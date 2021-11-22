<?php
    class GeneralModels extends db{
        private function _query($query){
            return mysqli_query($this->connect, $query);
        }
        public function getAllData($flag){
            $arr = array("","lecturer","student","subject","Question","exam","","","","","description_file");
            if ($flag != 3 && $flag != 6 && $flag != 7){
                $query = "SELECT * FROM `".$arr[$flag]."`";
            }else if($flag == 3){
                $query = "SELECT subject.Subject_Code, subject.Name, concat(lecturer.First_Name,' ',lecturer.Last_Name) as `mng_name` FROM `subject`, `lecturer` WHERE lecturer.Lecturer_ID = subject.Mgr_Lecturer_ID";
            } else if ($flag == 6){
                $query = "SELECT * FROM `management_lecturer`,lecturer WHERE lecturer.Lecturer_ID = management_lecturer.MLecturer_ID";
            }
            else if ($flag == 7){
                $query = "SELECT * FROM `lecturer_in_charge`, lecturer, subject WHERE lecturer_in_charge.CLecturer_ID = lecturer.Lecturer_ID AND lecturer_in_charge.Inchr_Subject_Code = subject.Subject_Code";
            }
            if ($flag  == 4){
                $query = "SELECT *, concat(lecturer.First_Name,' ',lecturer.Last_Name) as `fullname` FROM `question`,`lecturer` WHERE question.Ctrb_Lecturer_ID = lecturer.Lecturer_ID";
            }
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
    }

?>