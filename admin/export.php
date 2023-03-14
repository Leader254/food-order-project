<?php
include("../connection/connect.php");

// Check if the button was clicked
if (isset($_POST['export_pdf'])) {
    // Include libraries for PDF generation
    require('../fpdf185/fpdf.php');

    // Create new PDF object
    $pdf = new FPDF();
    $pdf->AddPage();

    // Add table header
    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(40, 10, 'Order ID');
    $pdf->Cell(40, 10, 'User ID');
    $pdf->Cell(40, 10, 'Title');
    $pdf->Cell(40, 10, 'Quantity');
    $pdf->Cell(40, 10, 'Price');
    $pdf->Cell(40, 10, 'Status');
    $pdf->Cell(40, 10, 'Date');
    $pdf->Ln();

    // Fetch table data and add to PDF
    $result = mysqli_query($db, "SELECT * FROM users_orders");
    while ($row = mysqli_fetch_assoc($result)) {
        $pdf->Cell(40, 10, $row['o_id']);
        $pdf->Cell(40, 10, $row['u_id']);
        $pdf->Cell(40, 10, $row['title']);
        $pdf->Cell(40, 10, $row['quantity']);
        $pdf->Cell(40, 10, $row['price']);
        $pdf->Cell(40, 10, $row['status']);
        $pdf->Cell(40, 10, $row['date']);
        $pdf->Ln();
    }

    // Output the PDF to the browser
    $pdf->Output();
    // redirect to index.php using javascript
    echo '<script type="text/javascript">window.location.href = "all_orders.php";</script>';
} else if (isset($_POST['export_csv'])) {
    // Set headers for CSV download
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename=users_orders.csv');

    // Open file handle for output
    $output = fopen('php://output', 'w');

    // Add table header to CSV
    fputcsv($output, array('Order ID', 'User ID', 'Title', 'Quantity', 'Price', 'Status', 'Date'));

    // Fetch table data and add to CSV
    $result = mysqli_query($db, "SELECT * FROM users_orders");
    while ($row = mysqli_fetch_assoc($result)) {
        fputcsv($output, $row);
    }

    // Close file handle
    fclose($output);
    // redirect to index.php using javascript
    echo '<script type="text/javascript">window.location.href = "all_orders.php";</script>';
}
