<?php
// if session is not set start session
if (!isset($_SESSION)) {
    session_start();
}
include("connection/connect.php");

if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (!empty($_POST["submit"])) {
        $loginquery = "SELECT * FROM users WHERE username='$username' && password='" . md5($password) . "'"; //selecting matching records
        $result = mysqli_query($db, $loginquery); //executing
        $row = mysqli_fetch_array($result);
        $tot = mysqli_num_rows($result);

        if ($tot > 0) {
            $_SESSION["user_id"] = $row['u_id'];
            // header("refresh:1;url=index.php");
            // redirect to index.php using javascript
            echo '<script type="text/javascript">window.location.href = "index.php";</script>';
        } else {
            $message = "Invalid Username or Password!";
        }
    }
}

// payment order
if (isset($_POST['pay-order'])) {
    $phone = mysqli_real_escape_string($db, $_POST['phone-number']);
    foreach ($_SESSION["cart_item"] as $item) {

        $item_total += ($item["price"] * $item["quantity"]);

        $SQL = "insert into users_orders(u_id,title,quantity,price) values('" . $_SESSION["user_id"] . "','" . $item["title"] . "','" . $item["quantity"] . "','" . $item["price"] . "')";

        mysqli_query($db, $SQL);
        // get this order id
        $order_id = mysqli_insert_id($db);
    }
    unset($_SESSION["cart_item"]);
    unset($item["title"]);
    unset($item["quantity"]);
    unset($item["price"]);
    $success = "Thank you. Your order has been placed!";

    // function_alert();
    // get user details
    $user_id = $_SESSION["user_id"];
    $sql = "SELECT * FROM users WHERE u_id='$user_id'";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_assoc($result);
    $user_email = $row['email'];
    $user_name = $row['username'];

    // send mail
    $to = $user_email;
    $subject = "Order Confirmation";
    $message = "Hello " . $user_name . ",\n\nThank you for your order. Your order has been placed and will be delivered shortly.\n\nRegards,\niOrder";
    $headers = "From: iOrder ";
    mail($to, $subject, $message, $headers);
    // mail to admin
    $to = "samuelwachira219@gmail.com";
    $subject = "New Order";
    $message = "Hello Admin,\n\nA new order has been placed. Please check your dashboard for more details.\n\nRegards,\niOrder";
    $headers = "From: iOrder ";
    mail($to, $subject, $message, $headers);

    // save to payment table
    $uid = $_SESSION["user_id"];
    $sql3 = "INSERT INTO payments (u_id, order_id, total) VALUES ('$uid', '$order_id', '$item_total')";
    $result = mysqli_query($db, $sql3);
    if ($result) {
        echo "New record created successfully";
        // get request  to express-stk.php to initiate stk push
        $url = "https://localhost/express-stk.php?phone=" . $phone . "&amount=" . $item_total . "&order_id=" . $order_id;
        header("Location: $url");
    } else {
        echo "Error: " . $sql3 . "<br>" . mysqli_error($db);
    }
}


/* 
https://iorder.shaking-machine.com/iorder/mpesaIntegration/express-stk.php?phone=%22%20.%20$phone%20.%20%22&amount=%22%20.%20$item_total%20.%20%22&order_id=%22%20.%20$order_id
*/