<table class="table table-striped">

    <thead>
        <tr>
            <th>Transaction</th>
            <th>Symbol</th>
            <th>Shares</th>
            <th>Price</th>
            <th>Date/Time</th>
        </tr>
    </thead>

    <tbody>
    <?php foreach($records as $record): ?>
    <tr>
                <td><?= $record["action"] ?></td>
                <td><?= $record["symbol"] ?></td>
                <td><?= $record["shares"] ?></td>
                <td><?= number_format($record["price"], 2) ?></td>
                <td><?= date('Y-m-d H:i:s', strtotime($record["date"])) ?></td>
    </tr>    
    <? endforeach ?>
</tbody>

</table>
