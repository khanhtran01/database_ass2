<?php
require_once "./mvc/core/basehref.php";
$home_url = getUrl().'/';
?>
<?php

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        echo "<base href='${home_url}'>";
    ?>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Multi Choice</title>
</head>
<body>
    <?php
        $arr = array("","lecturer","Student","Subject","Question","Exam","LecturerManager","Lecturer_in_charge","Choice","Student_Answer","upload_file","");
        require_once "./mvc/views/blocks/frame.php";
        require_once "./mvc/views/pages/".$arr[$flag].".php";
        
    ?>
    <script src="./assets/js/main.js"></script>
</body>
</html>