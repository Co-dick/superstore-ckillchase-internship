
SET datestyle = 'ISO , MDY';
CREATE TABLE superstore_data 
 (
    "Row ID" INTEGER,
    "Order ID" TEXT,
    "Order Date" DATE,
    "Ship Date" DATE,
    "Ship Mode" TEXT,
    "Customer ID" TEXT,
    "Customer Name" TEXT,
    "Segment" TEXT,
    "Country" TEXT,
    "City" TEXT,
    "State" TEXT,
    "Postal Code" TEXT,
    "Region" TEXT,
    "Product ID" TEXT,
    "Category" TEXT,
    "Sub-Category" TEXT,
    "Product Name" TEXT,
    "Sales" NUMERIC, 
    "Quantity" INTEGER,
    "Discount" NUMERIC,
    "Profit" NUMERIC 
);

COPY superstore_data ("Row ID", "Order ID", "Order Date", "Ship Date", "Ship Mode", "Customer ID", "Customer Name", "Segment", "Country", "City", "State", "Postal Code", "Region", "Product ID", "Category", "Sub-Category", "Product Name", "Sales", "Quantity", "Discount", "Profit")
FROM 'C:/PostgreSQLImport/superstore_data.csv'
DELIMITER ','
CSV HEADER;



SELECT "Customer ID", "Customer Name", SUM("Sales") AS total_sales
FROM  superstore_data
GROUP BY "Customer ID", "Customer Name"
ORDER BY total_sales DESC;


SELECT "Category", AVG("Discount") AS average_discount
FROM superstore_data
GROUP BY "Category"
ORDER BY average_discount DESC;


SELECT "City", SUM("Sales") AS total_sales FROM superstore_data
GROUP BY "City"ORDER BY total_sales DESC
LIMIT 5;


SELECT "Product Name", SUM("Sales") AS total_sales FROM superstore_data
GROUP BY "Product Name"
HAVING SUM("Sales") > 5000 ORDER BY total_sales DESC;


SELECT "Ship Mode", COUNT("Order ID") AS number_of_orders FROM superstore_data
GROUP BY "Ship Mode" ORDER BY number_of_orders DESC;






