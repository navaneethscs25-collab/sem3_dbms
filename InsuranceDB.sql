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