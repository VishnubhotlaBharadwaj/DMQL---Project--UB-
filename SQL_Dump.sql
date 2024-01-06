create table geolocation_table(geolocation_zip_code_prefix INT,
							  geolocation_lat VARCHAR(300),
							  geolocation_lng VARCHAR(300),
							  geolocation_city VARCHAR(200),
							  geolocation_state VARCHAR(100))
							  
SELECT * FROM geolocation_table where geolocation_zip_code_prefix = 1037;

INSERT INTO geolocation_table(geolocation_zip_code_prefix,
							  geolocation_lat,
							  geolocation_lng,
							  geolocation_city,
							  geolocation_state)  VALUES(1234, 90, 112, 'MUMBAI', 'MAHARASHTRA')
							  
SELECT * FROM geolocation_table where geolocation_city = 'MUMBAI';

create table customers_table(customer_id VARCHAR(100) primary key,
							customer_unique_id VARCHAR(100),
							customer_fname VARCHAR(25),
							customer_lname VARCHAR(25),
							customer_DOB VARCHAR(10),
							customer_age INT,
							customer_email VARCHAR(50),
							customer_gender VARCHAR(10),
							customer_zip_code_prefix VARCHAR(10),
							customer_city VARCHAR(40),
							customer_state VARCHAR(10))
							
select count(*) from customers_table

INSERT INTO customers_table(customer_id,
							customer_unique_id,
							customer_fname,
							customer_lname,
							customer_DOB,
							customer_age,
							customer_email,
							customer_gender,
							customer_zip_code_prefix,
							customer_city,
							customer_state)
VALUES (1124324, 23425554, 'stephen', 'hawking', '10/29/96', '89', 'steph@gmail.com', 'male', '9999', 'MUMBAI', 'MAHARASTRA')

SELECT * FROM customers_table where customer_city = 'MUMBAI';

create table sellers_table(seller_id VARCHAR(100) primary key,
							seller_fname VARCHAR(100),
							seller_lname VARCHAR(100),
							seller_dob VARCHAR(10),
							seller_age INT,
							seller_email VARCHAR(60),
							seller_gender VARCHAR(10),
							seller_zip_code_prefix VARCHAR(10),
							seller_city VARCHAR(60),
							seller_state VARCHAR(10))
							
select count(*) from sellers_table

INSERT INTO sellers_table(seller_id,
							seller_fname,
							seller_lname,
							seller_dob,
							seller_age,
							seller_email,
							seller_gender,
							seller_zip_code_prefix,
							seller_city,
							seller_state)
VALUES (35436, 'johny', 'depp', '04/21/96', '89', 'johny@gmail.com', 'male', '9999', 'MUMBAI', 'MAHARASTRA')

SELECT * FROM sellers_table where seller_city = 'MUMBAI';

create table orders_table(order_id VARCHAR(100) primary key,
						 customer_id VARCHAR(100),
						 order_status VARCHAR(100),
						 order_purchase_timestamp TIMESTAMP,
						 order_approved_at TIMESTAMP,
						 order_delivered_carrier_date TIMESTAMP,
						 order_delivered_customer_date TIMESTAMP,
						 order_estimated_delivery_date TIMESTAMP,
						 FOREIGN KEY (customer_id) REFERENCES customers_table(customer_id))	

select count(*) from orders_table

INSERT INTO orders_table(order_id,
						 customer_id,
						 order_status,
						 order_purchase_timestamp,
						 order_approved_at,
						 order_delivered_carrier_date,
						 order_delivered_customer_date,
						 order_estimated_delivery_date)
VALUES(4764, 1124324, 'PLACED','12-23-16 10:57:32', '11-29-16 10:00:00', '12-10-16 9:40:50', 
	   '12-16-16 11:50:40', '12-24-16 10:40:55')

Select * FROM orders_table where order_id = 'a4591c265e18cb1dcee52889e2d8acc3';

create table order_payments_table(order_id VARCHAR(100),
								 payment_sequential INT,
								 payment_type VARCHAR(30),
								 payment_installments INT,
								 payment_value NUMERIC(20,5),
								 FOREIGN KEY (order_id) REFERENCES orders_table(order_id))


select count(*) from order_payments_table

INSERT INTO order_payments_table(order_id,
								 payment_sequential,
								 payment_type,
								 payment_installments,
								 payment_value)
VALUES('4764', 2, 'credit_card', 3, 90) 
	   
Select * FROM order_payments_table where order_id = '4764';

create table order_reviews_table(review_id VARCHAR(100),
								order_id VARCHAR(100),
								review_score INT,
								review_comment_title VARCHAR(30),
								review_comment_message VARCHAR(500),
								review_creation_date TIMESTAMP,
								review_answer_timestamp TIMESTAMP,
								FOREIGN KEY (order_id) REFERENCES orders_table(order_id))
								










INSERT INTO order_reviews_table(review_id,
								order_id,
								review_score,
								review_comment_title,
								review_comment_message,
								review_creation_date,
								review_answer_timestamp)
VALUES(3424, 4764, 4, 'Good', 'Very good', '04-30-2023 2:57', '04-30-2023 10:00')
			
Select * FROM order_reviews_table where review_id = '3424'







create table products_table(product_id VARCHAR(100) primary key,
						   product_category_name VARCHAR(100),
						   product_name_length INT,
						   product_description_length INT,
						   product_photos_qty INT,
						   product_weight_g INT,
						   product_length_cm INT,
						   product_height_cm INT,
						   product_width_cm INT,
						   product_manufacturing_date VARCHAR(30),
						   product_expiry_date VARCHAR(30))
						   
						   
INSERT INTO products_table(product_id,
						   product_category_name,
						   product_name_length,
						   product_description_length,
						   product_photos_qty,
						   product_weight_g,
						   product_length_cm,
						   product_height_cm,
						   product_width_cm,
						   product_manufacturing_date,
						   product_expiry_date)
VALUES(76979, 'dairy_milk', 10, 346, 2, 1000, 9, 9, 7, '01/11/2023', '01/11/2024')
						
Select * FROM products_table where product_id = '76979'


create table order_items(order_id VARCHAR(100),
						order_item_id INT,
						product_id VARCHAR(100),
						seller_id VARCHAR(100),
						shipping_limit_data TIMESTAMP,
						price NUMERIC(20,5),
						freight_value NUMERIC(20,5),
						FOREIGN KEY (order_id) REFERENCES orders_table(order_id),
						FOREIGN KEY (seller_id) REFERENCES sellers_table(seller_id),
						FOREIGN KEY (product_id) REFERENCES products_table(product_id))		
						
						
INSERT INTO order_items(order_id,
						order_item_id,
						product_id,
						seller_id,
						shipping_limit_data,
						price,
						freight_value)
VALUES(4764, 76979, '76979', 35436, '05-06-2023 2:57', 99, '100')


Select * FROM products_table where product_id = '76979'	

create table product_seller_table(product_id VARCHAR(100) NOT NULL,
								 seller_id VARCHAR(100) NOT NULL,
								 FOREIGN KEY (seller_id) REFERENCES sellers_table(seller_id),
								 FOREIGN KEY (product_id) REFERENCES products_table(product_id))
								 
								 
INSERT INTO product_seller_table(product_id,
								 seller_id)
VALUES(76979, 35436)

Select * FROM products_table where product_id = '76979'

SELECT customers.customer_unique_id,
	COUNT(*) AS total_purchases
	FROM customers_table AS customers
    JOIN orders_table AS orders ON customers.customer_id = orders.customer_id
	GROUP BY customers.customer_unique_id
	ORDER BY total_purchases DESC
	LIMIT 10;
	
SELECT product_category_name,
    AVG(order_reviews.review_score) AS avg_rating
	FROM products_table AS products
    JOIN order_items AS order_items ON products.product_id = order_items.product_id
    JOIN orders_table AS orders ON order_items.order_id = orders.order_id
    JOIN order_reviews_table AS order_reviews ON orders.order_id = order_reviews.order_id
	GROUP BY product_category_name;
	
SELECT DATE_TRUNC('month', orders.order_purchase_timestamp) AS month,
    COUNT(DISTINCT orders.customer_id) AS unique_customers
	FROM orders_table AS orders
	WHERE EXTRACT(YEAR FROM orders.order_purchase_timestamp) = 2018
	GROUP BY month;
	
SELECT customers.customer_city,
    AVG(order_items.price + order_items.freight_value) AS avg_order_value
	FROM customers_table AS customers
    JOIN orders_table AS orders ON customers.customer_id = orders.customer_id
    JOIN order_items AS order_items ON orders.order_id = order_items.order_id
	GROUP BY customers.customer_city
	ORDER BY avg_order_value DESC
	LIMIT 10;

SELECT order_items.product_id, products.product_category_name,
    COUNT(*) AS return_count
	FROM order_items AS order_items
    JOIN orders_table AS orders ON order_items.order_id = orders.order_id
    JOIN order_reviews_table AS order_reviews ON orders.order_id = order_reviews.order_id
    JOIN products_table AS products ON order_items.product_id = products.product_id
	WHERE order_reviews.review_comment_title LIKE '%devolução%'
	GROUP BY order_items.product_id, products.product_category_name
	ORDER BY return_count DESC
	LIMIT 5;
	
SELECT AVG(EXTRACT(EPOCH FROM 
	(orders.order_delivered_customer_date - orders.order_delivered_carrier_date))) / 86400 AS avg_delivery_time_days
	FROM orders_table AS orders
	WHERE
    orders.order_status = 'delivered' AND
    orders.order_delivered_customer_date IS NOT NULL AND
    orders.order_delivered_carrier_date IS NOT NULL
	
SELECT products.product_category_name,
    COUNT(DISTINCT orders.order_id) AS order_count
	FROM orders_table AS orders
    JOIN order_items AS order_items ON orders.order_id = order_items.order_id
    JOIN products_table AS products ON order_items.product_id = products.product_id
	GROUP BY products.product_category_name
	ORDER BY order_count DESC
	LIMIT 10;

SELECT  s.seller_id, 
    COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END) / 
	COUNT(*) AS on_time_delivery_rate
	FROM sellers_table AS s
	JOIN order_items AS oi ON s.seller_id = oi.seller_id
	JOIN orders_table AS o ON oi.order_id = o.order_id
	GROUP BY s.seller_id
	ORDER BY on_time_delivery_rate DESC
	LIMIT 5;

SELECT r.order_id, 
    COUNT(r.review_id) AS num_reviews, 
    AVG(r.review_score) AS avg_rating
	FROM order_reviews_table AS r
	GROUP BY r.order_id
	ORDER BY avg_rating DESC
	LIMIT 10;

UPDATE orders_table
SET order_status = 'delivered'
WHERE order_id = 'e481f51cbdc54678b7cc49136f2d6af7';

UPDATE order_items
SET price = 50.99
WHERE order_id = '000576fe39319847cbb9d288c5617fa6' 
AND product_id = '557d850972a7d6f792fd18ae1400d9b6';

UPDATE customers_table
SET customer_city = 'New City'
WHERE customer_id = '9fb35e4ed6f0a14a4977cd9aea4042bb';

UPDATE products_table
SET product_category_name = 'construcao_ferramentas_seguranca'
WHERE product_id = '96bd76ec8810374ed1b65e291975717f';

UPDATE sellers_table
SET seller_zip_code_prefix = '11111'
WHERE seller_id = 'c0f3eea2e14555b6faeea3dd58c1b1c3';

--ADDING FUNCTIONS

create or replace function seller_total_sales(sellers_id VARCHAR(100)) returns numeric(100,5)
LANGUAGE plpgsql
AS $$
declare total_sales numeric(100,5);
begin
	select sum(price)
	into total_sales
	from order_items
	where seller_id = sellers_id;
	return total_sales;
end;
$$;

select seller_total_sales('dd7ddc04e1b6c2c614352b383efe2d36');



--TRIGGERS

create or replace function payment_made_function() returns trigger as $payment_made$
begin
	if new.payment_installments > 0
	then
		update orders_table
		set order_status = 'purchased'
		from orders_table as ordernumber
		where ordernumber.order_id = new.order_id;
	end if;
return new;
end;
$payment_made$ LANGUAGE plpgsql;

create trigger payment_made
after INSERT
on
order_payments_table
for each row
execute function payment_made_function();



drop trigger payment_made on order_payments_table;


select * from order_payments_table where order_id = '4764789';
select * from orders_table where order_id = '4764789';


INSERT INTO order_payments_table(order_id,
								 payment_sequential,
								 payment_type,
								 payment_installments,
								 payment_value)
								
VALUES('4764789', 2, 'credit_card', 3, 90);




--INDEXING

SELECT customers.customer_unique_id,
COUNT(* ) AS total_purchases
FROM customers_ table AS customers
JOIN orders_table AS orders ON customers.customer_id
= orders. customer id
GROUP BY customers. customer unique id
ORDER BY total_purchases DESC
LIMIT 10;

create index idx_customers_customer_id on customers_table (customer_id) ;

create index idx_orders_customer_id on orders_table (customer_id) ;

drop index idx_customers_customer_id;

drop index idx_orders_customer_id;

SELECT customers. customer_unique_id,
COUNT(*) AS total_purchases
FROM customers_table AS customers
JOIN orders_table AS orders ON customers. customer_id = orders. customer_id
GROUP BY customers. customer unique id
ORDER BY total_purchases DESC
LIMIT 10;



--UPDATE QUERY

INSERT INTO order_payments_table(order_id,
payment sequential,
payment_type,
payment installments.
payment_value)

VALUES ('47647', 2, 'credit_card', 3, 90) ;

select * from order payments table where order id = '47647';


UPDATE order_payments_table SET payment_sequential = 1,
payment_type = 'DEBIT CARD'
payment_installments = 1,
payment_value = '99'
WHERE order_id = '47647';

select * from order_payments_table where order_id = '47647';



UPDATE order_payments_table SET payment_sequential = 1,
payment_type = 'DEBIT CARD'
payment _installments = 1,
payment_value = '99'
WHERE order_id = '4764';


--DELETE QUERY


select * from products_table where product_category_name = 'artes';

delete from products_table where product_category_name = 'artes';