-- q1

-- spliting into 2 tables, productlines and orderProducts
CREATE TABLE productlines ( OrderID INT PRIMARY KEY AUTO_INCREMENT, 
							CustomerName VARCHAR(20) );

-- makes sure OrderID starts from 101
ALTER TABLE productlines AUTO_INCREMENT = 101;

INSERT INTO productlines( CustomerName)

VALUES ( 'John Doe' ),
       ( 'Jane Doe' ),
       ( 'Emily Clark' );
       
SELECT * FROM products.productlines;

-- 
CREATE TABLE orderProducts ( OrderID INT, 
                             Products VARCHAR(20),
							 PRIMARY KEY ( OrderID, Products ),
                             FOREIGN KEY (OrderID) REFERENCES productlines(OrderID));
                             
INSERT INTO orderProducts ( OrderID, Products )

VALUES ( 101, 'Laptop' ),
       ( 101, 'Mouse' ),
       ( 102, ' Tablet' ),
       ( 102, ' Keyboard' ),
	     ( 102, ' Mouse' ),
       ( 103, 'Phone' );
       
SELECT * FROM products.orderProducts;
       
-- q2

-- creating customers table since it's not dependent on both quantity and products
CREATE TABLE customers ( OrderID INT PRIMARY KEY, 
						 CustomerName VARCHAR(20) );

-- Makes the oderID starts from 101, after oderID++						
ALTER TABLE customers AUTO_INCREMENT = 101;
                         
CREATE TABLE OrderDetails ( OrderID INT, 
							              Products VARCHAR(20), 
                            Quantity INT,
                            
                            -- quantity depends on both the oderID and Products
                            PRIMARY KEY (OrderID, Products),
                            FOREIGN KEY(OrderID) REFERENCES customers(OrderID));

