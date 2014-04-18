<form action="sell.php" method="post">
    <fieldset>
        <div class="form-group">
            <select name="symbol">
                <option value="">Select Stock</option>
                <?
                    foreach($symbols as $symbol)
                    {
                        print("<option value='{$symbol["symbol"]}'>{$symbol["symbol"]}</option>\n");
                    }
                ?>
            </select>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default">Sell</button>
        </div>
    </fieldset>
</form>
