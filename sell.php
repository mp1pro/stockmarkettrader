<?php

// configuration
require("includes/config.php");


if ($_SERVER["REQUEST_METHOD"] == "POST")
{
        if (!empty($_POST["symbol"]))
        {
             $stock = lookup($_POST["symbol"]);
        }
        else
        {
            apologize("Please enter the stock symbol.");
        }
        
            if ($stock===false)
            {
                apologize("Enter the correct stock symbol");
            }
            else
            {
                $rows = query("SELECT shares FROM portfolio WHERE id = ? and symbol = ?", $_SESSION["id"], strtoupper($_POST["symbol"]));
                
                if (count($rows) == 1)
                {
                    $shares = $rows[0]["shares"];
                    $value = $stock["price"] * $shares;
                    $query = query("DELETE FROM portfolio where id = ? and symbol = ?", $_SESSION["id"], strtoupper($_POST["symbol"]));
                    if ($query === false)
                    {
                       apologize("Error while selling shares.");
                    }
                    $query = query("UPDATE users SET cash = cash + ? where id = ?", $value, $_SESSION["id"]);
                    if ($query === false)
                    {
                       apologize("Balance was not updated");
                    }
                    $action="sell";
                    $symbol=strtoupper($_POST["symbol"]); 
                    $price=$stock["price"];
                    //cash update function
                    
                    addHistory($action,$symbol,$shares,$price);
                    redirect("/");
                    
                }
                else
                {
                    apologize("Shares was not found.");
                }
                
                
            }
}
else
{
    $rows = query("SELECT symbol FROM portfolio WHERE id = ?", $_SESSION["id"]);
    render("sell_form.php", ["title" => "Sell", "symbols" => $rows]);
}

