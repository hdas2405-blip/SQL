create database company_db;
use company_db;
create table employees
(employee_id int primary key,
First_name varchar(50),
Last_name varchar(50),
Department varchar(50),
Salary int,
Hire_Date date);

insert into employees value
(101, "Amit","Sharma","HR",50000,"2020-01-15"),
(102, "Riya","kapoor","Sales",75000,"2019-03-22"),
(103, "Raj","Mehta","IT",90000,"2018-07-11"),
(104, "Neha","Verma","IT",85000,"2021-09-01"),
(105, "Arjun","Singh","Finance",60000,"2022-02-10");

select * from employees;

Select salary from employees order by salary asc;

select employee_id,First_name,Last_name,Department,Salary,Hire_Date from employees order by Department asc , Salary desc;

select employee_id,First_name,Last_name,Department,Salary,Hire_Date from employees order by Hire_date desc;

create table Sales
(Sales_id int,
Customer_Name varchar(50),
Amount int,
Sales_date varchar(10));

insert into Sales
value
(1,"Aditi",1500,"2024-08-01"),
(2,"Rohan",2200,"2024-08-03"),
(3,"Aditi",3500,"2024-09-05"),
(4,"Meena",2700,"2024-09-15"),
(5,"Rohan",4500,"2024-09-25");

select * from sales;

select * from sales order by Amount desc;
select * from sales where Customer_name= "Aditi";





