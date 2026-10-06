SHOW databases;

CREATE database insuranceNavu;
USE insuranceNavu;

CREATE TABLE person (
	driverid varchar(10) primary key,
    name varchar(20) not null,
    address varchar(20) not null
) engine = InnoDB;

CREATE TABLE car (
	regno varchar(10) primary key,
    model varchar(20) not null,
    year year  not null
) engine = InnoDB;

CREATE TABLE owns (
	driverid varchar(10),
    regno varchar(10),
    foreign key (driverid) references 
		person (driverid) on delete cascade,
	foreign key (regno) references 
		car (regno) on delete cascade
) engine = InnoDB;

CREATE TABLE accident (
	report_no varchar(10) primary key,
    accident_date date,
    location varchar(20) not null
) engine = InnoDB;

CREATE TABLE participated (
	driverid varchar(10),
    regno varchar(10),
    report_no varchar(10),
    damage_amt decimal(6),
    foreign key (driverid) references 
		person (driverid) on delete cascade,
	foreign key (regno) references 
		car (regno) on delete cascade
) engine = InnoDB;

describe participated;

INSERT into Person VALUES ('D001', 'Jake', 'Vijaynagar');
INSERT into Person VALUES ('D002', 'Loki', 'Kormangala');
INSERT into Person VALUES ('D003', 'Sandy', 'Basvangudi');
INSERT into Person VALUES ('D004', 'Lucy', 'Hanumanthnagar');
INSERT into Person VALUES ('D005', 'Cassie', 'Malleshwaram');

INSERT into Car VALUES ('KA03MH8765', 'Audi', 2010);
INSERT into Car VALUES ('KA01MH8575', 'Alto', 2020);
INSERT into Car VALUES ('KA05MH9765', 'Omni', 2000);
INSERT into Car VALUES ('KA07MH7764', 'Ertiga', 2010);
INSERT into Car VALUES ('KA09MH3645', 'Celario', 2011);

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`insurancenavu`.`owns`, CONSTRAINT `owns_ibfk_1
INSERT into Owns VALUES ('D001', 'KA03MH8765');
INSERT into Owns VALUES ('D002', 'KA01MH8575');
INSERT into Owns VALUES ('D003', 'KA05MH9765');
INSERT into Owns VALUES ('D004', 'KA07MH7764');
INSERT into Owns VALUES ('D005', 'KA09MH3645');

INSERT into Accident VALUES ('R001', '2010-07-24', 'Vijaynagar');
INSERT into Accident VALUES ('R002', '2023-10-29', 'Kormangala');
INSERT into Accident VALUES ('R003', '2008-07-07', 'Basvangudi');
INSERT into Accident VALUES ('R004', '2011-10-18', 'Hanumanthnagar');
INSERT into Accident VALUES ('R005', '2012-05-27', 'Malleshwaram');

INSERT into Participated VALUES ('D001', 'KA03MH8765', 'R001', 10000);
INSERT into Participated VALUES ('D002', 'KA01MH8575', 'R002', 1500);
INSERT into Participated VALUES ('D003', 'KA05MH9765', 'R003', 6000);
INSERT into Participated VALUES ('D004', 'KA07MH7764', 'R004', 7000);
INSERT into Participated VALUES ('D005', 'KA09MH3645', 'R005', 8800);

SELECT * FROM Car;
SELECT * FROM Owns; 
SELECT * FROM Person;
SELECT * FROM Accident;
SELECT * FROM Participated;


SELECT accident_date AS accident, location
FROM Accident;

UPDATE Participated
SET damage_amt = 25000
WHERE regno = 'KA05MH9765' AND report_no = 'R003';

SELECT driverid 
FROM Participated
WHERE damage_amt >= 25000;
