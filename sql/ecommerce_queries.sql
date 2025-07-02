CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    order_id VARCHAR(10),
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

---- total revenue
SELECT SUM(amount) AS total_revenue
FROM payments;

---- top 5 selling products ( by quantity)


---- monthly sales trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_sales
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

---- sales by region
SELECT 
    c.region,
    SUM(pay.amount) AS total_sales
FROM payments pay
JOIN orders o ON pay.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

---- top customers by spending
SELECT 
    c.customer_name,
    SUM(p.amount) AS total_spent
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

---- sales by products
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

---- Average order value(AOV)
SELECT 
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM payments;

---- numbers of orders per customers 
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC
LIMIT 10;

---- customer lifetime value(CLV)
SELECT 
    c.customer_name,
    SUM(p.amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_name
ORDER BY lifetime_value DESC
LIMIT 10;

----  most popular payment method
SELECT 
    payment_method,
    COUNT(*) AS count,
    ROUND(SUM(amount), 2) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

---- daily sales trends(last 30 days)
SELECT 
    o.order_date,
    ROUND(SUM(p.amount), 2) AS total_sales
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY o.order_date
ORDER BY o.order_date;










