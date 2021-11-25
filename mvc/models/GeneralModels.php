<?php
    class GeneralModels extends db{
        private function _query($query){
            return mysqli_query($this->connect, $query);
        }
        public function getAllData($flag,$sorted){
            
            $arr = array("","lecturer","student","subject_view","Question_view","exam","Lecturer_Manager_view","LecturerInCharge_view","choice_view","student_answer_view","description_file");
            if ($flag != 1){
                if (isset($_SESSION["sort"])){
                    unset($_SESSION["sort"]);
                }
            }
            if ($sorted){
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
            }else {
                if (isset($_SESSION["sort"])){
                    $query = "SELECT * FROM ".$_SESSION["sort"]."_lecturerid";
                }
                else {
                    $query = "SELECT * FROM `".$arr[$flag]."`";
                }
            }
            


            // if ($flag == 100){
                
            //         if ($_SESSION["sort"] == "asc"){
            //         $query = "SELECT * FROM desc_lecturerid";
            //         $_SESSION["sort"] = "desc";

            //         }elseif ($_SESSION["sort"] == "desc") {
            //         $query = "SELECT * FROM asc_lecturerid";
            //         $_SESSION["sort"] = "asc";
            //         }
    
                
            // } else {
            //     $query = "SELECT * FROM `".$arr[$flag]."`";
            // }
            $rawdata = $this->_query($query);
            $data = [];
            while ($row = mysqli_fetch_assoc($rawdata)) {
                array_push($data, $row);
            }
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
            $this->_query($query);
        }
    }

?>