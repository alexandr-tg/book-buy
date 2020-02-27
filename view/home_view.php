<?php
require_once 'view/elements/banners.php';
require_once 'view/elements/sidebar.php';
?>

<div class="items">
            <div class="offers">
                <a href="..?best_seller">Best sellers</a>
                <a href="..?new_arrivals">New arrivals</a>
            </div>
            <div style="clear: left"></div>

                <?php if (isset($_GET['best_seller'])): ?>
                    <?php foreach ($data['best_seller'] as $value):;?>
                        <div class="item">
                            <a href="../../product/show/?id=<?=$value['id']?>">
                                <img class="item_img" src='../../web/images/productImage/<?=$value['image']?>' alt="">
                            </a>
                            <span class="book_name"><?=$value['title'] ?></span>
                            <span class="book_price">$<?=$value['price']?></span>
                        </div>
                    <?php endforeach; ?>
                <?php elseif (isset($_GET['new_arrivals'])): ?>
                    <?php foreach ($data['new_arrivals'] as $value):;?>
                        <div class="item">
                            <a href="../../product/show/?id=<?=$value['id']?>">
                                <img class="item_img" src='../../web/images/productImage/<?=$value['image']?>' alt="">
                            </a>
                            <span class="book_name"><?=$value['title'] ?></span>
                            <span class="book_price">$<?=$value['price']?></span>
                        </div>
                    <?php endforeach; ?>
                <?php elseif(isset($data['data'])):?>
                <?php foreach ($data['data'] as $value):?>
                    <div class="item">
                        <a href="../../product/show/?id=<?=$value['id']?>">
                            <img class="item_img" src='../../web/images/productImage/<?=$value['image']?>' alt="">
                        </a>
                        <span class="book_name"><?=$value['title'] ?></span>
                        <span class="book_price">$<?=$value['price']?></span>
                    </div>
                <?php endforeach; ?>
                <?php endif; ?>

            <div class="paginator" style="clear: both">
                <?php if ($data['page'] > 1): ?>
                    <a href="../?page=<?=$data['page']-1?>">Prev</a>
                <?php endif; ?>
                <?php for ($i = 1; $i <= $data['total_page']; $i++): ?>
                    <a href="../?page=<?=$i?>"><?=$i?></a>
                <?php endfor; ?>
                <?php if ($data['page'] < $data['total_page']): ?>
                    <a href="../?page=<?=$data['page']+1?>">Next</a>
                <?php endif; ?>
            </div>
</div>