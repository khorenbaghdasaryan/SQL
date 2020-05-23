/*select*/
select CONCAT (sales.customers.last_name,', ', sales.customers.first_name) 
as fullname
from sales.customers

/*SQL Alias*/
select production.products.product_name "Product Name",
	   production.brands.brand_name "Brand Name"
from production.products
inner join production.brands
on production.products.brand_id = production.brands.brand_id

/*SQL DISTINCT*/
select distinct sales.customers.first_name,
	sales.customers.last_name
from sales.customers

select sales.customers.first_name,
	sales.customers.last_name
from sales.customers

/*SQL WHERE */
select ss.city,
	ss.zip_code,
	ss.phone,
	ss.state
from sales.stores as ss
where not
(ss.city <> 'Paris'
or ss.zip_code >20000)

/*ORDER BY*/
select sales.customers.first_name,
	sales.customers.last_name
from sales.customers
order by last_name asc,
first_name desc

select CONCAT(sales.customers.last_name,', ', sales.customers.first_name) fullname
from sales.customers
order by CONCAT(sales.customers.last_name,', ', sales.customers.first_name)

select sales.customers.last_name, sales.customers.first_name
from sales.customers
order by 2 desc;

/*BETWEEN */
select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code between 10000 and 20000

select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code  >= 10000 and sc.zip_code <>20000

select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code not between 10000 and 20000

select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code  >= 10000 or sc.zip_code <>20000

/*IN*/
select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code not in (14127,76901,95060)

/*IS*/
select sc.last_name, sc.first_name, sc.zip_code
from sales.customers as sc
where sc.zip_code is not null

/*EXISTS*/
select 
	   so.order_status,
	   so.order_date,
	   so.shipped_date
from sales.orders as so
where exists(
select sc.customer_id
from sales.customers as sc
where so.customer_id =sc.customer_id)

select 
	   so.order_status,
	   so.order_date,
	   so.shipped_date
from sales.orders as so
where exists(
select null)

/*LIKE*/
select sales.customers.first_name,
	   sales.customers.last_name
from sales.customers
where last_name not Like '_D%'

select sales.customers.first_name,
	   sales.customers.last_name
from sales.customers
where last_name Like '_D%'

select sales.customers.first_name,
	   sales.customers.last_name
from sales.customers
where last_name Like '%20@%' escape '@'

/*Inner Join*/
select production.products.product_name,
	   production.brands.brand_name
from production.products
inner join production.brands
on production.products.brand_id = production.brands.brand_id

/*double inner join*/
select p.product_name,
	   b.brand_name,
	   c.category_name
from production.products as p
inner join production.brands as b
on p.brand_id = b.brand_id
inner join production.categories as c
on p.category_id = c.category_id


/*LEFT/RIGTH OUTER JOIN*/
select ss.state, 
	ss.city,
	ss.street,
	ss.store_name,
	ss.phone,
	ps.quantity
from sales.stores as ss
right outer join production.stocks as ps
on ss.store_id = ps.store_id

/*FULL  OUTER JOIN*/
select ss.state, 
	ss.city,
	ss.street,
	ss.store_name,
	ss.phone,
	ps.quantity
from sales.stores as ss
full outer join production.stocks as ps
on ss.store_id = ps.store_id

/**/
select pp.category_id, 
	   count(product_id) "product_id"
from production.products as pp
group by category_id