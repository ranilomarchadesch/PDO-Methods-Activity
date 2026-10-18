CREATE DATABASE IF NOT EXISTS new_zealand_grocery_db;
USE new_zealand_grocery_db;

CREATE TABLE grocery_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    brand_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price_nzd DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    expiration_date DATE,
    country_origin VARCHAR(50) DEFAULT 'New Zealand'
);

INSERT INTO grocery_items
(item_name, brand_name, category, price_nzd,
 stock_quantity, expiration_date)
VALUES
('Creamy Milk Chocolate Block', 'Whittakers', 'Chocolate', 6.50, 30, '2027-05-10'),
('50% Dark Chocolate Block', 'Whittakers', 'Chocolate', 6.50, 25, '2027-05-15'),
('72% Dark Ghana Block', 'Whittakers', 'Chocolate', 6.80, 20, '2027-06-10'),
('Creamy Caramel Block', 'Whittakers', 'Chocolate', 6.50, 22, '2027-05-20'),
('Almond Gold Block', 'Whittakers', 'Chocolate', 6.80, 18, '2027-06-15'),
('Peanut Butter Block', 'Whittakers', 'Chocolate', 6.50, 24, '2027-05-25'),
('Fruit and Nut Block', 'Whittakers', 'Chocolate', 6.50, 28, '2027-06-20'),
('Hokey Pokey Crunch Block', 'Whittakers', 'Chocolate', 6.50, 26, '2027-06-25'),
('Weet-Bix', 'Sanitarium', 'Cereal', 5.50, 35, '2027-03-15'),
('Gluten Free Weet-Bix', 'Sanitarium', 'Cereal', 6.20, 20, '2027-03-20'),
('UP&GO Chocolate', 'Sanitarium', 'Breakfast Drink', 3.00, 40, '2026-12-15'),
('UP&GO Vanilla', 'Sanitarium', 'Breakfast Drink', 3.00, 32, '2026-12-20'),
('So Good Oat Milk', 'Sanitarium', 'Plant Milk', 4.50, 25, '2026-12-25'),
('Marmite Yeast Spread', 'Sanitarium', 'Spread', 5.00, 22, '2027-04-15'),
('Ricies', 'Sanitarium', 'Cereal', 4.80, 27, '2027-03-25'),
('Anchor Blue Milk', 'Anchor', 'Dairy', 4.50, 30, '2026-11-05'),
('Anchor Butter Unsalted', 'Anchor', 'Dairy', 6.00, 20, '2026-12-10'),
('Anchor Butter Salted', 'Anchor', 'Dairy', 6.00, 18, '2026-12-15'),
('Anchor Cheddar Cheese Slices', 'Anchor', 'Dairy', 5.50, 24, '2026-11-20'),
('Anchor Sour Cream Original', 'Anchor', 'Dairy', 3.80, 16, '2026-11-10');

INSERT INTO grocery_items
(item_name, brand_name, category, price_nzd,
 stock_quantity, expiration_date, country_origin)
SELECT
    g.item_name,
    g.brand_name,
    g.category,
    g.price_nzd,
    g.stock_quantity + n.copy_number,
    DATE_ADD(g.expiration_date, INTERVAL n.copy_number DAY),
    'New Zealand'
FROM (
    SELECT item_name, brand_name, category, price_nzd,
           stock_quantity, expiration_date
    FROM grocery_items
    WHERE item_id BETWEEN 1 AND 20
) AS g
CROSS JOIN (
    SELECT 1 AS copy_number
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
) AS n;

SELECT COUNT(*) AS total_records
FROM grocery_items;

SELECT * FROM grocery_items;


<?php
echo "PHP is working!";
?>
