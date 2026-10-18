<?php
require_once 'dbconfig.php';

$stmt = $pdo->prepare("SELECT * FROM grocery_items");

$stmt->execute();
$items = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Zealand Grocery Items</title>
</head>
<body>
    <h2>New Zealand Grocery Items</h2>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Brand Name</th>
            <th>Category</th>
            <th>Price (NZD)</th>
            <th>Stock Quantity</th>
            <th>Expiration Date</th>
            <th>Country of Origin</th>
        </tr>

        <?php foreach ($items as $item): ?>
        <tr>
            <td><?= htmlspecialchars((string) $item['item_id']) ?></td>
            <td><?= htmlspecialchars($item['item_name']) ?></td>
            <td><?= htmlspecialchars($item['brand_name']) ?></td>
            <td><?= htmlspecialchars($item['category']) ?></td>
            <td><?= htmlspecialchars((string) $item['price_nzd']) ?></td>
            <td><?= htmlspecialchars((string) $item['stock_quantity']) ?></td>
            <td><?= htmlspecialchars($item['expiration_date'] ?? '') ?></td>
            <td><?= htmlspecialchars($item['country_origin']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
