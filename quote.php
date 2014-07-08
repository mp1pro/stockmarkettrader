<?php
    // configuration
    require("../includes/config.php"); 
    
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (empty($_POST["symbol"]))
        {
            apologize("Enter a Stock Symbol");
        }
        else
        {
            $stock=lookup($_POST["symbol"]);
            if ($stock===false)
            {
                apologize("please enter correct stock symbol");
            }
            else
            {
                render("quote_result.php",["title"=>"quote", "symbol" => $stock["symbol"], "name" => $stock["name"], "price" => $stock["price"]]);
            }
        }
        
    }
    else
    {
        // else render form
        render("quote_form.php", ["title" => "Quote"]);
    }
?>
