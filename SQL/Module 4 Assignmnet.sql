create database module4;
use module4;
drop table contact;
drop table Employee;
drop table ContactEmployee;
drop table company;

create table Company(
         CompanyID int,
         CompanyName varchar(45),
         Street varchar(45),
         City varchar(45),
         State varchar(20),
         Zip varchar(10)
);

INSERT INTO Company
VALUES (1, 'Urban Outfitters, Inc.', '123 Innovation Dr', 'San Jose', 'CA', '95134'),
	   (2, 'GreenLeaf Solutions', '456 Forest Rd', 'Portland', 'OR', '97201');




#### Q-1 Statement to create the Contact table.

create table Contact(
		ContactID int,
        CompanyID int,
        FirstName varchar(45),
        LastName varchar(45),
        Street varchar(45),
	    City varchar(20),
        State varchar(20),
        Zip varchar(20),
        IsMain Boolean,
        Email varchar(45),
        Phone varchar(12)
);

INSERT INTO Contact 
VALUES   (1, 1, 'Toll', 'Brother', '123 Innovation Dr', 'San Jose', 'CA', '95134', true, 'toll.brother@technova.com', '4085551234'),
         (2, 1, 'Bob', 'Martinez', '123 Innovation Dr', 'San Jose', 'CA', '95134', false, 'bob.martinez@technova.com', '4085552345'),
		 (3, 2, 'Carol', 'Wang', '456 Forest Rd', 'Portland', 'OR', '97201', true, 'carol.wang@greenleaf.com', '5035553456'),
         (4, 2, 'Dianne', 'Connor', '456 Forest Rd', 'Portland', 'OR', '97201', false, 'dianne.Connor@greenleaf.com', '5035554567');
         

      
      
#### Q-3 Statement to create the ContactEmployee table.


create table ContactEmployee(
        ContactEmployeeID int,
	    ContactID int,
        EmployeeID int,
        ContactDate Date,
        Description varchar(100)
);

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description) 
VALUES (1, 1, 1, '2025-01-10', 'Initial sales call with brother from Urban Outfitters, Inc.'),
       (2, 2, 2, '2025-02-05', 'Technical discussion with Bob regarding software needs'),
       (3, 3, 1, '2025-03-15', 'Sales follow-up with Carol from GreenLeaf'),
       (4, 4, 3, '2025-04-20', 'HR onboarding talk with dainee'),
       (5, 1, 2, '2025-05-22', 'Software architecture planning with toll'),
       (6, 3, 3, '2025-06-30', 'Compliance and HR policies discussion');


        
###### Q-2 Statement to create the Employee table .
        
create table Employee(
        EmployeeID int,
        FirstName varchar(45),
        LastName varchar(45),
		Salary decimal(10,2),
        HireDate date,
        JobTitle varchar(50),
        Email varchar(45),
        Phone varchar(12)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES (1, 'James', 'Turner', 85000.00, '2021-03-15', 'Sales Manager', 'jturner@company.com', '4085551122'),
       (2, 'Lesley', 'Bland', 92000.00, '2020-06-01', 'Software Engineer', 'l.blend@company.com', '5035552211'),
       (3, 'Jack', 'Lee', 78000.00, '2022-09-10', 'HR Specialist', 'jack.lee@company.com', '2125553344');

       
###### Q-4  In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 .

update employee
set Phone = "214-555-8800"
where FirstName = "Lesley" and LastName = "Bland";

select * from employee;

########## Q-5 In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .

update Company
set  CompanyName = "Urban Outfitters"
Where CompanyID = 1;

select * from Company;

######## Q-6 In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee.

delete from ContactEmployee
where contactid = 4 and employeeid = 3;
 
 select * from ContactEmployee;
 
######### Q-7 Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers.

select employee.firstname,
       employee.lastname
from employee
left join contactemployee
on employee.employeeid = contactemployee.employeeid
left join contact
on contact.ContactID = contactemployee.ContactID
where contact.FirstName = 'Toll' and contact.LastName = 'Brother'
group by employee.firstname,
         employee.lastname;


######### Q-8 What is the significance of “%” and “_” operators in the LIKE statement?

/* A-8 The significance difference between "%" and "_" in the like statement is "%" usually use for example we want data  which start from "V",
similary last letter or between letter so its give everypossibity of that "V%","%V","%v" but "_" is giving exactly what we write for example if we write "a_pp__"then 
it gives only this possiblity not more than that.*/

######## Q-9 Explain normalization in the context of databases.

/* Normalization in context of databases is like it store data in multiple places with less data storage. so  when we have to update data so we can do with very ease.
it will be good for our system to tackel with data . if there is big data then its make such way that data don't feel big but its atcully that whole big data.*/ 


########## Q-10 What does a join in MySQL mean? 

/* A meaning of join in MySQL is for example data with order and product , now productname is repeatedly use in order but not in product and i want to show profit in 
particular one product at that time if trying in order then there is multiple time that order repeat so what we do using "join" getting profit with product table using product name
, so in short it doesn't make work that much complicated.*/

######## Q-11 What do you understand about DDL, DCL, and DML in MySQL? 

/* DDL is data definition Language that use to create,drop and alter for database and table . Now if once table is create then data should be there so for that we are using
DML (data manipulation Language) which help to insert, update and delete to data in table. so we can manipulate the data with DMl.
DCl(data control language) which give autority to another person to change in data which already exist.*/

########### Q-12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
 
/* The role of join is , data with uniqueness,common data according to tables, particular one name wise all data , profit,sum,average, minimum , maximum etc . There are commonly six type of joins:
1. left join
2. right join
3. self join
4. inner join
5. outer join
6. cross join*/


