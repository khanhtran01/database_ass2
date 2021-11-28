<?php
    class GeneralModels extends db{
        private function _query($query){
            return mysqli_query($this->connect, $query);
        }
        public function getAllData($flag,$sorted){
            
            $arr = array("","lecturer","student","subject_view","Question_view","exam","Lecturer_Manager_view","LecturerInCharge_view","choice_view","student_answer_view","description_file");
            // $tableList = array("","lecturerid","","","","","management_lecturer","lecturer_in_charge");
            $key_array = array("","Lecturer_ID","Student_ID","Subject_Code","Question_ID","Exam_Code","MLecturer_ID","CLecturer_ID","Question_ID","","","");
            if ($flag != $_SESSION['page']){

                if (isset($_SESSION["sort"])){
                    unset($_SESSION["sort"]);
                    // echo "<script>console.log('".$_SESSION['page']."')</script>";
                    $_SESSION['page'] = $flag;
                }
            }
            if ($sorted && ($flag ==1 || $flag == 2 || $flag == 4 || $flag == 6 || $flag == 7 || $flag == 8) ){

                if (!isset($_SESSION["sort"])){
                    $_SESSION["sort"] = "asc";
                }
                if (isset($_SESSION["sort"])){
                    if ($flag != 8)
                    {
                        if ($_SESSION["sort"] == "asc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) DESC";
                            $_SESSION["sort"] = "desc";
                        }
                        elseif ($_SESSION["sort"] == "desc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) ASC";
                            $_SESSION["sort"] = "asc";
                        }
                    }
                    if ($flag == 8) {
                        if ($_SESSION["sort"] == "asc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) DESC, Choice_ID ASC";
                            $_SESSION["sort"] = "desc";
                        }
                        elseif ($_SESSION["sort"] == "desc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) ASC, Choice_ID ASC";
                            $_SESSION["sort"] = "asc";
                        }
                    }
                }
            }elseif($sorted){

                if (!isset($_SESSION["sort"])){
                    $_SESSION["sort"] = "asc";
                }

                if (isset($_SESSION["sort"])){
                    if (isset($_SESSION["sort"])){
                        if ($_SESSION["sort"] == "asc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY ".$key_array[$flag]." DESC";
                            $_SESSION["sort"] = "desc";
                        }
                        elseif ($_SESSION["sort"] == "desc"){
                            $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY ".$key_array[$flag]." ASC";
                            $_SESSION["sort"] = "asc";
                        }
                    }
                }

            }
            elseif (!$sorted && ($flag ==1 || $flag == 2 || $flag == 4 || $flag == 6 || $flag == 7 || $flag == 8)) {
                if ($flag != 8)
                {
                    if (isset($_SESSION["sort"])){
                        $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) ".$_SESSION['sort']."";
                    }
                    else {
                        $query = "SELECT * FROM `".$arr[$flag]."`";
                    }   
                }else {
                    if (isset($_SESSION["sort"])){
                        $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) ".$_SESSION['sort']."";
                    }
                    else {
                        $query = "SELECT * FROM `".$arr[$flag]."`";
                    }   
                }
            } else {
                if (isset($_SESSION["sort"])){
                    // $query = "SELECT * FROM ".$_SESSION["sort"]."_".$tableList[$flag];
                    // $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY ".$key_array[$flag]." ".$_SESSION['sort']."";
                    $query = "SELECT * FROM `".$arr[$flag]."` ORDER BY cast(".$key_array[$flag]." as INT) ".$_SESSION['sort'].", Choice_ID ASC";
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
        public function addExams($data){
            
            $query = "SELECT * FROM `exam_time` WHERE Exam_Date = ".$data['edate']." and Subject_Code = '".$data['subcode']."'";


            if ($datecontain = $this->_query($query)){

                if (mysqli_num_rows($datecontain) == 0){


                    $query1 = "INSERT INTO `exam_time` (`Subject_Code`, `Exam_Date`) VALUES ('".$data['subcode']."', '".$data['edate']."');";
                    

                    $this->_query($query1);
                }
            }
            $query2 = "INSERT INTO `exam` (`Subject_Code`, `Exam_Date`, `Exam_Code`, `Lecturer_Note`, `BC_Lecturer_ID`, `Date_Of_Confirmation`, `Apr_Lecturer_ID`, `Date_Of_Approval`) VALUES ('".$data['subcode']."', '".$data['edate']."', '".$data['ecode']."', '".$data['note']."', '".$data['bcid']."', '".$data['datecf']."', '" .$data['aprid']. "', '" .$data['dateapp']. "');";
            echo $query2;
            $this->_query($query2);
        }
        public function addQuestion($data){
            $query2 = "INSERT INTO `question` (`Question_ID`, `Content`, `Level`, `Correct_Choice_ID`, `Described_Content_ID`, `Ctrb_Lecturer_ID`, `Time_Contribute`, `Evl_Outcome_No`, `Evl_Subject_Code`) VALUES ('".$data['id']."', '".$data['ctn']."', '".$data['lv']."', '".$data['crid']."', '".$data['desid']."', '".$data['ctbid']."', current_timestamp(), '".$data['outcome']."', '".$data['subcode']."');";                                                                                                                                                                                                                                                                                                                                                                          
            echo $query2;
            $this->_query($query2);
        }
        public function addSubject($data){
            $query2 ="INSERT INTO `subject` (`Subject_Code`, `Name`, `Mgr_Lecturer_ID`) VALUES ('".$data['subjectcode']."', '".$data['name']."', '".$data['lecturerid']."');";
            echo $query2;
            $this->_query($query2);
        }
        public function addChoice($data){
            if ($data['desid'] == ''){
                $query2 ="INSERT INTO `choice` (`Question_ID`, `Choice_ID`, `Choice_Content`, `Described_Content_ID`) VALUES ('".$data['id']."', '".$data['cid']."', '" .$data['cc']. "', NULL)";    
            }else {
                $query2 ="INSERT INTO `choice` (`Question_ID`, `Choice_ID`, `Choice_Content`, `Described_Content_ID`) VALUES ('".$data['id']."', '".$data['cid']."', '" .$data['cc']. "', '" .$data['desid']. "')";
            }
            echo $query2;
            $this->_query($query2);
        }
        public function addStudent($data){
            $query = "INSERT INTO `student` (`Student_ID`, `Last_Name`, `First_Name`, `Faculty`, `Address`, `Email`, `Phone`) VALUES ('".$data['id']."', '".$data['ln']."', '".$data['fn']."', '".$data['fa']."', '".$data['ad']."', '".$data['em']."', '".$data['ph']."');";
            $this->_query($query);
        }
    }

?>