<?php
    // configuration
    require("../includes/config.php");
    
    // Query current users shares
    $rows = query("SELECT action, symbol, shares, price, date FROM history
        WHERE id = ? order by date desc", $_SESSION["id"]);
    
    if (count($rows) <1)
    {
        apologize("No recorded transactions for this user exist.");
    }
    else{

    // render history
    render("history_result.php", ["title" => "History", "records" => $rows]);
    }
?>
