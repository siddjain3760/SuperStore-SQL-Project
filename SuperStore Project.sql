USE superstore;


-- --------------------------------------Determining which Product Categories that produce the highest average profits, produce the most average sales, have the highest profit percentage, and the highest average base margins----------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
SELECT productCategory, avg(profit) as 'Average Profit', avg(sales) 'Average Sales', (sum(profit)/sum(sales))*100 as 'Total Profit Percent', avg(baseMargin) as 'Average Base Margin' from StoreInventory
group by 1
order by avg(profit) desc;
-- -----------------------------Determining the Top 5 most avid users, by their id, through their total items ordered and items purchased per order, on average-----------------------------------------------------------------------------------------------------------------------------------------------
SELECT customerID, sum(quantityOrdered), count(*), sum(quantityOrdered)/count(*) as 'Average Items per Order' from StoreInventory
group by 1
order by 4 desc
LIMIT 5;
-- ----------------------------------Determining the relationship between Unit Price and profits and sales------------------------------------------------------
select unitPrice, round(avg(profit),2) as 'Average Profits', round(avg(sales), 2) as 'Average Sales' from StoreInventory
group by 1 
order by 1 desc;

-- ---------------------------Using a case function to determine which sales made profits, did not make profits, and broke even-------------------------------------------------------------------------------
select *,
CASE
when profit>0 then 'Profit was made'
when profit<0 then 'A loss was incurred'
when profit=0 then 'Broke even'

end as 'Profit Statement'

from StoreInventory;
-- ------------------------------Determining the relationship between discount rate and sales and profit ------------------------------------------------------------------------------
select discount*100 as 'discount rate (percent)', sales, profit from StoreInventory
order by 1 desc;
-- ----------------------------------Determining customers from which region have bought items from the store the most and have produced the most sales-------------------------------------------------------------------------------------------------
select region, round(sum(sales), 2), count(*) from StoreInventory
group by 1
order by 2 desc;
-- ---------------------------Determining if the store is profitable for the entire year------------------------------------------------------------------------------------------------
select avg(profit), 
CASE
when avg(profit)>0 then 'Overall, the store is profitable'
when avg(profit)<0 then 'Overall, the store is not profitable'
when avg(profit)=0 then 'Overall, the store is breaking even'

end as 'Profit Statement'
from StoreInventory; 
-- -----------------------------Determining the top 10 least profitable sales----------------------------------------------------------------------
select * from StoreInventory
order by profit asc
LIMIT 10;
-- ------------------------Determining the top 10 most profitable sales ----------------------------------------------------
select * from StoreInventory
order by profit desc
LIMIT 10;
-- -----------------------Determine the product category that products the highest average base margin----------------------------------------------------------
select productCategory, round(avg(baseMargin),3) from StoreInventory
group by 1
order by 2 desc;
-- -----------------------------------------------------------------------------------

