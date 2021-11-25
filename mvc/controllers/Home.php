<?php

use function PHPSTORM_META\type;

class Home extends controller
{

  public function viewHome($flag)
  {
    $data = 0;
    $data = $this->model("GeneralModels")->getAllData($flag);
    if ($flag == 100){
      $flag = 1;
    }
    $this->view("master", [
      "flag" => $flag,
      "data" => $data
    ]);
  }

  public function addLecturer($page)
  {
    require_once "./mvc/core/basehref.php";
    if ($page == 1) {
      $this->model("GeneralModels")->addLecturer($page,[
        'id'=> $_POST['id'],
        'FN'=> $_POST['fn'],
        'LN' => $_POST['ln'],
        'Degree'=> $_POST['de'],
        'Faculty'=> $_POST['fa'],
        'Address'=> $_POST['ad'],
        'Email'=> $_POST['em'],
        'Phone'=> $_POST['ph']
      ]);
    }elseif ($page == 6){
      $this->model("GeneralModels")->addLecturer($page,[
        'id'=> $_POST['id']
      ]);
    }
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "");
  }


  public function Upload()
  {
    require_once "./mvc/core/basehref.php";
    $target_dir = "assets/img/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
    if (isset($_POST["submit"])) {
      $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
      if ($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
      } else {
        echo "File is not an image.";
        $uploadOk = 0;
      }
    }

    // Check if file already exists
    if (file_exists($target_file)) {
      echo "Sorry, file already exists.";
      $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) {
      echo "Sorry, your file is too large.";
      $uploadOk = 0;
    }

    // Allow certain file formats
    if (
      $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
      && $imageFileType != "gif"
    ) {
      echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
      $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
      echo "Sorry, your file was not uploaded.";
      // if everything is ok, try to upload file
    } else {
      if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
        $this->model("GeneralModels")->pushData($target_file);
      } else {
        echo "Sorry, there was an error uploading your file.";
      }
    }
    header("Location: " . geturl() . "/Home/viewHome/10");
  }
}
?>

<!-- echo '<pre>';
    print_r($data);
    die; -->