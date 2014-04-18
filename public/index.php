<?php

    // configuration
    require("../includes/config.php"); 
    
    updateCash();
    
    $rows = query("SELECT symbol, shares FROM portfolio WHERE id = ?", $_SESSION["id"]);
    
    //declare array
    $positions = [];
    
    foreach($rows as $row)
    {
        $stock = lookup($row["symbol"]);
        
        if ($stock !== false)
        {
            $positions[] = [
            
                "symbol"    => $row["symbol"]
                
                ,"name"   => $stock["name"]
                
                ,"shares"   => $row["shares"]
                
                ,"price"   => $stock["price"]
                
                ,"total" => $stock["price"] * $row["shares"]
                              
                        ];
        }
    }

    // render portfolio
    render("portfolio.php", ["title" => "Portfolio", "positions" => $positions, "balance" => $_SESSION["cash"]]);

?>
