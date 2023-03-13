<?php
if (!isset($_SESSION)) {
    session_start();
}
include("connection/connect.php");

// confirm successful payment
if (isset($_SESSION["phone"])) {
    $phone = $_SESSION["phone"];
    $amount = $_SESSION["amount"];
    $order_id = $_SESSION["order_id"];
    $user_id = $_SESSION["user_id"];
    $sql = "SELECT * FROM users WHERE u_id='$user_id'";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_assoc($result);
    $user_email = $row['email'];
    $user_name = $row['username'];
    $to = $user_email;
    $subject .= "Order Confirmation";
    $message = "Hello " . $user_name . ",\n\nThank you for your order. Your order has been placed and will be delivered shortly.\n\nRegards,\niOrder";
    // order details
    $message .= "\n\nOrder Details:\n";
    $message .= "Order ID: " . $order_id . "\n";
    $message .= "Phone: " . $phone . "\n";
    $message .= "Amount: " . $amount . "\n";
    $message .= "Order Status: Confirmed\n";
    $message .= "Order Date: " . date("Y-m-d") . "\n";
    $message .= "Order Time: " . date("h:i:sa") . "\n";
    $headers = "From: iOrder < ";
    if (mail($to, $subject, $message, $headers)) {
        echo "Payment Confirmed and Mail Sent";
    } else {
        echo "Payment Confirmed but Mail Not Sent";
    }
}
