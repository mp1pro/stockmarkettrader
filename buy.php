<?php

    // configuration
    require("../includes/config.php"); 
    
    

    // if form was submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (!empty($_POST["symbol"]))
        {
            if (!empty($_POST["shares"]) || is_numeric($_POST["shares"]) || preg_match("/^\d+$/", $_POST["shares"]))
            {
                 $stock = lookup($_POST["symbol"]);
                 if ($stock === false)
                    {
                        apologize("Entered stock symbol was invalid.");
                    }
                 $value = $stock["price"] * $_POST["shares"];
            }
            else
            {
                apologize("enter correct amount of shares");
            }
        }
        else
        {
            apologize("enter a stock symbol.");
        }
        
        if ($_SESSION["cash"] >= $value)
        {
        
            $query = query("INSERT INTO portfolio(id, symbol, shares) VALUES (?, ?, ?)
                    ON DUPLICATE KEY UPDATE shares = shares + VALUES(shares)"
                    ,$_SESSION["id"], strtoupper($stock["symbol"]), $_POST["shares"]);
        if ($query === false)
        {
            apologize("Buying shares did not work.");
        }
                
            $query = query("UPDATE users SET cash = cash - ? where id = ?", $value, $_SESSION["id"]);
                    
        if ($query === false)
            {
                apologize("Buying shares failed.");
            }
            
        
        $action="buy";   
        $symbol=strtoupper($_POST["symbol"]);   
        $price=$stock["price"];
          
        $shares=strtoupper($_POST["shares"]);  
        
        addHistory($action,$symbol,$shares,$price);
        redirect("/");
               
        }
        else
        {
            apologize("you do not have enough money");
        }
    }
     else
    {
        // else render form
        render("buy_form.php", ["title" => "Buy"]);
    }
?>
