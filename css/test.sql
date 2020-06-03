CREATE database stockapp;


CREATE TABLE type_of_storage(
	ID 			INT		 NOT NULL,
	name 		CHAR(50) NOT NULL,

	PRIMARY KEY(ID)
);

CREATE TABLE stock(
	ID 					INT 		NOT NULL	AUTO_INCREMENT,
	name 				CHAR(15) 	NOT NULL, 
	type_of_storage_id 	INT 	 	NOT NULL,
	no_floor 			INT,
	absorptive_capacity INT,

	PRIMARY KEY(ID),
	FOREIGN KEY (type_of_storage_id) REFERENCES type_of_storage(ID)
);


CREATE TABLE item(
	ID 					INT 		NOT NULL	AUTO_INCREMENT,
	name 				CHAR(15) 	NOT NULL,
	stock_id 			INT			NOT NULL,
	place_of_store 		CHAR(15),

	PRIMARY KEY	(ID),
	FOREIGN KEY (stock_id) REFERENCES stock(ID)
);


CREATE table storage_location (
	ID 				INT 	NOT NULL	AUTO_INCREMENT,
	item_id 		INT 	references item(ID),
	stock_id 	 	INT		references stock(ID),
	floor 			INT,
	sector 			CHAR(2),

	PRIMARY KEY(ID),
	FOREIGN KEY (stock_id) REFERENCES stock(ID),
	FOREIGN KEY (item_id) REFERENCES item(ID)
);

CREATE TABLE import (
	ID 						INT 	NOT NULL	AUTO_INCREMENT,
	item_id 	 			INT 	NOT NULL,
	date_of_arrival			DATETIME,
	county_of_manufacture 	CHAR(15),
	quantity 				INT,

	PRIMARY KEY(ID),
	FOREIGN KEY (item_id) REFERENCES item(ID)
);

CREATE TABLE customer (
	ID  	INT 		NOT NULL	AUTO_INCREMENT,
	name 	CHAR(50) 	NOT NULL,
	customer_number 	INT,
	
	PRIMARY KEY(ID)
);

CREATE TABLE request (
	ID 					INT 		NOT NULL	AUTO_INCREMENT,
	item_id 	 		INT			NOT NULL,
	customer_id 		INT 		NOT NULL,
	required_quantity 	INT 		NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY (item_id) REFERENCES item(ID),
	FOREIGN KEY (customer_id) REFERENCES customer(ID)
);

CREATE TABLE delivery (
	ID 						INT 	NOT NULL 	AUTO_INCREMENT,
	request_id 	 			INT 	references request(ID),
	delivery_date 			DATETIME,
	place_to 				CHAR(15),

	PRIMARY KEY(ID),
	FOREIGN KEY (request_id) REFERENCES request(ID)
);


CREATE TABLE manager(
	ID 				INT 		NOT NULL 	AUTO_INCREMENT,
	stock_id 		INT 		NOT NULL,
	name 			CHAR(50)	NOT NULL,
	no_of_workers 	INT ,

	PRIMARY KEY(ID),
	FOREIGN KEY (stock_id) REFERENCES stock(ID)
);


CREATE TABLE employee(
	ID 		INT 				NOT NULL	AUTO_INCREMENT,
	name 	CHAR(50) 			NOT NULL,
	salary 	DECIMAL(18, 2) 		NOT NULL,
	no 		INT 				NOT NULL,

	manager_id 		INT 		NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY (manager_id) REFERENCES manager(ID)
);


INSERT INTO type_of_storage(name)
VALUES ("Building material");

INSERT INTO stock(ID,name, type_of_storage_id, no_floor,absorptive_capacity)
VALUES(1, "Shayd", 1, 3, 30);