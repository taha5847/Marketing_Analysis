select * from customer_reviews


-- Query to remove the whitespace issues

select
ReviewID,
CustomerID,
ProductID,
ReviewDate,
Rating,
REPLACE(ReviewText,'  ',' ') as ReviewText

from customer_reviews