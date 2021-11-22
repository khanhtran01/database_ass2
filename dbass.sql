-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 08:45 AM
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
('1', 'A', 'dog', '1'),
('1', 'D', 'Human', '1'),
('1', 'B', 'cat', '2'),
('1', 'C', 'Snake', '3');

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
('/assets/img/123.png'),
('assets/img/described_content.png'),
('assets/img/exam.png'),
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
('1A', '2020-01-12', '1', 'Khong duoc su dung tai lieu', '1', '2020-01-05', '1', '2020-01-08'),
('2S', '2021-04-05', '2', 'khong co', '2', '2021-03-29', '2', '2021-04-01');

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
('2S', '2021-04-05');

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
('2', 'Hung', 'Le', 'Chemistry', 'Master', 'Ca Mau', 'Hung@gmail.com', '0213765423'),
('3', 'Dung', 'Nguyen', 'Physic', 'Doctor', 'Quang Nam', 'Dung@gmail.com', '0356574354');

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
('2', 'Normal', '323S');

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
('3');

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
('2', 'B la gi?', 'Easy', 'A', '2', '2', '2019-01-01 00:00:00', '2', '1A');

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
('3', 'Duy', 'Tran', 'Chem', 'Long An', 'duy@gmail.com', '023256346');

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
('323S', 'Phy', '3');

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
  ADD PRIMARY KEY (`MLecturer_ID`);

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
  ADD PRIMARY KEY (`Student_ID`);

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
