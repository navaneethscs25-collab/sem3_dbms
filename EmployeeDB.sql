create database empNavu;
use empNavu;

create table dept(
    deptno decimal(2,0),
    dname varchar(14) ,
    loc varchar(13) ,
    PRIMARY KEY(deptno)
);

create table emp(
    empno decimal(4,0),
    ename varchar(10) ,
    mgr_no decimal(4,0),
    hiredate date ,
    sal decimal(7,2) ,
    deptno decimal(2,0),
    PRIMARY KEY(empno),
    foreign key (deptno) references dept(deptno)
);

create table incentives(
    empno decimal(4,0),
    incentive_date date,
    incentive_amount decimal(10,2),
    PRIMARY KEY(empno,incentive_date),
    foreign key (empno) references emp(empno)
);

create table project(
    pno int,
    pname varchar(30) ,
    ploc varchar(30),
    PRIMARY KEY(pno)
);

create table assigned_to(
    empno decimal(4,0),
    pno int,
    job_role varchar(30),
    PRIMARY KEY(empno,pno),
    foreign key (empno) references emp(empno),
    foreign key (pno) references project(pno)
);

show tables;

INSERT INTO dept VALUES (10,"ACCOUNTING","MUMBAI");
INSERT INTO dept VALUES (20,"RESEARCH","BENGALURU");
INSERT INTO dept VALUES (30,"SALES","DELHI");
INSERT INTO dept VALUES (40,"OPERATIONS","CHENNAI");
INSERT INTO dept VALUES (50,"IT","HYDERABAD");
INSERT INTO dept VALUES (60,"FINANCE","MYSURU");

INSERT INTO emp VALUES (7369,"Adarsh",7902,"2012-12-17",80000.00,20);
INSERT INTO emp VALUES (7499,"Shruthi",7698,"2013-02-20",16000.00,30);
INSERT INTO emp VALUES (7521,"Anvitha",7698,"2015-02-22",12500.00,30);
INSERT INTO emp VALUES (7566,"Tanvir",7839,"2008-04-02",29750.00,20);
INSERT INTO emp VALUES (7698,"Kumar",7839,"2015-05-01",28500.00,30);
INSERT INTO emp VALUES (7839,"KING",NULL,"2009-11-17",50000.00,10);

INSERT INTO incentives VALUES(7499,"2019-02-01",5000.00);
INSERT INTO incentives VALUES(7521,"2019-03-01",2500.00);
INSERT INTO incentives VALUES(7566,"2022-02-01",5070.00);
INSERT INTO incentives VALUES(7698,"2020-03-01",9000.00);
INSERT INTO incentives VALUES(7698,"2022-04-01",4500.00);
INSERT INTO incentives VALUES(7839,"2023-01-01",6000.00);

INSERT INTO project VALUES(101,"AI Project","BENGALURU");
INSERT INTO project VALUES(102,"IOT","HYDERABAD");
INSERT INTO project VALUES(103,"BLOCKCHAIN","BENGALURU");
INSERT INTO project VALUES(104,"DATA SCIENCE","MYSURU");
INSERT INTO project VALUES(105,"AUTONOMUS SYSTEMS","PUNE");
INSERT INTO project VALUES(106,"CLOUD COMPUTING","CHENNAI");

INSERT INTO assigned_to VALUES(7499,101,"Software Engineer");
INSERT INTO assigned_to VALUES(7521,101,"Software Architect");
INSERT INTO assigned_to VALUES(7566,101,"Project Manager");
INSERT INTO assigned_to VALUES(7698,104,"Software Engineer");
INSERT INTO assigned_to VALUES(7839,104,"General Manager");
INSERT INTO assigned_to VALUES(7499,102,"Software Engineer");

Select * from dept;
select * from emp;
select * from incentives;
select * from project;
select * from assigned_to;


