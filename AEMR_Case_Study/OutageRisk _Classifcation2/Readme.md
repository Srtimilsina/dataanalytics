
Let's 

As in Risk_Classification1, we summarized the risk factor and noticed that Consequential, Opportunistict or Planned are not considered in the Risk Category. Thus, further we will be focusing on the unplanned outages.

Criteria are below,

High Risk - On average, the participant is unavailable for > 24 Hours (1 Day) OR the Total Number of Outage Events > 20
Medium Risk - On average, the participant is unavailable between 12 and 24 Hours OR the Total Number of Outage Events is Between 10 and 20
Low Risk - On average, the participant is unavailable for less than 12 Hours OR the Total Number of Outage Events < 10
If the Outage Type is not forced, then N/A

In addition to our classification consider the Total Number of Outage Events and Outage Type.

5) Using the above criteria for context, write a SQL Statement that classifies each participant code as either High Risk, Medium Risk or Low Risk in a column called Risk_Classification using the new criteria. Order the results using Average Duration Time In Days in descending order.