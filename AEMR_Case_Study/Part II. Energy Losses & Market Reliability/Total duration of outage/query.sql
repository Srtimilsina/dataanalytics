SELECT 
Count(*) AS Total_Number_Outages,
ROUND(SUM (ABS(JULIANDAY(end_Time) - JULIANDAY(start_Time))), 2) AS Total_Outage_Duration_In_Days,
ROUND(SUM(Energy_Lost_MW), 2) AS Total_Energy_Lost,
Outage_Reason,
Participant_Code,
Facility_Code,
Year
FROM AEMR_Outage_Table
WHERE Status = 'Approved' 
GROUP BY Participant_Code,Outage_Reason, Year,Facility_Code 
ORDER BY Total_Outage_Duration_In_Days DESC, Year DESC