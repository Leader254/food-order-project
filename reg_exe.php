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
