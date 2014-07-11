<?php

    //define variables
    
    //configuration
    require("includes/config.php");
    
    //check if form was submitted
    if ($_SERVER["REQUEST_METHOD"]=="POST")
    {
        if(!empty($_POST["username"])||!empty($_POST["password"]))
        {
            if($_POST["password"]==$_POST["confirmation"])
            {
                $check = query("SELECT * FROM users WHERE username = ?", $_POST["username"]);
                if (count($check) < 1)
                {
                    $result= query("INSERT INTO users (username, hash, cash) VALUES(?,?,10000.00)", $_POST["username"], crypt($_POST["password"]));
                    
                    $rows = query("SELECT LAST_INSERT_ID() AS id");
                    $id = $rows[0]["id"];
                    
                    $_SESSION["id"]=$id;
                    redirect("/");
                    
                }
                else
                {
                    apologize("this username already exists");  
                }
            }    
            else
            {
                apologize("ensure that your passwords match");  
            }
        }
        else
        {
            apologize("ensure that the username or password fields are not empty");
        }
    }
    else
    {
        //else render form
        render("register_form.php", ["title"=>"Register"]);
    }
?>
