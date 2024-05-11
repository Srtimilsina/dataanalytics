SELECT
 COUNT (*) AS Total_Number_Outages,
 Outage_Reason,
 Year
FROM AEMR_Outage_Table
WHERE Status= "Approved"
Group BY Outage_Reason, Year
LIMIT 10