<?php
require_once 'dbconfig.php';

$stmt = $pdo->prepare(
    "SELECT * FROM grocery_items WHERE item_id = :id"
);

$stmt->execute(['id' => 1]);

$item = $stmt->fetch();

echo "<pre>";
print_r($item);
echo "</pre>";
?>
