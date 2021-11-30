-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 09:33 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbass`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_exam` (OUT `param1` INT)  BEGIN
  DELETE FROM exam WHERE exam.Exam_Code = param1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lecturer_manager` (OUT `param1` INT)  BEGIN
  DELETE FROM management_lecturer WHERE management_lecturer.MLecturer_ID = param1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_numb_of_lecturer` (OUT `numb` INT)  SELECT COUNT(*) INTO numb FROM lecturer$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_clecturer` (IN `id_in` INT, IN `subcode_in` VARCHAR(20), IN `role_in` VARCHAR(20))  INSERT INTO lecturer_in_charge (CLecturer_ID,Role,Inchr_Subject_Code) VALUES (id_in,role_in,subcode_in)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `Student_ID` varchar(9) NOT NULL,
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Exam_Code` char(4) NOT NULL,
  `Answer_Number` int(11) NOT NULL,
  `Student_Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`Student_ID`, `Subject_Code`, `Exam_Date`, `Exam_Code`, `Answer_Number`, `Student_Note`) VALUES
('1', '1A', '2020-01-12', '1', 1, 'no'),
('1', '1A', '2020-01-12', '1', 2, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `answer_content`
--

CREATE TABLE `answer_content` (
  `Student_ID` varchar(9) NOT NULL,
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Exam_Code` char(4) NOT NULL,
  `Answer_Number` int(11) NOT NULL,
  `Answer_No` int(11) NOT NULL,
  `Answer_Choice_IDs` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer_content`
--

INSERT INTO `answer_content` (`Student_ID`, `Subject_Code`, `Exam_Date`, `Exam_Code`, `Answer_Number`, `Answer_No`, `Answer_Choice_IDs`) VALUES
('1', '1A', '2020-01-12', '1', 1, 1, 'B'),
('1', '1A', '2020-01-12', '1', 2, 2, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `choice`
--

CREATE TABLE `choice` (
  `Question_ID` varchar(9) NOT NULL,
  `Choice_ID` char(1) NOT NULL,
  `Choice_Content` varchar(500) NOT NULL,
  `Described_Content_ID` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `choice`
--

INSERT INTO `choice` (`Question_ID`, `Choice_ID`, `Choice_Content`, `Described_Content_ID`) VALUES
('1', 'A', 'Trái đất', NULL),
('1', 'B', 'mặt trời', NULL),
('1', 'C', 'con chim', NULL),
('2', 'A', 'con thỏ', NULL),
('2', 'C', 'xe máy', NULL),
('2', 'D', 'xe buýt', NULL),
('3', 'A', 'tên lửa', NULL),
('1', 'D', 'Human', '1'),
('2', 'B', 'xe đạp', '2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `choice_view`
-- (See below for the actual view)
--
CREATE TABLE `choice_view` (
`Question_ID` varchar(9)
,`Choice_ID` char(1)
,`Choice_Content` varchar(500)
,`File_Path` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `common_description`
--

CREATE TABLE `common_description` (
  `Description_ID` varchar(9) NOT NULL,
  `CDescription` varchar(500) NOT NULL,
  `Described_Content_ID` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `common_description`
--

INSERT INTO `common_description` (`Description_ID`, `CDescription`, `Described_Content_ID`) VALUES
('1', '1', '1'),
('2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `described_content`
--

CREATE TABLE `described_content` (
  `Described_Content_ID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `described_content`
--

INSERT INTO `described_content` (`Described_Content_ID`) VALUES
('1'),
('2'),
('3'),
('4');

-- --------------------------------------------------------

--
-- Table structure for table `description_file`
--

CREATE TABLE `description_file` (
  `File_Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `description_file`
--

INSERT INTO `description_file` (`File_Path`) VALUES
('assets/img/answer-content.png'),
('assets/img/described_content.png'),
('assets/img/disciptionfile.png'),
('assets/img/exam.png'),
('assets/img/student.png'),
('img/question.png');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Exam_Code` char(4) NOT NULL,
  `Lecturer_Note` text DEFAULT NULL,
  `BC_Lecturer_ID` varchar(9) NOT NULL,
  `Date_Of_Confirmation` date DEFAULT NULL,
  `Apr_Lecturer_ID` varchar(9) DEFAULT NULL,
  `Date_Of_Approval` date DEFAULT NULL
) ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`Subject_Code`, `Exam_Date`, `Exam_Code`, `Lecturer_Note`, `BC_Lecturer_ID`, `Date_Of_Confirmation`, `Apr_Lecturer_ID`, `Date_Of_Approval`) VALUES
('1A', '2020-01-12', '1', 'Khong duoc su dung tai lieu', '1', '2020-01-07', '1', '2020-01-09'),
('2S', '2022-01-13', 'ck1', 'thi sinh khong duoc mang tai lieu', '2', '2021-11-02', '1', '2021-11-18'),
('323S', '2021-12-21', 'CSD5', 'thi sinh khong duoc mang tai lieu', '5', '2021-11-10', '6', '2021-11-18'),
('CO2001', '2021-11-24', 'CKCO', 'thi sinh khong duoc mang tai lieu', '3', '2021-11-11', '8', '2021-11-17'),
('XH2913', '2021-11-11', 'XH20', NULL, '2', '2021-11-01', '1', '2021-11-08'),
('XH2913', '2022-01-20', '34f1', 'asddsa', '5', '2021-12-17', '8', '2022-01-04');

--
-- Triggers `exam`
--
DELIMITER $$
CREATE TRIGGER `before_insert_exam` BEFORE INSERT ON `exam` FOR EACH ROW BEGIN
  IF ADDDATE(NEW.Date_Of_Confirmation , INTERVAL 3 DAY) >= NEW.Date_Of_Approval OR ADDDATE(NEW.Date_Of_Approval , INTERVAL 3 DAY) >= NEW.Exam_Date THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'cannot insert date';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_exam` BEFORE UPDATE ON `exam` FOR EACH ROW BEGIN
  IF NEW.Exam_Date < OLD.Exam_Date THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'new exam date lower than old exam date';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_examdate` BEFORE UPDATE ON `exam` FOR EACH ROW BEGIN
  IF ADDDATE(NEW.Date_Of_Confirmation , INTERVAL 3 DAY) > NEW.Date_Of_Approval THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'cannot update date';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `exam_time`
--

CREATE TABLE `exam_time` (
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_time`
--

INSERT INTO `exam_time` (`Subject_Code`, `Exam_Date`) VALUES
('1A', '2020-01-12'),
('1A', '2021-12-16'),
('2S', '2022-01-13'),
('323S', '2021-12-21'),
('CO2001', '2021-11-24'),
('XH2913', '2021-11-11'),
('XH2913', '2022-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `expression_of_question`
--

CREATE TABLE `expression_of_question` (
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Question_ID` varchar(9) NOT NULL,
  `Question_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expression_of_question`
--

INSERT INTO `expression_of_question` (`Subject_Code`, `Exam_Date`, `Question_ID`, `Question_No`) VALUES
('1A', '2020-01-12', '1', 2),
('1A', '2020-01-12', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `has_file`
--

CREATE TABLE `has_file` (
  `File_Path` varchar(255) NOT NULL,
  `Described_Content_ID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has_file`
--

INSERT INTO `has_file` (`File_Path`, `Described_Content_ID`) VALUES
('assets/img/disciptionfile.png', '1'),
('assets/img/student.png', '2');

-- --------------------------------------------------------

--
-- Table structure for table `in_exam`
--

CREATE TABLE `in_exam` (
  `EQSubject_Code` char(6) NOT NULL,
  `EQExam_Date` date NOT NULL,
  `Question_ID` varchar(9) NOT NULL,
  `Question_No` int(11) NOT NULL,
  `ESubject_Code` char(6) NOT NULL,
  `EExam_Date` date NOT NULL,
  `Exam_Code` char(4) NOT NULL,
  `Mix_Question_No` int(11) NOT NULL,
  `Mix_Correct_Choice_IDs` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `in_exam`
--

INSERT INTO `in_exam` (`EQSubject_Code`, `EQExam_Date`, `Question_ID`, `Question_No`, `ESubject_Code`, `EExam_Date`, `Exam_Code`, `Mix_Question_No`, `Mix_Correct_Choice_IDs`) VALUES
('1A', '2020-01-12', '1', 2, '1A', '2020-01-12', '1', 3, 'C'),
('1A', '2020-01-12', '2', 1, '1A', '2020-01-12', '1', 2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `Lecturer_ID` varchar(9) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Faculty` varchar(30) DEFAULT NULL,
  `Degree` enum('Bachelor','Master','Doctor') DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`Lecturer_ID`, `Last_Name`, `First_Name`, `Faculty`, `Degree`, `Address`, `Email`, `Phone`) VALUES
('1', 'Le', 'Tran', 'Computer Science', 'Bachelor', 'TP.HCM', 'Le@gmail.com', '035534645'),
('13', 'Le', 'Loi', 'CS', 'Master', 'TP.HCM', 'loi@gmail.com', '0857673645'),
('2', 'Hung', 'Le', 'Chemistry', 'Master', 'Ca Mau', 'Hung@gmail.com', '0213765423'),
('3', 'Dung', 'Nguyen', 'Physic', 'Doctor', 'Quang Nam', 'Dung@gmail.com', '0356574354'),
('4', 'A', 'Nguyễn Văn', 'Chemical Technology', 'Doctor', 'Kiên Giang', 'vana@gmail.com', '0983645163'),
('5', 'Vu', 'Pham', 'Industrial Management', 'Bachelor', 'Que Son, Quang Nam', 'butbixanh20@gmail.com', '+8482267136'),
('6', 'Kinh', 'Ngo', 'Computer Science & Engineering', 'Bachelor', 'Lâm Đồng', 'ngokinh@gmail.com', '0237845838'),
('7', 'Dần', 'Trần', 'Materials Technology', 'Master', 'Khánh Hòa', 'trandan@gmail.com', '0263568354'),
('8', 'Trưởng', 'Phạm', 'Industrial Management', 'Master', 'TPHCM', 'truong@gmail.com', '0345867384');

-- --------------------------------------------------------

--
-- Stand-in structure for view `lecturerincharge_view`
-- (See below for the actual view)
--
CREATE TABLE `lecturerincharge_view` (
`CLecturer_ID` varchar(9)
,`Role` enum('Main','Normal')
,`Inchr_Subject_Code` char(6)
,`Lecturer_ID` varchar(9)
,`Last_Name` varchar(30)
,`First_Name` varchar(15)
,`Faculty` varchar(30)
,`Degree` enum('Bachelor','Master','Doctor')
,`Address` varchar(30)
,`Email` varchar(30)
,`Phone` varchar(11)
,`Subject_Code` char(6)
,`Name` varchar(30)
,`Mgr_Lecturer_ID` varchar(9)
);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_in_charge`
--

CREATE TABLE `lecturer_in_charge` (
  `CLecturer_ID` varchar(9) NOT NULL,
  `Role` enum('Main','Normal') NOT NULL,
  `Inchr_Subject_Code` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturer_in_charge`
--

INSERT INTO `lecturer_in_charge` (`CLecturer_ID`, `Role`, `Inchr_Subject_Code`) VALUES
('1', 'Main', '1A'),
('2', 'Normal', '323S'),
('3', 'Main', '1A'),
('4', 'Main', '1A'),
('5', 'Main', '2S'),
('8', '', 'CO2001');

-- --------------------------------------------------------

--
-- Stand-in structure for view `lecturer_manager_view`
-- (See below for the actual view)
--
CREATE TABLE `lecturer_manager_view` (
`MLecturer_ID` varchar(9)
,`Lecturer_ID` varchar(9)
,`Last_Name` varchar(30)
,`First_Name` varchar(15)
,`Faculty` varchar(30)
,`Degree` enum('Bachelor','Master','Doctor')
,`Address` varchar(30)
,`Email` varchar(30)
,`Phone` varchar(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `management_lecturer`
--

CREATE TABLE `management_lecturer` (
  `MLecturer_ID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `management_lecturer`
--

INSERT INTO `management_lecturer` (`MLecturer_ID`) VALUES
('1'),
('2'),
('3'),
('6'),
('7'),
('8');

-- --------------------------------------------------------

--
-- Table structure for table `mix_choice_order`
--

CREATE TABLE `mix_choice_order` (
  `Subject_Code` char(6) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Question_ID` varchar(9) NOT NULL,
  `Question_No` int(11) NOT NULL,
  `A_Mix_Choice_ID` char(1) NOT NULL,
  `A_Mix_Choice_Content` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mix_choice_order`
--

INSERT INTO `mix_choice_order` (`Subject_Code`, `Exam_Date`, `Question_ID`, `Question_No`, `A_Mix_Choice_ID`, `A_Mix_Choice_Content`) VALUES
('1A', '2020-01-12', '1', 2, '3', 'nothing'),
('1A', '2020-01-12', '2', 1, '2', 'nmothing');

-- --------------------------------------------------------

--
-- Table structure for table `outcome`
--

CREATE TABLE `outcome` (
  `Subject_Code` char(6) NOT NULL,
  `Outcome_No` varchar(9) NOT NULL,
  `Content` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outcome`
--

INSERT INTO `outcome` (`Subject_Code`, `Outcome_No`, `Content`) VALUES
('1A', '2', 'SDC'),
('2S', '23', 'ABC');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `Question_ID` varchar(9) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Level` enum('Easy','Medium','Difficult') NOT NULL,
  `Correct_Choice_ID` varchar(5) NOT NULL,
  `Described_Content_ID` varchar(9) DEFAULT NULL,
  `Ctrb_Lecturer_ID` varchar(9) NOT NULL,
  `Time_Contribute` datetime NOT NULL,
  `Evl_Outcome_No` varchar(9) NOT NULL,
  `Evl_Subject_Code` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`Question_ID`, `Content`, `Level`, `Correct_Choice_ID`, `Described_Content_ID`, `Ctrb_Lecturer_ID`, `Time_Contribute`, `Evl_Outcome_No`, `Evl_Subject_Code`) VALUES
('1', 'Ban đêm nhìn lên bầu trời ta thất vô số các ngôi sao, ban ngày thì không thấy, Phải chăng ban ngày bầu trời không có các ngôi sao?', 'Easy', 'A', '1', '1', '2019-01-01 00:00:00', '2', '1A'),
('10', 'Bỏ ngoài nướng trong, ăn ngoài bỏ trong là gì?', 'Difficult', 'C', '4', '2', '2021-11-28 15:31:28', '23', '2S'),
('2', 'B la gi?', 'Easy', 'A', '2', '2', '2019-01-01 00:00:00', '2', '1A'),
('3', 'Cộng nghệ đó là gì', 'Medium', 'B', '2', '3', '2021-11-29 09:42:23', '23', '2S'),
('4', 'Đó là ai ?', 'Easy', 'B', NULL, '5', '2021-11-29 09:39:22', '23', '2S'),
('5', 'Chú chó đấy tên gì', 'Medium', 'D', '2', '3', '2021-11-29 09:42:23', '23', '2S'),
('9', 'asddsasdasda', 'Easy', 'A', '4', '2', '2021-11-28 04:04:28', '23', '2S');

-- --------------------------------------------------------

--
-- Stand-in structure for view `question_view`
-- (See below for the actual view)
--
CREATE TABLE `question_view` (
`Question_ID` varchar(9)
,`Content` varchar(500)
,`Level` enum('Easy','Medium','Difficult')
,`Correct_Choice_ID` varchar(5)
,`Described_Content_ID` varchar(9)
,`Ctrb_Lecturer_ID` varchar(9)
,`Time_Contribute` datetime
,`Evl_Outcome_No` varchar(9)
,`Evl_Subject_Code` char(6)
,`Lecturer_ID` varchar(9)
,`Last_Name` varchar(30)
,`First_Name` varchar(15)
,`Faculty` varchar(30)
,`Degree` enum('Bachelor','Master','Doctor')
,`Address` varchar(30)
,`Email` varchar(30)
,`Phone` varchar(11)
,`fullname` varchar(46)
);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(9) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Faculty` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Last_Name`, `First_Name`, `Faculty`, `Address`, `Email`, `Phone`) VALUES
('1', 'Alex', 'Boob', 'Computer', 'VietNam', 'Alex@gmail.com', '048586345'),
('2', 'Hoang', 'Luong', 'Computer', 'VietNam', 'hoang@gmailcom', '092745612'),
('3', 'Khánh', 'Trần Lê', 'Environment', 'Que Son, Quang Nam', 'butbixanh20@gmail.com', '+8482267136'),
('3123', 'Ngáo', 'Trần', 'Computer Science & Engineering', '', 'huanhoahong1@gmail.com', ''),
('4', 'Ngan', 'Nguyen', 'CS', 'TP.HCM', 'a@gmail.com', '090xxxxxxx'),
('6', 'Kinh', 'Ngo', 'Computer Science & Engineering', 'TPHCM', 'butbixanh20@gmail.com', '+8482267136');

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_answer_view`
-- (See below for the actual view)
--
CREATE TABLE `student_answer_view` (
`Student_ID` varchar(9)
,`Subject_Code` char(6)
,`Exam_Date` date
,`Exam_Code` char(4)
,`Answer_Number` int(11)
,`Answer_No` int(11)
,`Answer_Choice_IDs` varchar(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Subject_Code` char(6) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Mgr_Lecturer_ID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subject_Code`, `Name`, `Mgr_Lecturer_ID`) VALUES
('1A', 'Math', '1'),
('2S', 'OS', '1'),
('323S', 'Phy', '3'),
('CO2001', 'Giai tich 1', '2'),
('XH2913', 'Hoa Dai Cuong', '8');

-- --------------------------------------------------------

--
-- Stand-in structure for view `subject_view`
-- (See below for the actual view)
--
CREATE TABLE `subject_view` (
`Subject_Code` char(6)
,`Name` varchar(30)
,`mng_name` varchar(46)
);

-- --------------------------------------------------------

--
-- Table structure for table `sub_of`
--

CREATE TABLE `sub_of` (
  `Sub_Subject_Code` char(6) NOT NULL,
  `Sub_Outcome_No` varchar(9) NOT NULL,
  `Super_Subject_Code` char(6) DEFAULT NULL,
  `Super_Outcome_No` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_of`
--

INSERT INTO `sub_of` (`Sub_Subject_Code`, `Sub_Outcome_No`, `Super_Subject_Code`, `Super_Outcome_No`) VALUES
('2S', '23', '1A', '2'),
('1A', '2', '2S', '23');

-- --------------------------------------------------------

--
-- Table structure for table `use_des`
--

CREATE TABLE `use_des` (
  `Description_ID` varchar(9) NOT NULL,
  `Question_ID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `use_des`
--

INSERT INTO `use_des` (`Description_ID`, `Question_ID`) VALUES
('1', '2'),
('2', '1');

-- --------------------------------------------------------

--
-- Structure for view `choice_view`
--
DROP TABLE IF EXISTS `choice_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `choice_view`  AS SELECT `choice`.`Question_ID` AS `Question_ID`, `choice`.`Choice_ID` AS `Choice_ID`, `choice`.`Choice_Content` AS `Choice_Content`, `has_file`.`File_Path` AS `File_Path` FROM (`choice` left join `has_file` on(`choice`.`Described_Content_ID` = `has_file`.`Described_Content_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `lecturerincharge_view`
--
DROP TABLE IF EXISTS `lecturerincharge_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lecturerincharge_view`  AS SELECT `lecturer_in_charge`.`CLecturer_ID` AS `CLecturer_ID`, `lecturer_in_charge`.`Role` AS `Role`, `lecturer_in_charge`.`Inchr_Subject_Code` AS `Inchr_Subject_Code`, `lecturer`.`Lecturer_ID` AS `Lecturer_ID`, `lecturer`.`Last_Name` AS `Last_Name`, `lecturer`.`First_Name` AS `First_Name`, `lecturer`.`Faculty` AS `Faculty`, `lecturer`.`Degree` AS `Degree`, `lecturer`.`Address` AS `Address`, `lecturer`.`Email` AS `Email`, `lecturer`.`Phone` AS `Phone`, `subject`.`Subject_Code` AS `Subject_Code`, `subject`.`Name` AS `Name`, `subject`.`Mgr_Lecturer_ID` AS `Mgr_Lecturer_ID` FROM ((`lecturer_in_charge` join `lecturer`) join `subject`) WHERE `lecturer_in_charge`.`CLecturer_ID` = `lecturer`.`Lecturer_ID` AND `lecturer_in_charge`.`Inchr_Subject_Code` = `subject`.`Subject_Code` ;

-- --------------------------------------------------------

--
-- Structure for view `lecturer_manager_view`
--
DROP TABLE IF EXISTS `lecturer_manager_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lecturer_manager_view`  AS SELECT `management_lecturer`.`MLecturer_ID` AS `MLecturer_ID`, `lecturer`.`Lecturer_ID` AS `Lecturer_ID`, `lecturer`.`Last_Name` AS `Last_Name`, `lecturer`.`First_Name` AS `First_Name`, `lecturer`.`Faculty` AS `Faculty`, `lecturer`.`Degree` AS `Degree`, `lecturer`.`Address` AS `Address`, `lecturer`.`Email` AS `Email`, `lecturer`.`Phone` AS `Phone` FROM (`management_lecturer` join `lecturer`) WHERE `lecturer`.`Lecturer_ID` = `management_lecturer`.`MLecturer_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `question_view`
--
DROP TABLE IF EXISTS `question_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `question_view`  AS SELECT `question`.`Question_ID` AS `Question_ID`, `question`.`Content` AS `Content`, `question`.`Level` AS `Level`, `question`.`Correct_Choice_ID` AS `Correct_Choice_ID`, `question`.`Described_Content_ID` AS `Described_Content_ID`, `question`.`Ctrb_Lecturer_ID` AS `Ctrb_Lecturer_ID`, `question`.`Time_Contribute` AS `Time_Contribute`, `question`.`Evl_Outcome_No` AS `Evl_Outcome_No`, `question`.`Evl_Subject_Code` AS `Evl_Subject_Code`, `lecturer`.`Lecturer_ID` AS `Lecturer_ID`, `lecturer`.`Last_Name` AS `Last_Name`, `lecturer`.`First_Name` AS `First_Name`, `lecturer`.`Faculty` AS `Faculty`, `lecturer`.`Degree` AS `Degree`, `lecturer`.`Address` AS `Address`, `lecturer`.`Email` AS `Email`, `lecturer`.`Phone` AS `Phone`, concat(`lecturer`.`First_Name`,' ',`lecturer`.`Last_Name`) AS `fullname` FROM (`question` join `lecturer`) WHERE `question`.`Ctrb_Lecturer_ID` = `lecturer`.`Lecturer_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `student_answer_view`
--
DROP TABLE IF EXISTS `student_answer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_answer_view`  AS SELECT `answer_content`.`Student_ID` AS `Student_ID`, `answer_content`.`Subject_Code` AS `Subject_Code`, `answer_content`.`Exam_Date` AS `Exam_Date`, `answer_content`.`Exam_Code` AS `Exam_Code`, `answer_content`.`Answer_Number` AS `Answer_Number`, `answer_content`.`Answer_No` AS `Answer_No`, `answer_content`.`Answer_Choice_IDs` AS `Answer_Choice_IDs` FROM `answer_content` ;

-- --------------------------------------------------------

--
-- Structure for view `subject_view`
--
DROP TABLE IF EXISTS `subject_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subject_view`  AS SELECT `subject`.`Subject_Code` AS `Subject_Code`, `subject`.`Name` AS `Name`, concat(`lecturer`.`First_Name`,' ',`lecturer`.`Last_Name`) AS `mng_name` FROM (`subject` join `lecturer`) WHERE `lecturer`.`Lecturer_ID` = `subject`.`Mgr_Lecturer_ID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Student_ID`,`Subject_Code`,`Exam_Date`,`Exam_Code`,`Answer_Number`),
  ADD KEY `Subject_Code` (`Subject_Code`,`Exam_Date`,`Exam_Code`);

--
-- Indexes for table `answer_content`
--
ALTER TABLE `answer_content`
  ADD PRIMARY KEY (`Student_ID`,`Subject_Code`,`Exam_Date`,`Exam_Code`,`Answer_Number`,`Answer_No`);

--
-- Indexes for table `choice`
--
ALTER TABLE `choice`
  ADD PRIMARY KEY (`Question_ID`,`Choice_ID`,`Choice_Content`),
  ADD KEY `Described_Content_ID` (`Described_Content_ID`);

--
-- Indexes for table `common_description`
--
ALTER TABLE `common_description`
  ADD PRIMARY KEY (`Description_ID`),
  ADD KEY `Described_Content_ID` (`Described_Content_ID`);

--
-- Indexes for table `described_content`
--
ALTER TABLE `described_content`
  ADD PRIMARY KEY (`Described_Content_ID`);

--
-- Indexes for table `description_file`
--
ALTER TABLE `description_file`
  ADD PRIMARY KEY (`File_Path`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`Subject_Code`,`Exam_Date`,`Exam_Code`),
  ADD KEY `BC_Lecturer_ID` (`BC_Lecturer_ID`),
  ADD KEY `Apr_Lecturer_ID` (`Apr_Lecturer_ID`);

--
-- Indexes for table `exam_time`
--
ALTER TABLE `exam_time`
  ADD PRIMARY KEY (`Subject_Code`,`Exam_Date`);

--
-- Indexes for table `expression_of_question`
--
ALTER TABLE `expression_of_question`
  ADD PRIMARY KEY (`Subject_Code`,`Exam_Date`,`Question_ID`,`Question_No`),
  ADD KEY `Question_ID` (`Question_ID`);

--
-- Indexes for table `has_file`
--
ALTER TABLE `has_file`
  ADD PRIMARY KEY (`File_Path`,`Described_Content_ID`),
  ADD KEY `Described_Content_ID` (`Described_Content_ID`);

--
-- Indexes for table `in_exam`
--
ALTER TABLE `in_exam`
  ADD PRIMARY KEY (`EQSubject_Code`,`EQExam_Date`,`Question_ID`,`Question_No`),
  ADD KEY `ESubject_Code` (`ESubject_Code`,`EExam_Date`,`Exam_Code`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`Lecturer_ID`);

--
-- Indexes for table `lecturer_in_charge`
--
ALTER TABLE `lecturer_in_charge`
  ADD PRIMARY KEY (`CLecturer_ID`),
  ADD KEY `Inchr_Subject_Code` (`Inchr_Subject_Code`);

--
-- Indexes for table `management_lecturer`
--
ALTER TABLE `management_lecturer`
  ADD UNIQUE KEY `MLecturer_ID` (`MLecturer_ID`) USING BTREE;

--
-- Indexes for table `mix_choice_order`
--
ALTER TABLE `mix_choice_order`
  ADD PRIMARY KEY (`Subject_Code`,`Exam_Date`,`Question_ID`,`Question_No`,`A_Mix_Choice_ID`,`A_Mix_Choice_Content`);

--
-- Indexes for table `outcome`
--
ALTER TABLE `outcome`
  ADD PRIMARY KEY (`Subject_Code`,`Outcome_No`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Question_ID`),
  ADD KEY `Described_Content_ID` (`Described_Content_ID`),
  ADD KEY `Ctrb_Lecturer_ID` (`Ctrb_Lecturer_ID`),
  ADD KEY `Evl_Subject_Code` (`Evl_Subject_Code`,`Evl_Outcome_No`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`),
  ADD UNIQUE KEY `stuID` (`Student_ID`),
  ADD UNIQUE KEY `stID` (`Student_ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Subject_Code`),
  ADD KEY `Mgr_Lecturer_ID` (`Mgr_Lecturer_ID`);

--
-- Indexes for table `sub_of`
--
ALTER TABLE `sub_of`
  ADD PRIMARY KEY (`Sub_Subject_Code`,`Sub_Outcome_No`),
  ADD KEY `Super_Subject_Code` (`Super_Subject_Code`,`Super_Outcome_No`);

--
-- Indexes for table `use_des`
--
ALTER TABLE `use_des`
  ADD PRIMARY KEY (`Description_ID`,`Question_ID`),
  ADD KEY `Question_ID` (`Question_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`Subject_Code`,`Exam_Date`,`Exam_Code`) REFERENCES `exam` (`Subject_Code`, `Exam_Date`, `Exam_Code`);

--
-- Constraints for table `answer_content`
--
ALTER TABLE `answer_content`
  ADD CONSTRAINT `answer_content_ibfk_1` FOREIGN KEY (`Student_ID`,`Subject_Code`,`Exam_Date`,`Exam_Code`,`Answer_Number`) REFERENCES `answer` (`Student_ID`, `Subject_Code`, `Exam_Date`, `Exam_Code`, `Answer_Number`);

--
-- Constraints for table `choice`
--
ALTER TABLE `choice`
  ADD CONSTRAINT `choice_ibfk_1` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`),
  ADD CONSTRAINT `choice_ibfk_2` FOREIGN KEY (`Described_Content_ID`) REFERENCES `described_content` (`Described_Content_ID`);

--
-- Constraints for table `common_description`
--
ALTER TABLE `common_description`
  ADD CONSTRAINT `common_description_ibfk_1` FOREIGN KEY (`Described_Content_ID`) REFERENCES `described_content` (`Described_Content_ID`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`Subject_Code`,`Exam_Date`) REFERENCES `exam_time` (`Subject_Code`, `Exam_Date`),
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`BC_Lecturer_ID`) REFERENCES `lecturer_in_charge` (`CLecturer_ID`),
  ADD CONSTRAINT `exam_ibfk_3` FOREIGN KEY (`Apr_Lecturer_ID`) REFERENCES `management_lecturer` (`MLecturer_ID`);

--
-- Constraints for table `exam_time`
--
ALTER TABLE `exam_time`
  ADD CONSTRAINT `exam_time_ibfk_1` FOREIGN KEY (`Subject_Code`) REFERENCES `subject` (`Subject_Code`);

--
-- Constraints for table `expression_of_question`
--
ALTER TABLE `expression_of_question`
  ADD CONSTRAINT `expression_of_question_ibfk_1` FOREIGN KEY (`Subject_Code`,`Exam_Date`) REFERENCES `exam_time` (`Subject_Code`, `Exam_Date`),
  ADD CONSTRAINT `expression_of_question_ibfk_2` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`);

--
-- Constraints for table `has_file`
--
ALTER TABLE `has_file`
  ADD CONSTRAINT `has_file_ibfk_1` FOREIGN KEY (`File_Path`) REFERENCES `description_file` (`File_Path`),
  ADD CONSTRAINT `has_file_ibfk_2` FOREIGN KEY (`Described_Content_ID`) REFERENCES `described_content` (`Described_Content_ID`);

--
-- Constraints for table `in_exam`
--
ALTER TABLE `in_exam`
  ADD CONSTRAINT `in_exam_ibfk_1` FOREIGN KEY (`EQSubject_Code`,`EQExam_Date`,`Question_ID`,`Question_No`) REFERENCES `expression_of_question` (`Subject_Code`, `Exam_Date`, `Question_ID`, `Question_No`),
  ADD CONSTRAINT `in_exam_ibfk_2` FOREIGN KEY (`ESubject_Code`,`EExam_Date`,`Exam_Code`) REFERENCES `exam` (`Subject_Code`, `Exam_Date`, `Exam_Code`);

--
-- Constraints for table `lecturer_in_charge`
--
ALTER TABLE `lecturer_in_charge`
  ADD CONSTRAINT `lecturer_in_charge_ibfk_1` FOREIGN KEY (`CLecturer_ID`) REFERENCES `lecturer` (`Lecturer_ID`),
  ADD CONSTRAINT `lecturer_in_charge_ibfk_2` FOREIGN KEY (`Inchr_Subject_Code`) REFERENCES `subject` (`Subject_Code`);

--
-- Constraints for table `management_lecturer`
--
ALTER TABLE `management_lecturer`
  ADD CONSTRAINT `management_lecturer_ibfk_1` FOREIGN KEY (`MLecturer_ID`) REFERENCES `lecturer` (`Lecturer_ID`);

--
-- Constraints for table `mix_choice_order`
--
ALTER TABLE `mix_choice_order`
  ADD CONSTRAINT `mix_choice_order_ibfk_1` FOREIGN KEY (`Subject_Code`,`Exam_Date`,`Question_ID`,`Question_No`) REFERENCES `expression_of_question` (`Subject_Code`, `Exam_Date`, `Question_ID`, `Question_No`);

--
-- Constraints for table `outcome`
--
ALTER TABLE `outcome`
  ADD CONSTRAINT `outcome_ibfk_1` FOREIGN KEY (`Subject_Code`) REFERENCES `subject` (`Subject_Code`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Described_Content_ID`) REFERENCES `described_content` (`Described_Content_ID`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`Ctrb_Lecturer_ID`) REFERENCES `lecturer_in_charge` (`CLecturer_ID`),
  ADD CONSTRAINT `question_ibfk_3` FOREIGN KEY (`Evl_Subject_Code`,`Evl_Outcome_No`) REFERENCES `outcome` (`Subject_Code`, `Outcome_No`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`Mgr_Lecturer_ID`) REFERENCES `management_lecturer` (`MLecturer_ID`);

--
-- Constraints for table `sub_of`
--
ALTER TABLE `sub_of`
  ADD CONSTRAINT `sub_of_ibfk_1` FOREIGN KEY (`Sub_Subject_Code`,`Sub_Outcome_No`) REFERENCES `outcome` (`Subject_Code`, `Outcome_No`),
  ADD CONSTRAINT `sub_of_ibfk_2` FOREIGN KEY (`Super_Subject_Code`,`Super_Outcome_No`) REFERENCES `outcome` (`Subject_Code`, `Outcome_No`);

--
-- Constraints for table `use_des`
--
ALTER TABLE `use_des`
  ADD CONSTRAINT `use_des_ibfk_1` FOREIGN KEY (`Description_ID`) REFERENCES `common_description` (`Description_ID`),
  ADD CONSTRAINT `use_des_ibfk_2` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
