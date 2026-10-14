select * from [dbo].[products]


-- Qyery to Categorize products based on their price

select ProductID,ProductName,Price,
-- Add new column to categorize price
CASE
	when Price > 50 then 'Low'
	when price between 50 and 200 then 'Medium'
	Else 'High'
	END as price_category
from products