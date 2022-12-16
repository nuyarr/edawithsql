CREATE DATABASE PROJECT_2

SELECT Machine, COUNT(Machine) as Number_of_sales
FROM vending_machine_sales
GROUP BY Machine
ORDER BY Number_of_sales DESC;

SELECT Type as payment_type, count(type) as payment_type_count
FROM vending_machine_sales
GROUP BY Type
ORDER BY payment_type_count DESC;

SELECT 
CASE
WHEN Category = ''THEN 'Other'
ELSE Category
END as Category,
AVG(TransTotal) as catergory_mean_price, COUNT(Category) as category_count
FROM vending_machine_sales
GROUP BY Category
ORDER BY category_count DESC 


SELECT Product, COUNT(Product) as product_count
FROM vending_machine_sales
GROUP BY Product
ORDER BY product_count DESC
LIMIT 5 

SELECT Machine, MONTH(cast(str_to_date(TransDate, '%m%d%y') as date )) as Months, COUNT(*) as Count_Of_Sales
FROM vending_machine_sales
GROUP BY Machine, Months
ORDER BY Machine, Months ;

SELECT
         Machine,
         MONTH(cast(str_to_date(TransDate, '%m%d%y') as date )) AS Months,
		 SUM(COUNT(Product)) OVER (partition by Machine order by MONTH(cast(str_to_date(TransDate, '%m%d%y') as date )) as Count
         
FROM vending_machine_sales
GROUP BY Machine, Months
ORDER BY Machine, Months ;


         