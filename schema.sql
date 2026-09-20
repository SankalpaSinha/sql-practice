-- MuleTrainingDB: schema used in my MuleSoft integration training
-- Database: MySQL 8

CREATE SCHEMA MuleTrainingDB;
USE MuleTrainingDB;

-- Product table backing the product-catalog integration APIs.
-- Data type choices:
--   DECIMAL(10,2)  -> exact monetary values (never FLOAT for money)
--   BIGINT         -> 13-digit epoch-millisecond timestamps (e.g. 1466098094993)
--   AUTO_INCREMENT -> database-generated primary key
CREATE TABLE Product (
    product_id        INT AUTO_INCREMENT PRIMARY KEY,
    brand_name        VARCHAR(100),
    description       VARCHAR(255),
    name              VARCHAR(100),
    offer_price       DECIMAL(10, 2),
    offer_valid_until BIGINT,
    original_price    DECIMAL(10, 2)
);

-- Sample data (mirrors the product payloads used in the training REST/SOAP services)
INSERT INTO Product (brand_name, description, name, offer_price, offer_valid_until, original_price) VALUES
('Sony',  'SONY Laptop',        'Sony VAIO',       2000.00, 1466098094993, 4000.00),
('Apple', 'Apple Laptop',       'MacBook Air',     55000.00, 1466098094993, 65000.00),
('Apple', 'Apple Smartphone',   'iPhone',          40000.00, 1466098094993, 48000.00),
('HP',    'HP Laptop',          'HP Pavilion',     35000.00, 1466098094993, 42000.00),
('IBM',   'IBM ThinkPad',       'ThinkPad T14',    52000.00, 1466098094993, 60000.00);
