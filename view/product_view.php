<div class="crumb">
    <a href="/"><span>Home</span></a>
    <img src="../../web/images/templateImage/arrow.png" alt="">
    <a href="../../category/sub/?id=<?= $data['subcategories_id'] ?>">
        <span><?= ucfirst($data['sub_cat']['name']) ?></span>
    </a>
    <img src="../../web/images/templateImage/arrow.png" alt="">
    <a href=""><span><?= $data['title'] ?></span></a>
</div>

<div class="product_block clearfix">
    <img src="../../web/images/productImage/<?= $data['image'] ?>" alt="" class="product_img">
    <div class="title_desc_pay">
        <div>
            <h1><?= $data['title'] ?></h1>
            <ul class="spec">
                <?php foreach ($data['spec'] as $value):?>
                    <li><?=$value?></li>
                <?php endforeach; ?>
            </ul>
        </div>
        <div class="product_payment">
            <div class="price_block">
                <div class="price">
                    <span>Our Price :</span>
                    <span>$<?= $data['price'] ?></span>
                    <span>Was $<?= $data['discount']; ?> Save 20%</span>
                </div>
                <a href="/cart/add/?add_cart=<?= $data['id'] ?>">Add to cart</a>
            </div>
            <p style="padding: 0;">Safe, Secure Shopping</p>
            <img src="../web/images/templateImage/paypal.png" alt="">
            <img src="../web/images/templateImage/mastercard.png" alt="">
            <img src="../web/images/templateImage/visa.png" alt="">
            <img src="../web/images/templateImage/americanexpress.png" alt="">
            <a href="/wish/add/?add_wish=<?= $data['id'] ?>" class="wish">Add to wish</a>
        </div>
    </div>
</div>

<div class="product_info">
    <div class="product_desc">
        <h2>Product Information</h2>
        <p><?= $data['descrip'] ?></p>
    </div>


    <div class="product_review clearfix">
        <h2>Product review</h2>
        <?php foreach ($data['review'] as $value): ?>
            <div class="review_item">
                <img src="../../web/images/userImage/<?= $value['image'] ?>" alt="">
                <p><?= $value['review'] ?></p>
                <span><?= $value['f_name'] . ' ' . $value['l_name'] ?></span>
            </div>
        <?php endforeach; ?>

        <div class="write_comment">
            <h2>Write a comment</h2>
            <form action="../../product/review/" method="post">
                <span>Message <textarea cols="76" rows="8" name="review" required></textarea></span>
                <input type="hidden" name="token" value="<?= $_SESSION['csrf_token'] ?>">
                <input type="submit" class="submit" value="Submit">
            </form>
        </div>


    </div>
</div>

<div class="also_like_block">
    <h2>You may also like</h2>
    <?php foreach ($data['same_cat'] as $value): ?>
        <div class="like_item">
            <img src="../../web/images/productImage/<?= $value['image'] ?>" alt="">
            <span class="also_item_name"><?= $value['title'] ?></span>
            <span class="price_color">$<?= $value['price'] ?></span>
            <a href="../../product/show/?id=<?=$value['id'] ?>">Read More</a>
        </div>
    <?php endforeach; ?>
</div>