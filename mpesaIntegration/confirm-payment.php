<?php
if (!isset($_SESSION)) {
    session_start();
}
// include("connection/connect.php");

// confirm successful payment
if (isset($_SESSION["phone"])) {
    $db = mysqli_connect("localhost", "shakingmachine_iorder", "icb*lGIIq;Q5", "shakingmachine_onlinefoodphp");
    /* if ($db) {
        echo "db connected!";
    } else {
        echo "db not connected!";
    } */
    $phone = $_SESSION["phone"];
    $order_id = $_SESSION["order_no"];
    $user_id = $_SESSION["user_id"];
    // echo $phone . '<br>';
    // echo $order_id;
    // var dump session with pre tags
    /* echo "<pre>";
    var_dump($_SESSION);
    echo "</pre>"; */
    $sql = "SELECT * FROM users WHERE u_id='$user_id'";
    $result = mysqli_query($db, $sql);
    // print_r($result);
    $row = mysqli_fetch_assoc($result);
    $user_email = $row['email'];
    $user_name = $row['username'];
    // echo $user_email;
    $to = $user_email;
    // get order details from user_orders
    $sql1 = "SELECT * FROM users_orders WHERE o_id='$order_id'";
    $result1 = mysqli_query($db, $sql1);
    $row1 = mysqli_fetch_assoc($result1);
    $title = $row1['title'];
    $quantity = $row1['quantity'];
    $price = $row1['price'];
    $amount = $quantity * $price;
    $subject .= "Order Confirmation";
    $message = "Hello " . $user_name . ",\n\nThank you for your order. Your order has been placed and will be delivered shortly.\n\nOrder Details:\nOrder ID: " . $order_id . "\nTitle: " . $title . "\nQuantity: " . $quantity . "\nPrice: " . $price . "\nAmount: " . $amount . "\n\nRegards,\niOrder";
    $headers = "From: iOrder ";
    if (mail($to, $subject, $message, $headers)) {
        echo "Payment Confirmed and Mail Sent";
        // send mail to admin
        $to = "samuelwachira219@gmail.com";
        $subject = "Order Confirmation";
        $message = "Hello Admin,\n\nA new order has been placed.\n\nOrder Details:\nOrder ID: " . $order_id . "\nTitle: " . $title . "\nQuantity: " . $quantity . "\nPrice: " . $price . "\nAmount: " . $amount . "\n\nRegards,\niOrder";
        $headers = "From: iOrder ";
        mail($to, $subject, $message, $headers);
        // a button to redirect to home page
        echo "<a href='index.php' class='btn btn-primary'>Go to Home</a>";
    } else {
        echo "Payment Confirmed but Mail Not Sent";
        $last_error = error_get_last();
        error_log("Error sending mail: " . $last_error['message']);
    }
}
