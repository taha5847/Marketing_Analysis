-- select * from engagement_data


-- Query to clean and normalize the engagement_data Table

select 
	EngagementID,
	ContentID,
	CampaignID,
	ProductID,
	UPPER(REPLACE(ContentType,'Socialmedia','Social Media')) as ContentType,
	LEFT(ViewsClicksCombined,CHARINDEX('-',ViewsClicksCombined) -1) AS Views,
	RIGHT(ViewsClicksCombined,LEN(ViewsClicksCombined) - CHARINDEX('-',ViewsClicksCombined)) AS Clicks,
	FORMAT(CONVERT(DATE,EngagementDate),'dd.MM.yyyy') as EngagementDate

from engagement_data

Where ContentType != 'Newsletter';


