create database companies;
use companies;

create table employees
(Emp_id int,
EmpName varchar(20),
Department varchar(20),
City varchar(20),
Salary int,
HireDate date);
select * from employees;
insert into employees
value
(101, "Rahul Mehta","Sales","Delhi",55000,"2020-04-12"),
(102, "Priya Sharma","HR","Mumbai",62000,"2019-09-25"),
(103, "Aman Singh","IT","Bangaluru",72000,"2021-03-10"),
(104, "Neha Patel","Sales","Delhi",48000,"2022-01-14"),
(105, "Karn Joshi","Marketing","Pune",45000,"2018-07-22"),
(106, "Divya Nair","IT","Chennai",81000,"2019-12-11"),
(107, "Raj Kumar","HR","Delhi",60000,"2020-05-28"),
(108, "Simran Kaur","Financce","Mumbai",58000,"2021-08-03"),
(109, "Arjun Reddy","IT","Hydrabad",70000,"2022-02-18"),
(110, "Anjali Das","Sales","Kolkata",51000,"2023-01-15");

select * from employees where Department in ("IT","HR");

SELECT * 
FROM employees 
WHERE department IN ("Sales", "IT", "Finance");

SELECT * 
FROM employees 
WHERE salary BETWEEN 50000 AND 70000;

SELECT * 
FROM employees 
WHERE EmpName like"A%";

SELECT * 
FROM employees 
WHERE EmpName like"%An%";

SELECT * 
FROM Employees 
WHERE City IN ("Delhi", "Mumbai") 
AND Salary > 55000;

select * 
From employees
WHERE Department <> ("HR");

select * 
From employees
where HireDate between "2019-01-01" And "2022-12-31" order by HireDate asc;





