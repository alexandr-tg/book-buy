<?php require_once 'view/elements/sidebar.php'; ?>
<div class="items">
            <div class="offers">
                <a href="..?best_seller">Best sellers</a>
                <a href="..?new_arrivals">New arrivals</a>
            </div>
            <div style="clear: left"></div>
                <h3><?=$data['cat_name']?></h3>
                <?php foreach ($data['main'] as $value):?>
                    <div class="item">
                        <a href="../../product/show/?id=<?=$value['id']?>">
                            <img class="item_img" src='../../web/images/productImage/<?=$value['image']?>' alt="">
                        </a>
                        <span class="book_name"><?=$value['title'] ?></span>
                        <span class="book_price">$<?=$value['price']?></span>
                    </div>
                <?php endforeach; ?>
</div>