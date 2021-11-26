<?php
    class GeneralModels extends db{
        private function _query($query){
            return mysqli_query($this->connect, $query);
        }
        public function getAllData($flag,$sorted){
            
            $arr = array("","lecturer","student","subject_view","Question_view","exam","Lecturer_Manager_view","LecturerInCharge_view","choice_view","student_answer_view","description_file");
            $tableList = array("","lecturer","","","","","management_lecturer","lecturer_in_charge");
            if ($flag != $_SESSION['page']){

                if (isset($_SESSION["sort"])){
                    unset($_SESSION["sort"]);
            echo "<script>console.log('".$_SESSION['page']."')</script>";
            $_SESSION['page'] = $flag;
                }
            }
            if ($sorted && $flag == 1){

                if (!isset($_SESSION["sort"])){
                    $_SESSION["sort"] = "asc";
                }
                if (isset($_SESSION["sort"])){
                    if ($_SESSION["sort"] == "asc"){
                        $query = "SELECT * FROM desc_lecturerid";
                        $_SESSION["sort"] = "desc";
                    }
                    elseif ($_SESSION["sort"] == "desc"){
                        $query = "SELECT * FROM asc_lecturerid";
                        $_SESSION["sort"] = "asc";
                    }
                }
            }elseif($sorted){

                if (!isset($_SESSION["sort"])){
                    $_SESSION["sort"] = "asc";
                }

                if (isset($_SESSION["sort"])){
                    echo "<script>console.log('".$_SESSION["sort"]."')</script>";

                    if ($_SESSION["sort"] == "asc"){
                        $query = "SELECT * FROM desc_".$tableList[$flag]."";
                        $_SESSION["sort"] = "desc";
                    }
                    elseif ($_SESSION["sort"] == "desc"){

                        $query = "SELECT * FROM asc_".$tableList[$flag]."";
                        $_SESSION["sort"] = "asc";
                    }
                }

            }
            elseif (!$sorted && $flag == 1) {
                if (isset($_SESSION["sort"])){
                    $query = "SELECT * FROM ".$_SESSION["sort"]."_lecturerid";
                }
                else {
                    $query = "SELECT * FROM `".$arr[$flag]."`";
                }
            } else {
                if (isset($_SESSION["sort"])){
                    $query = "SELECT * FROM ".$_SESSION["sort"]."_".$tableList[$flag];
                }
                else {
                    $query = "SELECT * FROM `".$arr[$flag]."`";
                }
            }
            echo "<script>console.log('".$query."')</script>";

            $rawdata = $this->_query($query);
            $data = [];
            while ($row = mysqli_fetch_assoc($rawdata)) {
                array_push($data, $row);
            }
            // print_r($data);

            return $data;
        }
        public function pushData($content){
            $query = "INSERT INTO `description_file` (`File_Path`) VALUES ('".$content."')";
            $this->_query($query);
        }

        public function addLecturer($page,$data){
            $query = "";
            if ($page == 1){
                $query = "INSERT INTO `lecturer` (`Lecturer_ID`, `Last_Name`, `First_Name`, `Faculty`, `Degree`, `Address`, `Email`, `Phone`) VALUES ('".$data['id']."', '".$data['LN']."', '".$data['FN']."', '".$data['Faculty']."', '".$data['Degree']."', '".$data['Address']."', '".$data['Email']."', '".$data['Phone']."');";
            }
            if ($page == 6){
                $query = "INSERT INTO `management_lecturer` (`MLecturer_ID`) VALUES ('".$data['id']."')";
            }
            if ($page == 7){
                $query = "INSERT INTO `lecturer_in_charge` (`CLecturer_ID`, `Role`, `Inchr_Subject_Code`) VALUES ('".$data['id']."', '".$data['role']."', '".$data['Scode']."');";
            }
            $this->_query($query);
        }
    }

?>