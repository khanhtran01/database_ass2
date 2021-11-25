<?php
    class removeModels extends db {
        private function _query($sql){
            return mysqli_query($this->connect, $sql);
        }

        public function remove($primary_key,$page){
            // test with lecturer  management_lecturer
            echo "<script>alert('".$primary_key."')</script>";

            $page_array = array("","lecturer","","","","","management_lecturer","lecturer_in_charge","");
            
            $query = "DELETE FROM ".$page_array[$page]." WHERE Lecturer_ID =".$primary_key.";";
            if ($page == 6){
                $query = "DELETE FROM ".$page_array[$page]." WHERE MLecturer_ID =".$primary_key.";";
            }
            if ($page == 7){
                $query = "DELETE FROM ".$page_array[$page]." WHERE CLecturer_ID =".$primary_key.";";
            }
            echo "<script>alert('".$primary_key."')</script>";
            
            $this->_query($query);
        }
    }
?>