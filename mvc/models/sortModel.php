<?php
    class sortModel extends db {
        private function _query($sql){
            return mysqli_query($this->connect, $sql);
        }

        public function sort($ele,$page){
            // test with lecturer  management_lecturer
            // echo "<script>alert('".$primary_key."')</script>";
            
            if (!isset($_SESSION['sort'])){
                // echo "<script>alert('3')</script>";

                $query = "SELECT * FROM asc_lecturerid";
            }else
            {
                // echo "<script>alert('2')</script>";

                if ($_SESSION['sort'] == "asc"){
                $query = "SELECT * FROM desc_lecturerid";

                }else {
                $query = "SELECT * FROM asc_lecturerid";

                }

            }
            $this->_query($query);
        }
    }
?>