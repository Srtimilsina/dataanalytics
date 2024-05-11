SELECT 

ROUND(SUM(Energy_Lost_MW), 2) AS Total_Energy_Lost,
ROUND(AVG(Energy_Lost_MW), 2) AS Average_Energy_Lost,
ROUND(SUM(Energy_Lost_MW)/(SELECT SUM(Energy_Lost_MW) FROM AEMR_Outage_Table WHERE Status = 'Approved' AND Outage_Reason= 'Forced')*100,2) AS Pct_Energy_Loss,
Outage_Reason,
Participant_Code,
Facility_Code,
Year
FROM AEMR_Outage_Table
WHERE Status = 'Approved' AND Outage_Reason= 'Forced'
GROUP BY Participant_Code,Outage_Reason, Year,Facility_Code 
ORDER BY Total_Energy_Lost DESC,Year DESC