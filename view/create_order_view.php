<?php ?>
<div class="product_block">
    <form action="../../order/create/" method="post">
        <h2>Contacts info</h2>
        Name and Surname: <input type="text" required>
        <br>
        Phone number: <input type="tel" required>
        <h2>Shipment</h2>
        Address of shipment: <input type="text" name="ship_address" required>
        <h2>Payment</h2>
        <input type="radio" name="payment_type" value="card" checked>Credit or Debit Cards
        <br>
        <input type="radio" name="payment_type" value="gift_promo">Gift Cards and Promotional Codes
        <br>
        <input type="radio" name="payment_type" value="check">Personal Checking Accounts
        <br>
        <br>
        <span><?=$data['sum']?></span>
        <br>
        <br>
        <input type="submit" value="Order Submit">
    </form>
</div>