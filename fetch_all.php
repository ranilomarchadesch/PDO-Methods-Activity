<?php
require_once 'dbconfig.php';

$stmt = $pdo->prepare("SELECT * FROM grocery_items");

$stmt->execute();

$items = $stmt->fetchAll();

echo "<pre>";
print_r($items);
echo "</pre>";
?>
