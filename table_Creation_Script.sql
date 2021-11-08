
create database if not exists `order-directory` ;

use `order-directory`;

-- Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
create table if not exists `supplier`(
	`SUPP_ID` int primary key,
    `SUPP_NAME` varchar(50) ,
	`SUPP_CITY` varchar(50),
	`SUPP_PHONE` varchar(10)
);

-- Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
create table if not exists `customer` (
	`CUS_ID` int not null,
	`CUS_NAME` varchar(20) null default null,
	`CUS_PHONE` varchar(10),
	`CUS_CITY` varchar(30) ,
	`CUS_GENDER` CHAR,
	primary key (`CUS_ID`)
);

-- Category(CAT_ID,CAT_NAME)
create table if not exists `category` (
	`CAT_ID` int not null,
	`CAT_NAME` varchar(20) null default null,
	primary key (`CAT_ID`)
);

-- Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
create table if not exists `product` (
	`PRO_ID` int not null,
	`PRO_NAME` varchar(20) null default null,
	`PRO_DESC` varchar(60) null default null,
	`CAT_ID` int not null,
	primary key (`PRO_ID`),
	foreign key (`CAT_ID`) references category(`CAT_ID`)
);

-- ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
 create table if not exists `product_details` (
	`PROD_ID` int not null,
	`PRO_ID` int not null,
	`SUPP_ID` int not null,
	`PROD_PRICE` int not null,
	primary key (`PROD_ID`),
	foreign key (`PRO_ID`) references product(`PRO_ID`),
	foreign key (`SUPP_ID`) references supplier(`SUPP_ID`)
);

-- Order(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
create table if not exists `order` (
  `ORD_ID` int not null,
  `ORD_AMOUNT` int not null,
  `ORD_DATE` date,
  `CUS_ID` int not null,
  `PROD_ID` int not null,
  primary key (`ORD_ID`),
  foreign key (`CUS_ID`) references customer(`CUS_ID`),
  foreign key (`PROD_ID`) references product_details(`PROD_ID`)
);

-- Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)
create table if not exists `rating` (
	`RAT_ID` int not null,
	`CUS_ID` int not null,
	`SUPP_ID` int not null,
	`RAT_RATSTARS` int not null,
	primary key (`RAT_ID`),
	foreign key (`SUPP_ID`) references supplier(`SUPP_ID`),
	foreign key (`CUS_ID`) references customer(`CUS_ID`)
  );