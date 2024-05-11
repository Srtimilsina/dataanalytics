SELECT
 Year, 
 Month,
 COUNT (*) AS Total_Number_Outages
 FROM AEMR_Outage_Table
 WHERE Status = "Approved" 
 Group BY Year, Month
 ORDER BY  Year, Month, Total_Number_Outages DESC
 LIMIT 10;