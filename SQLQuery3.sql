/*select*/
select CONCAT (sales.customers.last_name,', ', sales.customers.first_name) as fullname
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

/*SQL WHERE */
select ss.city,
	ss.zip_code,
	ss.phone,
	ss.state
from sales.stores as ss
where not
(ss.city <> 'Paris'
or ss.zip_code >20000)


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