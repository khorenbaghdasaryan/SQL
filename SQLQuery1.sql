CREATE TABLE Product (
    ID int NOT NULL PRIMARY KEY IDENTITY,
    ProductType varchar(255),
    ProductName varchar(255) NOT NULL,
    ProductPrice varchar(255) NOT NULL
);

CREATE TABLE Customer (
    ID int NOT NULL PRIMARY KEY IDENTITY,
    CustomerLastName varchar(255) NOT NULL,
    CustomerFirstName varchar(255)
);

CREATE TABLE Sale (
    ID int NOT NULL PRIMARY KEY IDENTITY,
    SaleDate DATETIME,
    constraint FK_Sale_References_Product  FOREIGN KEY (ID) REFERENCES Product (ID),
	constraint FK_Sale_References_Customer FOREIGN KEY (ID) REFERENCES Customer (ID),
);