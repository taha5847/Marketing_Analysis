
select * from customer_journey

-- CTE to identify and tag duplicate records

with DuplicateRecords as (
select 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	Duration,
	ROW_NUMBER() over (partition by CustomerID,ProductID,VisitDate,Stage,Action 
                            order by JourneyID ) as row_num
from customer_journey

)

select *
from DuplicateRecords
where row_num > 1
order by JourneyID



-- replace null in duration with avg_duration

select 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	coalesce (Duration,avg_duration) As Duration
FROM (
		select 
			JourneyID,
	        CustomerID,
			ProductID,
			VisitDate,
			UPPER(Stage) as Stage,
			Action,
			Duration,
			AVG(Duration) over (Partition by VisitDate) as avg_duration,
			ROW_NUMBER() over (partition by CustomerID,ProductID,VisitDate,UPPER(Stage),Action 
                            order by JourneyID ) as row_num

			from customer_journey
		) as subquery

		Where row_num = 1