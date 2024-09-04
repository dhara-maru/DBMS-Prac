use LAB8_dhara
create table orders2(
ord_no int primary key,
punch_amt decimal(8,2),
ord_date date not null,
customer_id int not null,
salesman_id int not null,
foreign key(salesman_id) references salesman(salesman_id)
)

create table salesman(
salesman_id int primary key,
name varchar(50) not null,
city varchar(50) not null,
commission decimal(8,2) not null
)

create table customer(
customer_id int primary key,
cust_name varchar(50) not null,
city varchar(50) not null,
grade int not null,
salesman_id int not null,
foreign key(salesman_id) references salesman(salesman_id))

--1
SELECT s.name as salesmanname, c.cust_name as custname, c.city as customercity, s.city as salesmancity
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id
where c.city=s.city

--2
select o.ord_no, o.punch_amt, c.cust_name, c.city
from orders2 o
inner join customer c
on c.customer_id=o.customer_id
where o.punch_amt between 500 and 2000

--3
SELECT s.name as salesmanname, c.cust_name as custname, s.commission
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id

--4
SELECT s.name as salesmanname, c.cust_name as custname, c.city as customercity, s.commission
from salesman s
inner join customer c
on s.salesman_id = c.salesman_id
where s.commission > 0.12

--5
SELECT s.name as salesmanname, c.cust_name as custname, c.city as customercity, s.city as salesmancity
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id
where c.city!=s.city and s.commission > 0.12

--6
select o.ord_no, o.ord_date, o.punch_amt, c.cust_name, c.grade, c.salesman_id
from orders2 o
join customer c 
on c.customer_id= o.customer_id

--7
select o.ord_no, o.ord_date, o.punch_amt, c.cust_name, c.grade, c.salesman_id
from orders2 o
join customer c 
on c.customer_id= o.customer_id
UNION
select s.commission, c.cust_name, c.grade, c.salesman_id
from salesman s
join customer c 
on c.salesman_id= s.salesman_id

--8
SELECT s.name as salesmanname, c.cust_name as custname, c.city as custcity, s.city, c.grade
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id 
order by c.customer_id asc

--9
SELECT s.name as salesmanname,s.city as salesmancity, c.cust_name as custname, c.city as custcity, c.grade
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id 
where c.grade < 300
order by c.customer_id asc

--10
select c.cust_name, c.city, o.ord_no, o.ord_date, o.punch_amt
from customer c
join orders2 o
on c.customer_id = o.customer_id
order by o.ord_date asc

--PART B*******************************************************

--11
select c.cust_name, c.city, o.ord_no, o.ord_date, o.punch_amt, s.name as salesmanname, s.commission


--12
select c.salesman_id 
from customer c
join salesman s
on s.salesman_id = c.salesman_id
group by c.salesman_id
having count(c.salesman_id) >= 1

--14
select c.salesman_id 
from customer c
join salesman s
on s.salesman_id = c.salesman_id
group by c.salesman_id
having count(c.salesman_id) >= 1

---******************************** PART C **************************************

--16
select c.cust_name, c.city, o.ord_no, o.ord_date, o.punch_amt
from customer c
join orders2 o
on c.customer_id = o.customer_id
where c.grade IS NOT NULL 

--17
select * from customer
cross join orders2

--18
select s.name as salesperson, c.cust_name, s.city as salesmancity, c.city as custcity
from salesman s
cross join customer c
where c.salesman_id = s.salesman_id

