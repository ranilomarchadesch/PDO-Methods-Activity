<?php
require_once 'dbconfig.php';

$id = 100;

$stmt = $pdo->prepare(
    "DELETE FROM grocery_items WHERE item_id = :id"
);

$stmt->execute(['id' => $id]);

if ($stmt->rowCount() > 0) {
    echo "Grocery item deleted successfully.";
} else {
    echo "No grocery item was found with that ID.";
}
?>
