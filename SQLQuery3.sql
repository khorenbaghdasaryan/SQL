/*select*/
select CONCAT (sales.customers.last_name,', ', sales.customers.first_name) as fullname,
	   customer_id,
	   city
from sales.customers

select count(distinct city)
from sales.stores

select distinct 
city,
store_id
from sales.stores

select all store_id
from sales.stores

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

/*ORDER BY -Sorting a Result Set By Using SQL ORDER BY Clause */
select sales.customers.first_name,
	sales.customers.last_name
from sales.customers
order by last_name asc,
first_name desc

select CONCAT(sales.customers.last_name,', ', sales.customers.first_name) fullname,
	   customer_id
from sales.customers
order by CONCAT(sales.customers.last_name,', ', sales.customers.first_name)

select last_name, first_name
from sales.customers
order by 1 asc;

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
select so.order_id,
	   so.order_status,
	   so.order_date,
	   so.shipped_date
from sales.orders as so
where not exists
(select sc.customer_id
from sales.customers as sc
where so.customer_id = sc.customer_id)

select so.order_id,
	   so.order_status,
	   so.order_date,
	   so.shipped_date
from sales.orders as so
where exists(select null)

/*LIKE*/
select sales.customers.first_name,
	   sales.customers.last_name
from sales.customers
where last_name Like '_D%'

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

/*SQL UNION*/
select city
from sales.stores
union  --all 
select sc.city   
from sales.customers sc
order by city asc

select distinct city
from sales.stores

select distinct ss.city
from sales.stores ss
left join sales.customers sc on sc.city = ss.city
where ss.city is null

select distinct ss.city
from sales.stores ss
inner join sales.customers sc on sc.city = ss.city
where ss.city is null

/*GROUP BY*/
select pp.category_id, 
	   count(product_id) 'product_id_count'
from production.products as pp
group by category_id 

select pp.category_id, 
	   sum(product_id) "product_id_sum"
from production.products as pp
group by category_id

select pp.category_id, 
	   floor(avg(product_id)) "product_id"
from production.products as pp
group by category_id

select pp.category_id, 
	   avg(product_id) "product_id"
from production.products as pp
group by category_id

select pp.category_id, 
	   min(product_id),
	   max(product_id)
from production.products as pp
group by category_id

select pp.category_id, 
	   count(product_id) "product_id_count"
from production.products as pp
group by category_id
order by count(product_id) desc;

select sc.customer_id,
	   sc.email,
	   count(so.order_id) 'Order_id_count',
	   concat(ss.first_name,', ',ss.last_name) as Staff
from sales.orders as so
inner join sales.customers sc on so.customer_id = sc.customer_id
inner join sales.staffs ss on ss.staff_id = so.staff_id
group by sc.customer_id,
		 sc.email,
		 ss.first_name,
		 ss.last_name
order by sc.customer_id asc,
		 'Order_id_count' desc

/*SQL HAVING*/
select shipped_date,
	   sales.orders.order_id,
	   count(sales.orders.order_id) as Counts
from sales.orders
group by shipped_date,
		 order_id
having sales.orders.shipped_date = (select sales.orders.shipped_date
from sales.orders
where sales.orders.order_id = 1)

----------------------------
select shipped_date,
	   count(sales.orders.order_id) as Counts
from sales.orders
group by shipped_date
having sales.orders.shipped_date = (select sales.orders.shipped_date
from sales.orders
where sales.orders.order_id = 1)

-----------------------------------
select sales.orders.shipped_date,
	   count(sales.orders.order_id) as Count
from sales.orders
group by shipped_date
having sales.orders.shipped_date = '2016-01-03'

select sales.orders.shipped_date,
	   count(sales.orders.order_id) as Count
from sales.orders
where sales.orders.shipped_date = '2016-01-03'
group by shipped_date
	
select sales.orders.shipped_date,
	   count(sales.orders.order_id) as Counts
from sales.orders
where sales.orders.shipped_date = (select sales.orders.shipped_date
from sales.orders
where sales.orders.order_id = 1)
group by shipped_date

select pp.category_id,
	   pp.product_id,
	   pp.product_name,
	   max(pp.list_price)
from production.products pp
where pp.list_price = (select top 1 max(pp2.list_price)
					 from production.products pp2
					 where pp2.category_id = pp.category_id
					 group by pp2.list_price)
group by pp.category_id,
		 pp.product_id,
		 pp.product_name,
		 pp.list_price
having max(list_price) = 379.99

/*SQL Subquery*/
select sales.staffs.first_name 
from sales.staffs

select distinct sales.staffs.first_name 
from sales.staffs 

select ss.staff_id, ss.first_name, ss.last_name
from sales.staffs ss
where ss.staff_id in(5,3,11)

select sc.customer_id, sc.city, sc.email
from sales.customers sc
where sc.customer_id <> 54
	  and city = 
	  (select city
	   from sales.customers
	   where customer_id = 54)


select sc.customer_id, sc.city, sc.email
from sales.customers sc
where sc.customer_id not in 
	  (select customer_id
	   from sales.customers
	   where sales.customers.city = 'Buffalo')


select product_id,
	   product_name,
	   list_price,
	   (select avg(list_price)
	    from production.products) as 'average price'
		--(list_price - (select avg(list_price)
		--			   from production.products)) as diff
from production.products pp
where category_id = 1
order by pp.list_price desc

select pp.product_id,
	   pp.product_name,
	   pp.list_price
from production.products pp
order by pp.list_price desc

/*Correlated Subquery*/
select top 5
	   city,
	   email,
	   (select sum(list_price * quantity)
	    from sales.order_items soi
		inner join sales.orders so on so.order_id = soi.order_id
		where so.customer_id = sc.customer_id) as total
from sales.customers sc
order by total desc

select city,
	   email
from sales.customers sc
where 34503.82 <= (select sum(list_price * quantity)
				from sales.order_items soi
				inner join sales.orders so on so.order_id = soi.order_id
				where so.customer_id = sc.customer_id)

select pp.category_id
	   category_name
from production.products pp
inner join production.categories pc on pc.category_id = pp.category_id
group by pp.category_id
having max(list_price)> all(select 2 * avg(list_price)
							 from production.products pp2
							 where pp.category_id = pp2.category_id)