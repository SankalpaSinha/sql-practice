-- Queries from my MuleSoft integration training (MySQL, MuleTrainingDB)
USE MuleTrainingDB;

-- 1. Fetch the full product catalog (used by the GET /db endpoint)
SELECT * FROM Product;

-- 2. Filter by brand
SELECT * FROM Product WHERE brand_name = 'Apple';

-- 3. Parameterized form, as configured in the Mule Database connector.
--    The value is bound separately as an input parameter, never concatenated
--    into the query text -> prevents SQL injection.
--    Input parameters: { bname: attributes.queryParams.brandname }
SELECT * FROM Product WHERE brand_name = :bname;

-- 4. Watermark-based incremental fetch (Object Store lab):
--    only rows newer than the last processed id are picked up on each
--    scheduled run, so repeated jobs never reprocess old data.
SELECT * FROM Product WHERE product_id > :lastproductid ORDER BY product_id;

-- 5. New watermark value after a successful run
SELECT MAX(product_id) FROM Product;

-- Practice queries on the same schema --

-- Products sorted by price (descending)
SELECT name, brand_name, original_price
FROM Product
ORDER BY original_price DESC;

-- Product count per brand
SELECT brand_name, COUNT(*) AS product_count
FROM Product
GROUP BY brand_name;

-- Brands whose average price crosses a threshold
SELECT brand_name, AVG(original_price) AS avg_price
FROM Product
GROUP BY brand_name
HAVING AVG(original_price) > 40000;

-- Discount computed per product
SELECT name,
       original_price,
       offer_price,
       (original_price - offer_price) AS discount
FROM Product
WHERE offer_price IS NOT NULL;
