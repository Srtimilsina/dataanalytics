SELECT 
Year,
Count(*) AS Total_Number_Outage,
 SUM(CASE WHEN Outage_Reason ='Forced' THEN 1 ELSE 0 END ) AS total_number_forced_outage,
ROUND(SUM(CASE WHEN Outage_Reason ='Forced' THEN 1 ELSE 0 END )*1.0/Count(*)*100, 2) AS Perc_force_outage
FROM AEMR_Outage_Table
WHERE Status = 'Approved' 
GROUP BY Year;
