<?php
    class Edit extends Controller {
    
    public function remove($ele,$page){
        require_once "./mvc/core/basehref.php";
        echo "<script>console.log('".$ele."')</script>";
        $this->model("removeModels")->remove($ele,$page);

        header("Location: " . geturl() . "/Home/viewHome/".$page."");
    }

    public function sort($ele,$page){
        require_once "./mvc/core/basehref.php";
        $this->model('sortModel')->sort($ele,$page);
        echo "<script>alert('".$ele."')</script>";

        header("Location: " . geturl() . "/Home/viewHome/".$page."");

    }

}
?>