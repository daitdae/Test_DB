
--1
CREATE TABLE categories (
    category_id CHAR(10) CONSTRAINT categories_category_id_pk PRIMARY KEY,
    type VARCHAR2(50) CONSTRAINT categories_type_ck NOT NULL CHECK (type IN ('侥前', '啊傈','林规','啊备'))
	);

--2
CREATE TABLE product (
    product_id CHAR(10) CONSTRAINT product_product_id_pk PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    ptok_date DATE DEFAULT SYSDATE NOT NULL,
    category_id CHAR(10) REFERENCES categories(category_id) ON DELETE CASCADE
);

--3
CREATE TABLE customers (
    customer_id VARCHAR2(20) CONSTRAINT customers_customer_id_pk PRIMARY KEY,
    email VARCHAR2(20) CONSTRAINT customers_email_uqnn UNIQUE NOT NULL,
    customer_name VARCHAR2(30) NOT NULL,
    address VARCHAR2(100) NOT NULL
);

--4
CREATE TABLE orders (
    order_id NUMBER CONSTRAINT orders_order_id_pk PRIMARY KEY,
    customer_id VARCHAR2(20) REFERENCES customers(customer_id) ON DELETE CASCADE,
    product_id CHAR(10) REFERENCES product(product_id) ON DELETE CASCADE,
    order_date DATE DEFAULT SYSDATE,
    order_count NUMBER DEFAULT 0
);

--5
CREATE TABLE wishlist (
    customer_id VARCHAR2(20) REFERENCES customers(customer_id) ON DELETE CASCADE,
    product_id CHAR(10) REFERENCES product(product_id) ON DELETE CASCADE,
    save_date DATE DEFAULT SYSDATE
);


