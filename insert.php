<?php
require_once 'dbconfig.php';

$sql = "INSERT INTO grocery_items
(item_name, brand_name, category, price_nzd,
 stock_quantity, expiration_date, country_origin)
VALUES
(:item_name, :brand_name, :category, :price_nzd,
 :stock_quantity, :expiration_date, :country_origin)";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    'item_name' => 'Creamy Milk Chocolate Block',
    'brand_name' => 'Whittakers',
    'category' => 'Chocolate',
    'price_nzd' => 6.50,
    'stock_quantity' => 25,
    'expiration_date' => '2027-06-30',
    'country_origin' => 'New Zealand'
]);
echo "Grocery item inserted successfully.";
?>
