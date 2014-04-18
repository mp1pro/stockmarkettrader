<?php
    // configuration
    require("../includes/config.php");
    
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(!empty($_POST["deposit"]))
        {
            if(is_numeric($_POST["deposit"]) || preg_match("/^\d+$/", $_POST["deposit"]))
            {
                $query = query("UPDATE users SET cash = cash + ? where id = ?", $_POST["deposit"], $_SESSION["id"]);
                $action="deposit";
                $symbol="$";
                $shares="0";
                $price=$_POST["deposit"];
                addHistory($action,$symbol,$shares,$price);
                
                redirect("/");
            }
            else
            {
                apologize("enter only numbers");
            }
        }
        else
        {
            apologize("enter a deposit amount");
        }
    }
    else
    {
     
    render("deposit_form.php", ["title" => "Deposit"]);
    }
?>
