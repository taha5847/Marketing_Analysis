
select * from customers

select * from geography

-- We want all data of the customer and their geography from geography

select c.CustomerID,
c.CustomerName,
c.Email,
c.Gender,
c.Age,
g.Country,
g.City
from customers c
left join geography g
on c.GeographyID = g.GeographyID