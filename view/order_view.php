<?php
require_once 'view/elements/sidebar.php';
?>

<div class="items">
    <h3>Your Orders</h3>
    <table border="1" class="order_table">
        <tr>
            <th>Order number</th>
            <th>Products</th>
            <th>Quantity</th>
            <th>Status</th>
            <th>Create Time</th>
            <th>Ship Address</th>
            <th>Sum</th>
        </tr>
        <?php foreach ($data as $value): ?>
            <tr>
                <td><?=$value['id']?></td>
                <td><a href="../../product/show/?id=<?=$value['product_id']?>">
                        <?=$value['title']?></a></td>
                <td><?=$value['quantity']?></td>
                <td><?=$value['status']?></td>
                <td><?=$value['create_time']?></td>
                <td><?=$value['ship_address']?></td>
                <td><?='$'.$value['sum']?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</div>