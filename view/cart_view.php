<?php
require_once 'view/elements/sidebar.php';
?>

<div class="items">
    <h3>Your Cart</h3>
    <?php if(isset($data['main']))?>
    <?php foreach ($data['main'] as $value): ?>
        <div class="item">
            <a href="/cart/remove/?id=<?=$value['id'];?>">
                <img class="remove_icon" src="../../web/images/templateImage/remove.png" alt="">
            </a>
            <a href="../product/show/?id=<?=$value['id']?>">
                <img class="item_img" src='../../web/images/productImage/<?=$value['image']?>' alt="">
            </a>
            <span class="book_name"><?=$value['title']?></span>
            <span class="book_price">$<?=$value['price']?></span>
        </div>
    <?php endforeach; ?>
    <a href="../../order/form/" class="cart_button">Proceed to checkout</a>
</div>
