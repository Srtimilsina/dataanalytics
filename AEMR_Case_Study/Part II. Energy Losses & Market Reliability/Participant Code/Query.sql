SELECT 
* 
FROM (
SELECT 
Participant_Code,
Facility_Code,
Description_Of_Outage,
ROUND(SUM(Energy_Lost_MW), 2) AS Total_Energy_Lost,
ROUND(SUM(Energy_Lost_MW)/(SELECT SUM(Energy_Lost_MW) FROM AEMR_Outage_Table WHERE Status = 'Approved' AND Outage_Reason= 'Forced')*100,2) AS Pct_Energy_Loss,
 RANK() OVER (PARTITION BY Participant_Code, Outage_Reason
                    ORDER BY  SUM(Energy_Lost_MW) DESC
                    ) AS ranK
FROM AEMR_Outage_Table
WHERE Status = 'Approved' AND Outage_Reason= 'Forced' AND Participant_Code IN('AURICON','GW','MELK')
GROUP BY Participant_Code,Outage_Reason, Year,Facility_Code 
ORDER BY Total_Energy_Lost DESC, Participant_Code )
    
WHERE rank = 1
