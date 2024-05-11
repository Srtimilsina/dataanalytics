SELECT 

ROUND(AVG (ABS(JULIANDAY(end_Time) - JULIANDAY(start_Time))), 2) AS AVG_Duration_In_Days,
ROUND(AVG(Energy_Lost_MW), 2) AS AVG_Energy_Lost,
Outage_Reason,
Participant_Code,
Facility_Code,
Year
FROM AEMR_Outage_Table
WHERE Status = 'Approved' AND Outage_Reason = 'Forced'
GROUP BY Participant_Code,Outage_Reason, Year,Facility_Code 
ORDER BY AVG_Duration_In_Days DESC, Year DESC