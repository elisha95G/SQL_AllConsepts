--DDL-Data defination language__1)Create, 2)Drop, 3)Alter, 4) Truncate.
--1)Create
create table Myntra_Orders
(
Order_Id Integer,
Order_date date,
Product_Name varchar(50),
Total_price decimal(8,2),
Payment_Method varchar(20)
);
--2)Drop--To delete the table
drop table Myntra_Orders;
select * from myntra_orders;

--DML--Data manipulation Language--1)Insert, 2)Update, 3)Delete.
--1)Insert
insert into myntra_orders values(1,'01-07-2024','IPhone',45000.50,'Credit Card');
insert into myntra_orders values(2,'02-07-2024','Dell Lap',53000,'Debit Card');
insert into myntra_orders values(3,'03-07-2024','Octapad',78000,'UPI');
insert into myntra_orders values(4,'04-07-2024','Cooker',2750.45,'UPI');
insert into myntra_orders values(5,'04-07-2024','Samsung M51',28000.50,'Credit Card');

--2)to delete the data from table

delete from myntra_orders
--DQL--Data Query Language or SQL-Structured Query Language-- Select

select * from myntra_orders;
--limiting columns or selecting specific columns

select product_name,Order_date,Total_price from myntra_orders;

--limiting rows
select top 3 * from myntra_orders; 

--Sorting
select order_id,order_date from myntra_orders
order by order_date desc;

select * from myntra_orders
order by order_date desc;

select * from myntra_orders
order by order_date desc,product_name desc;

select order_id,order_date,product_name from myntra_orders
order by product_name;


select * from myntra_orders;
--to Change data type of a column
alter table myntra_orders alter column order_date datetime;
alter table myntra_orders alter column order_id date;--DDl data type shuld be Compitable
alter table myntra_orders alter column product_name varchar(20);

--If table is empty we can change any data type to any other data type.

Insert into myntra_orders values(6,'05-07-2024 13:16:45','Roland',35000,'credit card');
Insert into myntra_orders values(7,'06-07-2024 9:16:45','Conditionar',35000,'Debit card');

--to add a column in a table
alter table myntra_orders add Username varchar(20)
alter table myntra_orders add Cateogary varchar(20)

--To delete a column in a exiating table
alter table myntra_orders drop column cateogary;
alter table myntra_orders drop column username;

select * from myntra_orders;
Insert into myntra_orders values(8,'06-07-2024 9:16:45',null,35000,'Debit card');
Insert into myntra_orders values(8,'06-07-2024 9:16:45','null',35000,'Debit card');

--Constraints
--Primary key is unique+not null constraint
drop table a_table
create table a_table
(
order_id integer,
Order_date date,
product_name varchar(100),
Total_price decimal(6,2),
payment_method varchar(20) check (payment_method in('UPI','Credit')) default 'UPI',--check constraint
Discount integer check(discount<=20),
Cateogary varchar(20) default 'Mens wear',
primary key(order_id,product_name)
);
select * from a_table;
insert into a_table values(1,'01-07-2024','Shirt',450.50,'UPI',50.50,'Kids wear');
insert into a_table values(2,'02-07-2024','T-Shirt',500,'UPI',25,'Mens wear');
insert into a_table values(3,'03-07-2024','Phant',950,'Credit',50,'Mens wear');

insert into a_table values(1,'01-07-2024','Shirt',450.50,'UPI',50.50,'Kids wear');
insert into a_table values(2,'02-07-2024','T-Shirt',500,'UPI',20,'Mens wear');
insert into a_table values(3,'03-07-2024','Phant',950,'Credit',15,'Mens wear');

insert into a_table values(4,'04-07-2024','Jeans',950,default,15,default);

insert into a_table(order_id,Order_date,product_name,Total_price,payment_method)
values(5,'05-07-2024','Shirts',650,'upi');

select * from a_table
---delete with filter condition----DML
delete from a_table where product_name='Shirts';

Update_DML

update a_table
set Discount=20
where order_id=5;

update a_table
set order_id=1,product_name='shirt',Cateogary='kids wear'
where order_id=5;
use EliNamsteySql
select * from orders;
select top 5 * from orders
order by order_date;

---To get distinct vlaues
select order_date from orders
order by order_date;

select distinct order_date from orders
order by order_date;

select ship_mode,segment from orders;

select distinct ship_mode,segment from orders;
select distinct * from orders; 

--Fillters

select * from orders
where ship_mode='First Class';

select * from orders
where order_date='2020-12-08';

select order_date,quantity 
from orders
where quantity!=5
order by order_date desc;

select * from orders
where order_date<'2020-12-08'
order by order_date;

select * from orders
where order_date between '2020-12-08' and '2020-12-12'
order by order_date;

select * from orders
where quantity between 3 and 5
order by quantity desc;

select distinct ship_mode from orders
where ship_mode in('First class','Same day')

select * from orders
where quantity in(3,4,5)
order by quantity desc;

select distinct ship_mode from orders
where ship_mode not in('First class','Same day')

select distinct ship_mode from orders
where ship_mode>='Second class'

select order_date,ship_mode,segment from orders
where ship_mode='first class' and segment='consumer';

select order_date,ship_mode,segment from orders
where ship_mode='first class' or segment='consumer';

select * from Orders where Quantity>5 and Order_Date<'2020-11-08' --and will decrease

select * from orders where quantity>5 or order_date<'2020-11-08'--or will increase the rows

select *,Profit/sales as ratio, profit*sales as Total,GETDATE() as datetime
from orders;

--Pattern matching operators.
select Order_id,Order_date,customer_name
from orders
where customer_name like 'chris%';

select Order_id,Order_date,customer_name
from orders
where customer_name like 't%';

select Order_id,Order_date,customer_name
from orders
where customer_name like '%t';

select Order_id,Order_date,customer_name
from orders
where customer_name like '%Ven%';

select Order_id,Order_date,customer_name,lower(customer_name) as Name_Lower
from orders
where lower(customer_name) like 'c%a';

select Order_id,Order_date,customer_name,Upper(customer_name) as Name_Upper
from orders
where lower(customer_name) like 'c%a';

select Order_id,Order_date,customer_name
from orders
where customer_name like '_l%';

select Order_id,Order_date,customer_name
from orders
where customer_name like 'cl%';

select Order_id,Order_date,customer_name
from orders
where customer_name like 'c[albo]%';

--%,0 are more characters
--_-->one character

select Order_id,Order_date,customer_name
from orders
where customer_name like 'c[^albo]%';

--Filltering Null values

select * from orders
where city is null

select * from orders
where city is not null
--Aggregation-
--to know the count of the data
select count(*) as CNt
from orders;

select count(*) as CNT,
sum(sales) as Sum_Sales,
max(sales) as max_sales,
min(profit) as min_profit,
avg(profit) as Avg_profit
from orders;

--Group by--
select count(*) as Cnt,
sum(sales) as sum_sales,
max(sales) as max_sales,
min(profit) as min_profit,
avg(profit) as Avg_profit
from orders
group by region;

select Region,Category,sum(sales) as Total_sales
from orders
group by Region

select Region,sum(sales) as Total_sales
from orders
group by Region

select * from orders;

select Region,sum(sales) as Total_sales
from orders
where profit>50
group by Region

select region,sum(sales) as total_sales
from orders
where profit>50
group by region
order by total_sales desc;

select top 2 region,sum(sales) as total_sales
from orders
where profit>50
group by region
order by total_sales desc;

select sub_category,sum(sales) as Total_sales
from orders
group by sub_category
having SUM(sales) > 100000
order by Total_sales desc

select sub_category,sum(sales) as Total_sales
from orders
where profit > 50
group by sub_category
having sum(sales) >100000
order by Total_sales desc;

select top 5 sub_category,sum(sales) as Total_sales
from orders
where profit > 50
group by sub_category
having sum(sales) >100000
order by Total_sales desc;

select top 5 sub_category,sum(sales) as Total_sales
from orders
where sub_category='phones'
group by sub_category
order by Total_sales desc;

select sub_category,min(order_date),sum(sales) as Total_Sales
from Orders
group by Sub_Category
having max(Order_Date)>'2020-01-01'
order by Total_Sales desc;

select sub_category,sum(sales) as total_sales--, max(order_date)
from orders
where order_date > '2020-01-01'
group by sub_category
order by total_sales desc;

--count--
select count(distinct region) as DisRgCnt,
count(*),
count(city),
sum(sales)
from orders;

select region,avg(sales) as Avg_sales,
sum(sales)/COUNT(region)
from orders
group by region;

select * from orders
select * from returns$

select o.order_Id,o.product_id,r.return_reason
from orders o
inner join returns$ r
on o.order_id=r.order_id

select o.order_Id,o.product_id,r.return_reason,r.Order_id as Return_reason_ID
from orders o
left join returns$ r
on o.order_id=r.order_id

select r.return_reason,sum(sales) as Total_sales
from returns$ r
inner join orders o
on o.order_id=r.order_id
group by r.return_reason

create table employee(
	Emp_Id int,
	Emp_Name varchar(20),
	Dept_Id int,
	Salary int,
	Manager_Id int,
	Emp_Age int
);

insert into employee values(1,'Ankit',100,10000,4,39)
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);

select * from employee;


create table Dept(
	Dep_Id int,
	Dep_Name varchar(20)
);
insert into Dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');

select * from employee;
select * from Dept;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_name
from employee e
inner join Dept d
on e.Dept_Id=d.Dep_Id;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_name
from employee e
left join Dept d
on e.Dept_Id=d.Dep_Id;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_Id,d.Dep_name
from employee e
right join Dept d
on e.Dept_Id=d.Dep_Id;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_name
from Dept d
left join employee e
on e.Dept_Id=d.Dep_Id;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_name
from employee e
inner join Dept d
on e.Dept_Id=d.Dep_Id;

select e.Emp_Id,e.Emp_name,e.Dept_id,d.Dep_name
from employee e
full outer join Dept d
on e.Dept_Id=d.Dep_Id;

create table People(
	Manager varchar(20),
	Region varchar(10)
);

insert into people
values ('Ankit','West')
,('Deepak','East')
,('Vishal','Central')
,('Sanjay','South')

Select * from employee
select * from Dept
select * from People;

select * from orders
select * from returns$
select * from People;

select o.Order_Id,o.product_Id,r.return_reason,p.Region
from orders o
left join returns$ r on o.order_id=r.order_id
inner join People p on o.region=p.Region; 

select * from employee
select * from employee

select e1.emp_Id,e1.emp_name,e2.emp_name as Manager_Name
from employee e1
inner join employee e2
on e1.Manager_Id=e2.Emp_Id

select e1.emp_Id,e1.emp_name,e2.emp_name as Manager_Name
from employee e1
inner join employee e2
on e1.Manager_Id=e2.Emp_Id
where e1.Salary>e2.Salary;

select Dept_Id,STRING_AGG(emp_name,';')
within group (order by salary desc) as list_employees
from employee
group by Dept_Id;

select dept_id,STRING_AGG(emp_name, ';')
within group(order by salary) as Employees_List
from employee
group by Dept_Id

select * from employee
alter table employee add DOb date;
alter table employee drop column Date_Diff_Week
alter table employee drop column Date_Diff_Days
update employee
set Dob = DATEADD(year,-1*emp_age,getdate());

select order_id,order_date,ship_date,
DATEDIFF(day,order_date,ship_date) as DateDiff_Day,
DATEDIFF(WEEK,order_date,ship_date) as DateDiff_Week
from orders

select order_id,order_date,ship_date,
DATEADD(day,5,order_date) as OrderDate_5_Day,
DATEADD(week,5,order_date) as orderdate_5_week,
DATEADD(day,-5,order_date) as Orderdate_minus5day
from orders

select order_id,order_date,ship_date,
DATEPART(yy,order_date) as year_Orderdate,
DATEPART(month,order_date) as month_Orderdate,
DATEPART(week,order_date) as week_orderdate,
DATEPART(weekday,order_date) as Weekday_orderdate
from orders

--if profit < 100 then 'low profit' elseif profit > 100 then 'profit' else end

select Order_Id,Profit,
case
when profit < 100 then 'Low Profit'
when profit < 250 then 'Medium profit'
when profit < 400 then 'High Profit'
else 'Very High Profit'
end Profit_Category
from orders

select Order_Id,Profit,
case
when profit < 0 then 'Loss'
when profit < 100 then 'Low Profit'
when profit >=100 and profit < 250 then 'Medium Profit'
when profit >=250 and profit < 400 then 'High Profit'
else 'Very High Profit'
end as Profit_Category
from orders

--String functions

select Order_id,Customer_name
,LEN(customer_name) as Len_custNam
,LEFT(customer_name,4) as Left4CN
,SUBSTRING(customer_name,4,5) as SubStrCUst45
,SUBSTRING(order_id,4,4) as Substr44
,CHARINDEX(' ',customer_name) as Space_postion
,CHARINDEX('n',customer_name) as n1stposition
,CHARINDEX('n',customer_name,CHARINDEX('n',customer_name,1)+1) as n2ndPosition
,LEFT(customer_name,charindex(' ',customer_name)) as First_name
,CONCAT(order_id,'-',customer_name)
,order_id + '-' + customer_name
,REPLACE(order_id,'CA','PB') as replaceCA
,TRANSLATE(customer_name,'CA','B@') as TranscCA
,TRIM('Elisha Raj') as UserName
from orders
select * from orders
---null handling fun

select Order_Id,City,ISNULL(city,'unkown') as New_city
from orders
where city is null

select order_id,city,ISNULL(city,'unkown') as New_City
from orders
order by city 

select order_id,city,coalesce(city,state,region,'unkown') as New_City
from orders
order by city 

select top 5 order_Id,Sales,cast(Sales as int) as Sales_Int
,ROUND(Sales,1) as Round_Sales
from Orders

--Set queries
--Union,Union All

create table orders_west
(
order_id int,
region varchar(10),
sales int
);


create table orders_east
(
order_id int,
region varchar(10),
sales int
);

insert into orders_west values(1,'west',100),(2,'west',200);
insert into orders_east values(3,'east',100),(4,'east',300);
insert into orders_west values(3,'east',100)
insert into orders_west values(1,'west',100)

select * from orders_west
select * from orders_east

select * from orders_west
union all
select * from orders_east

select * from orders_west
union
select * from orders_east

select Sales,order_id as sale from orders_east
union all
select order_id,sales from orders_west

(select * from orders_east
except
select * from orders_west)
union all
(select * from orders_west
except
select * from orders_east);

select * from orders_east
union
select * from orders_east

select * from orders;

create view Order_south_view as
select * from orders where region='South';

select * from Order_south_view

---------Sub queries

select avg(orderd_sales) from
(select order_id,sum(sales) as orderd_sales
from orders
group by order_id) as Order_aggregated;


--find order with sales more than average order value
select order_Id
from orders
group by order_Id
having sum(sales)> (select avg (orderd_sales) as Avg_orderd from
(select order_id,sum(sales) as orderd_sales
from orders
group by order_id) as Order_aggregated);

select * from orders where order_id='CA-2018-100090';


