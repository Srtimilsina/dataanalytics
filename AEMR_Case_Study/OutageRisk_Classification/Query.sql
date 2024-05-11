WITH Class AS(
SELECT 
Participant_Code,
Outage_Reason,
Year,
Count(*) AS Total_Number_Outage_Events,
ROUND(AVG (ABS(JULIANDAY(end_Time) - JULIANDAY(start_Time))), 2) AS Average_Outage_Duration_In_Days
FROM AEMR_Outage_Table
WHERE Status = 'Approved' 
GROUP BY Participant_Code,Outage_Reason, Year
ORDER BY Total_Number_Outage_Events DESC
)

SELECT * ,
CASE
 WHEN Average_Outage_Duration_In_Days > 1 THEN 'High Risk'
 WHEN Average_Outage_Duration_In_Days BETWEEN 0.5 AND 1 THEN 'Medium Risk' 
 WHEN Average_Outage_Duration_In_Days BETWEEN 0 AND 0.5 THEN 'Low Risk' 
 ELSE 'N/A'
 END AS Risk_Classification
FROM Class;