SHOW databases; 

CREATE database bankingNavu;
USE bankingNavu;

create table Branch(
	Branch_name varchar(30),
	Branch_city varchar(25),
	assets int,
	PRIMARY KEY (Branch_name)
);

create table BankAccount(
	Accno int,
	Branch_name varchar(30),
	Balance int,
	PRIMARY KEY(Accno),
	foreign key (Branch_name) references branch(Branch_name)
);

create table BankCustomer(
	Customer_name varchar(20),
	Customer_street varchar(30),
	Customer_city varchar (35),
	PRIMARY KEY(Customer_name)
);

create table Depositer(
	Customer_name varchar(20),
	Accno int,
	PRIMARY KEY(Customer_name,Accno),
	foreign key (Accno) references BankAccount(Accno),
	foreign key (Customer_name) references BankCustomer(Customer_name)
);

create table Loan(
	Loan_number int,
	Branch_name varchar(30),
	Amount int,
	PRIMARY KEY(Loan_number),
	foreign key (Branch_name) references branch(Branch_name)
);

desc Branch;
desc BankAccount;
desc BankCustomer;
desc Depositer;
desc Loan;

insert into Branch values("SBI_Chamrajpet","Bangalore",50000);
insert into Branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into Branch values("SBI_ShivajiRoad","Bombay",20000);
insert into Branch values("SBI_ParlimentRoad","Delhi",10000);
insert into Branch values("SBI_Jantarmantar","Delhi",20000);

insert into BankAccount values(1,"SBI_Chamrajpet",2000);
insert into BankAccount values(2,"SBI_ResidencyRoad",5000);
insert into BankAccount values(3,"SBI_ShivajiRoad",6000);
insert into BankAccount values(4,"SBI_ParlimentRoad",9000);
insert into BankAccount values(5,"SBI_Jantarmantar",8000);
insert into BankAccount values(6,"SBI_ResidencyRoad",5000);

insert into BankCustomer values("Avinash","Bull_Temple_Road","Bangalore");
insert into BankCustomer values("Dinesh","Bannergatta_Road","Bangalore");
insert into BankCustomer values("Mohan","NationalCollege_Road","Bangalore");
insert into BankCustomer values("Nikil","Akbar_Road","Delhi");
insert into BankCustomer values("Ravi","Prithviraj_Road","Delhi");

insert into Depositer values("Avinash",1);
insert into Depositer values("Dinesh",2);
insert into Depositer values("Mohan",3);
insert into Depositer values("Nikil",4);
insert into Depositer values("Ravi",5);
insert into Depositer values("Dinesh",6);

insert into Loan values(1,"SBI_Chamrajpet",1000);
insert into Loan values(2,"SBI_ResidencyRoad",2000);
insert into Loan values(3,"SBI_ShivajiRoad",3000);
insert into Loan values(4,"SBI_ParlimentRoad",4000);
insert into Loan values(5,"SBI_Jantarmantar",5000);

SELECT * FROM Branch;
SELECT * FROM BankAccount; 
SELECT * FROM BankCustomer;
SELECT * FROM Depositer;
SELECT * FROM Loan;

SELECT Branch_name, concat(assests/100000, ' lakhs') Assets_in_Lakhs
FROM Branch;  

SELECT D.Customer_name
FROM Depositer D, BankAccount B
WHERE D.Accno = B.Accno
GROUP BY D.Customer_name 
HAVING count(D.Accno) >= 2;

CREATE VIEW sum_of_loans AS 
SELECT Branch_name, SUM(Balanace)
FROM BankAccount
GROUP BY Branch;

