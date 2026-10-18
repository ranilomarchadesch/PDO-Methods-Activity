
<?php
require_once 'dbconfig.php';

$sql = "UPDATE grocery_items
SET price_nzd = :price_nzd,
    stock_quantity = :stock_quantity
WHERE item_id = :id";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    'price_nzd' => 7.00,
    'stock_quantity' => 40,
    'id' => 1
]);

if ($stmt->rowCount() > 0) {
    echo "Grocery item updated successfully.";
} else {
    echo "No changes were made. Check the item ID or existing values.";
}
?>
