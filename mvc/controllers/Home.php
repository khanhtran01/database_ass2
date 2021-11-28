<?php

use function PHPSTORM_META\type;

class Home extends controller
{

  public function viewHome($flag,$sorted)
  {
    if (!isset($_SESSION['page'])){
      $_SESSION['page'] = 1;
    }
    $data = 0;
    $data = $this->model("GeneralModels")->getAllData($flag,$sorted);
    
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
    }elseif ($page == 7){
      $this->model("GeneralModels")->addLecturer($page,[
        'id' => $_POST['id'],
        'role' => $_POST['role'],
        'Scode' => $_POST['Scode']
      ]);
    }
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
  }

  public function addExam($page){
    require_once "./mvc/core/basehref.php";
    $this->model("GeneralModels")->addExams([
      'subcode'=> $_POST['subcode'],
      'edate'=> $_POST['edate'],
      'ecode'=> $_POST['ecode'],
      'note'=> $_POST['note'],
      'bcid'=> $_POST['bcid'],
      'datecf'=> $_POST['datecf'],
      'aprid'=> $_POST['aprid'],
      'dateapp'=> $_POST['dateapp']
    ]);
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
  }
  public function addStudent($page){
    require_once "./mvc/core/basehref.php";
    $this->model("GeneralModels")->addStudent([
      'id'=> $_POST['id'],
      'fn'=> $_POST['fn'],
      'ln'=> $_POST['ln'],
      'fa'=> $_POST['fa'],
      'ph'=> $_POST['ph'],
      'em'=> $_POST['em'],
      'ad'=> $_POST['ad']
    ]);
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
  }


  public function addQuestion($page){
    require_once "./mvc/core/basehref.php";
    $this->model("GeneralModels")->addQuestion([
      'id'=> $_POST['id'],
      'ctn'=> $_POST['ctn'],
      'lv'=> $_POST['lv'],
      'crid'=> $_POST['crid'],
      'desid'=> $_POST['desid'],
      'ctbid'=> $_POST['ctbid'],
      'outcome'=> $_POST['outcome'],
      'subcode'=> $_POST['subcode']
    ]);
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
  }
  public function addSubject($page){
    require_once "./mvc/core/basehref.php";
    $this->model("GeneralModels")->addSubject([
      'subjectcode'=> $_POST['subjectcode'],
      'name'=> $_POST['name'],
      'lecturerid'=> $_POST['lecturerid']
    ]);
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
  }
  public function addChoice($page){
    require_once "./mvc/core/basehref.php";
    $this->model("GeneralModels")->addChoice([
      'id'=> $_POST['id'],
      'cid'=> $_POST['cid'],
      'cc'=> $_POST['cc'],
      'desid'=> $_POST['desid']
    ]);
    header("Location: " . geturl() . "/Home/viewHome/" . $page . "/0");
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