<?php
    class removeModels extends db {
        private function _query($sql){
            return mysqli_query($this->connect, $sql);
        }

        public function remove($primary_key,$page){
            $page_array = array("","lecturer","student","subject","question","exam","management_lecturer","lecturer_in_charge","choice");
            $key_array = array("","Lecturer_ID","Student_ID","Subject_Code","Question_ID","Exam_Code","MLecturer_ID","CLecturer_ID","Choice_ID","","","");
            $query = "DELETE FROM ".$page_array[$page]." WHERE ".$key_array[$page]." = '".$primary_key."';";   
            $this->_query($query);
        }
    }
?>