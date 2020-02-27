<div class="product_block">
    <h3>Add product</h3>
    <form action="../../admin/addGood/" method="post" enctype="multipart/form-data" style="clear: both">
        Title: <input type="text" name="title" required>
        <br>
        Specification: <input type="text" name="spec" required>
        <br>
        Subcategories: <input list="subcat" name="subcategories_id" required>
        <datalist id="subcat">
            <?php foreach ($data as $value): ?>
                <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
            <?php endforeach; ?>
        </datalist>
        <br>
        Price: <input type="number" name="price" required>
        <br>
        Describe: <input type="text" name="describe">
        <br>
        Image: <input type="file" name="image" accept="image/*">
        <br>
        Quantity: <input type="number" name="quantity" required>

        <input type="hidden" name="token" value="<?= $_SESSION['csrf_token'] ?>">
        <input type="submit">
    </form>
</div>