<?php
// if session is not set start session
if (!isset($_SESSION)) {
    session_start();
}
include("connection/connect.php");
// $db = mysqli_connect("localhost", "shakingmachine_iorder", "icb*lGIIq;Q5", "shakingmachine_onlinefoodphp");
if ($db) {
    echo "db connected!";
} else {
    echo "db not connected!";
}

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
    $item_total = 0;
    $uid = $_SESSION["user_id"];
    $order_ids = [];
    foreach ($_SESSION["cart_item"] as $item) {
        $item_total += ($item["price"] * $item["quantity"]);
        $item_title = $item["title"];
        $item_quantity = $item["quantity"];
        $item_price = $item["price"];

        $sql = "INSERT INTO `users_orders`(`u_id`, `title`, `quantity`, `price`) VALUES ('$uid', '$item_title', '$item_quantity', '$item_price')";
        mysqli_query($db, $sql);
        // get this order id
        $tp_order_id = mysqli_insert_id($db);
        array_push($order_ids, $tp_order_id);
    }

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
    echo $uid;
    $order_id = implode(",", $order_ids);
    echo $order_id;
    // join order ids to string

    echo "total: " . $item_total;
    echo "phone: " . $phone;
    $sql3 = "INSERT INTO payments (uid, order_id, total) VALUES ('$uid', '$order_id', '$item_total')";
    $result = mysqli_query($db, $sql3);
    if ($result) {
        echo "New record created successfully";
        // get request  to express-stk.php to initiate stk push
        // $url = "https://localhost/express-stk.php?phone=" . $phone . "&amount=" . $item_total . "&order_id=" . $order_id;https://iorder.shaking-machine.com/iorder/mpesaIntegration/express-stk.php?phone=0724772046&amount=1&order_id=10
        $url = "https://iorder.shaking-machine.com/iorder/mpesaIntegration/express-stk.php?phone=" . $phone . "&amount=" . $item_total . "&order_id=" . $order_id;
        echo $url;
        unset($_SESSION["cart_item"]);
        unset($item["title"]);
        unset($item["quantity"]);
        unset($item["price"]);
        $success = "Thank you. Your order has been placed!";
        // header("Location: $url");
        echo '<script type="text/javascript">window.location.href = "' . $url . '";</script>';
    } else {
        echo "Error: " . $sql3 . "<br>" . mysqli_error($db);
    }
}

/* 
https://iorder.shaking-machine.com/iorder/mpesaIntegration/express-stk.php?phone=%22%20.%20$phone%20.%20%22&amount=%22%20.%20$item_total%20.%20%22&order_id=%22%20.%20$order_id
*/