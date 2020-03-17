-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2020 at 03:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_judge`
--

-- --------------------------------------------------------

--
-- Table structure for table `judge_problem_list`
--

CREATE TABLE `judge_problem_list` (
  `judgeProblemListId` int(11) NOT NULL,
  `problemId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `judge_problem_list`
--

INSERT INTO `judge_problem_list` (`judgeProblemListId`, `problemId`, `status`) VALUES
(1, 3, 0),
(5, 10, 0),
(6, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `judge_setting`
--

CREATE TABLE `judge_setting` (
  `judgeSettingId` int(11) NOT NULL,
  `languageList` text DEFAULT NULL,
  `judgeSpeed` int(11) NOT NULL DEFAULT 45
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `judge_setting`
--

INSERT INTO `judge_setting` (`judgeSettingId`, `languageList`, `judgeSpeed`) VALUES
(1, '[{\"id\":45,\"name\":\"Assembly (NASM 2.14.02)\",\"is_archived\":false},{\"id\":46,\"name\":\"Bash (5.0.0)\",\"is_archived\":false},{\"id\":47,\"name\":\"Basic (FBC 1.07.1)\",\"is_archived\":false},{\"id\":48,\"name\":\"C (GCC 7.4.0)\",\"is_archived\":false},{\"id\":52,\"name\":\"C++ (GCC 7.4.0)\",\"is_archived\":false},{\"id\":49,\"name\":\"C (GCC 8.3.0)\",\"is_archived\":false},{\"id\":53,\"name\":\"C++ (GCC 8.3.0)\",\"is_archived\":false},{\"id\":50,\"name\":\"C (GCC 9.2.0)\",\"is_archived\":false},{\"id\":54,\"name\":\"C++ (GCC 9.2.0)\",\"is_archived\":false},{\"id\":51,\"name\":\"C# (Mono 6.6.0.161)\",\"is_archived\":false},{\"id\":55,\"name\":\"Common Lisp (SBCL 2.0.0)\",\"is_archived\":false},{\"id\":56,\"name\":\"D (DMD 2.089.1)\",\"is_archived\":false},{\"id\":57,\"name\":\"Elixir (1.9.4)\",\"is_archived\":false},{\"id\":58,\"name\":\"Erlang (OTP 22.2)\",\"is_archived\":false},{\"id\":44,\"name\":\"Executable\",\"is_archived\":false},{\"id\":59,\"name\":\"Fortran (GFortran 9.2.0)\",\"is_archived\":false},{\"id\":60,\"name\":\"Go (1.13.5)\",\"is_archived\":false},{\"id\":61,\"name\":\"Haskell (GHC 8.8.1)\",\"is_archived\":false},{\"id\":62,\"name\":\"Java (OpenJDK 13.0.1)\",\"is_archived\":false},{\"id\":63,\"name\":\"JavaScript (Node.js 12.14.0)\",\"is_archived\":false},{\"id\":64,\"name\":\"Lua (5.3.5)\",\"is_archived\":false},{\"id\":65,\"name\":\"OCaml (4.09.0)\",\"is_archived\":false},{\"id\":66,\"name\":\"Octave (5.1.0)\",\"is_archived\":false},{\"id\":67,\"name\":\"Pascal (FPC 3.0.4)\",\"is_archived\":false},{\"id\":68,\"name\":\"PHP (7.4.1)\",\"is_archived\":false},{\"id\":43,\"name\":\"Plain Text\",\"is_archived\":false},{\"id\":69,\"name\":\"Prolog (GNU Prolog 1.4.5)\",\"is_archived\":false},{\"id\":70,\"name\":\"Python (2.7.17)\",\"is_archived\":false},{\"id\":71,\"name\":\"Python (3.8.1)\",\"is_archived\":false},{\"id\":72,\"name\":\"Ruby (2.7.0)\",\"is_archived\":false},{\"id\":73,\"name\":\"Rust (1.40.0)\",\"is_archived\":false},{\"id\":74,\"name\":\"TypeScript (3.7.4)\",\"is_archived\":false}]', 45);

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `problemId` int(11) NOT NULL,
  `problemName` text NOT NULL,
  `problemDescription` text DEFAULT NULL,
  `inputDescription` text DEFAULT NULL,
  `outputDescription` text DEFAULT NULL,
  `constraintDescription` text DEFAULT NULL,
  `inputExample` text DEFAULT NULL,
  `outputExample` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `cpuTimeLimit` float NOT NULL DEFAULT 2,
  `memoryLimit` int(11) NOT NULL DEFAULT 128000,
  `userId` int(11) NOT NULL,
  `problemAddedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`problemId`, `problemName`, `problemDescription`, `inputDescription`, `outputDescription`, `constraintDescription`, `inputExample`, `outputExample`, `notes`, `cpuTimeLimit`, `memoryLimit`, `userId`, `problemAddedDate`) VALUES
(1, 'Alice and Bob', '<p>Since childhood Abir loved to play with numbers, one day he was counting numbers from 1 to 100 and he found out that there were 10 numbers that had 0 as its last digit. The numbers are 10, 20, 30, 40, 50, 60, 70, 80, 90, 100. He wants you to find how many numbers that have 0 as last digit from 1 to N.</p>\n', 'You will be given an integer&nbsp;<strong>T</strong>&nbsp;(1 &le; T &le; 17) in the first line. In next T lines there will be an integer&nbsp;<strong>N</strong>&nbsp;(1 &le; N &le; 109).', 'For each test case, print the&nbsp;<strong>number of trailing zeroes</strong>&nbsp;in your result.', '<span class=\"equation\">\\(1&lt;N &lt; 10^5\\)</span><br />\n<span class=\"equation\">\\(1 &lt; T &lt;10^6\\)</span>', '6<br />\nLRU<br />\nDURLDRUDRULRDURDDL<br />\nLRUDDLRUDRUL<br />\nLLLLRRRR<br />\nURDUR<br />\nLLL', '2<br />\nLR<br />\n14<br />\nRUURDDDDLLLUUR<br />\n12<br />\nULDDDRRRUULL<br />\n2<br />\nLR<br />\n2<br />\nUD<br />\n7', '<p>There are only two possible answers in the first test case: &quot;LR&quot; and &quot;RL&quot;.</p>\n\n<p>The picture corresponding to the second test case:</p>\n<img src=\"https://espresso.codeforces.com/b8d040c328a3c50a5e36b8d6da86a6e5f2b67b52.png\" /><br />\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Note that the direction of traverse does not matter\n<p>Another correct answer to the third test case: &quot;URDDLLLUURDR&quot;.</p>\n', 1.2, 128000, 1, '2020-01-24 00:00:00'),
(3, 'hey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 128000, 7, '2020-02-27 16:44:11'),
(10, 'Bangladesh Play', '<p>Finding large prime numbers is an essential part of the mechanisms involved in Internet security and privacy. And not just prime numbers, sometimes you need to perform various calculations on numbers that are specifically not prime. There are also uses of methods you have familiarized yourself with during your childhood, such as greatest common divisor (GCD) and least common multiple (LCM).</p>\n\n<p>Based on these, in 1763 Carl Friedrich Gauss solved this interesting problem:</p>\n\n<blockquote>\n<p>If you are given a number N, you have to determine how many integers between 1 and N have a GCD of 1 with N.</p>\n</blockquote>\n\n<p>Finding large prime numbers is an essential part of the mechanisms involved in Internet security and privacy. And not just prime numbers, sometimes you need to perform various calculations on numbers that are specifically not prime. There are also uses of methods you have familiarized yourself with during your childhood, such as greatest common divisor (GCD) and least common multiple (LCM).</p>\n\n<p>Based on these, in 1763 Carl Friedrich Gauss solved this interesting problem:</p>\n\n<blockquote>\n<p>If you are given a number N, you have to determine how many integers between 1 and N have a GCD of 1 with N.</p>\n</blockquote>\n\n<p>Later in this tutorial we will see that the solution of this problem can be written as. Knowing how Sieve of Eratosthenes works and this tutorial we will solve this about 250 years old problem.</p>\n\n<h2>&nbsp;</h2>\n\n<p>\\N-N)=N&minus;1</p>\n\n<p>&nbsp;</p>\n', 'nbvm', 'bnm', 'bnm', 'bnm', '', '', 2, 128000, 1, '2020-03-01 23:19:11');

--
-- Triggers `problems`
--
DELIMITER $$
CREATE TRIGGER `TG_InsertProblemModerator` AFTER INSERT ON `problems` FOR EACH ROW BEGIN
    INSERT INTO problem_moderator(problemId, userId,moderatorRoles)
        VALUES(new.problemId,new.userId,10);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `problem_moderator`
--

CREATE TABLE `problem_moderator` (
  `problemModeratorId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `problemId` int(11) NOT NULL,
  `moderatorRoles` int(11) NOT NULL DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem_moderator`
--

INSERT INTO `problem_moderator` (`problemModeratorId`, `userId`, `problemId`, `moderatorRoles`) VALUES
(1, 1, 1, 10),
(56, 7, 3, 10),
(68, 1, 10, 10),
(72, 7, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submissionId` int(11) NOT NULL,
  `submissionType` int(11) NOT NULL DEFAULT 1,
  `problemId` int(11) NOT NULL,
  `sourceCode` text NOT NULL,
  `languageId` int(11) NOT NULL,
  `languageName` text DEFAULT NULL,
  `maxTimeLimit` float NOT NULL DEFAULT 0,
  `maxMemoryLimit` int(11) NOT NULL DEFAULT 0,
  `runOnMaxTime` float NOT NULL DEFAULT 0,
  `runOnMaxMemory` int(11) NOT NULL DEFAULT 0,
  `userId` int(11) NOT NULL,
  `submissionTime` datetime NOT NULL,
  `submissionVerdict` int(11) NOT NULL DEFAULT 1,
  `testCaseReady` int(11) NOT NULL DEFAULT -1,
  `judgeComplete` int(11) NOT NULL DEFAULT 0,
  `runOnTest` int(11) NOT NULL DEFAULT 1,
  `totalTestCase` int(11) NOT NULL DEFAULT 0,
  `threadId` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`submissionId`, `submissionType`, `problemId`, `sourceCode`, `languageId`, `languageName`, `maxTimeLimit`, `maxMemoryLimit`, `runOnMaxTime`, `runOnMaxMemory`, `userId`, `submissionTime`, `submissionVerdict`, `testCaseReady`, `judgeComplete`, `runOnTest`, `totalTestCase`, `threadId`) VALUES
(25, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:05:02', 3, 1, 1, 4, 4, 15009),
(26, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:07:38', 3, 1, 1, 4, 4, 15040),
(27, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:11:24', 4, 1, 1, 3, 4, 19245),
(28, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:13:16', 4, 1, 1, 1, 4, 81391),
(29, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:13:26', 4, 1, 1, 1, 4, 12351),
(30, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:13:28', 4, 1, 1, 1, 4, 82923),
(31, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:13:31', 3, 1, 1, 4, 4, 69962),
(32, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:15:57', 3, 1, 1, 4, 4, 89261),
(33, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:18:20', 4, 1, 1, 3, 4, 7935),
(34, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:18:24', 3, 1, 1, 4, 4, 40043),
(35, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:18:26', 3, 1, 1, 4, 4, 63202),
(36, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:18:28', 3, 1, 1, 4, 4, 52439),
(37, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:18:30', 3, 1, 1, 4, 4, 62815),
(38, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:20:54', 3, 1, 1, 4, 4, 85831),
(39, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:24:25', 3, 1, 1, 4, 4, 78882),
(40, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:24:40', 3, 1, 1, 4, 4, 95975),
(41, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:33:19', 3, 1, 1, 4, 4, 62580),
(42, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:28', 3, 1, 1, 4, 4, 40900),
(43, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:36', 3, 1, 1, 4, 4, 90818),
(44, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:37', 3, 1, 1, 4, 4, 87674),
(45, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:40', 3, 1, 1, 4, 4, 90604),
(46, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:42', 3, 1, 1, 4, 4, 16684),
(47, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:44', 3, 1, 1, 4, 4, 16572),
(48, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:35:46', 3, 1, 1, 4, 4, 32178),
(49, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:37:03', 3, 1, 1, 4, 4, 20435),
(50, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:37:18', 3, 1, 1, 4, 4, 53565),
(51, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 21:37:40', 3, 1, 1, 4, 4, 85361),
(52, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:37:49', 3, 1, 1, 4, 4, 98121),
(53, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:38:01', 3, 1, 1, 4, 4, 33506),
(54, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:38:09', 3, 1, 1, 4, 4, 13443),
(55, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:38:58', 3, 1, 1, 4, 4, 25355),
(56, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:39:37', 3, 1, 1, 4, 4, 83194),
(57, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-03 20:39:47', 6, 1, 1, 1, 4, 54783),
(58, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-03 20:39:57', 6, 1, 1, 3, 4, 23722),
(59, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:40:20', 3, 1, 1, 4, 4, 88337),
(60, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:40:31', 3, 1, 1, 4, 4, 11829),
(61, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:40:59', 3, 1, 1, 4, 4, 39261),
(62, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:41:52', 3, 1, 1, 4, 4, 77732),
(63, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:42:19', 3, 1, 1, 4, 4, 76725),
(64, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:45:02', 3, 1, 1, 4, 4, 80158),
(65, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:47:53', 3, 1, 1, 4, 4, 58561),
(66, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:48:07', 3, 1, 1, 4, 4, 47306),
(67, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:48:42', 3, 1, 1, 4, 4, 12504),
(68, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.009, 1416, 0, 0, 1, '2020-02-03 20:52:09', 3, 1, 1, 4, 4, 56867),
(69, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.2, 1416, 0.2, 1416, 1, '2020-02-03 20:56:02', 3, 1, 1, 4, 4, 32157),
(70, 1, 1, '', 13, 'C++ (GCC 8.3.0)', 0.2, 1470, 0.2, 1470, 1, '2020-02-03 20:57:34', 3, 1, 1, 4, 4, 55594),
(71, 1, 1, '<?php\nclass Site\n{\n    \n    //starting connection\n    public function __construct()\n    {\n        \n        $this->DB   = new Database();\n        $this->conn = $this->DB->conn;\n    }\n    \n    public function getBackPageUrl()\n    {\n        \n        $main_url = $_SERVER[\'REQUEST_URI\'];\n        \n        $url       = explode(\'/\', $main_url);\n        $len       = count($url);\n        $page_name = $url[$len - 1];\n        \n        //check if login or register page then its back url is always same\n        if (strpos($main_url, \'login.php\') !== false)\n            return (isset($_GET[\'back\'])) ? $_GET[\'back\'] : \"index.php\";\n        if (strpos($main_url, \'register.php\') !== false)\n            return (isset($_GET[\'back\'])) ? $_GET[\'back\'] : \"index.php\";\n        \n        return base64_encode($page_name == \"\" ? \"index.php\" : $page_name);\n    }\n    \n    public function createFile($url, $file_name, $txt)\n    {\n        $new_file_name = $url . $file_name;\n        $file          = fopen($new_file_name, \"w\");\n        fwrite($file, $txt);\n        fclose($file);\n    }\n    \n    public function readFile($path)\n    {\n        $basePath = dirname(__FILE__);\n        //problem for cpanel path cronjob need specefic file name otherwise its go to infinate loop\n        if (!strpos($basePath, \'wamp64\') !== false) {\n            $basePath = explode(\"/\", $basePath);\n            array_pop($basePath);\n            array_pop($basePath);\n            $basePath = implode(\'/\', $basePath);\n            $path     = $basePath . \'/\' . $path;\n        }\n        \n        $file = fopen($path, \"r\");\n        while (!feof($file)) {\n            $data .= fgets($file);\n        }\n        fclose($file);\n        return $data;\n    }\n    \n    \n}\n?>', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 18:59:29', 6, 1, 1, 1, 4, 79514),
(72, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  cout << \"hey\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 10524, 0.007, 10524, 1, '2020-02-06 19:07:41', 4, 1, 1, 1, 4, 36341),
(73, 1, 1, '#include<bits/stdc++.h>\nusing name', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:36:16', 6, 1, 1, 1, 4, 53916),
(74, 1, 1, 'sdafsdf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:36:37', 6, 1, 1, 1, 4, 2512),
(75, 1, 1, 'dsfasdf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:37:15', 6, 1, 1, 1, 4, 9815),
(76, 1, 1, 'sdaf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:38:33', 6, 1, 1, 1, 4, 67682),
(77, 1, 1, 'sadf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:41:20', 6, 1, 1, 1, 4, 63590),
(78, 1, 1, 'sdaf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:41:23', 6, 1, 1, 1, 4, 23615),
(79, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  int a;\n  cin >> a;\n cout << a << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.01, 15392, 0.01, 15392, 1, '2020-02-06 18:56:12', 4, 1, 1, 2, 2, 69700),
(80, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long a;\n  cin >> a;\n cout << a << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 3252, 0.008, 3252, 1, '2020-02-06 18:56:29', 4, 1, 1, 2, 2, 15873),
(81, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  int a;\n  cin >> a;\n cout << a << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1440, 0.008, 1440, 1, '2020-02-06 18:56:50', 3, 1, 1, 2, 2, 56495),
(82, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  int a;\n  cin >> a;\n cout << a << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.009, 1260, 0.009, 1260, 1, '2020-02-06 18:57:17', 4, 1, 1, 2, 2, 78196),
(83, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long a;\n  cin >> a;\n cout << a << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 1408, 0.007, 1408, 1, '2020-02-06 18:57:38', 3, 1, 1, 2, 2, 66822),
(84, 1, 1, '#include', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:23:20', 6, 1, 1, 1, 2, 43018),
(85, 1, 1, '#include<bits/s', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:23:37', 6, 1, 1, 1, 2, 1590),
(86, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.013, 4472, 0.013, 4472, 1, '2020-02-06 19:47:51', 4, 1, 1, 2, 2, 59418),
(87, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 2088, 0.008, 2088, 1, '2020-02-06 19:50:35', 3, 1, 1, 2, 2, 70740),
(88, 1, 1, 'sdafasdf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-06 19:52:34', 6, 1, 1, 1, 2, 48160),
(89, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long n,i;\n  cin >> n;\n for(i=0; i<n; i++){}\n  cout << n << \"\\n\";\n\nreturn 0;\n}\n', 53, 'C++ (GCC 8.3.0)', 0.006, 1420, 0.006, 1420, 1, '2020-02-06 19:53:58', 5, 1, 1, 2, 2, 93760),
(90, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long n,i;\n  cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}\n', 53, 'C++ (GCC 8.3.0)', 0.01, 15608, 0.01, 15608, 1, '2020-02-06 19:16:36', 3, 1, 1, 2, 2, 72117),
(91, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long n,i;\n  cin >> n;\n for(i=0; i<n; i++){}\n  cout << n << \"\\n\";\n\nreturn 0;\n}\n', 53, 'C++ (GCC 8.3.0)', 0.007, 1376, 0.007, 1376, 1, '2020-02-06 19:16:45', 5, 1, 1, 2, 2, 76075),
(92, 1, 1, '#include <bits/stdc++.h>\n#include <vector>\n#include <sstream>\n#include <string>\nusing namespace std;\ntypedef long long int lli;\n#define pb push_back\n#define urut(a) sort(a.begin(),a.end())\n#define sws ios_base::sync_with_stdio(false);cin.tie(0);cout.tie(0)\n\nint main(){\n    sws;\n    int n,a,b,cnt = 0; cin >> n;\n    vector <int> vec1;\n    for (int i = 0; i < n; i++){\n        cin >> a;\n        vec1.pb(a);\n    }\n    int m; cin >> m;\n    vector <int> vec2;\n    for (int i = 0; i < m; i++){\n        cin >> b;\n        vec2.pb(b);\n    }\n    urut(vec1);\n    urut(vec2);\n    int mn,mx;\n    if (n > m){\n        mn = m;\n        mx = n;\n        for (int i = 0; i < mn; i++){\n            for (int j = 0; j < mx; j++){\n                if (abs(vec2[i] - vec1[j]) <= 1){\n                    cnt++;\n                    vec2[i] = -1;\n                    vec1[j] = -1;\n                    break;\n                }\n            }\n        }\n    }\n    else{\n        mn = n;\n        mx = m;\n        for (int i = 0; i < mn; i++){\n            for (int j = 0; j < mx; j++){\n                if (abs(vec1[i] - vec2[j]) <= 1){\n                    cnt++;\n                    vec1[i] = -1;\n                    vec2[j] = -1;\n                    break;\n                }\n            }\n        }\n    }\n    cout << cnt << endl;\n}\n', 53, 'C++ (GCC 8.3.0)', 0.01, 38304, 0.01, 38304, 1, '2020-02-06 19:38:16', 4, 1, 1, 1, 2, 71814),
(93, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long n;\n  cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1728, 0.008, 1728, 1, '2020-02-06 19:52:18', 3, 1, 1, 2, 2, 93132),
(94, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n  long long n;\n  cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1316, 0.008, 1316, 1, '2020-02-06 19:17:45', 3, 1, 1, 2, 2, 20165),
(95, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n  long long n;\n  cin >> a;\n cout << a << \"\\n\";\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-07 13:11:24', 6, 1, 1, 1, 2, 267),
(96, 1, 1, 'sdaf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 07:35:51', 6, 1, 1, 1, 2, 42336),
(97, 1, 1, 'sadf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 07:36:26', 6, 1, 1, 1, 2, 33900),
(98, 1, 1, 'saf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 07:46:14', 6, 1, 1, 1, 2, 11028),
(99, 1, 1, 'sdafsdf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 08:19:57', 6, 1, 1, 1, 3, 40109),
(100, 1, 1, 'sadf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 08:20:51', 6, 1, 1, 1, 3, 61995),
(101, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n long long n;\n  cin >> a;\n cout << a << \"\\n\";\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 09:27:16', 6, 1, 1, 1, 3, 19320),
(102, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n long long n;\n  cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.012, 1932, 0.012, 1932, 1, '2020-02-08 09:34:57', 3, 1, 1, 3, 3, 22836),
(103, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n long long n;\n  cin >> a;\n cout << a << \"\\n\";\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-08 09:35:23', 6, 1, 1, 1, 3, 99963),
(104, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.009, 32696, 0.009, 32696, 1, '2020-02-08 15:38:24', 3, 1, 1, 3, 3, 95367),
(105, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n int n;\n  cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 7996, 0.008, 7996, 1, '2020-02-08 17:14:41', 4, 1, 1, 2, 3, 62807),
(106, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n int n;\n cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 31368, 0.008, 31368, 1, '2020-02-09 06:27:54', 4, 1, 1, 2, 3, 74533),
(107, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n long long n;\n cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 6728, 0.008, 6728, 1, '2020-02-09 06:28:12', 3, 1, 1, 3, 3, 29435),
(108, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n\n int n;\n cin >> n;\n cout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.012, 23084, 0.012, 23084, 1, '2020-02-09 06:34:09', 4, 1, 1, 2, 3, 68623),
(109, 1, 1, '#include<', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-09 17:37:28', 6, 1, 1, 1, 3, 1732),
(110, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.013, 15576, 0.013, 15576, 1, '2020-02-09 17:38:38', 4, 1, 1, 2, 3, 46324),
(111, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.01, 1880, 0.01, 1880, 1, '2020-02-09 17:39:02', 3, 1, 1, 3, 3, 3878),
(112, 1, 1, 'dfsgsdfg', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-09 19:20:13', 6, 1, 1, 1, 3, 92300),
(113, 1, 1, 'assdafsdf', 53, NULL, 0, 0, 0, 0, 1, '2020-02-12 13:07:32', 6, 1, 1, 1, 3, 70688),
(114, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 18332, 0.009, 18332, 1, '2020-02-12 13:11:59', 3, 1, 1, 3, 3, 56317),
(115, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1416, 0.008, 1416, 1, '2020-02-12 13:12:25', 3, 1, 1, 3, 3, 55014),
(116, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 1240, 0.009, 1240, 1, '2020-02-12 13:13:32', 3, 1, 1, 5, 5, 48251),
(117, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=0; i<n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 4.776, 1492, 4.776, 1492, 1, '2020-02-12 13:19:59', 5, 1, 1, 2, 5, 11484),
(118, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1292, 0.008, 1292, 1, '2020-02-12 13:29:17', 3, 1, 1, 5, 5, 42243),
(119, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 29540, 0.009, 29540, 1, '2020-02-12 16:34:57', 3, 1, 1, 5, 5, 58918),
(120, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1352, 0.008, 1352, 1, '2020-02-12 16:36:07', 4, 1, 1, 5, 5, 51046),
(121, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1280, 0.008, 1280, 1, '2020-02-12 16:36:35', 4, 1, 1, 5, 5, 25715),
(122, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1284, 0.008, 1284, 1, '2020-02-12 16:41:52', 4, 1, 1, 5, 5, 70699),
(123, 1, 1, '#include<bits/stdc++.h>\n#define MAX 100007\nusing namespace std;\ntypedef long long ll;\n\nvector<ll>t[4*MAX],v,sum[4*MAX];\nvoid build(ll node,ll l,ll r)\n{\n    if(l==r)\n    {\n        t[node].push_back(v[l-1]);\n        sum[node].push_back(0);\n        return;\n    }\n    ll mid=(l+r)/2;\n    build(node*2,l,mid);\n    build(node*2+1,mid+1,r);\n    merge(t[node*2].begin(),t[node*2].end(),\n          t[node*2+1].begin(),t[node*2+1].end(),back_inserter(t[node]));\n\n    for(ll i=0; i<t[node].size(); i++)\n    {\n        if(i==0)\n            sum[node].push_back(0);\n        else\n        {\n            ll diff=t[node][i]-t[node][i-1];\n            diff=(diff*(i));\n            sum[node].push_back(diff+sum[node][sum[node].size()-1]);\n        }\n    }\n}\n\nll query(ll node,ll l,ll r,ll i,ll j,ll k)\n{\n    if(l>j || r<i)\n        return 0;\n    if(l>=i && r<=j)\n    {\n        ll ans,pos,a,diff,pos1;\n        pos=lower_bound(t[node].begin(),t[node].end(),k)-t[node].begin();\n        pos1=pos;\n        if(pos==t[node].size())\n            pos--;\n        a=t[node][pos];\n        diff=a-k;\n        ans=sum[node][pos]-(diff*pos1);\n        return ans;\n    }\n    ll mid=(l+r)/2;\n    return query(node*2,l,mid,i,j,k)+query(node*2+1,mid+1,r,i,j,k);\n}\n\n\nint main()\n{\n    ios_base::sync_with_stdio(false);\n    cin.tie(NULL);\n    ll n,q,i,j,l,r,a,k,ans;\n    cin >> n >> q;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        v.push_back(a);\n    }\n    build(1,1,n);\n    for(i=0; i<q; i++)\n    {\n        cin >> l >> r >> k;\n        ans=query(1,1,n,l,r,k);\n        cout << ans << \"\\n\";\n    }\n\n    return 0;\n}', 53, NULL, 0.203, 22044, 0.203, 22044, 1, '2020-02-12 16:50:19', 11, 1, 1, 1, 5, 32812),
(124, 1, 1, '#include<bits/stdc++.h>\n#define MAX 100007\nusing namespace std;\ntypedef long long ll;\n\nvector<ll>t[4*MAX],v,sum[4*MAX];\nvoid build(ll node,ll l,ll r)\n{\n    if(l==r)\n    {\n        t[node].push_back(v[l-1]);\n        sum[node].push_back(0);\n        return;\n    }\n    ll mid=(l+r)/2;\n    build(node*2,l,mid);\n    build(node*2+1,mid+1,r);\n    merge(t[node*2].begin(),t[node*2].end(),\n          t[node*2+1].begin(),t[node*2+1].end(),back_inserter(t[node]));\n\n    for(ll i=0; i<t[node].size(); i++)\n    {\n        if(i==0)\n            sum[node].push_back(0);\n        else\n        {\n            ll diff=t[node][i]-t[node][i-1];\n            diff=(diff*(i));\n            sum[node].push_back(diff+sum[node][sum[node].size()-1]);\n        }\n    }\n}\n\nll query(ll node,ll l,ll r,ll i,ll j,ll k)\n{\n    if(l>j || r<i)\n        return 0;\n    if(l>=i && r<=j)\n    {\n        ll ans,pos,a,diff,pos1;\n        pos=lower_bound(t[node].begin(),t[node].end(),k)-t[node].begin();\n        pos1=pos;\n        if(pos==t[node].size())\n            pos--;\n        a=t[node][pos];\n        diff=a-k;\n        ans=sum[node][pos]-(diff*pos1);\n        return ans;\n    }\n    ll mid=(l+r)/2;\n    return query(node*2,l,mid,i,j,k)+query(node*2+1,mid+1,r,i,j,k);\n}\n\n\nint main()\n{\n    ios_base::sync_with_stdio(false);\n    cin.tie(NULL);\n    ll n,q,i,j,l,r,a,k,ans;\n    cin >> n >> q;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        v.push_back(a);\n    }\n    build(1,1,n);\n    for(i=0; i<q; i++)\n    {\n        cin >> l >> r >> k;\n        ans=query(1,1,n,l,r,k);\n        cout << ans << \"\\n\";\n    }\n\n    return 0;\n}', 53, NULL, 0.187, 21788, 0.187, 21788, 1, '2020-02-12 17:19:11', 11, 1, 1, 1, 5, 73868),
(125, 1, 1, '#include<bits/stdc++.h>\n#define MAX 100007\nusing namespace std;\ntypedef long long ll;\n\nvector<ll>t[4*MAX],v,sum[4*MAX];\nvoid build(ll node,ll l,ll r)\n{\n    if(l==r)\n    {\n        t[node].push_back(v[l-1]);\n        sum[node].push_back(0);\n        return;\n    }\n    ll mid=(l+r)/2;\n    build(node*2,l,mid);\n    build(node*2+1,mid+1,r);\n    merge(t[node*2].begin(),t[node*2].end(),\n          t[node*2+1].begin(),t[node*2+1].end(),back_inserter(t[node]));\n\n    for(ll i=0; i<t[node].size(); i++)\n    {\n        if(i==0)\n            sum[node].push_back(0);\n        else\n        {\n            ll diff=t[node][i]-t[node][i-1];\n            diff=(diff*(i));\n            sum[node].push_back(diff+sum[node][sum[node].size()-1]);\n        }\n    }\n}\n\nll query(ll node,ll l,ll r,ll i,ll j,ll k)\n{\n    if(l>j || r<i)\n        return 0;\n    if(l>=i && r<=j)\n    {\n        ll ans,pos,a,diff,pos1;\n        pos=lower_bound(t[node].begin(),t[node].end(),k)-t[node].begin();\n        pos1=pos;\n        if(pos==t[node].size())\n            pos--;\n        a=t[node][pos];\n        diff=a-k;\n        ans=sum[node][pos]-(diff*pos1);\n        return ans;\n    }\n    ll mid=(l+r)/2;\n    return query(node*2,l,mid,i,j,k)+query(node*2+1,mid+1,r,i,j,k);\n}\n\n\nint main()\n{\n    ios_base::sync_with_stdio(false);\n    cin.tie(NULL);\n    ll n,q,i,j,l,r,a,k,ans;\n    cin >> n >> q;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        v.push_back(a);\n    }\n    build(1,1,n);\n    for(i=0; i<q; i++)\n    {\n        cin >> l >> r >> k;\n        ans=query(1,1,n,l,r,k);\n        cout << ans << \"\\n\";\n    }\n\n    return 0;\n}', 53, NULL, 0.233, 21056, 0.233, 21056, 1, '2020-02-12 17:20:01', 11, 1, 1, 1, 5, 49538),
(126, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1280, 0.008, 1280, 1, '2020-02-12 17:20:58', 4, 1, 1, 5, 6, 3243),
(127, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1308, 0.008, 1308, 1, '2020-02-12 17:21:40', 4, 1, 1, 5, 6, 58937),
(128, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 13416, 0.009, 13416, 1, '2020-02-12 18:35:19', 4, 1, 1, 5, 6, 2550),
(129, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.014, 34504, 0.014, 34504, 1, '2020-02-12 20:11:28', 4, 1, 1, 5, 6, 48277),
(130, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1572, 0.008, 1572, 1, '2020-02-12 20:33:28', 3, 1, 1, 6, 6, 53180),
(131, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 1392, 0.01, 1392, 1, '2020-02-12 20:37:21', 3, 1, 1, 6, 6, 26016),
(132, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 4160, 0.009, 4160, 1, '2020-02-12 22:10:05', 3, 1, 1, 6, 6, 66518),
(133, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 1260, 0.009, 1260, 1, '2020-02-12 22:12:20', 3, 1, 1, 1, 1, 63457),
(134, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.007, 1236, 0.007, 1236, 1, '2020-02-12 22:12:44', 3, 1, 1, 1, 1, 673),
(135, 1, 1, 'sdafsadf', 53, NULL, 0, 0, 0, 0, 1, '2020-02-12 22:14:39', 6, 1, 1, 1, 1, 18079),
(136, 1, 1, 'sadf', 53, NULL, 0, 0, 0, 0, 1, '2020-02-12 22:17:05', 6, 1, 1, 1, 1, 79818),
(137, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 3376, 0.01, 3376, 1, '2020-02-12 22:27:00', 3, 1, 1, 5, 5, 25487),
(138, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.007, 1368, 0.007, 1368, 1, '2020-02-12 22:28:13', 4, 1, 1, 4, 5, 59292),
(139, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1276, 0.008, 1276, 1, '2020-02-12 22:29:35', 4, 1, 1, 4, 5, 4344),
(140, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlonglong n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0, 0, 0, 0, 1, '2020-02-12 22:30:03', 6, 1, 1, 1, 5, 9632),
(141, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.013, 1392, 0.013, 1392, 1, '2020-02-12 22:30:28', 3, 1, 1, 5, 5, 62954),
(142, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=0; i<n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.016, 5092, 0.016, 5092, 1, '2020-02-12 22:46:55', 5, 1, 1, 4, 5, 25314),
(143, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=0; i<n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1348, 0.008, 1348, 1, '2020-02-12 22:56:18', 5, 1, 1, 4, 5, 94840),
(144, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n,i;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.013, 1328, 0.013, 1328, 1, '2020-02-12 22:56:43', 3, 1, 1, 5, 5, 19916),
(145, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 29588, 0.01, 29588, 1, '2020-02-13 10:04:20', 3, 1, 1, 5, 5, 30029),
(146, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 29804, 0.01, 29804, 1, '2020-02-13 13:17:54', 4, 1, 1, 4, 5, 62288),
(147, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.013, 35560, 0.013, 35560, 1, '2020-02-14 02:31:44', 3, 1, 1, 5, 5, 13638),
(148, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1336, 0.008, 1336, 1, '2020-02-14 02:31:53', 3, 1, 1, 5, 5, 68889),
(149, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 1400, 0.01, 1400, 1, '2020-02-14 02:33:09', 3, 1, 1, 5, 5, 18734),
(150, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1324, 0.008, 1324, 1, '2020-02-14 02:33:18', 3, 1, 1, 5, 5, 63984),
(151, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1428, 0.008, 1428, 1, '2020-02-14 02:34:52', 3, 1, 1, 5, 5, 15012),
(152, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1312, 0.008, 1312, 1, '2020-02-14 02:35:32', 3, 1, 1, 5, 5, 67459),
(153, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1316, 0.008, 1316, 1, '2020-02-14 02:35:39', 3, 1, 1, 5, 5, 17498),
(154, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.011, 1348, 0.011, 1348, 1, '2020-02-14 02:35:52', 3, 1, 1, 5, 5, 95937),
(155, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\n\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 1580, 0.009, 1580, 1, '2020-02-14 02:38:17', 4, 1, 1, 4, 5, 76627),
(156, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.013, 1380, 0.013, 1380, 1, '2020-02-14 02:38:33', 3, 1, 1, 5, 5, 41848),
(157, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\nfor(int i=0; i<n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.013, 1532, 0.013, 1532, 1, '2020-02-14 02:39:06', 5, 1, 1, 4, 5, 15462),
(158, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.014, 1324, 0.014, 1324, 1, '2020-02-14 02:40:00', 4, 1, 1, 4, 5, 97147),
(159, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1608, 0.008, 1608, 1, '2020-02-14 02:50:37', 3, 1, 1, 5, 5, 71267),
(160, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.007, 10856, 0.007, 10856, 1, '2020-02-14 02:51:03', 4, 1, 1, 4, 5, 57004),
(161, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 2896, 0.008, 2896, 1, '2020-02-14 03:02:23', 4, 1, 1, 4, 5, 60097),
(162, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,b;\ncin >> n;\nb=n/0;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0, 0, 0, 0, 1, '2020-02-14 03:03:39', 6, 1, 1, 1, 5, 26046),
(163, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 1400, 0.009, 1400, 1, '2020-02-14 03:05:18', 3, 1, 1, 5, 5, 96104),
(164, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1252, 0.008, 1252, 1, '2020-02-14 03:08:30', 4, 1, 1, 4, 5, 18696),
(165, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.012, 7380, 0.012, 7380, 1, '2020-02-14 04:56:56', 3, 1, 1, 5, 5, 51553),
(166, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.012, 1328, 0.012, 1328, 1, '2020-02-14 04:57:18', 4, 1, 1, 4, 5, 44124),
(167, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.008, 1440, 0.008, 1440, 1, '2020-02-14 05:42:13', 3, 1, 1, 5, 5, 64601),
(168, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.012, 32928, 0.012, 32928, 1, '2020-02-14 18:33:21', 3, 1, 1, 5, 5, 70468),
(169, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.011, 32768, 0.011, 32768, 1, '2020-02-15 00:26:47', 3, 1, 1, 5, 5, 68232),
(170, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.011, 1332, 0.011, 1332, 1, '2020-02-15 00:27:13', 3, 1, 1, 5, 5, 94713),
(171, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.01, 1348, 0.01, 1348, 1, '2020-02-15 03:43:45', 3, 1, 1, 5, 5, 4759),
(172, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.009, 1332, 0.009, 1332, 1, '2020-02-15 03:53:24', 4, 1, 1, 4, 5, 9498),
(173, 1, 1, 'hey', 53, NULL, 0, 0, 0, 0, 1, '2020-02-15 16:35:46', 6, 1, 1, 1, 5, 90501),
(174, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.012, 34556, 0.012, 34556, 1, '2020-02-16 06:11:11', 3, 1, 1, 5, 5, 72078),
(175, 1, 1, '#include<bits/stdc++.h>\nusing namespae', 53, NULL, 0, 0, 0, 0, 16, '2020-02-17 02:56:35', 6, 1, 1, 1, 5, 96037),
(176, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, NULL, 0.012, 1352, 0.012, 1352, 16, '2020-02-17 02:57:44', 3, 1, 1, 5, 5, 94121),
(177, 1, 1, '#include', 52, 'C++ (GCC 7.4.0)', 0, 0, 0, 0, 16, '2020-02-17 03:10:55', 6, 1, 1, 1, 1, 7187),
(178, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 1620, 0.007, 1620, 16, '2020-02-17 03:13:14', 3, 1, 1, 1, 1, 52061),
(179, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.009, 26992, 0.009, 26992, 16, '2020-02-17 03:13:34', 3, 1, 1, 1, 1, 88003),
(180, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1596, 0.008, 1596, 16, '2020-02-17 03:15:04', 3, 1, 1, 1, 1, 12869),
(181, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 1340, 0.007, 1340, 16, '2020-02-17 03:15:58', 3, 1, 1, 1, 1, 38413),
(182, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1116, 0.008, 1116, 16, '2020-02-17 03:17:24', 3, 1, 1, 1, 1, 79400),
(183, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 1336, 0.007, 1336, 16, '2020-02-17 03:17:43', 3, 1, 1, 1, 1, 50899),
(184, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.006, 1640, 0.006, 1640, 16, '2020-02-17 03:18:10', 3, 1, 1, 1, 1, 99083),
(185, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 71, 'Python (3.8.1)', 0.039, 6768, 0.039, 6768, 1, '2020-02-17 03:27:38', 11, 1, 1, 1, 1, 36033),
(186, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.009, 1428, 0.009, 1428, 1, '2020-02-17 03:34:56', 3, 1, 1, 1, 1, 12678),
(187, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.01, 18320, 0.01, 18320, 1, '2020-02-17 03:50:19', 3, 1, 1, 1, 1, 71997),
(188, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.011, 6804, 0.011, 6804, 1, '2020-02-17 04:24:48', 3, 1, 1, 1, 1, 24482),
(189, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:25:02', 6, 1, 1, 1, 1, 70619),
(190, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:25:25', 6, 1, 1, 1, 1, 61230),
(191, 2, 1, 'fasfsadf', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-02-17 04:26:01', 6, 1, 1, 1, 1, 17288),
(192, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 55, 'Common Lisp (SBCL 2.0.0)', 0.051, 29032, 0.051, 29032, 1, '2020-02-17 04:26:25', 11, 1, 1, 1, 1, 58826),
(193, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.015, 26856, 0.015, 26856, 1, '2020-02-17 04:26:40', 3, 1, 1, 1, 1, 41528),
(194, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:27:17', 6, 1, 1, 1, 1, 93240),
(195, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:33:13', 6, 1, 1, 1, 1, 98487),
(196, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:35:53', 6, 1, 1, 1, 1, 94252),
(197, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 48, 'C (GCC 7.4.0)', 0, 0, 0, 0, 1, '2020-02-17 04:55:42', 6, 1, 1, 1, 1, 74617),
(198, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 51, 'C# (Mono 6.6.0.161)', 0, 0, 0, 0, 1, '2020-02-17 04:56:51', 6, 1, 1, 1, 1, 91647),
(199, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.009, 17796, 0.009, 17796, 1, '2020-02-17 05:29:50', 3, 1, 1, 4, 4, 85569),
(200, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.012, 21012, 0.012, 21012, 1, '2020-02-17 05:29:58', 3, 1, 1, 4, 4, 38976),
(201, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.008, 1336, 0.008, 1336, 1, '2020-02-17 05:30:53', 3, 1, 1, 4, 4, 84297),
(202, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.007, 6556, 0.007, 6556, 1, '2020-02-17 05:31:06', 4, 1, 1, 3, 4, 41529),
(203, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 1364, 0.008, 1364, 1, '2020-02-17 05:31:18', 3, 1, 1, 4, 4, 21823),
(204, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.013, 1252, 0.013, 1252, 1, '2020-02-17 05:33:42', 3, 1, 1, 4, 4, 29443),
(205, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nint n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.007, 1300, 0.007, 1300, 1, '2020-02-17 05:33:53', 4, 1, 1, 3, 4, 43914),
(206, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=1; i<=n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 4.827, 1380, 4.827, 1380, 1, '2020-02-17 05:34:18', 5, 1, 1, 3, 4, 99201),
(207, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=1; i<=n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 4.905, 1296, 4.905, 1296, 1, '2020-02-17 05:35:12', 5, 1, 1, 3, 4, 29715),
(208, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=1; i<=n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 5.01, 25404, 5.01, 25404, 1, '2020-02-17 05:44:36', 5, 1, 1, 3, 4, 90820),
(209, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=1; i<=n; i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.008, 2536, 0.008, 2536, 1, '2020-02-17 05:45:10', 5, 1, 1, 3, 4, 4892),
(210, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n,i;\ncin >> n;\nfor(i=1; i<=sqrt(n); i++){}\ncout << n << \"\\n\";\n\nreturn 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.014, 1772, 0.014, 1772, 1, '2020-02-17 05:45:46', 3, 1, 1, 4, 4, 32192),
(211, 2, 1, '#include<bits/stdc++.h>\n#define MAX 1007\nusing namespace std;\n\nint visit[MAX],in[MAX],flag[MAX];\nvector<int>adj[MAX];\nvoid dfs(int s,int turn)\n{\n    if(visit[s]==1 && in[s]<turn)return;\n    visit[s]=1;\n    in[s]=turn;\n    for(int i=0; i<adj[s].size(); i++)\n        dfs(adj[s][i],turn+1);\n\n}\n\nint main()\n{\n\n    int q,n,m,u,v,s,i,j;\n    cin >> q;\n    for(i=0; i<q; i++)\n    {\n        cin >> n >> m;\n        for(j=0; j<m; j++)\n        {\n            cin >> u >> v;\n            adj[u].push_back(v);\n            adj[v].push_back(u);\n        }\n        cin >> s;\n        memset(visit,0,sizeof(visit));\n        memset(in,-1,sizeof(in));\n        dfs(s,0);\n        for(j=1; j<=n; j++)\n        {\n            int res=in[j];\n            res=(res==-1)?-1:res*6;\n            if(j!=s)cout << res << \" \";\n        }\n        cout << \"\\n\";\n        for(j=0; j<MAX-4; j++)adj[j].clear();\n    }\n\n    return 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.012, 1984, 0.012, 1984, 1, '2020-02-17 05:57:33', 4, 1, 1, 2, 2, 13534),
(212, 2, 1, '#include<bits/stdc++.h>\n#define MAX 1007\nusing namespace std;\n\nint visit[MAX],in[MAX],flag[MAX];\nvector<int>adj[MAX];\nvoid dfs(int s,int turn)\n{\n    if(visit[s]==1 && in[s]<turn)return;\n    visit[s]=1;\n    in[s]=turn;\n    for(int i=0; i<adj[s].size(); i++)\n        dfs(adj[s][i],turn+1);\n\n}\n\nint main()\n{\n\n    int q,n,m,u,v,s,i,j;\n    cin >> q;\n    for(i=0; i<q; i++)\n    {\n        cin >> n >> m;\n        for(j=0; j<m; j++)\n        {\n            cin >> u >> v;\n            adj[u].push_back(v);\n            adj[v].push_back(u);\n        }\n        cin >> s;\n        memset(visit,0,sizeof(visit));\n        memset(in,-1,sizeof(in));\n        dfs(s,0);\n        for(j=1; j<=n; j++)\n        {\n            int res=in[j];\n            res=(res==-1)?-1:res*6;\n            if(j!=s)cout << res << \" \";\n        }\n        cout << \"\\n\";\n        for(j=0; j<MAX-4; j++)adj[j].clear();\n    }\n\n    return 0;\n}\n', 52, 'C++ (GCC 7.4.0)', 0.009, 1752, 0.009, 1752, 1, '2020-02-17 05:58:25', 4, 1, 1, 2, 2, 61943),
(213, 2, 1, '#include<bits/stdc++.h>\n#define MAX 1007\nusing namespace std;\n\nint visit[MAX],in[MAX],flag[MAX];\nvector<int>adj[MAX];\nvoid dfs(int s,int turn)\n{\n    if(visit[s]==1 && in[s]<turn)return;\n    visit[s]=1;\n    in[s]=turn;\n    for(int i=0; i<adj[s].size(); i++)\n        dfs(adj[s][i],turn+1);\n\n}\n\nvoid bfs(int s)\n{\n\n    deque<int>q;\n    q.push_back(s);\n    while(!q.empty())\n    {\n        s=q.front();\n        q.pop_front();\n        int turn=in[s];\n        for(int i=0; i<adj[s].size(); i++)\n        {\n            int a=adj[s][i];\n            if(visit[a]==0)\n            {\n                visit[a]=1;\n                in[a]=turn+1;\n                q.push_back(a);\n            }\n        }\n    }\n}\n\nint main()\n{\n\n    int q,n,m,u,v,s,i,j;\n    cin >> q;\n    for(i=0; i<q; i++)\n    {\n        cin >> n >> m;\n        for(j=0; j<m; j++)\n        {\n            cin >> u >> v;\n            adj[u].push_back(v);\n            adj[v].push_back(u);\n        }\n        cin >> s;\n        memset(visit,0,sizeof(visit));\n        memset(in,0,sizeof(in));\n        bfs(s);\n        for(j=1; j<=n; j++)\n        {\n            int res=in[j];\n            res=(res==0)?-1:res*6;\n            if(j!=s)cout << res << \" \";\n        }\n        cout << \"\\n\";\n        for(j=0; j<MAX-4; j++)adj[j].clear();\n    }\n\n    return 0;\n}\n', 54, 'C++ (GCC 9.2.0)', 0.008, 2092, 0.008, 2092, 1, '2020-02-17 05:59:08', 4, 1, 1, 2, 2, 38210),
(214, 2, 1, '#include<bits/stdc++.h>\n#define MAX 1007\nusing namespace std;\n\nint visit[MAX],in[MAX],flag[MAX];\nvector<int>adj[MAX];\nvoid dfs(int s,int turn)\n{\n    if(visit[s]==1 && in[s]<turn)return;\n    visit[s]=1;\n    in[s]=turn;\n    for(int i=0; i<adj[s].size(); i++)\n        dfs(adj[s][i],turn+1);\n\n}\n\nvoid bfs(int s)\n{\n\n    deque<int>q;\n    q.push_back(s);\n    while(!q.empty())\n    {\n        s=q.front();\n        q.pop_front();\n        int turn=in[s];\n        for(int i=0; i<adj[s].size(); i++)\n        {\n            int a=adj[s][i];\n            if(visit[a]==0)\n            {\n                visit[a]=1;\n                in[a]=turn+1;\n                q.push_back(a);\n            }\n        }\n    }\n}\n\nint main()\n{\n\n    int q,n,m,u,v,s,i,j;\n    cin >> q;\n    for(i=0; i<q; i++)\n    {\n        cin >> n >> m;\n        for(j=0; j<m; j++)\n        {\n            cin >> u >> v;\n            adj[u].push_back(v);\n            adj[v].push_back(u);\n        }\n        cin >> s;\n        memset(visit,0,sizeof(visit));\n        memset(in,0,sizeof(in));\n        bfs(s);\n        for(j=1; j<=n; j++)\n        {\n            int res=in[j];\n            res=(res==0)?-1:res*6;\n            if(j!=s)cout << res << \" \";\n        }\n        cout << \"-\\n\";\n        for(j=0; j<MAX-4; j++)adj[j].clear();\n    }\n\n    return 0;\n}\n', 54, 'C++ (GCC 9.2.0)', 0.01, 35672, 0.01, 35672, 1, '2020-02-17 17:26:36', 4, 1, 1, 1, 2, 83654),
(215, 2, 1, '#include<bits/stdc++.h>\n#define MAX 1007\nusing namespace std;\n\nint visit[MAX],in[MAX],flag[MAX];\nvector<int>adj[MAX];\nvoid dfs(int s,int turn)\n{\n    if(visit[s]==1 && in[s]<turn)return;\n    visit[s]=1;\n    in[s]=turn;\n    for(int i=0; i<adj[s].size(); i++)\n        dfs(adj[s][i],turn+1);\n\n}\n\nvoid bfs(int s)\n{\n\n    deque<int>q;\n    q.push_back(s);\n    while(!q.empty())\n    {\n        s=q.front();\n        q.pop_front();\n        int turn=in[s];\n        for(int i=0; i<adj[s].size(); i++)\n        {\n            int a=adj[s][i];\n            if(visit[a]==0)\n            {\n                visit[a]=1;\n                in[a]=turn+1;\n                q.push_back(a);\n            }\n        }\n    }\n}\n\nint main()\n{\n\n    int q,n,m,u,v,s,i,j;\n    cin >> q;\n    for(i=0; i<q; i++)\n    {\n        cin >> n >> m;\n        for(j=0; j<m; j++)\n        {\n            cin >> u >> v;\n            adj[u].push_back(v);\n            adj[v].push_back(u);\n        }\n        cin >> s;\n        memset(visit,0,sizeof(visit));\n        memset(in,0,sizeof(in));\n        bfs(s);\n        for(j=1; j<=n; j++)\n        {\n            int res=in[j];\n            res=(res==0)?-1:res*6;\n            if(j!=s)cout << res << \" \";\n        }\n        cout << \"\\n\";\n        for(j=0; j<MAX-4; j++)adj[j].clear();\n    }\n\n    return 0;\n}\n', 54, 'C++ (GCC 9.2.0)', 0.008, 1960, 0.008, 1960, 1, '2020-02-17 17:26:58', 4, 1, 1, 2, 2, 94194),
(216, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main() {\n    int t;\n    cin>>t;\n    while(t--) {\n        int row;\n        cin>>row;\n        int col = row*2;\n        for(int i = 0; i < row; i++) {\n            for(int j = 0; j < col ; j++) {\n                if(j > i && j < (col-i-1))\n                    cout<<\"#\";\n                else\n                    cout<<\"*\";\n            }\n            cout<<endl;\n        }\n        cout<<endl;\n    }\n    return 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.007, 14348, 0.007, 14348, 1, '2020-02-17 20:10:17', 4, 1, 1, 1, 2, 66089),
(217, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main() {\n    int t;\n    cin>>t;\n    while(t--) {\n        int row;\n        cin>>row;\n        int col = row*2;\n        for(int i = 0; i < row; i++) {\n            for(int j = 0; j < col ; j++) {\n                if(j > i && j < (col-i-1))\n                    cout<<\"#\";\n                else\n                    cout<<\"*\";\n            }\n            cout<<endl;\n        }\n        cout<<endl;\n    }\n    return 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.007, 2240, 0.007, 2240, 1, '2020-02-17 20:11:06', 4, 1, 1, 1, 2, 63355);
INSERT INTO `submissions` (`submissionId`, `submissionType`, `problemId`, `sourceCode`, `languageId`, `languageName`, `maxTimeLimit`, `maxMemoryLimit`, `runOnMaxTime`, `runOnMaxMemory`, `userId`, `submissionTime`, `submissionVerdict`, `testCaseReady`, `judgeComplete`, `runOnTest`, `totalTestCase`, `threadId`) VALUES
(218, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main() {\n    int t;\n    cin>>t;\n    while(t--) {\n        int row;\n        cin>>row;\n        int col = row*2;\n        for(int i = 0; i < row; i++) {\n            for(int j = 0; j < col ; j++) {\n                if(j > i && j < (col-i-1))\n                    cout<<\"#\";\n                else\n                    cout<<\"*\";\n            }\n            cout<<endl;\n        }\n        cout<<endl;\n    }\n    return 0;\n}', 52, 'C++ (GCC 7.4.0)', 0.007, 4528, 0.007, 4528, 1, '2020-02-17 20:16:31', 4, 1, 1, 1, 2, 86857),
(219, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main() {\n    int t;\n    cin>>t;\n    while(t--) {\n        int row;\n        cin>>row;\n        int col = row*2;\n        for(int i = 0; i < row; i++) {\n            for(int j = 0; j < col ; j++) {\n                if(j > i && j < (col-i-1))\n                    cout<<\"#\";\n                else\n                    cout<<\"*\";\n            }\n            cout<<endl;\n        }\n        cout<<endl;\n    }\n    return 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.016, 28068, 0.016, 28068, 1, '2020-02-17 20:19:20', 3, 1, 1, 2, 2, 84224),
(220, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main() {\n    int t;\n    cin>>t;\n    while(t--) {\n        int row;\n        cin>>row;\n        int col = row*2;\n        for(int i = 0; i < row; i++) {\n            for(int j = 0; j < col ; j++) {\n                if(j > i && j < (col-i-1))\n                    cout<<\"#\";\n                else\n                    cout<<\"*\";\n            }\n            cout<<endl;\n        }\n        cout<<endl;\n    }\n    return 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.014, 1800, 0.014, 1800, 1, '2020-02-17 20:21:28', 3, 1, 1, 2, 2, 2445),
(221, 2, 1, '#include <iostream>\n \nusing namespace std;\n \nint main() {\n  int test;\n cin>>test;\n  for(int i=0;i<test;i++){\n      int n,j;\n      \n      cin>>n;\n     char a[n][2*n];\n     for(int k=0;k<n;k++)\n      for(int j=0;j<2*n;j++){\n         \n      \n      a[k][j]=\'#\';}\n     for(int k=0;k<n;k++){\n     for(int i=0;i<2*n;i++){\n         \n          a[k][i]=\'*\';\n          a[k][2*n-i-1]=\'*\';\n          for(int k=0;k<n;k++){\n         for(int j=0;j<2*n;j++){\n            \n         cout<<a[k][j];\n          }\n         cout<<endl;\n         }\n     }}}\n}', 54, 'C++ (GCC 9.2.0)', 0.115, 2284, 0.115, 2284, 1, '2020-02-17 20:23:07', 4, 1, 1, 1, 2, 6184),
(222, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.015, 2780, 0.015, 2780, 1, '2020-02-17 20:23:39', 3, 1, 1, 2, 2, 73076),
(223, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.008, 6944, 0.008, 6944, 1, '2020-02-17 20:24:56', 4, 1, 1, 1, 2, 21591),
(224, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.015, 1824, 0.015, 1824, 1, '2020-02-17 20:26:39', 3, 1, 1, 2, 2, 94393),
(225, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 15236, 0.016, 15236, 1, '2020-02-17 22:38:06', 3, 1, 1, 2, 2, 52125),
(226, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.015, 1432, 0.015, 1432, 1, '2020-02-17 22:39:31', 3, 1, 1, 2, 2, 93170),
(227, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.028, 37480, 0.028, 37480, 1, '2020-02-18 02:44:20', 3, 1, 1, 2, 2, 1586),
(228, 2, 1, '*################*\n**##############**\n***############***\n****##########****\n*****########*****\n******######******\n*******####*******\n********##********\n******************\n\n*##*\n****\n\n*########*\n**######**\n***####***\n****##****\n**********', 43, 'Plain Text', 0.008, 852, 0.008, 852, 1, '2020-02-18 03:09:55', 4, 1, 1, 2, 2, 4310),
(229, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 14000, 0.016, 14000, 1, '2020-02-18 04:00:05', 3, 1, 1, 2, 2, 97726),
(230, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 52, 'C++ (GCC 7.4.0)', 0.016, 13224, 0.016, 13224, 1, '2020-02-18 04:03:48', 3, 1, 1, 2, 2, 19591),
(231, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.012, 15324, 0.012, 15324, 1, '2020-02-18 15:12:09', 3, 1, 1, 2, 2, 62901),
(232, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n\nint main(){\nlong long n;\ncin >> n;\ncout << n << \"\\n\";\n\nreturn 0;\n}', 53, 'C++ (GCC 8.3.0)', 0.008, 29776, 0.008, 29776, 1, '2020-02-18 15:14:01', 4, 1, 1, 1, 2, 79738),
(233, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.012, 36412, 0.012, 36412, 1, '2020-02-19 04:01:35', 3, 1, 1, 2, 2, 20465),
(234, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"**\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.008, 29740, 0.008, 29740, 1, '2020-02-19 04:01:59', 4, 1, 1, 1, 2, 34922),
(235, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.013, 26004, 0.013, 26004, 1, '2020-02-21 06:44:43', 3, 1, 1, 2, 2, 57660),
(236, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.013, 26616, 0.013, 26616, 1, '2020-02-21 17:33:05', 3, 1, 1, 2, 2, 48851),
(237, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.016, 36868, 0.016, 36868, 1, '2020-02-27 03:17:00', 3, 1, 1, 2, 2, 50415),
(238, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.02, 1272, 0.02, 1272, 1, '2020-02-27 03:17:42', 3, 1, 1, 2, 2, 8043),
(239, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.011, 32044, 0.011, 32044, 1, '2020-02-27 03:17:49', 3, 1, 1, 2, 2, 64759),
(240, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.022, 3244, 0.022, 3244, 1, '2020-02-27 03:17:57', 3, 1, 1, 2, 2, 52658),
(241, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 1848, 0.016, 1848, 1, '2020-02-27 03:18:04', 3, 1, 1, 2, 2, 93027),
(242, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.024, 12028, 0.024, 12028, 1, '2020-02-29 15:32:32', 3, 1, 1, 2, 2, 7793),
(243, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n#define ff first\n#define ss second\n#define mp make_pair\n\ntypedef long long LL;\ntypedef pair< LL, LL >PLL;\n\nconst PLL M = mp(1e9+7, 1e9+9);\nconst LL base = 347;\nconst int N = 2e5+7;\n\nostream &operator<<(ostream &out, PLL p) {\n    return out << \"(\" << p.ff << \", \" << p.ss << \")\";\n}\n\nPLL operator+(PLL a, LL x) { return mp(a.ff+x, a.ss+x); }\nPLL operator-(PLL a, LL x) { return mp(a.ff-x, a.ss-x); }\nPLL operator*(PLL a, LL x) { return mp(a.ff*x, a.ss*x); }\nPLL operator+(PLL a, PLL x) { return mp(a.ff+x.ff, a.ss+x.ss); }\nPLL operator-(PLL a, PLL x) { return mp(a.ff-x.ff, a.ss-x.ss); }\nPLL operator*(PLL a, PLL x) { return mp(a.ff*x.ff, a.ss*x.ss); }\nPLL operator%(PLL a, PLL m) { return mp(a.ff%m.ff, a.ss%m.ss); }\n\nPLL pb[N];\n\nvoid hashPre() {\n    pb[0] = mp(1, 1);\n    for (int i = 1; i < N; i++) {\n        pb[i] = (pb[i-1]*base)%M;\n    }\n}\n\nPLL concat(PLL left, PLL right, int k) {\n    return (left*pb[k]+right)%M;\n}\n\ntypedef struct item *pitem;\n\nstruct item {\n    int prior, cnt;\n    pitem l, r;\n    PLL shoja, ulta;\n    PLL value;\n    item(int val) : prior(rand()), value(mp(val, val)) {\n        cnt = 0;\n        l = r = nullptr;\n    }\n    void calc() {\n        shoja = value;\n        ulta = value;\n    }\n};\n\n\nnamespace Treap {\n    int cnt(pitem it) {\n        return it != nullptr ? it->cnt : 0;\n    }\n\n    PLL shoja(pitem it) {\n        return it != nullptr ? it->shoja : PLL(0, 0);\n    }\n    PLL ulta(pitem it) {\n        return it != nullptr ? it->ulta: PLL(0, 0);\n    }\n\n    void upd_cnt(pitem it) {\n        if (it != nullptr) {\n            it->cnt = cnt(it->l)+cnt(it->r)+1;\n            ///hash\n            it->shoja = concat(it->value, shoja(it->r), cnt(it->r));\n            it->shoja = concat(shoja(it->l), it->shoja, cnt(it->r)+1);\n\n            it->ulta = concat(it->value, ulta(it->l), cnt(it->l));\n            it->ulta = concat(ulta(it->r), it->ulta, cnt(it->l)+1);\n        }\n    }\n\n    void merge(pitem &t, pitem l, pitem r) {\n        if (l==nullptr||r==nullptr) t = (l != nullptr) ? l : r;\n        else if (l->prior > r->prior) merge(l->r, l->r, r), t = l;\n        else merge(r->l, l, r->l), t = r;\n        upd_cnt(t);\n    }\n\n    void split(pitem t, pitem &l, pitem &r, int key, int add = 0) {\n        if (t==nullptr) {\n            l = r = nullptr;\n            return;\n        }\n        int cur_key = add+cnt(t->l);\n        if (key <= cur_key) split(t->l, l, t->l, key, add), r = t;\n        else split(t->r, t->r, r, key, add+1+cnt(t->l)), l = t;\n        upd_cnt(t);\n    }\n\n    void insert(pitem &t, int key, int value) {\n        pitem x = new item(value);\n        x->calc();\n\n        pitem L, R;\n        split(t, L, R, key);\n        merge(L, L, x);\n        merge(t, L, R);\n\n        upd_cnt(t);\n    }\n\n    void erase(pitem &t, int key) {\n        assert(cnt(t) > key);\n        pitem L, MID, R;\n        split(t, L, MID, key);\n        split(MID, MID, R, 1);\n        merge(t, L, R);\n        delete MID;\n        upd_cnt(t);\n    }\n\n    void update(pitem &t, int key, int value) {\n        assert(cnt(t) > key);\n        pitem L, MID, R;\n        split(t, L, MID, key);\n        split(MID, MID, R, 1);\n\n        ///\n        MID->value = PLL(value, value);\n        MID->calc();\n\n        merge(L, L, MID);\n        merge(t, L, R);\n\n        upd_cnt(t);\n    }\n\n    bool isPal(pitem &t, int n) {\n        if (n == 1) return 1;\n        bool ans = false;\n        if (n % 2) {\n            pitem t1, t2, t3;\n            split(t, t1, t2, n/2);\n            split(t2, t2, t3, 1);\n            ans = ulta(t1) == shoja(t3);\n            merge(t, t1, t2);\n            merge(t, t, t3);\n        } else {\n            pitem t1, t2;\n            split(t, t1, t2, n/2);\n            ans = ulta(t1)==shoja(t2);\n            merge(t, t1, t2);\n        }\n        return ans;\n    }\n\n    int ask(pitem &t, int l, int r) {\n        pitem t1, t2, t3;\n        split(t, t1, t2, l);\n        split(t2, t2, t3, r-l+1);\n\n        bool ans = isPal(t2, r-l+1);\n\n        merge(t, t1, t2);\n        merge(t, t, t3);\n\n        return ans;\n    }\n}\n\n\nint main() {\n    ios::sync_with_stdio(false);\n    cin.tie(0);\n\n    hashPre();\n\n    string s;\n    cin >> s;\n    int n = s.size();\n\n    pitem tr = nullptr;\n    for (int i = 0; i < n; i++) {\n        Treap::insert(tr, i, s[i]);\n    }\n\n\n    int q;\n    cin >> q;\n\n    while (q--) {\n        char c;\n        cin >> c;\n\n        if (c==\'C\') {\n            int i, j;\n            cin >> i >> j;\n            if (i > j) swap(i, j);\n            i--; j--;\n            if (Treap::ask(tr, i, j)) cout << \"Yes!\\n\";\n            else cout << \"No!\\n\";\n        } else if (c == \'D\') {\n            int i;\n            cin >> i;\n            i--;\n            Treap::erase(tr, i);\n        } else {\n            int i; char c;\n            cin >> i >> c;\n            i--;\n            Treap::update(tr, i, c);\n        }\n    }\n\n\n\n    return 0;\n}', 54, 'C++ (GCC 9.2.0)', 0.021, 4560, 0.021, 4560, 1, '2020-02-29 16:33:25', 11, 1, 1, 1, 2, 26191),
(244, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.013, 26556, 0.013, 26556, 1, '2020-03-08 18:19:42', 3, 1, 1, 2, 2, 54849),
(245, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>10)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.015, 7544, 0.015, 7544, 1, '2020-03-08 18:20:36', 4, 1, 1, 2, 2, 66302),
(246, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>10)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0.016, 3524, 0.016, 3524, 1, '2020-03-08 18:20:56', 4, 1, 1, 2, 2, 89004),
(247, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>10)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.015, 13072, 0.015, 13072, 1, '2020-03-08 18:21:18', 4, 1, 1, 2, 2, 24894),
(248, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.017, 5360, 0.017, 5360, 1, '2020-03-08 18:21:42', 3, 1, 1, 2, 2, 70328),
(249, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.013, 8912, 0.013, 8912, 1, '2020-03-08 20:03:49', 3, 1, 1, 2, 2, 96924),
(250, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.021, 15268, 0.021, 15268, 1, '2020-03-14 02:37:05', 3, 1, 1, 2, 2, 66288),
(251, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.015, 7716, 0.015, 7716, 1, '2020-03-14 02:37:49', 3, 1, 1, 2, 2, 22846),
(252, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.03, 2092, 0.03, 2092, 1, '2020-03-14 02:38:15', 3, 1, 1, 2, 2, 33997),
(253, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 53, NULL, 0, 0, 0, 0, 1, '2020-03-14 04:25:24', 3, 1, 1, 1, 0, 37044),
(254, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 54, 'C++ (GCC 9.2.0)', 0.008, 11720, 0.008, 11720, 1, '2020-03-14 04:25:54', 4, 1, 1, 1, 2, 50283),
(255, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 53, NULL, 0, 0, 0, 0, 1, '2020-03-14 04:27:11', 3, 1, 1, 1, 0, 30438),
(256, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 53, NULL, 0, 30388, 0, 30388, 1, '2020-03-14 04:27:28', 5, 1, 1, 1, 1, 77866),
(257, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 53, NULL, 0.011, 8636, 0.011, 8636, 1, '2020-03-14 04:31:46', 3, 1, 1, 2, 2, 51114),
(258, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YESs\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 53, NULL, 0.006, 2180, 0.006, 2180, 1, '2020-03-14 04:32:01', 4, 1, 1, 1, 2, 30908),
(259, 1, 10, '#include <bits/stdc++.h>\nusing namespace std;\n \n#define MOD 10000007\n#define f first\n#define s second\n#define es \" \"\n#define pb push_back\n#define is insert\n#define endl \"\\n\"\n#define INF 0x3f3f3f3f\n#define INFL 0x3f3f3f3f3f3f3f3f\n#define ll long long\n#define fastio ios_base::sync_with_stdio(0), cin.tie(0), cout.tie(0)\n#define debug(x) cout << \"debug 1: \" << x << endl\n#define debug2(x, y) cout << \"debug 2: \" << x << es << y << endl\n#define debug3(x, y, z) cout << \"debug 3: \" << x << es << y << es << z << endl\n \nint main()\n{\n    fastio;\n \n    int t, n, v[5005], memo[5005], check[5005];\n    bool resp=false;\n    cin >> t;\n    while(t>0){\n        t--;\n        cin >> n;\n        for(int i=1; i<=n; i++){\n            cin >> v[i];\n        }\n        int past=0;\n        resp=false;\n        memset(memo, 0, sizeof(memo));\n        memset(check, 0, sizeof(check));\n        past=v[1];\n        memo[past]=1;\n        for(int i=2; i<=n; i++){\n            if(memo[v[i]]==1 && check[v[i]]==1){\n                resp=true;\n            }\n            for(int j=1; j<=n; j++){\n                if(memo[v[j]]==1 && v[i]!=v[j]){\n                    check[past]=1;\n                }\n            }\n            memo[v[i]]=1;\n        }\n        if(resp){\n            cout << \"YES\" << endl;\n        }else{\n            cout << \"NO\" << endl;\n        }\n    }\n    return 0;\n}', 53, NULL, 0.008, 1944, 0.008, 1944, 1, '2020-03-14 04:32:57', 4, 1, 1, 1, 2, 92022),
(260, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 52, 'C++ (GCC 7.4.0)', 0.009, 27028, 0.009, 27028, 1, '2020-03-14 04:50:30', 3, 1, 1, 2, 2, 43378),
(261, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\ntypedef long long ll;\n\nvoid solve()\n{\n\n    ll n,i,a,ok=0,dis;\n    map<ll,ll>mp;\n    cin >> n;\n    for(i=0; i<n; i++)\n    {\n        cin >> a;\n        if(mp[a]==0)mp[a]=i+1;\n        dis=(i+1)-mp[a];\n        if(dis>1)ok=1;\n    }\n    cout << ((ok)?\"YES\":\"NO\") << \"\\n\";\n\n}\n\nint main()\n{\n    ll a,b,c,t,i;\n    cin >> t;\n    for(i=0; i<t; i++)solve();\n\n    return 0;\n}\n\n', 47, 'Basic (FBC 1.07.1)', 0, 0, 0, 0, 1, '2020-03-14 04:51:06', 6, 1, 1, 1, 2, 67927),
(262, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 12912, 0.016, 12912, 1, '2020-03-14 05:48:12', 3, 1, 1, 2, 2, 97273),
(263, 1, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.014, 24488, 0.014, 24488, 1, '2020-03-15 06:19:17', 3, 1, 1, 2, 2, 48738),
(264, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:24:45', 6, 1, 1, 1, 2, 49861),
(265, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.224, 24692, 0.224, 24692, 1, '2020-03-16 01:26:34', 3, 1, 1, 1, 1, 23328),
(266, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.191, 13540, 0.191, 13540, 1, '2020-03-16 01:27:11', 5, 1, 1, 1, 1, 46712),
(267, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.031, 15776, 0.031, 15776, 1, '2020-03-16 01:29:12', 3, 1, 1, 1, 1, 86841),
(268, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:30:21', 6, 1, 1, 1, 2, 9224),
(269, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:31:26', 6, 1, 1, 1, 2, 93678),
(270, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 53, 'C++ (GCC 8.3.0)', 0, 0, 0, 0, 1, '2020-03-16 01:32:11', 6, 1, 1, 1, 2, 60991),
(271, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.04, 32920, 0.04, 32920, 1, '2020-03-16 01:32:38', 3, 1, 1, 1, 1, 2022),
(272, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.028, 20876, 0.028, 20876, 1, '2020-03-16 01:38:43', 3, 1, 1, 2, 2, 42227),
(273, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:39:12', 6, 1, 1, 1, 2, 81608),
(274, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:51:34', 6, 1, 1, 1, 2, 28468),
(275, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:52:14', 6, 1, 1, 1, 2, 40993),
(276, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:53:01', 6, 1, 1, 1, 2, 20547),
(277, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 01:53:33', 6, 1, 1, 1, 2, 11771),
(278, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.037, 22800, 0.037, 22800, 1, '2020-03-16 01:54:36', 3, 1, 1, 1, 1, 35584),
(279, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.012, 21508, 0.012, 21508, 1, '2020-03-16 02:01:38', 3, 1, 1, 2, 2, 41115),
(280, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 1.872, 26700, 1.872, 26700, 1, '2020-03-16 02:02:17', 5, 1, 1, 2, 2, 78773),
(281, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 02:28:18', 6, 1, 1, 1, 2, 35206),
(282, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 1.92, 30812, 1.92, 30812, 1, '2020-03-16 03:19:55', 5, 1, 1, 2, 2, 35076),
(283, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 03:20:28', 6, 1, 1, 1, 2, 33443),
(284, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 03:21:04', 6, 1, 1, 1, 2, 23905),
(285, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:44:57', 6, 1, 1, 1, 2, 59103),
(286, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.029, 21096, 0.029, 21096, 1, '2020-03-16 07:45:57', 3, 1, 1, 1, 1, 78591),
(287, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t+4 << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.033, 16492, 0.033, 16492, 1, '2020-03-16 07:46:16', 4, 1, 1, 1, 1, 79368),
(288, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:46:39', 6, 1, 1, 1, 2, 98058),
(289, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.011, 22036, 0.011, 22036, 1, '2020-03-16 07:48:01', 4, 1, 1, 1, 2, 36806),
(290, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.021, 28412, 0.021, 28412, 1, '2020-03-16 07:48:23', 3, 1, 1, 2, 2, 59773),
(291, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 24564, 0.016, 24564, 1, '2020-03-16 07:48:37', 3, 1, 1, 2, 2, 7935),
(292, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:49:09', 6, 1, 1, 1, 2, 66022),
(293, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:49:38', 6, 1, 1, 1, 2, 30782),
(294, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.013, 25352, 0.013, 25352, 1, '2020-03-16 07:50:11', 3, 1, 1, 2, 2, 76689),
(295, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:50:45', 6, 1, 1, 1, 2, 25208),
(296, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:51:17', 6, 1, 1, 1, 2, 65310),
(297, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.016, 19816, 0.016, 19816, 1, '2020-03-16 07:52:10', 3, 1, 1, 2, 2, 58447),
(298, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 07:52:39', 6, 1, 1, 1, 2, 60593),
(299, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.029, 19428, 0.029, 19428, 1, '2020-03-16 07:53:43', 3, 1, 1, 1, 1, 63742),
(300, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.034, 17508, 0.034, 17508, 1, '2020-03-16 07:56:30', 3, 1, 1, 1, 1, 79390),
(301, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.03, 19040, 0.03, 19040, 1, '2020-03-16 08:28:35', 3, 1, 1, 1, 1, 10095),
(302, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 08:29:17', 6, 1, 1, 1, 2, 56262),
(303, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 08:29:44', 6, 1, 1, 1, 2, 56263),
(304, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.03, 29412, 0.03, 29412, 1, '2020-03-16 21:59:06', 4, 1, 1, 2, 2, 31217),
(305, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-16 21:59:49', 6, 1, 1, 1, 2, 33581),
(306, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 03:59:16', 6, 1, 1, 1, 2, 54688),
(307, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 04:00:09', 6, 1, 1, 1, 2, 81942),
(308, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.028, 23472, 0.028, 23472, 1, '2020-03-17 04:00:48', 3, 1, 1, 1, 1, 48874),
(309, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.03, 21392, 0.03, 21392, 1, '2020-03-17 06:00:03', 3, 1, 1, 1, 1, 31359),
(310, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 50, 'C (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 06:00:42', 6, 1, 1, 1, 1, 60915),
(311, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t+1 << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.03, 18656, 0.03, 18656, 1, '2020-03-17 06:00:59', 4, 1, 1, 1, 1, 2687),
(312, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 06:01:26', 6, 1, 1, 1, 2, 98225),
(313, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.011, 28732, 0.011, 28732, 1, '2020-03-17 06:32:23', 3, 1, 1, 2, 2, 18080),
(314, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.013, 16732, 0.013, 16732, 1, '2020-03-17 06:43:21', 3, 1, 1, 2, 2, 3591),
(315, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.01, 30184, 0.01, 30184, 1, '2020-03-17 06:57:28', 4, 1, 1, 1, 2, 97387),
(316, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.011, 29060, 0.011, 29060, 1, '2020-03-17 06:59:56', 3, 1, 1, 2, 2, 42797),
(317, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.01, 27432, 0.01, 27432, 1, '2020-03-17 08:29:03', 3, 1, 1, 2, 2, 10807),
(318, 1, 10, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t,i;\ncin >> t;\nfor(i=1; i<t; i++){}\ncout << t << \"\\n\";\n\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.015, 21388, 0.015, 21388, 1, '2020-03-17 08:38:44', 3, 1, 1, 2, 2, 2451),
(319, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.024, 21456, 0.024, 21456, 1, '2020-03-17 08:40:02', 3, 1, 1, 2, 2, 86717),
(320, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 08:40:52', 6, 1, 1, 1, 2, 7257),
(321, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 08:40:59', 6, 1, 1, 1, 2, 54157),
(322, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.021, 30564, 0.021, 30564, 1, '2020-03-17 08:41:06', 3, 1, 1, 2, 2, 8906),
(323, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 08:41:17', 6, 1, 1, 1, 2, 84551);
INSERT INTO `submissions` (`submissionId`, `submissionType`, `problemId`, `sourceCode`, `languageId`, `languageName`, `maxTimeLimit`, `maxMemoryLimit`, `runOnMaxTime`, `runOnMaxMemory`, `userId`, `submissionTime`, `submissionVerdict`, `testCaseReady`, `judgeComplete`, `runOnTest`, `totalTestCase`, `threadId`) VALUES
(324, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0, 0, 0, 0, 1, '2020-03-17 08:41:24', 6, 1, 1, 1, 2, 87007),
(325, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.019, 20076, 0.019, 20076, 1, '2020-03-17 08:41:32', 3, 1, 1, 2, 2, 89050),
(326, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.019, 18860, 0.019, 18860, 1, '2020-03-17 08:41:39', 3, 1, 1, 2, 2, 32718),
(327, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.021, 24944, 0.021, 24944, 1, '2020-03-17 08:46:41', 3, 1, 1, 2, 2, 76506),
(328, 2, 1, '#include<bits/stdc++.h>\nusing namespace std;\n \nint main()\n{\nint t;\ncin>>t;\nint arr[t];\nint i;\nint n,q,p,x;\nif(t>100)cout << \"hey\";\nfor(i=0;i<t;i++)\ncin>>arr[i];\n \nfor(i=0;i<t;i++)\n{\nn=arr[i];\nq=n;\np=1;\nfor(int j=0;j<n;j++)\n{\nx=(2*q)-2;\nfor(int k=0;k<p;k++)\ncout<<\"*\";\nfor(int k=0;k<x;k++)\ncout<<\"#\";\nfor(int k=0;k<p;k++)\ncout<<\"*\";\ncout<<endl;\np++;\nq--;\n \n}\n \ncout<<endl;\n}\nreturn 0;\n \n}', 54, 'C++ (GCC 9.2.0)', 0.02, 25108, 0.02, 25108, 1, '2020-03-17 08:48:33', 3, 1, 1, 2, 2, 25866);

-- --------------------------------------------------------

--
-- Table structure for table `submissions_on_test_case`
--

CREATE TABLE `submissions_on_test_case` (
  `submissionTestCaseId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `testCaseSerialNo` int(11) NOT NULL,
  `testCaseId` int(11) NOT NULL,
  `testCaseToken` varchar(100) DEFAULT NULL,
  `judgeStatus` int(11) NOT NULL DEFAULT -1,
  `verdict` int(11) NOT NULL DEFAULT 0,
  `totalTime` float NOT NULL DEFAULT 0,
  `totalMemory` int(11) NOT NULL DEFAULT 0,
  `responseData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`responseData`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submissions_on_test_case`
--

INSERT INTO `submissions_on_test_case` (`submissionTestCaseId`, `submissionId`, `testCaseSerialNo`, `testCaseId`, `testCaseToken`, `judgeStatus`, `verdict`, `totalTime`, `totalMemory`, `responseData`) VALUES
(26, 25, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(27, 25, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(28, 25, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(29, 25, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(30, 26, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(31, 26, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(32, 26, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(33, 26, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(34, 27, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(35, 27, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(36, 27, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(37, 27, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(38, 28, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(39, 28, 2, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(40, 28, 3, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(41, 28, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(42, 29, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(43, 29, 2, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(44, 29, 3, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(45, 29, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(46, 30, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(47, 30, 2, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(48, 30, 3, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(49, 30, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(50, 31, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(51, 31, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(52, 31, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(53, 31, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(54, 32, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(55, 32, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(56, 32, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(57, 32, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(58, 33, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(59, 33, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(60, 33, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(61, 33, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(62, 34, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(63, 34, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(64, 34, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(65, 34, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(66, 35, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(67, 35, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(68, 35, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(69, 35, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(70, 36, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(71, 36, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(72, 36, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(73, 36, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(74, 37, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(75, 37, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(76, 37, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(77, 37, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(78, 38, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(79, 38, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(80, 38, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(81, 38, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(82, 39, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(83, 39, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(84, 39, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(85, 39, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(86, 40, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(87, 40, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(88, 40, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(89, 40, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(90, 41, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(91, 41, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(92, 41, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(93, 41, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(94, 42, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(95, 42, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(96, 42, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(97, 42, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(98, 43, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(99, 43, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(100, 43, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(101, 43, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(102, 44, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(103, 44, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(104, 44, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(105, 44, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(106, 45, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(107, 45, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(108, 45, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(109, 45, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(110, 46, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(111, 46, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(112, 46, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(113, 46, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(114, 47, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(115, 47, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(116, 47, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(117, 47, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(118, 48, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(119, 48, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(120, 48, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(121, 48, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(122, 49, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(123, 49, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(124, 49, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(125, 49, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(126, 50, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(127, 50, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(128, 50, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(129, 50, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(130, 51, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(131, 51, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(132, 51, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(133, 51, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(134, 52, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(135, 52, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(136, 52, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(137, 52, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(138, 53, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(139, 53, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(140, 53, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(141, 53, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(142, 54, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(143, 54, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(144, 54, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(145, 54, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(146, 55, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(147, 55, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(148, 55, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(149, 55, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(150, 56, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(151, 56, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(152, 56, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(153, 56, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(154, 57, 1, 91, 'asfsdafsa0', 1, 6, 0, 0, '{}'),
(155, 57, 2, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(156, 57, 3, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(157, 57, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(158, 58, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(159, 58, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(160, 58, 3, 91, 'asfsdafsa0', 1, 6, 0, 0, '{}'),
(161, 58, 4, 91, 'asfsdafsa0', -1, 1, 0, 0, NULL),
(162, 59, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(163, 59, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(164, 59, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(165, 59, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(166, 60, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(167, 60, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(168, 60, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(169, 60, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(170, 61, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(171, 61, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(172, 61, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(173, 61, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(174, 62, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(175, 62, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(176, 62, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(177, 62, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(178, 63, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(179, 63, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(180, 63, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(181, 63, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(182, 64, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(183, 64, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(184, 64, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(185, 64, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(186, 65, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(187, 65, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(188, 65, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(189, 65, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(190, 66, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(191, 66, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(192, 66, 3, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(193, 66, 4, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(194, 67, 1, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(195, 67, 2, 91, 'asfsdafsa0', 1, 1, 0, 0, NULL),
(196, 67, 3, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(197, 67, 4, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(198, 68, 1, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(199, 68, 2, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(200, 68, 3, 91, 'asfsdafsa0', 1, 3, 0.1, 1416, '{\"time\": \"0.1\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(201, 68, 4, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(202, 69, 1, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(203, 69, 2, 91, 'asfsdafsa0', 1, 3, 0.1, 1416, '{\"time\": \"0.1\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(204, 69, 3, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(205, 69, 4, 91, 'asfsdafsa0', 1, 3, 0.2, 1416, '{\"time\": \"0.2\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(206, 70, 1, 91, 'asfsdafsa0', 1, 3, 0.009, 1416, '{\"time\": \"0.009\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1416, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(207, 70, 2, 91, 'asfsdafsa0', 1, 3, 0.2, 1470, '{\"time\": \"0.2\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1470, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(208, 70, 3, 91, 'asfsdafsa0', 1, 3, 0.2, 1470, '{\"time\": \"0.2\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1470, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(209, 70, 4, 91, 'asfsdafsa0', 1, 3, 0.2, 1470, '{\"time\": \"0.2\", \"token\": \"87499552-56fd-4bb4-8bbc-cc24fa4ccc61\", \"memory\": 1470, \"status\": {\"id\": 3, \"description\": \"WA\"}, \"stderr\": null, \"stdout\": \"2\\n\", \"message\": null, \"compile_output\": null}'),
(210, 71, 1, 91, '2f5144a9-0905-48b6-9b62-aa7b576e4667', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(211, 71, 2, 91, 'dc2ddb0b-e9b8-4d7c-b8fb-6522aa4fc70e', -1, 1, 0, 0, NULL),
(212, 71, 3, 91, '42809675-0700-4a41-98ff-e19cf9fd4ce2', -1, 1, 0, 0, NULL),
(213, 71, 4, 91, '6e060d11-f618-4563-adc9-a074638e9344', -1, 1, 0, 0, NULL),
(214, 72, 1, 91, '060adeba-15f3-436b-a1ad-f9fa9885dc4f', 1, 4, 0.007, 10524, '{\"time\": \"0.007\", \"token\": \"060adeba-15f3-436b-a1ad-f9fa9885dc4f\", \"memory\": 10524, \"status\": {\"id\": 4, \"description\": \"Wrong Answer\"}, \"stderr\": null, \"stdout\": \"hey\\n\", \"message\": null, \"compile_output\": null}'),
(215, 72, 2, 91, '5081403b-173e-4369-863e-5e6f9de40bd2', -1, 1, 0, 0, NULL),
(216, 72, 3, 91, '5db36ca8-f604-481e-9e57-dc1247d9371d', -1, 1, 0, 0, NULL),
(217, 72, 4, 91, 'f1d18f71-a1f1-4d07-9ca1-c971cc728ebb', -1, 1, 0, 0, NULL),
(218, 73, 1, 91, '125357c1-f1c9-4667-b4a4-a9bd9122affa', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(219, 73, 2, 91, '8cabf935-725d-4e7c-9906-e9f0dbbde4f6', -1, 1, 0, 0, NULL),
(220, 73, 3, 91, '430fe973-c176-4e32-bd20-9dc1be5ab3c2', -1, 1, 0, 0, NULL),
(221, 73, 4, 91, '9e0dda70-e32a-4ffc-9309-49cf1020f5ba', -1, 1, 0, 0, NULL),
(222, 74, 1, 91, 'e9bda533-9ff5-4f23-a2cc-b77d5a9778c9', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(223, 74, 2, 91, 'dfd1a541-f79f-410d-9611-c53ae381e159', -1, 1, 0, 0, NULL),
(224, 74, 3, 91, 'c96a236f-6e41-48d7-ab70-b96500cffa02', -1, 1, 0, 0, NULL),
(225, 74, 4, 91, 'c6f084ad-a7d5-4147-982b-3289b77994ba', -1, 1, 0, 0, NULL),
(226, 75, 1, 91, '4d8056ec-46a2-40e4-90ad-82f9f0860daa', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(227, 75, 2, 91, 'cb2ff911-0460-4912-87ac-f6cf896bd818', -1, 1, 0, 0, NULL),
(228, 75, 3, 91, 'ab019b0d-d257-4d88-9dbe-6196d52509b7', -1, 1, 0, 0, NULL),
(229, 75, 4, 91, '0e7f40bc-be2e-4752-9fb7-5a4a83ab923c', -1, 1, 0, 0, NULL),
(230, 76, 1, 91, '20c6c361-0078-414e-b94c-044ec69a868f', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(231, 76, 2, 91, '0e5a59fc-7927-4701-9701-79ea57002ad2', -1, 1, 0, 0, NULL),
(232, 76, 3, 91, 'db46e37d-f549-4f61-842e-af5e2cc5bf06', -1, 1, 0, 0, NULL),
(233, 76, 4, 91, 'b1bdb33d-b008-4008-9d58-d27c9e0d4547', -1, 1, 0, 0, NULL),
(234, 77, 1, 91, '0c1e5275-73ba-4266-99fd-aecac10d6332', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(235, 77, 2, 91, '74ab9b96-68ac-480d-a76f-1981435b8b9f', -1, 1, 0, 0, NULL),
(236, 77, 3, 91, 'e6363998-a20a-435e-bf94-e8bd9380feb2', -1, 1, 0, 0, NULL),
(237, 77, 4, 91, '6508bc9d-19c3-4ff3-b9e3-dcb6dbb02506', -1, 1, 0, 0, NULL),
(238, 78, 1, 91, 'c5691f18-412c-4133-9f91-48f4ec463a3f', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(239, 78, 2, 91, '5cb66221-1e9e-4211-859d-f70d549b61f2', -1, 1, 0, 0, NULL),
(240, 78, 3, 91, '076cb0fe-c6ba-46ca-ab7c-04ad2de1d517', -1, 1, 0, 0, NULL),
(241, 78, 4, 91, 'b42e6baf-8d85-49d6-bad5-d760b534b508', -1, 1, 0, 0, NULL),
(242, 79, 1, 91, 'f8bc31eb-1819-4a4c-9b5b-80394b8646b7', 1, 3, 0.01, 15392, '{\"time\": \"0.01\", \"token\": \"f8bc31eb-1819-4a4c-9b5b-80394b8646b7\", \"memory\": 15392, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(243, 79, 2, 91, '28adf998-951d-48f5-9ee9-32725235a1ae', 1, 4, 0.008, 1504, '{\"time\": \"0.008\", \"token\": \"28adf998-951d-48f5-9ee9-32725235a1ae\", \"memory\": 1504, \"status\": {\"id\": 4, \"description\": \"Wrong Answer\"}, \"stderr\": null, \"stdout\": \"1000000000\\n\", \"message\": null, \"compile_output\": null}'),
(244, 80, 1, 91, '1daaf2b1-2f66-473d-b9fb-79ec2a5feba0', 1, 3, 0.008, 3252, '{\"time\": \"0.008\", \"token\": \"1daaf2b1-2f66-473d-b9fb-79ec2a5feba0\", \"memory\": 3252, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(245, 80, 2, 91, '64f9ddc8-f720-41a3-8379-4a9ce41b44ec', 1, 4, 0.008, 1180, '{\"time\": \"0.008\", \"token\": \"64f9ddc8-f720-41a3-8379-4a9ce41b44ec\", \"memory\": 1180, \"status\": {\"id\": 4, \"description\": \"Wrong Answer\"}, \"stderr\": null, \"stdout\": \"1000000000\\n\", \"message\": null, \"compile_output\": null}'),
(246, 81, 1, 91, '5b104b3b-8d4c-48f8-99ed-43e739239d6c', 1, 3, 0.007, 1220, '{\"time\": \"0.007\", \"token\": \"5b104b3b-8d4c-48f8-99ed-43e739239d6c\", \"memory\": 1220, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(247, 81, 2, 91, '3233df93-b048-4223-9303-541c6e27c76e', 1, 3, 0.008, 1440, '{\"time\": \"0.008\", \"token\": \"3233df93-b048-4223-9303-541c6e27c76e\", \"memory\": 1440, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"1000000000\\n\", \"message\": null, \"compile_output\": null}'),
(248, 82, 1, 91, '0ed8399d-4a4f-4cf0-ad79-2b37ffadbfdd', 1, 3, 0.008, 1196, '{\"time\": \"0.008\", \"token\": \"0ed8399d-4a4f-4cf0-ad79-2b37ffadbfdd\", \"memory\": 1196, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(249, 82, 2, 91, '99fa79bd-d7d7-417c-b361-dbca48862fa0', 1, 4, 0.009, 1260, '{\"time\": \"0.009\", \"token\": \"99fa79bd-d7d7-417c-b361-dbca48862fa0\", \"memory\": 1260, \"status\": {\"id\": 4, \"description\": \"Wrong Answer\"}, \"stderr\": null, \"stdout\": \"2147483647\\n\", \"message\": null, \"compile_output\": null}'),
(250, 83, 1, 91, 'efe117a5-165f-44f2-80dc-c18cc10e7632', 1, 3, 0.007, 1348, '{\"time\": \"0.007\", \"token\": \"efe117a5-165f-44f2-80dc-c18cc10e7632\", \"memory\": 1348, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(251, 83, 2, 91, '9aa5419e-e127-48fa-aa77-9b7270651e09', 1, 3, 0.007, 1408, '{\"time\": \"0.007\", \"token\": \"9aa5419e-e127-48fa-aa77-9b7270651e09\", \"memory\": 1408, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"100000000000\\n\", \"message\": null, \"compile_output\": null}'),
(252, 84, 1, 91, '21382444-3ba7-4492-b29f-2668169c1658', 1, 1, 0, 0, NULL),
(253, 84, 2, 91, 'bddaca16-6344-4437-95ac-a1a4e6533c01', -1, 1, 0, 0, NULL),
(254, 85, 1, 91, '64201458-8422-4a21-83c5-77e9fa4036b6', 1, 1, 0, 0, NULL),
(255, 85, 2, 91, '899f56ae-6b02-4441-b69e-6374a486eb5f', -1, 1, 0, 0, NULL),
(256, 86, 1, 91, 'fc994ad5-9b6b-4a48-a124-895732bad8cc', 1, 3, 0.013, 4472, '{\"time\": \"0.013\", \"token\": \"fc994ad5-9b6b-4a48-a124-895732bad8cc\", \"memory\": 4472, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(257, 86, 2, 91, 'e1bec702-7a7b-4de8-b887-817022b9f5ad', 1, 4, 0.009, 1268, '{\"time\": \"0.009\", \"token\": \"e1bec702-7a7b-4de8-b887-817022b9f5ad\", \"memory\": 1268, \"status\": {\"id\": 4, \"description\": \"Wrong Answer\"}, \"stderr\": null, \"stdout\": \"2147483647\\n\", \"message\": null, \"compile_output\": null}'),
(258, 87, 1, 91, 'a708f901-ee00-4fcf-b348-36da6677b1fa', 1, 3, 0.008, 2088, '{\"time\": \"0.008\", \"token\": \"a708f901-ee00-4fcf-b348-36da6677b1fa\", \"memory\": 2088, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(259, 87, 2, 91, '271a05fe-11cc-4cbc-8450-19337bf3d4cb', 1, 3, 0.008, 1252, '{\"time\": \"0.008\", \"token\": \"271a05fe-11cc-4cbc-8450-19337bf3d4cb\", \"memory\": 1252, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"100000000000\\n\", \"message\": null, \"compile_output\": null}'),
(260, 88, 1, 91, '29058471-b2f5-4422-87e7-1df6b46714a4', 1, 6, 0, 0, '{\"error\": \"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(261, 88, 2, 91, 'b6e0942c-b683-46e6-99ec-46a8badb80d5', -1, 1, 0, 0, NULL),
(262, 89, 1, 91, 'd11a6793-7f14-4413-b177-91aa4c047fe9', 1, 3, 0.006, 1260, '{\"time\": \"0.006\", \"token\": \"d11a6793-7f14-4413-b177-91aa4c047fe9\", \"memory\": 1260, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(263, 89, 2, 91, 'fec7042b-2836-473a-887d-ee4d0440bf26', 1, 5, 0.005, 1420, '{\"time\": \"0.005\", \"token\": \"fec7042b-2836-473a-887d-ee4d0440bf26\", \"memory\": 1420, \"status\": {\"id\": 5, \"description\": \"Time Limit Exceeded\"}, \"stderr\": null, \"stdout\": null, \"message\": \"Time limit exceeded (wall clock)\", \"compile_output\": null}'),
(264, 90, 1, 91, 'd8659069-a161-47cb-a098-1c34a1bc2ed0', 1, 3, 0.009, 15608, '{\"time\": \"0.009\", \"token\": \"d8659069-a161-47cb-a098-1c34a1bc2ed0\", \"memory\": 15608, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(265, 90, 2, 91, '497340e2-1353-41c3-abfb-b5d1df55ebc2', 1, 3, 0.01, 1404, '{\"time\": \"0.01\", \"token\": \"497340e2-1353-41c3-abfb-b5d1df55ebc2\", \"memory\": 1404, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"100000000000\\n\", \"message\": null, \"compile_output\": null}'),
(266, 91, 1, 91, '1de96cc1-6e5d-4fb2-b1f8-c0447ab920cc', 1, 3, 0.007, 1376, '{\"time\": \"0.007\", \"token\": \"1de96cc1-6e5d-4fb2-b1f8-c0447ab920cc\", \"memory\": 1376, \"status\": {\"id\": 3, \"description\": \"Accepted\"}, \"stderr\": null, \"stdout\": \"10\\n\", \"message\": null, \"compile_output\": null}'),
(267, 91, 2, 91, '1f92c8bc-6a4b-44ce-9195-2fa1e58994e7', 1, 5, 0, 1268, '{\"time\": \"0.0\", \"token\": \"1f92c8bc-6a4b-44ce-9195-2fa1e58994e7\", \"memory\": 1268, \"status\": {\"id\": 5, \"description\": \"Time Limit Exceeded\"}, \"stderr\": null, \"stdout\": null, \"message\": \"Time limit exceeded (wall clock)\", \"compile_output\": null}'),
(268, 92, 1, 91, '9bc9638e-8c73-4f6c-9380-3bd1d701544b', 1, 4, 0.01, 38304, '{\"stdout\":\"0\\n\",\"time\":\"0.01\",\"memory\":38304,\"stderr\":null,\"token\":\"9bc9638e-8c73-4f6c-9380-3bd1d701544b\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(269, 92, 2, 91, '11d94364-81ed-4b32-a75f-1620233fa945', -1, 1, 0, 0, NULL),
(270, 93, 1, 91, '5101b403-e660-411a-ac1c-40fa430be48b', 1, 3, 0.008, 1728, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":1728,\"stderr\":null,\"token\":\"5101b403-e660-411a-ac1c-40fa430be48b\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(271, 93, 2, 91, 'b2363321-867b-4a67-87f6-fa4f84392742', 1, 3, 0.008, 1272, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":1272,\"stderr\":null,\"token\":\"b2363321-867b-4a67-87f6-fa4f84392742\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(272, 94, 1, 91, '8e7b66e7-b72d-4fe5-8619-9080706edb10', 1, 3, 0.008, 1316, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":1316,\"stderr\":null,\"token\":\"8e7b66e7-b72d-4fe5-8619-9080706edb10\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(273, 94, 2, 91, 'd6ebfcba-c866-43fc-88bf-0eb7d731ceb5', 1, 3, 0.007, 1240, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.007\",\"memory\":1240,\"stderr\":null,\"token\":\"d6ebfcba-c866-43fc-88bf-0eb7d731ceb5\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(274, 95, 1, 91, '2478085c-2c11-4d15-a680-beb7dc06f0a6', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(275, 95, 2, 91, 'a318a08d-5d56-4986-b4fc-d96ef85afb61', -1, 1, 0, 0, NULL),
(276, 96, 1, 91, '8807ecbd-d717-4c9e-83c4-e57f8c28a8fa', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(277, 96, 2, 91, '629afcad-83bc-4fbf-b052-d1eaf75c1a49', -1, 1, 0, 0, NULL),
(278, 97, 1, 91, '12a362e1-561d-4b46-b362-40711f2be20d', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(279, 97, 2, 91, 'ddb67782-a5c2-4f7b-ad0b-a6250c363b4c', -1, 1, 0, 0, NULL),
(280, 98, 1, 91, 'd5408ed0-3193-4dd9-bebf-16e1625a0095', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(281, 98, 2, 91, '27f23cd1-d381-4ddf-9ab6-1f5a88639805', -1, 1, 0, 0, NULL),
(282, 99, 1, 91, 'e4031fae-2cc1-40f1-9c68-c0242ab6e687', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(283, 99, 2, 91, 'ef2b1cdf-4387-47dd-9820-c719bd174564', -1, 1, 0, 0, NULL),
(284, 99, 3, 91, 'acbb7231-2473-4148-903c-090903eb1c8b', -1, 1, 0, 0, NULL),
(285, 100, 1, 91, '3f241a02-7f29-480f-8a1a-d740d6eb216a', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(286, 100, 2, 91, '9bda36a9-fb15-4986-92e8-9d513178a8b5', -1, 1, 0, 0, NULL),
(287, 100, 3, 91, '13098067-c1d5-40a1-a00a-7815eb623ff9', -1, 1, 0, 0, NULL),
(288, 101, 1, 91, 'ee9ad0fb-01c0-4b69-9fde-248734b97e3b', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(289, 101, 2, 91, '4616fbeb-b2a8-4f9e-b04a-1b9a6144b52b', -1, 1, 0, 0, NULL),
(290, 101, 3, 91, 'a0a2da3d-baff-4244-9046-79ea4966e3d7', -1, 1, 0, 0, NULL),
(291, 102, 1, 91, 'b6f17567-e886-42c5-8bc2-c0a9364abf7d', 1, 3, 0.008, 1932, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":1932,\"stderr\":null,\"token\":\"b6f17567-e886-42c5-8bc2-c0a9364abf7d\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(292, 102, 2, 91, '85d5b7fd-306a-4ac9-ab9e-5d1d7ac4418d', 1, 3, 0.009, 1272, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.009\",\"memory\":1272,\"stderr\":null,\"token\":\"85d5b7fd-306a-4ac9-ab9e-5d1d7ac4418d\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(293, 102, 3, 91, '751eab63-6a74-4967-9c3a-baee2c111fcc', 1, 3, 0.012, 1460, '{\"stdout\":\"123\\n\",\"time\":\"0.012\",\"memory\":1460,\"stderr\":null,\"token\":\"751eab63-6a74-4967-9c3a-baee2c111fcc\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(294, 103, 1, 91, '362554f7-0903-4fac-90a3-ba1267895369', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(295, 103, 2, 91, 'e9dd4604-6402-4fd9-bde0-65d0d7bdaf7e', -1, 1, 0, 0, NULL),
(296, 103, 3, 91, '20d7bf04-b23f-4e2c-9061-79feefe1ca8d', -1, 1, 0, 0, NULL),
(297, 104, 1, 91, 'ecf18cd7-d009-44aa-86f5-6cf38fe89254', 1, 3, 0.009, 32696, '{\"stdout\":\"10\\n\",\"time\":\"0.009\",\"memory\":32696,\"stderr\":null,\"token\":\"ecf18cd7-d009-44aa-86f5-6cf38fe89254\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(298, 104, 2, 91, 'f5921276-cdb8-4f42-bc01-b6c75f99211b', 1, 3, 0.009, 5796, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.009\",\"memory\":5796,\"stderr\":null,\"token\":\"f5921276-cdb8-4f42-bc01-b6c75f99211b\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(299, 104, 3, 91, '8227a607-baf0-49ff-a220-e42e9a2ad8a0', 1, 3, 0.009, 3156, '{\"stdout\":\"123\\n\",\"time\":\"0.009\",\"memory\":3156,\"stderr\":null,\"token\":\"8227a607-baf0-49ff-a220-e42e9a2ad8a0\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(300, 105, 1, 91, 'de8d1496-3c28-4cb0-804f-f9d198c08ae8', 1, 3, 0.006, 1528, '{\"stdout\":\"10\\n\",\"time\":\"0.006\",\"memory\":1528,\"stderr\":null,\"token\":\"de8d1496-3c28-4cb0-804f-f9d198c08ae8\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(301, 105, 2, 91, '8868784f-ce43-42a1-bd77-76a9b26fac06', 1, 4, 0.008, 7996, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.008\",\"memory\":7996,\"stderr\":null,\"token\":\"8868784f-ce43-42a1-bd77-76a9b26fac06\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(302, 105, 3, 91, 'd2a0e3e1-827a-4471-9f3f-8b47f8905330', -1, 1, 0, 0, NULL),
(303, 106, 1, 91, '94fddb55-3b85-4de4-b0ae-f646069905b1', 1, 3, 0.008, 31368, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":31368,\"stderr\":null,\"token\":\"94fddb55-3b85-4de4-b0ae-f646069905b1\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(304, 106, 2, 91, 'f6c20542-34fd-429f-86b1-eff0da377304', 1, 4, 0.006, 3812, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.006\",\"memory\":3812,\"stderr\":null,\"token\":\"f6c20542-34fd-429f-86b1-eff0da377304\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(305, 106, 3, 91, '1676fb4f-ed72-4582-9eaa-0c74918f4a7c', -1, 1, 0, 0, NULL),
(306, 107, 1, 91, 'e74ae94c-9f98-4aac-9a7b-0ccc8481c6a7', 1, 3, 0.006, 4192, '{\"stdout\":\"10\\n\",\"time\":\"0.006\",\"memory\":4192,\"stderr\":null,\"token\":\"e74ae94c-9f98-4aac-9a7b-0ccc8481c6a7\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(307, 107, 2, 91, '11c29bbb-65b9-4f6a-8187-93bf22d0d299', 1, 3, 0.008, 6728, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":6728,\"stderr\":null,\"token\":\"11c29bbb-65b9-4f6a-8187-93bf22d0d299\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(308, 107, 3, 91, '323870c7-aea6-4a7a-a81d-aa79cc64685f', 1, 3, 0.008, 2548, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":2548,\"stderr\":null,\"token\":\"323870c7-aea6-4a7a-a81d-aa79cc64685f\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(309, 108, 1, 91, '37878bce-32be-4088-8fd1-629cdccd7e57', 1, 3, 0.008, 23084, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":23084,\"stderr\":null,\"token\":\"37878bce-32be-4088-8fd1-629cdccd7e57\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(310, 108, 2, 91, '0a3cdfa0-d139-4643-ba77-ce52a4927ac5', 1, 4, 0.012, 12176, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.012\",\"memory\":12176,\"stderr\":null,\"token\":\"0a3cdfa0-d139-4643-ba77-ce52a4927ac5\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(311, 108, 3, 91, '42cdae8b-1aca-4f31-8624-937efb3fb620', -1, 1, 0, 0, NULL),
(312, 109, 1, 91, '73df58b4-be64-46ce-80d7-45683629fdf0', 1, 1, 0, 0, NULL),
(313, 109, 2, 91, '88171c26-af9b-4711-8ce8-59c42fb64ad2', -1, 1, 0, 0, NULL),
(314, 109, 3, 91, 'ed599055-9053-47fa-9e27-b7c1507cb84f', -1, 1, 0, 0, NULL),
(315, 110, 1, 91, 'a67ff44f-0f01-4339-a4fb-f7a8a59142eb', 1, 3, 0.013, 15576, '{\"stdout\":\"10\\n\",\"time\":\"0.013\",\"memory\":15576,\"stderr\":null,\"token\":\"a67ff44f-0f01-4339-a4fb-f7a8a59142eb\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(316, 110, 2, 91, '66253f05-37ea-4e3f-a2d6-5a201cdb02d1', 1, 4, 0.011, 2296, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.011\",\"memory\":2296,\"stderr\":null,\"token\":\"66253f05-37ea-4e3f-a2d6-5a201cdb02d1\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(317, 110, 3, 91, '51730245-3758-4da9-9c1b-798447a556ff', -1, 1, 0, 0, NULL),
(318, 111, 1, 91, '10330849-db42-4212-9ea9-a96574204891', 1, 3, 0.007, 1740, '{\"stdout\":\"10\\n\",\"time\":\"0.007\",\"memory\":1740,\"stderr\":null,\"token\":\"10330849-db42-4212-9ea9-a96574204891\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(319, 111, 2, 91, '0c7aef96-4578-43f6-ac76-e375e3ede9b2', 1, 3, 0.008, 1880, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":1880,\"stderr\":null,\"token\":\"0c7aef96-4578-43f6-ac76-e375e3ede9b2\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(320, 111, 3, 91, 'fdcf94cf-815f-49bb-9753-4761d745b32f', 1, 3, 0.01, 1316, '{\"stdout\":\"123\\n\",\"time\":\"0.01\",\"memory\":1316,\"stderr\":null,\"token\":\"fdcf94cf-815f-49bb-9753-4761d745b32f\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(321, 112, 1, 91, '830c4ff8-d19e-445d-a085-d41f769fbdf8', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(322, 112, 2, 91, '157245f7-f371-4ca8-ab04-a8d9c2d01a85', -1, 1, 0, 0, NULL),
(323, 112, 3, 91, '64451b95-b8c5-4c67-a77f-5fdbdaf8c692', -1, 1, 0, 0, NULL),
(324, 113, 1, 91, '6c0c88d5-354a-4927-ba87-cb629ea5ac77', 1, 6, 0, 0, '{\"error\":\"some attributes for this submission cannot be converted to UTF-8, use base64_encoded=true query parameter\"}'),
(325, 113, 2, 91, 'd0def528-bc51-4c15-8438-2f23f79d6deb', -1, 1, 0, 0, NULL),
(326, 113, 3, 91, '6348f164-a854-4154-ac2b-7e3e1f2c06ee', -1, 1, 0, 0, NULL),
(327, 114, 1, 91, '2a14c68d-5f29-4b1b-b421-c4f3d9b1a3cc', 1, 3, 0.009, 18332, '{\"stdout\":\"10\\n\",\"time\":\"0.009\",\"memory\":18332,\"stderr\":null,\"token\":\"2a14c68d-5f29-4b1b-b421-c4f3d9b1a3cc\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(328, 114, 2, 91, '54fb6500-4082-4055-a35b-cbe7bef0987e', 1, 3, 0.008, 3324, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":3324,\"stderr\":null,\"token\":\"54fb6500-4082-4055-a35b-cbe7bef0987e\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(329, 114, 3, 91, '5067903d-ea44-4166-bddf-4e71975924c1', 1, 3, 0.008, 2460, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":2460,\"stderr\":null,\"token\":\"5067903d-ea44-4166-bddf-4e71975924c1\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(330, 115, 1, 91, 'bdd02a89-c8e0-4145-9a5a-de2ad9ab0df5', 1, 3, 0.006, 1264, '{\"stdout\":\"10\\n\",\"time\":\"0.006\",\"memory\":1264,\"stderr\":null,\"token\":\"bdd02a89-c8e0-4145-9a5a-de2ad9ab0df5\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(331, 115, 2, 91, '95da5b9e-d43a-4d8f-9909-446cf8dd8c21', 1, 3, 0.006, 1160, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.006\",\"memory\":1160,\"stderr\":null,\"token\":\"95da5b9e-d43a-4d8f-9909-446cf8dd8c21\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(332, 115, 3, 91, 'eab905ef-4eef-460f-ab26-403e4cb7e504', 1, 3, 0.008, 1416, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":1416,\"stderr\":null,\"token\":\"eab905ef-4eef-460f-ab26-403e4cb7e504\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(333, 116, 1, 91, '48f01dc4-1c09-4cda-bebf-2968d82d2e7f', 1, 3, 0.008, 1168, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":1168,\"stderr\":null,\"token\":\"48f01dc4-1c09-4cda-bebf-2968d82d2e7f\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(334, 116, 2, 91, 'dfb02195-694d-4961-9c68-90ab01805811', 1, 3, 0.008, 1240, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":1240,\"stderr\":null,\"token\":\"dfb02195-694d-4961-9c68-90ab01805811\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(335, 116, 3, 91, '1217560e-200c-4ca9-9bef-9ceb2b8024cf', 1, 3, 0.009, 1108, '{\"stdout\":\"123\\n\",\"time\":\"0.009\",\"memory\":1108,\"stderr\":null,\"token\":\"1217560e-200c-4ca9-9bef-9ceb2b8024cf\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(336, 116, 4, 91, 'df57fe09-9f7d-4040-a081-cf6936c0cfdb', 1, 3, 0.007, 1056, '{\"stdout\":\"100\\n\",\"time\":\"0.007\",\"memory\":1056,\"stderr\":null,\"token\":\"df57fe09-9f7d-4040-a081-cf6936c0cfdb\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(337, 116, 5, 91, 'dd5ebef6-92ea-4254-8759-e895c2dba852', 1, 3, 0.009, 1216, '{\"stdout\":\"200\\n\",\"time\":\"0.009\",\"memory\":1216,\"stderr\":null,\"token\":\"dd5ebef6-92ea-4254-8759-e895c2dba852\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(338, 117, 1, 91, 'bf633d47-15d0-467e-af68-1e385d8eceb6', 1, 3, 0.006, 1492, '{\"stdout\":\"10\\n\",\"time\":\"0.006\",\"memory\":1492,\"stderr\":null,\"token\":\"bf633d47-15d0-467e-af68-1e385d8eceb6\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(339, 117, 2, 91, '711dd70c-498c-43e9-9b8f-1c913da50512', 1, 5, 4.776, 1336, '{\"stdout\":null,\"time\":\"4.776\",\"memory\":1336,\"stderr\":null,\"token\":\"711dd70c-498c-43e9-9b8f-1c913da50512\",\"compile_output\":null,\"message\":\"Time limit exceeded (wall clock)\",\"status\":{\"id\":5,\"description\":\"Time Limit Exceeded\"}}'),
(340, 117, 3, 91, '7441b7d2-1da3-459a-b0fb-b1d5916d4d58', -1, 0, 0, 0, NULL),
(341, 117, 4, 91, 'fc7b362a-f891-4c19-9db8-04bcda0d8186', -1, 0, 0, 0, NULL),
(342, 117, 5, 91, '4e1306e7-0985-4cdd-84f8-203f24b87211', -1, 0, 0, 0, NULL),
(343, 118, 1, 91, '52b6e878-67f7-4959-a3e4-9ba82a875ff4', 1, 3, 0.007, 1280, '{\"stdout\":\"10\\n\",\"time\":\"0.007\",\"memory\":1280,\"stderr\":null,\"token\":\"52b6e878-67f7-4959-a3e4-9ba82a875ff4\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(344, 118, 2, 91, 'c7e6c29e-510b-479d-a75e-e52035594ea4', 1, 3, 0.008, 1292, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.008\",\"memory\":1292,\"stderr\":null,\"token\":\"c7e6c29e-510b-479d-a75e-e52035594ea4\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(345, 118, 3, 91, 'dea4ed17-b67a-4b38-aea4-5b4cceb20117', 1, 3, 0.008, 1120, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":1120,\"stderr\":null,\"token\":\"dea4ed17-b67a-4b38-aea4-5b4cceb20117\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(346, 118, 4, 91, '1d87652d-552e-4e53-b514-6bc8fe3a6cfb', 1, 3, 0.007, 1256, '{\"stdout\":\"100\\n\",\"time\":\"0.007\",\"memory\":1256,\"stderr\":null,\"token\":\"1d87652d-552e-4e53-b514-6bc8fe3a6cfb\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(347, 118, 5, 91, '03afcbc0-8e8e-4e06-82c1-c36aa6909703', 1, 3, 0.007, 1248, '{\"stdout\":\"200\\n\",\"time\":\"0.007\",\"memory\":1248,\"stderr\":null,\"token\":\"03afcbc0-8e8e-4e06-82c1-c36aa6909703\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(348, 119, 1, 91, 'fb4f65cf-45c2-4e98-82c9-f99ebb2e80c9', 1, 3, 0.009, 29540, '{\"stdout\":\"10\\n\",\"time\":\"0.009\",\"memory\":29540,\"stderr\":null,\"token\":\"fb4f65cf-45c2-4e98-82c9-f99ebb2e80c9\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(349, 119, 2, 91, '53ab53a1-6e51-4a04-b00a-6888fe1869c4', 1, 3, 0.009, 2204, '{\"stdout\":\"100000000000\\n\",\"time\":\"0.009\",\"memory\":2204,\"stderr\":null,\"token\":\"53ab53a1-6e51-4a04-b00a-6888fe1869c4\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(350, 119, 3, 91, '46679235-0506-48b0-9a8f-cf90e4bfec29', 1, 3, 0.008, 3628, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":3628,\"stderr\":null,\"token\":\"46679235-0506-48b0-9a8f-cf90e4bfec29\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(351, 119, 4, 91, 'a9f9aee7-d5aa-4523-880e-b9d0866ba4a6', 1, 3, 0.007, 1420, '{\"stdout\":\"100\\n\",\"time\":\"0.007\",\"memory\":1420,\"stderr\":null,\"token\":\"a9f9aee7-d5aa-4523-880e-b9d0866ba4a6\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(352, 119, 5, 91, 'f79ece69-8400-4c0d-b47e-1c62d008d22f', 1, 3, 0.007, 1664, '{\"stdout\":\"200\\n\",\"time\":\"0.007\",\"memory\":1664,\"stderr\":null,\"token\":\"f79ece69-8400-4c0d-b47e-1c62d008d22f\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(353, 120, 1, 91, 'aaa3a8c2-f9ac-41ed-b248-a9760e821f2d', 1, 3, 0.007, 1272, '{\"stdout\":\"10\\n\",\"time\":\"0.007\",\"memory\":1272,\"stderr\":null,\"token\":\"aaa3a8c2-f9ac-41ed-b248-a9760e821f2d\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(354, 120, 2, 91, 'c348f7c9-b3bf-491c-99bc-883d1f57040d', 1, 3, 0.006, 1240, '{\"stdout\":\"1000\\n\",\"time\":\"0.006\",\"memory\":1240,\"stderr\":null,\"token\":\"c348f7c9-b3bf-491c-99bc-883d1f57040d\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(355, 120, 3, 91, '0c4aaf9d-ec9f-4084-a3f0-a817f94d4701', 1, 3, 0.008, 1272, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":1272,\"stderr\":null,\"token\":\"0c4aaf9d-ec9f-4084-a3f0-a817f94d4701\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(356, 120, 4, 91, 'c5efad56-9703-45bc-bb71-43fa6e12308a', 1, 3, 0.006, 1256, '{\"stdout\":\"100\\n\",\"time\":\"0.006\",\"memory\":1256,\"stderr\":null,\"token\":\"c5efad56-9703-45bc-bb71-43fa6e12308a\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(357, 120, 5, 91, 'f82de964-93be-41a7-ade5-ac3886905672', 1, 4, 0.007, 1352, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.007\",\"memory\":1352,\"stderr\":null,\"token\":\"f82de964-93be-41a7-ade5-ac3886905672\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(358, 121, 1, 91, 'd675e597-ceec-4552-be61-4bd245c6b6ff', 1, 3, 0.008, 1280, '{\"stdout\":\"10\\n\",\"time\":\"0.008\",\"memory\":1280,\"stderr\":null,\"token\":\"d675e597-ceec-4552-be61-4bd245c6b6ff\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(359, 121, 2, 91, '4b7d3d7a-6e98-498e-9377-cc13ba08a0bf', 1, 3, 0.007, 1228, '{\"stdout\":\"1000\\n\",\"time\":\"0.007\",\"memory\":1228,\"stderr\":null,\"token\":\"4b7d3d7a-6e98-498e-9377-cc13ba08a0bf\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(360, 121, 3, 91, '6e421ae1-b334-4b5c-a011-fdec865041d5', 1, 3, 0.008, 1260, '{\"stdout\":\"123\\n\",\"time\":\"0.008\",\"memory\":1260,\"stderr\":null,\"token\":\"6e421ae1-b334-4b5c-a011-fdec865041d5\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(361, 121, 4, 91, 'b9a50bdc-a5d9-4b2d-a4b1-3e8d199e6c86', 1, 3, 0.007, 1140, '{\"stdout\":\"100\\n\",\"time\":\"0.007\",\"memory\":1140,\"stderr\":null,\"token\":\"b9a50bdc-a5d9-4b2d-a4b1-3e8d199e6c86\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(362, 121, 5, 91, 'e658070e-10e6-4ef2-ad8c-be237047318a', 1, 4, 0.008, 1252, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.008\",\"memory\":1252,\"stderr\":null,\"token\":\"e658070e-10e6-4ef2-ad8c-be237047318a\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(363, 122, 1, 91, '47f5a2cf-6e31-411a-950e-05c42453209a', 1, 3, 0.007, 1196, '{\"stdout\":\"10\\n\",\"time\":\"0.007\",\"memory\":1196,\"stderr\":null,\"token\":\"47f5a2cf-6e31-411a-950e-05c42453209a\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(364, 122, 2, 91, '41dca4d1-5df5-4e16-a746-1701437d7101', 1, 3, 0.008, 1284, '{\"stdout\":\"1000\\n\",\"time\":\"0.008\",\"memory\":1284,\"stderr\":null,\"token\":\"41dca4d1-5df5-4e16-a746-1701437d7101\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(365, 122, 3, 91, '2aa2eaf5-9353-4cac-9a33-aa8bf4d3712b', 1, 3, 0.007, 1264, '{\"stdout\":\"123\\n\",\"time\":\"0.007\",\"memory\":1264,\"stderr\":null,\"token\":\"2aa2eaf5-9353-4cac-9a33-aa8bf4d3712b\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(366, 122, 4, 91, 'fd2f15a0-5860-42b7-9d26-5c58ca11cdee', 1, 3, 0.008, 1268, '{\"stdout\":\"100\\n\",\"time\":\"0.008\",\"memory\":1268,\"stderr\":null,\"token\":\"fd2f15a0-5860-42b7-9d26-5c58ca11cdee\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":3,\"description\":\"Accepted\"}}'),
(367, 122, 5, 91, '3e570126-11d0-40f7-957c-cb80ff73ef1a', 1, 4, 0.008, 1252, '{\"stdout\":\"2147483647\\n\",\"time\":\"0.008\",\"memory\":1252,\"stderr\":null,\"token\":\"3e570126-11d0-40f7-957c-cb80ff73ef1a\",\"compile_output\":null,\"message\":null,\"status\":{\"id\":4,\"description\":\"Wrong Answer\"}}'),
(368, 123, 1, 91, '208cc5ca-9888-44c4-9545-a3cbde28a16f', 1, 11, 0.203, 22044, NULL),
(369, 123, 2, 91, '6dc86937-f387-4744-b7d1-6f71f359c0e0', -1, 0, 0, 0, NULL),
(370, 123, 3, 91, '5a80e4f6-e47a-4570-a582-d02c9434fc79', -1, 0, 0, 0, NULL),
(371, 123, 4, 91, '9ab56e72-75ef-4aff-859e-6a20be631c48', -1, 0, 0, 0, NULL),
(372, 123, 5, 91, '7511510e-f5c8-4b85-a057-44960f174e8f', -1, 0, 0, 0, NULL),
(373, 124, 1, 91, 'c37250e6-e01b-4ab6-8c32-eea927e87a4b', 1, 11, 0.187, 21788, NULL),
(374, 124, 2, 91, '5a67c38d-2ea9-47bd-b231-e10db2b2db12', -1, 0, 0, 0, NULL),
(375, 124, 3, 91, 'e89a5a76-0eaf-491e-92ef-f3739e16aea5', -1, 0, 0, 0, NULL),
(376, 124, 4, 91, '4b2ae515-1e4d-4b7e-badb-ba7182ae8ffa', -1, 0, 0, 0, NULL),
(377, 124, 5, 91, '5a698c2f-c74f-4b95-832f-a90e10787d9b', -1, 0, 0, 0, NULL),
(378, 125, 1, 91, '6035cc47-3d59-4090-b4bd-8753840712ea', 1, 11, 0.233, 21056, NULL),
(379, 125, 2, 91, '581af783-4fd5-445c-a17a-0dcc65c5c021', -1, 0, 0, 0, NULL),
(380, 125, 3, 91, '389b8328-4dbd-403d-99e7-cd11f2c117be', -1, 0, 0, 0, NULL),
(381, 125, 4, 91, 'aef16d9c-19ad-4533-9401-de8bee98d060', -1, 0, 0, 0, NULL),
(382, 125, 5, 91, '04405f45-ca1b-4ee4-b70c-37d85e39cfe2', -1, 0, 0, 0, NULL),
(383, 126, 1, 91, 'be2c61bf-c68f-4219-a95f-979861bcf337', 1, 3, 0.008, 1280, NULL),
(384, 126, 2, 91, 'e0372a71-1cdc-402f-87ab-72958b6dc4a1', 1, 3, 0.007, 1092, NULL),
(385, 126, 3, 91, '18e0bd58-cb6a-4ad6-84f8-2904269446a6', 1, 3, 0.008, 1252, NULL),
(386, 126, 4, 91, '7d80c88f-2faf-4617-b001-e9aa91ca4c58', 1, 3, 0.008, 1248, NULL),
(387, 126, 5, 91, '04a99008-3b27-4313-8405-12be5ad4c68e', 1, 4, 0.007, 1240, NULL),
(388, 126, 6, 91, 'c70f4560-a173-40d4-8c7b-68f53313843e', -1, 0, 0, 0, NULL),
(389, 127, 1, 91, '330be978-6f0d-40e4-a847-a603b0c38f8f', 1, 3, 0.007, 1208, NULL),
(390, 127, 2, 91, '26d3a033-330d-42fc-a544-2d26289b1ae6', 1, 3, 0.008, 1236, NULL),
(391, 127, 3, 91, '1ca6ff1f-2f29-46e5-a755-3adde70f60b8', 1, 3, 0.008, 1228, NULL),
(392, 127, 4, 91, '2fa99bb0-de90-4d87-8405-0d1a8202c3e1', 1, 3, 0.007, 1092, NULL),
(393, 127, 5, 91, 'c3ad0fd8-7cdd-4318-ae95-683ae3560961', 1, 4, 0.007, 1308, NULL),
(394, 127, 6, 91, '64fe62f0-db6e-42e4-97cf-3616212313f8', -1, 0, 0, 0, NULL),
(395, 128, 1, 91, '396369be-99ed-4c54-b4b3-a1c96e1a939a', 1, 3, 0.008, 13416, NULL),
(396, 128, 2, 91, 'e6dc418e-ad93-489b-935a-2b44191bbe86', 1, 3, 0.007, 1928, NULL),
(397, 128, 3, 91, 'af4f42ef-43dd-4d75-82f1-48e4849594e3', 1, 3, 0.007, 1592, NULL),
(398, 128, 4, 91, '129c9073-046c-4d81-90a1-2a22210cfb7a', 1, 3, 0.009, 1500, NULL),
(399, 128, 5, 91, '26e4b869-5855-487f-ae5c-1881cf904d94', 1, 4, 0.008, 1084, NULL),
(400, 128, 6, 91, 'd10a81ec-bca9-4bb6-9bab-b9683fdb9ba7', -1, 0, 0, 0, NULL),
(401, 129, 1, 91, '052563de-18f2-4171-ba32-f05e68aa2f7a', 1, 3, 0.01, 34504, NULL),
(402, 129, 2, 91, 'e5fc4f0f-523e-47fd-90ba-e541a8db1b31', 1, 3, 0.014, 1468, NULL),
(403, 129, 3, 91, 'e214247f-e7be-4c2c-9676-5aa9ea152f0b', 1, 3, 0.008, 1300, NULL),
(404, 129, 4, 91, '9d95a17f-e7e5-4597-ab25-9209d0fdcab2', 1, 3, 0.009, 1096, NULL),
(405, 129, 5, 91, 'c92d9cbd-e9b6-4a02-a36b-6a5890a05c6d', 1, 4, 0.009, 1336, NULL),
(406, 129, 6, 91, 'c5950366-1a86-4e5c-9cc4-a6ff233fc4ca', -1, 0, 0, 0, NULL),
(407, 130, 1, 91, 'be0d1ebf-899a-416f-a0ca-47c985ccd21c', 1, 3, 0.008, 1572, NULL),
(408, 130, 2, 91, '78a95683-060f-4f71-a78b-82c0a5513553', 1, 3, 0.006, 1236, NULL),
(409, 130, 3, 91, '8994bd32-8412-448b-91de-8ec3f54910b1', 1, 3, 0.006, 1420, NULL),
(410, 130, 4, 91, 'cddc311d-103f-4a9b-92a7-84f6aa18cb85', 1, 3, 0.008, 1248, NULL),
(411, 130, 5, 91, '4a59d19a-e7f4-4a5d-8c7a-4c1bcea7521d', 1, 3, 0.008, 1240, NULL),
(412, 130, 6, 91, 'f18b3c81-fb6f-4d92-9799-b5863c50ac00', 1, 3, 0.007, 1368, NULL),
(413, 131, 1, 91, 'b1f0c454-bca3-4c67-876e-341fd8e39924', 1, 3, 0.008, 1340, NULL),
(414, 131, 2, 91, '6094e60a-202e-4f57-8007-281dd9db021c', 1, 3, 0.008, 1268, NULL),
(415, 131, 3, 91, 'fddb9d1d-0c0e-4879-b6f5-e4ce01e57d0d', 1, 3, 0.008, 1360, NULL),
(416, 131, 4, 91, '71f54803-26c1-423e-97b5-94a332a77819', 1, 3, 0.007, 1392, NULL),
(417, 131, 5, 91, '5012adb6-b091-45e9-a732-e62e38b00c91', 1, 3, 0.01, 1240, NULL),
(418, 131, 6, 91, '35c86ca0-6bd9-45cf-b13a-c3fded5488dd', 1, 3, 0.008, 1056, NULL),
(419, 132, 1, 91, '23f6a90e-1786-4da5-8138-50433381f718', 1, 3, 0.007, 4160, NULL),
(420, 132, 2, 91, '75aafff8-6d1c-466c-aa3f-5ea37167ada4', 1, 3, 0.008, 1252, NULL),
(421, 132, 3, 91, 'dbc1859d-c767-4858-b8cf-bdd1aec2ac98', 1, 3, 0.008, 1808, NULL);
INSERT INTO `submissions_on_test_case` (`submissionTestCaseId`, `submissionId`, `testCaseSerialNo`, `testCaseId`, `testCaseToken`, `judgeStatus`, `verdict`, `totalTime`, `totalMemory`, `responseData`) VALUES
(422, 132, 4, 91, '45884c36-b3ad-4a8c-975b-cc2b7a0f13ee', 1, 3, 0.009, 1304, NULL),
(423, 132, 5, 91, '33db5c5d-d4e3-4dae-9942-a0991b967ce8', 1, 3, 0.007, 1080, NULL),
(424, 132, 6, 91, 'afbd3757-f89c-48a8-8e91-5b880e23d6bd', 1, 3, 0.008, 1392, NULL),
(425, 133, 1, 91, '37f6d548-c940-48a1-8d35-c21a270a7375', 1, 3, 0.009, 1260, NULL),
(426, 134, 1, 91, 'a38cbbea-09c5-4ae8-9a1c-9a572e97dec8', 1, 3, 0.007, 1236, NULL),
(427, 135, 1, 91, '0230b43d-6101-4c22-8cb2-072b3f07445d', 1, 6, 0, 0, NULL),
(428, 136, 1, 91, '5284b9ff-8718-4523-88a0-4bd32b17386d', 1, 6, 0, 0, NULL),
(429, 137, 1, 91, '31882ff0-b074-4906-a738-c3561e7828f1', 1, 3, 0.007, 3376, NULL),
(430, 137, 2, 91, 'b4788fe0-c19c-4e0b-90d0-71deb815c4ed', 1, 3, 0.01, 1216, NULL),
(431, 137, 3, 91, 'c366d912-b270-4755-ad4c-74ce46187d3d', 1, 3, 0.007, 1808, NULL),
(432, 137, 4, 91, '74be1c06-799c-4b27-b486-b5c558d7353a', 1, 3, 0.008, 1352, NULL),
(433, 137, 5, 91, '47611339-1eb3-45f3-b9c8-6082f686f332', 1, 3, 0.009, 1284, NULL),
(434, 138, 1, 91, '1aaf7309-ca52-4653-8a15-68663fd2ec18', 1, 3, 0.007, 1368, NULL),
(435, 138, 2, 91, '8acee83c-593e-40bb-a9e9-712acfe7103b', 1, 3, 0.007, 1236, NULL),
(436, 138, 3, 91, '83af9b68-fd90-4d25-8f3b-26d4998cecb1', 1, 3, 0.006, 1292, NULL),
(437, 138, 4, 91, '59c5b039-e58f-4ed4-8916-15caa364c4e8', 1, 4, 0.006, 1316, NULL),
(438, 138, 5, 91, '50ee8033-1438-4b8f-b727-82164804a0b5', -1, 0, 0, 0, NULL),
(439, 139, 1, 91, '46dea0c9-bed4-46b9-936c-00c98442f05c', 1, 3, 0.007, 1252, NULL),
(440, 139, 2, 91, 'b17025af-fd64-4558-b736-d4bd0db11f41', 1, 3, 0.008, 1268, NULL),
(441, 139, 3, 91, 'e8e2aedf-d5f0-4011-9760-ae7f21c9db75', 1, 3, 0.007, 1276, NULL),
(442, 139, 4, 91, 'f5e96ac5-0e8d-41ec-b9c4-e1cc4eee203d', 1, 4, 0.007, 1224, NULL),
(443, 139, 5, 91, '20f92c6a-cea4-44c6-9c90-b6422c454a21', -1, 0, 0, 0, NULL),
(444, 140, 1, 91, 'd7123d99-4906-45dc-9811-9112163e8474', 1, 6, 0, 0, NULL),
(445, 140, 2, 91, 'a284ca63-5b98-4577-992b-11f96f5892d5', -1, 0, 0, 0, NULL),
(446, 140, 3, 91, '7fa91ba8-f818-4e8b-9816-87d24336200d', -1, 0, 0, 0, NULL),
(447, 140, 4, 91, 'a7728391-aeab-435c-a93a-7d5135303a51', -1, 0, 0, 0, NULL),
(448, 140, 5, 91, '1c0c1665-5597-4d47-a986-a2611fd0d4e8', -1, 0, 0, 0, NULL),
(449, 141, 1, 91, 'd711b11d-3882-48d5-a5f0-5ba8c7a0c181', 1, 3, 0.008, 1228, NULL),
(450, 141, 2, 91, '1ac1f6e2-3831-45ad-b67e-67b6a2484de2', 1, 3, 0.008, 1240, NULL),
(451, 141, 3, 91, '5973cdc5-412d-49b7-ad73-477f48b275d1', 1, 3, 0.009, 1236, NULL),
(452, 141, 4, 91, '718e998c-e5a0-47e0-ba8c-fd0ec439dde2', 1, 3, 0.006, 1076, NULL),
(453, 141, 5, 91, 'c1cd096e-7087-4614-9db2-f5b360044e4c', 1, 3, 0.013, 1392, NULL),
(454, 142, 1, 91, '9c5f126a-ef94-4775-b676-166b518683ed', 1, 3, 0.016, 2752, NULL),
(455, 142, 2, 91, 'dfd61330-258a-4fbb-b460-404081a91613', 1, 3, 0.008, 1432, NULL),
(456, 142, 3, 91, '822e8447-a59b-4dc2-8c82-5acba203ab83', 1, 3, 0.008, 5092, NULL),
(457, 142, 4, 91, 'cac87108-8909-4d64-b4f8-b9fad80435f0', 1, 5, 0, 1088, NULL),
(458, 142, 5, 91, 'e3ad66da-1078-4919-adce-c294d441ffb5', -1, 0, 0, 0, NULL),
(459, 143, 1, 91, '8ed6ac29-156b-40e0-ba74-aac3eb726cc5', 1, 3, 0.007, 1348, NULL),
(460, 143, 2, 91, 'e516364d-b4a1-4288-be16-ac75a4c53088', 1, 3, 0.007, 1308, NULL),
(461, 143, 3, 91, '933e2fd4-37ee-4898-a66a-deebd9262fb6', 1, 3, 0.008, 1084, NULL),
(462, 143, 4, 91, 'a7d1b763-6c62-451d-b3b8-1e0502e9988c', 1, 5, 0, 1268, NULL),
(463, 143, 5, 91, 'bae04333-26d5-4b41-a5da-173f9ef5ff0b', -1, 0, 0, 0, NULL),
(464, 144, 1, 91, '87b2b3c5-6571-4829-afd7-f0f469060a40', 1, 3, 0.008, 1248, NULL),
(465, 144, 2, 91, 'b5422c9d-aea1-4e61-9dd3-6efb34fc03fb', 1, 3, 0.01, 1136, NULL),
(466, 144, 3, 91, '59dddbc2-0a1e-45c5-a716-23fe5a8a6c37', 1, 3, 0.006, 1240, NULL),
(467, 144, 4, 91, 'e62bc109-60b3-49d6-9a47-f10718490570', 1, 3, 0.008, 1328, NULL),
(468, 144, 5, 91, '8f89c75e-7c10-4de1-9ab4-52e3a3688f5d', 1, 3, 0.013, 1224, NULL),
(469, 145, 1, 91, '2941a678-b892-4b21-b9ff-b0081cc67f12', 1, 3, 0.01, 29588, NULL),
(470, 145, 2, 91, 'd69fae69-1a6f-4712-9d29-05b42fbdda26', 1, 3, 0.009, 2632, NULL),
(471, 145, 3, 91, '005dafaf-434a-4f1c-bd5c-99009aab4a95', 1, 3, 0.007, 1172, NULL),
(472, 145, 4, 91, 'af252ad5-ff73-45d3-bf9a-0edb5dbcd1f0', 1, 3, 0.007, 1140, NULL),
(473, 145, 5, 91, 'eaf97371-3ea1-4f32-96af-439ec7175376', 1, 3, 0.008, 1392, NULL),
(474, 146, 1, 91, '92ab0562-fd6d-4ed4-b451-9cae45cd5822', 1, 3, 0.009, 29804, NULL),
(475, 146, 2, 91, '19ab14bb-d038-4a99-b237-6f748ec6d5b9', 1, 3, 0.008, 1728, NULL),
(476, 146, 3, 91, 'ec1105c6-7cb5-47c7-b775-860e399e897e', 1, 3, 0.01, 1312, NULL),
(477, 146, 4, 91, 'e75c1a9c-7a59-4e71-acaa-aadf6984437a', 1, 4, 0.007, 1380, NULL),
(478, 146, 5, 91, 'c5525eff-8f96-4c1b-9653-04233ad99f93', -1, 0, 0, 0, NULL),
(479, 147, 1, 91, '5db1aa66-36b9-43cb-9432-987dc338115e', 1, 3, 0.009, 35560, NULL),
(480, 147, 2, 91, 'ae3aa421-1607-4e06-ad0c-3abfa23a6961', 1, 3, 0.009, 1696, NULL),
(481, 147, 3, 91, '0f31265a-7b9c-423a-864d-4032d0dcdd42', 1, 3, 0.007, 1380, NULL),
(482, 147, 4, 91, '8a43fc09-ed25-4db8-ac1e-12ebc55b38de', 1, 3, 0.013, 1376, NULL),
(483, 147, 5, 91, '44d298f7-aeb3-4a3f-8ec2-6ee0e4e1fbbd', 1, 3, 0.008, 1380, NULL),
(484, 148, 1, 91, 'e87e837d-e5de-474d-85d8-6a8e3bc9d1e2', 1, 3, 0.008, 1104, NULL),
(485, 148, 2, 91, 'ee09e615-35c7-45d7-a703-7b7bac7fb605', 1, 3, 0.008, 1244, NULL),
(486, 148, 3, 91, '75ee5008-2ae5-4d42-a727-fbc4d46a3f71', 1, 3, 0.006, 1336, NULL),
(487, 148, 4, 91, '15bf46e7-a60c-4231-bff3-4b8a34b3f4cf', 1, 3, 0.007, 1204, NULL),
(488, 148, 5, 91, 'b76ec4df-c298-4f65-b7e3-f4814fb30760', 1, 3, 0.007, 1200, NULL),
(489, 149, 1, 91, '43c7d270-0d37-42d3-9a3e-5c41549cd52e', 1, 3, 0.008, 1172, NULL),
(490, 149, 2, 91, '5593e5ec-a7fd-4628-9606-dfdf548b7061', 1, 3, 0.007, 1400, NULL),
(491, 149, 3, 91, '6dcae7ed-66ec-465d-ba7d-bf4810e7fcbd', 1, 3, 0.006, 1364, NULL),
(492, 149, 4, 91, '0ac0be0d-1063-47e4-8ba4-f0eadef619c1', 1, 3, 0.008, 1184, NULL),
(493, 149, 5, 91, 'b6449586-e53c-4ece-9ecc-d99eda00eb91', 1, 3, 0.01, 1292, NULL),
(494, 150, 1, 91, '15370b47-9c1c-4e2e-9425-d0e4ca66c708', 1, 3, 0.007, 1324, NULL),
(495, 150, 2, 91, '8c396c64-7007-4964-a7a4-47980ab41625', 1, 3, 0.006, 1176, NULL),
(496, 150, 3, 91, '7e5480de-68ba-443a-9a80-613482a1aa40', 1, 3, 0.008, 1248, NULL),
(497, 150, 4, 91, '263aed08-9162-4b6d-bd62-071e3937551d', 1, 3, 0.007, 1116, NULL),
(498, 150, 5, 91, 'b5b44c6d-5e3b-466f-95c7-f3676a6c1932', 1, 3, 0.007, 1208, NULL),
(499, 151, 1, 91, '5bacea11-b847-47e2-8dda-84422dddebfc', 1, 3, 0.008, 1252, NULL),
(500, 151, 2, 91, '5ebff151-b0a7-432f-b83b-099233612abe', 1, 3, 0.008, 1164, NULL),
(501, 151, 3, 91, 'c5bcc2b8-285d-4c24-a18f-29a31bae9c4a', 1, 3, 0.006, 1220, NULL),
(502, 151, 4, 91, 'd876a367-f46e-4c03-92c9-66a9cf7cf607', 1, 3, 0.007, 1428, NULL),
(503, 151, 5, 91, '0271dbdc-b12d-4643-a474-630fc3832611', 1, 3, 0.007, 1260, NULL),
(504, 152, 1, 91, '8f18463c-845a-4f8e-a051-752f1ca014f1', 1, 3, 0.008, 1136, NULL),
(505, 152, 2, 91, '85316575-e34b-414e-8a07-3ab06073efd9', 1, 3, 0.007, 1244, NULL),
(506, 152, 3, 91, 'd7bf0d68-bb4e-4d78-af7e-4daf621bcf35', 1, 3, 0.008, 1256, NULL),
(507, 152, 4, 91, '19c1dbe4-83b6-40e1-a921-6055ac456588', 1, 3, 0.008, 1276, NULL),
(508, 152, 5, 91, '696aeeaa-7e7b-49c8-9077-c5dc99636cc4', 1, 3, 0.007, 1312, NULL),
(509, 153, 1, 91, 'c21c451c-87a1-492c-b078-86a847fbf8f8', 1, 3, 0.008, 1108, NULL),
(510, 153, 2, 91, 'f4b56542-00a6-4118-a647-2fed12fefa37', 1, 3, 0.007, 1316, NULL),
(511, 153, 3, 91, 'aef8c43b-cecc-43e5-8484-3f44ba6c99b1', 1, 3, 0.006, 1100, NULL),
(512, 153, 4, 91, 'f7246258-ff5a-4365-beb6-8b0c631c816f', 1, 3, 0.008, 1260, NULL),
(513, 153, 5, 91, '3298a793-da1c-488e-a894-a3c7dbeb7f57', 1, 3, 0.007, 1180, NULL),
(514, 154, 1, 91, 'd955f23f-8a51-49eb-b9be-cb5ef1f41e18', 1, 3, 0.007, 1220, NULL),
(515, 154, 2, 91, '73f3d3dc-44be-4fa7-a29b-ef4001970a0d', 1, 3, 0.008, 1256, NULL),
(516, 154, 3, 91, '7a9fee9c-0a78-421b-a42d-fb9bb49a0d52', 1, 3, 0.007, 1208, NULL),
(517, 154, 4, 91, 'ee3537cb-8ecd-4b9d-b4db-17e286cd057d', 1, 3, 0.01, 1348, NULL),
(518, 154, 5, 91, '57c28f6a-944b-43cc-953e-6d2acd50f32d', 1, 3, 0.011, 1172, NULL),
(519, 155, 1, 91, '67aa4150-06d8-4e60-b307-a361a9d41784', 1, 3, 0.008, 1256, NULL),
(520, 155, 2, 91, '648c6c90-b981-4411-9430-d31be448f265', 1, 3, 0.007, 1324, NULL),
(521, 155, 3, 91, 'dc3ece7e-8602-4f3c-862d-f80346b04d84', 1, 3, 0.009, 1580, NULL),
(522, 155, 4, 91, '00f1bba0-42a8-46b2-bbcf-5fae969afebb', 1, 4, 0.007, 1308, NULL),
(523, 155, 5, 91, '2dc30476-094f-4b1c-ac7f-2aaa362f6bd4', -1, 0, 0, 0, NULL),
(524, 156, 1, 91, '83029d82-bf95-42f6-a4ae-cbe8e1476912', 1, 3, 0.006, 1244, NULL),
(525, 156, 2, 91, 'f1153f5b-3731-4953-9c06-d8af47a533af', 1, 3, 0.009, 1260, NULL),
(526, 156, 3, 91, 'ee50f991-68a2-4e34-9078-c5cd870e5c59', 1, 3, 0.007, 1288, NULL),
(527, 156, 4, 91, 'b1fd4e2c-3f86-4520-8883-749bff66ac25', 1, 3, 0.011, 1236, NULL),
(528, 156, 5, 91, '77ad1f13-812f-4410-8b36-7979bc2620af', 1, 3, 0.013, 1380, NULL),
(529, 157, 1, 91, 'dfc11096-26c1-4807-86f0-4a77e2f5d9e5', 1, 3, 0.01, 1532, NULL),
(530, 157, 2, 91, 'ef80fe04-d772-48a5-8ee8-fb38adbeb982', 1, 3, 0.013, 1228, NULL),
(531, 157, 3, 91, '37766a94-bd1d-47ee-b86f-62c2a125b19b', 1, 3, 0.008, 1260, NULL),
(532, 157, 4, 91, 'f7a7fc4b-9a01-4e3d-bd5a-dbf507feab67', 1, 5, 0, 1368, NULL),
(533, 157, 5, 91, '77077032-e6b7-45f0-aef8-1cd929d5356f', -1, 0, 0, 0, NULL),
(534, 158, 1, 91, 'cd2469c7-69f8-4483-8805-9df5acf8c8aa', 1, 3, 0.008, 1112, NULL),
(535, 158, 2, 91, '34186f94-9688-4fd4-9db6-f20a3e3db951', 1, 3, 0.008, 1312, NULL),
(536, 158, 3, 91, 'a44f3c3b-de61-4b0b-913b-9b77ddce2a9f', 1, 3, 0.008, 1324, NULL),
(537, 158, 4, 91, 'aa6dd242-50d2-48df-9d21-aae30dc677ee', 1, 4, 0.014, 1304, NULL),
(538, 158, 5, 91, '22502dda-fdfd-46fb-bbf4-9cad749b6555', -1, 0, 0, 0, NULL),
(539, 159, 1, 91, '767fc4f3-557b-4b46-bb1a-e7eb7e91977e', 1, 3, 0.008, 1608, NULL),
(540, 159, 2, 91, 'abeba686-abd0-4c02-b59e-4bff85d1b502', 1, 3, 0.008, 1160, NULL),
(541, 159, 3, 91, '48efd274-87d5-47ef-9e7a-40bf6aa6ef0d', 1, 3, 0.008, 1392, NULL),
(542, 159, 4, 91, '3f40a1a2-5ade-41ad-9f72-3896e05af3a6', 1, 3, 0.008, 1364, NULL),
(543, 159, 5, 91, '4c1570e5-d138-440d-8293-9d5c6defcd30', 1, 3, 0.007, 1100, NULL),
(544, 160, 1, 91, 'c06e061b-2684-4123-96a5-458c8083a29b', 1, 3, 0.006, 4212, NULL),
(545, 160, 2, 91, 'cab887e2-0c52-4a6a-bbdf-4b0560a80a80', 1, 3, 0.007, 1296, NULL),
(546, 160, 3, 91, '2996efef-10fc-4156-8e3c-b6ec162562df', 1, 3, 0.007, 10856, NULL),
(547, 160, 4, 91, '6428c798-5ff7-4220-afaa-fa6321f698a7', 1, 4, 0.007, 1220, NULL),
(548, 160, 5, 91, 'ad04efc8-c235-4033-a685-710c7b05f28c', -1, 0, 0, 0, NULL),
(549, 161, 1, 91, 'c33f947b-a475-4e22-a0d4-f45a4d112924', 1, 3, 0.007, 2896, NULL),
(550, 161, 2, 91, '211c2d48-cfb2-4dab-80bc-b663a4d6aadb', 1, 3, 0.008, 1260, NULL),
(551, 161, 3, 91, '01ad195d-6f9c-452e-9d57-75debaed2dd2', 1, 3, 0.008, 2012, NULL),
(552, 161, 4, 91, '8d45c06a-9d8c-46e5-89ed-e1a47b06628d', 1, 4, 0.007, 1320, NULL),
(553, 161, 5, 91, 'd9a47d99-6d05-47ee-b860-593eaa49742a', -1, 0, 0, 0, NULL),
(554, 162, 1, 91, 'ce29604b-2e69-4ea6-afbe-a0525e9f278e', 1, 6, 0, 0, NULL),
(555, 162, 2, 91, 'f0e33dff-577f-4bf6-a813-b8e45982d4c5', -1, 0, 0, 0, NULL),
(556, 162, 3, 91, '3269c244-933d-42f8-8089-c96b8316b0b6', -1, 0, 0, 0, NULL),
(557, 162, 4, 91, 'f3aceef8-509f-4428-9333-8d41e3029ef1', -1, 0, 0, 0, NULL),
(558, 162, 5, 91, 'fab2a2e7-b52e-48e3-904a-083980ec445a', -1, 0, 0, 0, NULL),
(559, 163, 1, 91, 'bf102fb0-264f-45c8-a177-9c8774db6c4c', 1, 3, 0.008, 1400, NULL),
(560, 163, 2, 91, '820d0ea4-6bb2-477a-9299-5d7dcb4c5749', 1, 3, 0.007, 1252, NULL),
(561, 163, 3, 91, 'f6098908-488c-4181-8470-2acad51ddf16', 1, 3, 0.007, 1072, NULL),
(562, 163, 4, 91, '2f258763-e8ff-4503-8ec4-6d108e5604e0', 1, 3, 0.009, 1168, NULL),
(563, 163, 5, 91, '4af2113b-3960-472d-b95d-97929d24a2ca', 1, 3, 0.009, 1296, NULL),
(564, 164, 1, 91, '3bce6c16-da8b-472e-a822-14ec3f043bff', 1, 3, 0.008, 1140, NULL),
(565, 164, 2, 91, '499de6ce-2c82-4bb0-ae99-93ef2e7b6e24', 1, 3, 0.007, 1156, NULL),
(566, 164, 3, 91, '1bf2514c-9cc0-4dce-9b1f-c9b37b11fc9c', 1, 3, 0.008, 1124, NULL),
(567, 164, 4, 91, '398622ef-dbef-4819-be6b-5783617c9224', 1, 4, 0.007, 1252, NULL),
(568, 164, 5, 91, 'bd98c00c-c630-4f96-b64c-b4aec122889f', -1, 0, 0, 0, NULL),
(569, 165, 1, 91, '1ec4a29a-61e6-4a99-a077-c5473c157ffd', 1, 3, 0.007, 7380, NULL),
(570, 165, 2, 91, 'bb390bfa-1018-40c6-a151-ddd10216ef48', 1, 3, 0.008, 1096, NULL),
(571, 165, 3, 91, '87ceef80-cda7-417a-97a3-f5539bfbbc21', 1, 3, 0.008, 3168, NULL),
(572, 165, 4, 91, 'c34035ca-a76c-4bc7-82ad-210f49bf3d0f', 1, 3, 0.007, 1364, NULL),
(573, 165, 5, 91, '1291f17a-3772-4f42-a0fd-0f4043ac895a', 1, 3, 0.012, 1408, NULL),
(574, 166, 1, 91, 'c7d3fe9e-e62a-497d-8603-8870e0f16537', 1, 3, 0.006, 1328, NULL),
(575, 166, 2, 91, 'e6df02a7-e20b-4621-8ba6-61a236740012', 1, 3, 0.008, 1308, NULL),
(576, 166, 3, 91, 'ea93eae5-bff9-4169-9fbe-0e261d05ccd5', 1, 3, 0.012, 1316, NULL),
(577, 166, 4, 91, '36b0472f-a14e-4915-ab5e-e09e7d857391', 1, 4, 0.006, 1288, NULL),
(578, 166, 5, 91, '2746e582-edf4-4dcf-a7e4-daf1ec1b5bda', -1, 0, 0, 0, NULL),
(579, 167, 1, 91, 'da9a46e4-d664-45d1-b7c6-10a5a46a7b6a', 1, 3, 0.007, 1344, NULL),
(580, 167, 2, 91, 'fe7a01ec-dadf-4023-b106-ca8f71d26817', 1, 3, 0.007, 1204, NULL),
(581, 167, 3, 91, '0d66011b-4f4c-4345-bc08-f271bd6a5313', 1, 3, 0.007, 1256, NULL),
(582, 167, 4, 91, '28829dec-8549-4170-bee2-988f9162530c', 1, 3, 0.006, 1256, NULL),
(583, 167, 5, 91, 'bf118326-a014-4693-b8e7-1d5d1d8baee3', 1, 3, 0.008, 1440, NULL),
(584, 168, 1, 91, 'b431c1aa-35b4-4088-b761-5cf9fdb0cb75', 1, 3, 0.008, 32928, NULL),
(585, 168, 2, 91, '39d6812a-47b1-48df-bbfc-6a4b99696d6a', 1, 3, 0.006, 1368, NULL),
(586, 168, 3, 91, 'e6045ee6-1745-4635-8c58-d359dc731579', 1, 3, 0.012, 1732, NULL),
(587, 168, 4, 91, '4a90193e-76e8-46f7-8dfc-4e2ad4514f5a', 1, 3, 0.007, 1536, NULL),
(588, 168, 5, 91, '230ec9a0-4f08-4b3b-b392-d5b1a22104d5', 1, 3, 0.01, 1348, NULL),
(589, 169, 1, 91, '7bccfe6a-a5af-4a1d-af92-7e924bafa8a1', 1, 3, 0.011, 32768, NULL),
(590, 169, 2, 91, '66467fb3-7352-40bf-b20a-b3e13fff0c78', 1, 3, 0.011, 1868, NULL),
(591, 169, 3, 91, '5ca3921c-f142-4930-8940-3c0e2b38af93', 1, 3, 0.007, 2192, NULL),
(592, 169, 4, 91, '93da5054-41ff-47a3-b6c8-5df354f5e23d', 1, 3, 0.007, 1292, NULL),
(593, 169, 5, 91, 'c915285a-8e61-4951-99ff-eb5c7f4fadb9', 1, 3, 0.006, 1264, NULL),
(594, 170, 1, 91, '94a2c9ab-e725-4e91-a1ee-1271d123ab53', 1, 3, 0.007, 1236, NULL),
(595, 170, 2, 91, '8499f291-6a5a-4691-b879-531234f1d40d', 1, 3, 0.008, 1272, NULL),
(596, 170, 3, 91, 'e95da5c1-bcaa-4fef-861a-1e85f6243c00', 1, 3, 0.008, 1264, NULL),
(597, 170, 4, 91, '6393d164-dd92-4401-8a35-492f0c50d7a9', 1, 3, 0.009, 1244, NULL),
(598, 170, 5, 91, '3f754f94-2594-46fd-bf9d-1e4cabf1efe7', 1, 3, 0.011, 1332, NULL),
(599, 171, 1, 91, '1cd14fd9-02e0-482b-875c-e00d446d8930', 1, 3, 0.009, 1140, NULL),
(600, 171, 2, 91, '2929d4db-b587-47d4-b1a2-4e57a7e5e457', 1, 3, 0.008, 1348, NULL),
(601, 171, 3, 91, '742912be-e1e9-4397-b2bf-e563c19f34e4', 1, 3, 0.008, 1252, NULL),
(602, 171, 4, 91, '8c557990-cc03-4d62-a024-8cea67598e9f', 1, 3, 0.01, 1236, NULL),
(603, 171, 5, 91, '849bbf2b-dd52-4f99-8d61-e2b69bc31578', 1, 3, 0.008, 1324, NULL),
(604, 172, 1, 91, 'ba8326d3-2fff-46ca-b20a-2db53a8b55c5', 1, 3, 0.007, 1204, NULL),
(605, 172, 2, 91, '404f8610-c2f9-484a-838a-618d11c8893f', 1, 3, 0.009, 1332, NULL),
(606, 172, 3, 91, 'f21f2e41-e5bb-445f-ac6a-cbbd99472b59', 1, 3, 0.008, 1256, NULL),
(607, 172, 4, 91, '9a62c423-0498-43eb-9762-843dfb7dde52', 1, 4, 0.007, 1316, NULL),
(608, 172, 5, 91, 'bd1e4e63-5b02-4a29-9216-1cd5884f0641', -1, 0, 0, 0, NULL),
(609, 173, 1, 91, 'dd4f209a-83ea-4d52-bb7e-d2f487987d25', 1, 6, 0, 0, NULL),
(610, 173, 2, 91, 'de8a9110-96ef-4441-864c-33dcd55ac8e2', -1, 0, 0, 0, NULL),
(611, 173, 3, 91, '11c2a2eb-be7f-446b-93fa-52066be5fcd2', -1, 0, 0, 0, NULL),
(612, 173, 4, 91, 'bfe3d31c-e2d3-4a7d-87ca-8e9f4fd08c34', -1, 0, 0, 0, NULL),
(613, 173, 5, 91, 'b9e0835c-1a30-4ed7-80eb-5577b42272ba', -1, 0, 0, 0, NULL),
(614, 174, 1, 91, 'd93b51cd-b5e8-418d-b7cf-2ef424e25966', 1, 3, 0.009, 34556, NULL),
(615, 174, 2, 91, 'a9f7eab4-038f-42c7-9e7f-aa14e36342a8', 1, 3, 0.007, 1332, NULL),
(616, 174, 3, 91, '5df3dc77-dc4c-4b48-8c0e-a0e86b00f664', 1, 3, 0.006, 1688, NULL),
(617, 174, 4, 91, '5a9d09e0-3360-40fc-94b6-4a81ede93cb2', 1, 3, 0.012, 1388, NULL),
(618, 174, 5, 91, '2582e7ff-4541-4d5d-a565-067dda3ae95c', 1, 3, 0.008, 1432, NULL),
(619, 175, 1, 91, '3769fc97-b7de-4f72-b254-7767ef215ca0', 1, 6, 0, 0, NULL),
(620, 175, 2, 91, '72a6f325-bb4c-4346-8b6f-d3f0fad6dc81', -1, 0, 0, 0, NULL),
(621, 175, 3, 91, '5be3d100-d237-4cb9-8d47-bbe5894f3a21', -1, 0, 0, 0, NULL),
(622, 175, 4, 91, '852095a4-cfb7-49d5-b1f0-c89406cfb150', -1, 0, 0, 0, NULL),
(623, 175, 5, 91, '1bb3ae6f-874a-4e08-9adc-e5f78bdbb2a6', -1, 0, 0, 0, NULL),
(624, 176, 1, 91, '231d4e84-9170-452c-90ea-62ee7f49984a', 1, 3, 0.009, 1220, NULL),
(625, 176, 2, 91, 'c5de3ecc-baa8-4fb2-a7ab-eb2b4f55f2a8', 1, 3, 0.007, 1352, NULL),
(626, 176, 3, 91, 'ad60e726-0e0c-4f3a-87b7-cfded3feadf5', 1, 3, 0.006, 1304, NULL),
(627, 176, 4, 91, '4b4ec746-cce5-47c5-bb04-d3ea3aab5b82', 1, 3, 0.012, 1272, NULL),
(628, 176, 5, 91, 'ced03892-0a07-4e00-862e-5a836cb0c823', 1, 3, 0.012, 1240, NULL),
(629, 177, 1, 91, '822d58d3-299e-45c6-b602-793d5e7e9d48', 1, 0, 0, 0, NULL),
(630, 178, 1, 91, '01ac6fae-ff5c-4614-9322-3eb1ceb4561e', 1, 3, 0.007, 1620, NULL),
(631, 179, 1, 91, '3b684fd3-5345-4d96-8ab0-591efb41c26a', 1, 3, 0.009, 26992, NULL),
(632, 180, 1, 91, '921274b2-c49b-4f1c-ba3e-49e7112a7331', 1, 3, 0.008, 1596, NULL),
(633, 181, 1, 91, '44191d45-f51d-41df-84c3-1e69645f06cf', 1, 3, 0.007, 1340, NULL),
(634, 182, 1, 91, '5a7ce943-7f94-4c54-b785-f51a7226ee2b', 1, 3, 0.008, 1116, NULL),
(635, 183, 1, 91, 'e96257ce-1dd6-45e5-917c-4c9cdde0c9bb', 1, 3, 0.007, 1336, NULL),
(636, 184, 1, 91, '8f095863-2bfd-42f7-9bff-e0d60257b24b', 1, 3, 0.006, 1640, NULL),
(637, 185, 1, 91, '83b68b24-a3f5-44cb-9035-92aa973b3e1c', 1, 11, 0.039, 6768, NULL),
(638, 186, 1, 91, '90e075b7-cec9-485f-99e8-1ede0f14166e', 1, 3, 0.009, 1428, NULL),
(639, 187, 1, 91, 'd606ae6d-d63a-418a-958e-cd9964251983', 1, 3, 0.01, 18320, NULL),
(640, 188, 1, 91, 'c90daf42-bdbe-4cea-8fee-da3298dbcbd0', 1, 3, 0.011, 6804, NULL),
(641, 189, 1, 91, 'f96ea7bd-9671-43f1-a938-f366f417f831', 1, 0, 0, 0, NULL),
(642, 190, 1, 91, '6d775060-7b8f-46e0-8a52-81e2ac0ac058', 1, 0, 0, 0, NULL),
(643, 191, 1, 91, 'b93dc30a-bd5d-4264-9f0d-a6647ec1cbb4', 1, 6, 0, 0, NULL),
(644, 192, 1, 91, '45d12f33-7abc-4309-b15d-fd6613d62132', 1, 11, 0.051, 29032, NULL),
(645, 193, 1, 91, '0440c02b-29fd-4057-a359-2964ca661d0a', 1, 3, 0.015, 26856, NULL),
(646, 194, 1, 91, 'fb5d731a-1fdc-483e-9686-f5b0afb50178', 1, 0, 0, 0, NULL),
(647, 195, 1, 91, 'd8ba6264-9df5-4309-9897-0e13c6f7e3c8', 1, 0, 0, 0, NULL),
(648, 196, 1, 91, '61cc23fe-2170-49f1-92e8-7f5f57ba8a76', 1, 6, 0, 0, NULL),
(649, 197, 1, 91, 'f79ceeed-e04e-4a24-812a-79c7c0e106b4', 1, 6, 0, 0, NULL),
(650, 198, 1, 91, 'c5f4b228-a654-4863-8af3-3fc6d7bba859', 1, 6, 0, 0, NULL),
(651, 199, 1, 91, '0c335046-105b-4704-bfe3-1b56b881209e', 1, 3, 0.007, 17796, NULL),
(652, 199, 2, 91, '5d74338b-4f5e-4066-b47f-2dbee8fff4ef', 1, 3, 0.007, 2080, NULL),
(653, 199, 3, 91, 'a4360d87-87aa-4604-957c-c7b4d981de7e', 1, 3, 0.006, 2108, NULL),
(654, 199, 4, 91, '549940da-109e-4aea-9c1b-e53201a6ff6a', 1, 3, 0.009, 1240, NULL),
(655, 200, 1, 91, '8265481f-7de1-475b-a7d1-460487037a3e', 1, 3, 0.01, 21012, NULL),
(656, 200, 2, 91, '52ea3e0a-faa5-4339-9e2e-56be7d10c4a6', 1, 3, 0.012, 2848, NULL),
(657, 200, 3, 91, '4999cd41-99a8-44db-8447-44ef57c08309', 1, 3, 0.007, 2476, NULL),
(658, 200, 4, 91, 'f8f05358-d932-4492-9975-c7b433a8ceee', 1, 3, 0.006, 1176, NULL),
(659, 201, 1, 91, '38b9180a-b8cb-405a-9dff-e5321e560fbb', 1, 3, 0.007, 1336, NULL),
(660, 201, 2, 91, '85a99f96-240d-4938-99db-ec1c5d665ea7', 1, 3, 0.008, 1304, NULL),
(661, 201, 3, 91, '076b36b7-621b-45bb-b0a6-af9d0fd95271', 1, 3, 0.007, 1288, NULL),
(662, 201, 4, 91, '8794ebf0-9b12-459a-9631-f9f06fd5e5f8', 1, 3, 0.007, 1216, NULL),
(663, 202, 1, 91, '50428275-410e-47c0-89c7-176e9d4c1333', 1, 3, 0.007, 6556, NULL),
(664, 202, 2, 91, '8a8fd61c-d3c5-45d9-8bdb-ffd47a2b069f', 1, 3, 0.007, 1396, NULL),
(665, 202, 3, 91, 'bc46d2d5-29eb-4c9b-a3f3-51fb3eb959f1', 1, 4, 0.007, 1084, NULL),
(666, 202, 4, 91, 'dc570490-ed9f-41e2-9246-ec191bc3d2c9', -1, 0, 0, 0, NULL),
(667, 203, 1, 91, '53171004-b63e-4c19-9312-1f5999463514', 1, 3, 0.006, 1256, NULL),
(668, 203, 2, 91, '08c833cc-75ed-40ba-944e-6eceeecb0786', 1, 3, 0.006, 1216, NULL),
(669, 203, 3, 91, 'e7ec9ccb-b3c7-4f2f-bb8f-7059f5e5edde', 1, 3, 0.007, 1156, NULL),
(670, 203, 4, 91, 'ef821596-8d4f-49c7-abb0-243f363e1fd1', 1, 3, 0.008, 1364, NULL),
(671, 204, 1, 91, 'fcc6517e-8a29-4910-8460-83e0df98a6e6', 1, 3, 0.008, 1148, NULL),
(672, 204, 2, 91, 'c9b897d1-f918-4a4c-9121-2a234fae9019', 1, 3, 0.007, 1064, NULL),
(673, 204, 3, 91, 'e95e8e8b-e852-4f7d-9783-a0d7a53d2646', 1, 3, 0.009, 1252, NULL),
(674, 204, 4, 91, '13a01273-4db7-4bc3-b6e8-b94d9338c45e', 1, 3, 0.013, 1116, NULL),
(675, 205, 1, 91, 'b15021aa-dd7a-4371-9a86-f0dbb375d34c', 1, 3, 0.006, 1300, NULL),
(676, 205, 2, 91, '02d5eb55-7e61-4935-b182-684f8bd38991', 1, 3, 0.006, 1176, NULL),
(677, 205, 3, 91, '2344a2f3-1d31-4eab-8b89-48f44e28a4f4', 1, 4, 0.007, 1256, NULL),
(678, 205, 4, 91, '26f7ad66-d377-4fa9-90f8-08f35c979f8c', -1, 0, 0, 0, NULL),
(679, 206, 1, 91, '097515e5-474e-42ec-91b3-c3074410de33', 1, 3, 0.008, 1380, NULL),
(680, 206, 2, 91, 'a3d72dcc-be84-4d84-99a5-758470969ae8', 1, 3, 0.006, 1184, NULL),
(681, 206, 3, 91, 'd983dd44-04a1-43e3-8f09-b37f545da49b', 1, 5, 4.827, 1304, NULL),
(682, 206, 4, 91, 'f4d97821-cc57-43ca-97c0-c17f37be1eac', -1, 0, 0, 0, NULL),
(683, 207, 1, 91, '7cefe0e8-a723-45fe-b347-5e3668da3de2', 1, 3, 0.007, 1296, NULL),
(684, 207, 2, 91, '8901ccb3-0717-4c3f-9af8-f4504b5ef438', 1, 3, 0.006, 1232, NULL),
(685, 207, 3, 91, 'd89990fa-6484-4a67-80b1-b425c4150383', 1, 5, 4.905, 1256, NULL),
(686, 207, 4, 91, '5385809b-a986-4393-a27e-ce7e0d3d40b5', -1, 0, 0, 0, NULL),
(687, 208, 1, 91, 'b6b149f5-1399-4487-8647-61cf9ff48df2', 1, 3, 0.013, 25404, NULL),
(688, 208, 2, 91, '1953753d-c67e-4a87-b01c-bd6447599872', 1, 3, 0.008, 1416, NULL),
(689, 208, 3, 91, '5150a607-60bd-400b-9ead-2a4fd040d3d2', 1, 5, 5.01, 2148, NULL),
(690, 208, 4, 91, '44a7a652-2f28-41f6-81a7-6dc161703c04', -1, 0, 0, 0, NULL),
(691, 209, 1, 91, 'ae820598-0426-4877-ab48-0243dfa3d242', 1, 3, 0.008, 2536, NULL),
(692, 209, 2, 91, '1a003e10-f558-497a-929c-b6bc31afe0df', 1, 3, 0.008, 1268, NULL),
(693, 209, 3, 91, 'd5502233-4341-48a6-a2c2-d87defbee812', 1, 5, 0, 1256, NULL),
(694, 209, 4, 91, 'd39c1367-e452-480d-a0a0-869eb9f714e4', -1, 0, 0, 0, NULL),
(695, 210, 1, 91, '139634db-671f-4528-9320-ba5ca005c4d2', 1, 3, 0.006, 1772, NULL),
(696, 210, 2, 91, 'a2ed297f-27c3-4b73-8762-98ffac60e65e', 1, 3, 0.006, 1244, NULL),
(697, 210, 3, 91, 'b4a97b10-61dc-4b33-b22e-32495a6c3c23', 1, 3, 0.014, 1476, NULL),
(698, 210, 4, 91, '829bc8e3-4c1f-4ec2-8fc6-8a924ca652b0', 1, 3, 0.009, 1316, NULL),
(699, 211, 1, 91, '82c85a0b-4287-4934-b0de-48fc68c36897', 1, 3, 0.007, 1984, NULL),
(700, 211, 2, 91, '74c6a5d6-4c04-439e-a225-82fd4bb8f7e9', 1, 4, 0.012, 1280, NULL),
(701, 212, 1, 91, '167aed3c-36a6-47e6-9407-e382acfccd20', 1, 3, 0.009, 1752, NULL),
(702, 212, 2, 91, '29c74582-a0b7-4300-8867-da048487ee8b', 1, 4, 0.008, 1256, NULL),
(703, 213, 1, 91, 'c9518ed5-2362-4491-a562-575777d1b080', 1, 3, 0.008, 1344, NULL),
(704, 213, 2, 91, '6ef8b7d4-e272-4944-a082-1013ba157a5e', 1, 4, 0.008, 2092, NULL),
(705, 214, 1, 91, 'd0dc86d2-8c5c-4807-83eb-4dba9b40f30b', 1, 4, 0.01, 35672, NULL),
(706, 214, 2, 91, '83ca653d-9aff-4947-b37e-b0c32353760a', -1, 0, 0, 0, NULL),
(707, 215, 1, 91, '269ccb5f-6583-42e1-bb64-ae3ec662e29d', 1, 3, 0.008, 1960, NULL),
(708, 215, 2, 91, '3676208d-d4dc-40c6-ae4f-56e8f8e5ac18', 1, 4, 0.008, 1404, NULL),
(709, 216, 1, 91, 'bd457e11-3c82-4b93-b94b-370593e44044', 1, 4, 0.007, 14348, NULL),
(710, 216, 2, 91, '652256a0-31b0-485e-98d7-c0483faece77', -1, 0, 0, 0, NULL),
(711, 217, 1, 91, 'e067a26a-6b62-498e-b607-f183d9e373d1', 1, 4, 0.007, 2240, NULL),
(712, 217, 2, 91, 'd2997094-a656-4968-bc5e-04a53ec744d4', -1, 0, 0, 0, NULL),
(713, 218, 1, 91, '0575a842-6d08-46fd-a4c7-527af4ab97bf', 1, 4, 0.007, 4528, NULL),
(714, 218, 2, 91, '36d87cf9-64bb-46ef-9903-ed6fbcdf3bfe', -1, 0, 0, 0, NULL),
(715, 219, 1, 91, '1d6474bd-aeec-4cf7-b08b-cec0283afd46', 1, 3, 0.009, 28068, NULL),
(716, 219, 2, 91, '846ec4ca-d283-48d5-a9a0-90702415ee28', 1, 3, 0.016, 1568, NULL),
(717, 220, 1, 91, '596fb647-764d-45a3-9d2f-fc5b1af6a606', 1, 3, 0.009, 1800, NULL),
(718, 220, 2, 91, 'c082b76b-bdcb-4d23-83b2-da1c47c14291', 1, 3, 0.014, 1352, NULL),
(719, 221, 1, 91, 'cc7cd9cf-11de-4c7f-8c91-28c4ae8a1590', 1, 4, 0.115, 2284, NULL),
(720, 221, 2, 91, 'c25b4d20-3ff7-4a35-bdfa-9882d65cf470', -1, 0, 0, 0, NULL),
(721, 222, 1, 91, '63dea87b-e4b2-49b6-9953-1c4ed2a86a9c', 1, 3, 0.008, 2780, NULL),
(722, 222, 2, 91, '4b3683a6-95fd-4ec6-ba17-e2f50a66b025', 1, 3, 0.015, 2104, NULL),
(723, 223, 1, 91, '88436461-0199-4659-9ef2-6bd9ba7835e3', 1, 4, 0.008, 6944, NULL),
(724, 223, 2, 91, '3de3391a-2308-4b14-85b0-5c5b779ed00a', -1, 0, 0, 0, NULL),
(725, 224, 1, 91, 'd3034a52-5a00-49db-ad33-b34ac5756a00', 1, 3, 0.007, 1824, NULL),
(726, 224, 2, 91, '71398f33-249c-49bc-8ce5-875127c9335c', 1, 3, 0.015, 1576, NULL),
(727, 225, 1, 91, 'b0ccce5c-a372-4dc8-bc70-06f08ecf4c7d', 1, 3, 0.011, 15236, NULL),
(728, 225, 2, 91, '0cdcb625-85a3-4e18-92db-8492a0dc4e88', 1, 3, 0.016, 5584, NULL),
(729, 226, 1, 91, '1cf9307d-b354-49a4-b9a7-9e87e232e2f0', 1, 3, 0.009, 1432, NULL),
(730, 226, 2, 91, '926f8923-0a1e-4bd5-ab45-e049f0378d50', 1, 3, 0.015, 1352, NULL),
(731, 227, 1, 91, '669a8149-20d8-4132-a241-7b840b8eaec8', 1, 3, 0.013, 37480, NULL),
(732, 227, 2, 91, 'd7a39369-3918-48b8-bfdb-5debe1e1bf9c', 1, 3, 0.028, 2404, NULL),
(733, 228, 1, 91, 'd0da52b0-2421-4a1c-bbf8-0b7a181ec458', 1, 3, 0.008, 852, NULL),
(734, 228, 2, 91, '2a165827-5373-4a23-8b43-620e28120968', 1, 4, 0.007, 808, NULL),
(735, 229, 1, 91, 'b2ff557e-5288-4f3f-b008-6d9fd3adbbe3', 1, 3, 0.011, 14000, NULL),
(736, 229, 2, 91, '8e3dd83c-2c80-4d3d-b370-48e6d63ea11c', 1, 3, 0.016, 6104, NULL),
(737, 230, 1, 91, '9313aca5-ca21-46f2-9be5-0fb4f76390d4', 1, 3, 0.008, 13224, NULL),
(738, 230, 2, 91, 'eacc3b82-0798-4228-8d5c-f30c1bed4acf', 1, 3, 0.016, 2268, NULL),
(739, 231, 1, 91, '7c7a888e-2d99-492c-8634-fceb88e2b5ff', 1, 3, 0.006, 15324, NULL),
(740, 231, 2, 91, '3d8225e5-530a-40da-b028-34689079a24a', 1, 3, 0.012, 3168, NULL),
(741, 232, 1, 91, 'd2454876-b034-4b13-9561-179133a20339', 1, 4, 0.008, 29776, NULL),
(742, 232, 2, 91, 'b6cc6b6c-fdae-4ecb-9f35-e03455b031f1', -1, 0, 0, 0, NULL),
(743, 233, 1, 91, '1a70db7a-c4cf-4a90-9275-a8b808eff16b', 1, 3, 0.007, 36412, NULL),
(744, 233, 2, 91, '8889ab98-9621-49ab-b170-2fa27c035753', 1, 3, 0.012, 1484, NULL),
(745, 234, 1, 91, '69a2cca1-ad5c-490d-8219-1aadec061ddc', 1, 4, 0.008, 29740, NULL),
(746, 234, 2, 91, 'c7653bfd-2635-4219-ba5b-407a9b16a15b', -1, 0, 0, 0, NULL),
(747, 235, 1, 91, 'bb6b335a-4af1-48f6-aec7-80a1a100337c', 1, 3, 0.009, 26004, NULL),
(748, 235, 2, 91, '53c22c01-f3bc-4b36-8c82-f22b83ce0203', 1, 3, 0.013, 7468, NULL),
(749, 236, 1, 91, 'fc4c5987-98d6-4959-b8c6-ba9522dc36ea', 1, 3, 0.008, 26616, NULL),
(750, 236, 2, 91, '7351f330-9c22-48af-8192-332d3a59d3ba', 1, 3, 0.013, 1632, NULL),
(751, 237, 1, 91, '9558777e-d030-42b5-8bc5-1d7dc92e1ddb', 1, 3, 0.01, 36868, NULL),
(752, 237, 2, 91, '3e5a105d-a1b0-4ef7-aeed-3e415a78c337', 1, 3, 0.016, 1312, NULL),
(753, 238, 1, 91, 'f3ab51c2-09d7-46ca-b201-2865b36c56da', 1, 3, 0.006, 1272, NULL),
(754, 238, 2, 91, '70812721-7a0f-493f-9e6b-3ea561a30b9d', 1, 3, 0.02, 1164, NULL),
(755, 239, 1, 91, 'a799a71b-2b01-4ede-b2e1-4efd1f92f1a4', 1, 3, 0.008, 32044, NULL),
(756, 239, 2, 91, '1d198362-fdeb-48b8-a2f6-34461a7acecb', 1, 3, 0.011, 1360, NULL),
(757, 240, 1, 91, 'b61a4289-a249-42db-9660-25a9833ec4e2', 1, 3, 0.008, 2488, NULL),
(758, 240, 2, 91, '23fc30c7-9068-4464-945a-a033149a0106', 1, 3, 0.022, 3244, NULL),
(759, 241, 1, 91, '1c194b04-4a75-4ddd-b594-d54f9b84e246', 1, 3, 0.014, 1380, NULL),
(760, 241, 2, 91, '5cc1c078-2661-4ea6-9cde-8e9b147b83cd', 1, 3, 0.016, 1848, NULL),
(761, 242, 1, 91, 'c4bc08ed-f4de-41d2-abb2-cea2eac7a4f7', 1, 3, 0.01, 12028, NULL),
(762, 242, 2, 91, 'df7a5f35-558f-42d5-a39b-0d89165ea7e3', 1, 3, 0.024, 3220, NULL),
(763, 243, 1, 91, 'e3a8e190-ed38-483c-8ce1-7bea266e3010', 1, 11, 0.021, 4560, NULL),
(764, 243, 2, 91, '46e17097-11ae-47c2-9acf-aedcf2b56148', -1, 0, 0, 0, NULL),
(765, 244, 1, 91, 'da915a77-de1e-41a4-8b7f-5610ff47828b', 1, 3, 0.008, 26556, NULL),
(766, 244, 2, 91, '6a337a5d-6740-4883-ab74-803a5a1062ef', 1, 3, 0.013, 1352, NULL),
(767, 245, 1, 91, '557dc93e-cf4b-4b4e-8677-d306afd2c8bd', 1, 3, 0.007, 7544, NULL),
(768, 245, 2, 91, 'ce4f53d7-143d-422c-b8d1-9088a615b61c', 1, 4, 0.015, 1240, NULL),
(769, 246, 1, 91, '78a291fc-2c58-4b35-8706-e5db01990661', 1, 3, 0.013, 3524, NULL),
(770, 246, 2, 91, 'fa357605-779a-4d82-addc-9d3b4e50209d', 1, 4, 0.016, 1284, NULL),
(771, 247, 1, 91, 'bf246659-84ab-4f2e-8b3a-5bbf87a6a8f8', 1, 3, 0.008, 13072, NULL),
(772, 247, 2, 91, '78bf75c6-4985-4216-8517-648212d735b4', 1, 4, 0.015, 1404, NULL),
(773, 248, 1, 91, '4f6a14f6-05ab-4ac0-963a-75fc8b07a49d', 1, 3, 0.008, 5360, NULL),
(774, 248, 2, 91, '027b9b5b-cc4d-4fc8-ba00-9dc7bf2c9870', 1, 3, 0.017, 1712, NULL),
(775, 249, 1, 91, 'adaf10d8-108d-48fd-96c6-f8db33d995ff', 1, 3, 0.008, 8912, NULL),
(776, 249, 2, 91, 'adf9b0c0-6854-492f-a656-0cbb945fc931', 1, 3, 0.013, 4916, NULL),
(777, 250, 1, 91, 'a917123e-ae4a-4c09-825e-38a99526e004', 1, 3, 0.011, 15268, NULL),
(778, 250, 2, 91, 'f42cc257-8fb2-4ef5-abb5-d35d232d048a', 1, 3, 0.021, 12604, NULL),
(779, 251, 1, 91, 'bb67b860-9a6c-478d-8925-2161618a6e45', 1, 3, 0.011, 7716, NULL),
(780, 251, 2, 91, 'c2071395-8b2c-49d1-98cf-29e76fb913e7', 1, 3, 0.015, 1464, NULL),
(781, 252, 1, 91, 'a5ad09ad-7f4f-4234-b0d6-6b0c41d09ecb', 1, 3, 0.008, 2092, NULL),
(782, 252, 2, 91, '2b65bc0f-9df3-4760-a778-48151a24b16a', 1, 3, 0.03, 1520, NULL),
(783, 254, 1, 91, '09fe0a32-d3e4-4b3f-bfc4-01210771d13f', 1, 4, 0.008, 11720, NULL),
(784, 254, 2, 91, '17aededd-452a-400c-b686-fe8c1af64267', -1, 0, 0, 0, NULL),
(785, 256, 1, 91, 'e23dcea9-8f64-43a8-831b-2499dcdccac2', 1, 5, 0, 30388, NULL),
(786, 257, 1, 91, '8f52fa90-5c98-4210-9049-a6ffcbc94f2a', 1, 3, 0.011, 8636, NULL),
(787, 257, 2, 91, '481cb39e-c5c7-41a1-a1df-010286fb7179', 1, 3, 0.007, 1364, NULL),
(788, 258, 1, 91, '1ee36b8c-18bf-4717-bce4-ae047b5c4674', 1, 4, 0.006, 2180, NULL),
(789, 258, 2, 91, 'f5acaadb-8555-4d55-a981-286966a0c825', -1, 0, 0, 0, NULL),
(790, 259, 1, 91, '6fe4c017-426f-414d-9879-fb22619b7ddc', 1, 4, 0.008, 1944, NULL),
(791, 259, 2, 91, 'f9e6de18-b953-4474-a84c-fc6b0314d28f', -1, 0, 0, 0, NULL),
(792, 260, 1, 91, 'c8842b2a-a52e-4445-8f74-e38b504a3dc8', 1, 3, 0.008, 27028, NULL),
(793, 260, 2, 91, '05fd9e5d-d7f3-4e54-9f75-b418c3d7189e', 1, 3, 0.009, 1384, NULL),
(794, 261, 1, 91, '23036569-841d-42b5-8196-55dbce8adf27', 1, 6, 0, 0, NULL),
(795, 261, 2, 91, '052a407c-b4eb-412e-9ed9-5978864660b5', -1, 0, 0, 0, NULL),
(796, 262, 1, 91, '0df5b29c-a788-468e-90e8-e5aacdf9ef88', 1, 3, 0.01, 12912, NULL),
(797, 262, 2, 91, 'e3090ec7-c0b3-42ff-8bef-2cc7bdeb0b34', 1, 3, 0.016, 3300, NULL),
(798, 263, 1, 91, 'c26e646f-b1dc-4801-a5fd-e1dcf9246176', 1, 3, 0.012, 24488, NULL),
(799, 263, 2, 91, '0e391233-f7b5-4257-9352-d30cae6745f4', 1, 3, 0.014, 2288, NULL),
(800, 264, 1, 91, 'fefcb554-0a35-4aff-b9d4-c60192f9313e', 1, 6, 0, 0, NULL),
(801, 264, 2, 91, 'a31f4d6c-5c9c-4091-ae36-5d0e8f9309bd', -1, 0, 0, 0, NULL),
(802, 265, 1, 91, '06c9e2a9-5844-4284-813f-1ad5c87a7256', 1, 3, 0.224, 24692, NULL),
(803, 266, 1, 91, '788abff4-2d4c-4a82-8bc4-83992c67c374', 1, 5, 0.191, 13540, NULL),
(804, 267, 1, 91, '1f1b3762-3654-45b8-a903-fb039c80e8a8', 1, 3, 0.031, 15776, NULL),
(805, 268, 1, 91, '6c44717e-06e6-4f71-8098-7bd8769334d1', 1, 6, 0, 0, NULL),
(806, 268, 2, 91, '6b0a15c0-934d-40d9-b0c1-f00f4cfc89e8', -1, 0, 0, 0, NULL),
(807, 269, 1, 91, 'db53cd3e-2dbd-48a0-b8f8-532ca4693639', 1, 6, 0, 0, NULL),
(808, 269, 2, 91, 'f37173df-5a15-438b-99c3-f418cc68e120', -1, 0, 0, 0, NULL),
(809, 270, 1, 91, '85ee700c-b4a8-4783-b23d-19df542af16c', 1, 6, 0, 0, NULL),
(810, 270, 2, 91, 'c5dd2685-79be-48fd-9ea3-8f201b52678b', -1, 0, 0, 0, NULL),
(811, 271, 1, 91, '46652aaa-d8e1-4b6f-bb92-1a22d1a1cb66', 1, 3, 0.04, 32920, NULL),
(812, 272, 1, 91, '329d3657-4cf7-421a-a1de-3f3fe3fb51b8', 1, 3, 0.028, 20876, NULL),
(813, 272, 2, 91, 'b36bb181-9f6b-43b6-8a5c-ea6114c2f9ac', 1, 3, 0.008, 10636, NULL),
(814, 273, 1, 91, '3a81c1e6-06ce-4b4b-b9c1-a8d8bce7642c', 1, 6, 0, 0, NULL),
(815, 273, 2, 91, '115a8157-90c6-471b-8523-8fd9b88e2655', -1, 0, 0, 0, NULL),
(816, 274, 1, 91, 'f7589f9e-5ee4-42b7-9cf8-38cde167d318', 1, 6, 0, 0, NULL),
(817, 274, 2, 91, 'f88df752-fd40-4fbf-b95d-313c074def71', -1, 0, 0, 0, NULL),
(818, 275, 1, 91, 'ca0871fc-5162-4f92-a671-40dca04a6fb8', 1, 6, 0, 0, NULL),
(819, 275, 2, 91, 'abc29b3f-071b-45f6-b30f-203c8118cee4', -1, 0, 0, 0, NULL),
(820, 276, 1, 91, 'b075b2fd-312f-4c85-bb9e-7b74ddf44f0c', 1, 6, 0, 0, NULL),
(821, 276, 2, 91, 'd3fab11d-7daa-433d-8b30-b1beb6956277', -1, 0, 0, 0, NULL),
(822, 277, 1, 91, '179030f8-067b-4351-92e0-5747b30ea784', 1, 6, 0, 0, NULL),
(823, 277, 2, 91, 'd9b81649-2038-426b-afb5-197d6c3d41ae', -1, 0, 0, 0, NULL),
(824, 278, 1, 91, '0c3ec2d0-07bb-4150-a1c5-baba168d229f', 1, 3, 0.037, 22800, NULL),
(825, 279, 1, 91, '15157207-3528-40ee-8e49-93f0e3ea632a', 1, 3, 0.01, 21508, NULL),
(826, 279, 2, 91, 'a4ea1636-37b7-4834-a785-9a1189c224d1', 1, 3, 0.012, 15632, NULL),
(827, 280, 1, 91, '2b17cef4-3bdd-486c-96f4-c6353bc933ee', 1, 3, 0.028, 18724, NULL),
(828, 280, 2, 91, '981e5078-6278-4c04-8183-8809cd6a0f9d', 1, 5, 1.872, 26700, NULL),
(829, 281, 1, 91, '1d9b3bd8-b421-4cae-95f1-86c3112938d9', 1, 6, 0, 0, NULL),
(830, 281, 2, 91, '52fc264b-5e85-4b47-a090-6fb975485aae', -1, 0, 0, 0, NULL),
(831, 282, 1, 91, '9a1c2b4a-c2bf-4b0f-a14a-369c0d2189b9', 1, 3, 0.03, 30812, NULL),
(832, 282, 2, 91, '0711c099-6b08-4a40-968d-70706ea2642d', 1, 5, 1.92, 4536, NULL),
(833, 283, 1, 91, '87e1cd3b-95d4-451e-94ef-b1ca38505a42', 1, 6, 0, 0, NULL),
(834, 283, 2, 91, 'aafed4b4-b3bb-4335-9096-5260cac369fe', -1, 0, 0, 0, NULL),
(835, 284, 1, 91, 'f5bc7f79-b92c-4afc-80f5-6956352b8ac1', 1, 6, 0, 0, NULL),
(836, 284, 2, 91, '7b0e98c6-f39c-4d17-a7fe-9be60367ba5e', -1, 0, 0, 0, NULL),
(837, 285, 1, 91, '56dd9e57-0f2f-435c-a9c5-8c63ea33bc82', 1, 6, 0, 0, NULL),
(838, 285, 2, 91, '268d1976-f0b7-49ae-987d-7ac62eb40c77', -1, 0, 0, 0, NULL),
(839, 286, 1, 91, 'dbe36dce-3892-42a8-96fc-d5c49eabf702', 1, 3, 0.029, 21096, NULL),
(840, 287, 1, 91, 'c1bf531e-7c55-4f27-967c-15c85ffa0f34', 1, 4, 0.033, 16492, NULL),
(841, 288, 1, 91, 'f7e73deb-5d0c-4c0e-9ce2-88e8580f9520', 1, 6, 0, 0, NULL),
(842, 288, 2, 91, '38021279-c2d4-41c6-845e-a79afd9a02b2', -1, 0, 0, 0, NULL),
(843, 289, 1, 91, '35cc19cb-6e5e-489f-91ad-93fd9b7e2660', 1, 4, 0.011, 22036, NULL),
(844, 289, 2, 91, '7e01dbe6-4851-4021-a78a-a31ab16bf187', -1, 0, 0, 0, NULL),
(845, 290, 1, 91, '20d68f09-0663-4c8f-a6cd-4d433b3fca33', 1, 3, 0.008, 28412, NULL),
(846, 290, 2, 91, '1c68ce42-37f6-43b6-bfb5-a34ee337d9ee', 1, 3, 0.021, 5152, NULL),
(847, 291, 1, 91, '8da5e5ee-0c45-4c5f-a8bf-15bfb86946db', 1, 3, 0.013, 24564, NULL),
(848, 291, 2, 91, 'e9390ab1-8ba6-44ed-aa0d-233f043b31a4', 1, 3, 0.016, 16672, NULL),
(849, 292, 1, 91, '44b2ecb7-f803-414c-b364-b4fb42235dfa', 1, 6, 0, 0, NULL),
(850, 292, 2, 91, '79560dc9-e3e1-4fca-a38e-ca403123b017', -1, 0, 0, 0, NULL),
(851, 293, 1, 91, '797b9b6f-ee87-43ae-a2a8-4348db32cb67', 1, 6, 0, 0, NULL),
(852, 293, 2, 91, '1e16c0cc-5b14-47cb-9b38-7975af0f2a1a', -1, 0, 0, 0, NULL),
(853, 294, 1, 91, '32f6f50f-970e-44d0-bc94-96082d2418a2', 1, 3, 0.01, 25352, NULL),
(854, 294, 2, 91, '7b5b0075-b1cf-497c-a3f0-034925d827e1', 1, 3, 0.013, 8296, NULL),
(855, 295, 1, 91, 'ba745c60-4cbf-4ef6-a786-5bc78794d296', 1, 6, 0, 0, NULL),
(856, 295, 2, 91, 'c20cb345-bf89-4c87-8f8e-16625838ca2d', -1, 0, 0, 0, NULL),
(857, 296, 1, 91, '103a4c32-0fbb-4964-a116-407f974e2cf6', 1, 6, 0, 0, NULL),
(858, 296, 2, 91, 'df7e240b-088b-4ed2-9f8b-fdc8e1e51c6a', -1, 0, 0, 0, NULL),
(859, 297, 1, 91, '2b5d79db-b70a-4e26-9902-bbfb6b44b30e', 1, 3, 0.011, 14780, NULL),
(860, 297, 2, 91, 'c49e54e0-a42d-48fe-ad19-9c34538da284', 1, 3, 0.016, 19816, NULL),
(861, 298, 1, 91, '3a1dd5ae-51ed-474f-b4cb-5d8d04e6017c', 1, 6, 0, 0, NULL),
(862, 298, 2, 91, 'd2954016-e44d-49c1-a8c8-838374bfac53', -1, 0, 0, 0, NULL),
(863, 299, 1, 91, '9ff77048-e583-4759-81dc-0bc16026b0fe', 1, 3, 0.029, 19428, NULL),
(864, 300, 1, 91, 'ba2e9182-a26b-4898-9644-5d472e3b01d7', 1, 3, 0.034, 17508, NULL),
(865, 301, 1, 91, '75d63bf6-a640-4ce9-9f25-3cd770980a91', 1, 3, 0.03, 19040, NULL),
(866, 302, 1, 91, 'c39b205a-2c50-46df-b6c4-dd12e8479a04', 1, 6, 0, 0, NULL),
(867, 302, 2, 91, '4fcb6665-ebc3-4a23-b5d7-af3a27c6bbae', -1, 0, 0, 0, NULL),
(868, 303, 1, 91, 'f062829e-df18-448b-aae9-68b57d8e297c', 1, 6, 0, 0, NULL),
(869, 303, 2, 91, '8454448f-4105-448f-a251-29db6730dcbd', -1, 0, 0, 0, NULL),
(870, 304, 1, 91, '5c8b0125-f57a-41d9-9bb5-4d50277ada4d', 1, 3, 0.03, 29412, NULL),
(871, 304, 2, 91, 'fbd362e7-4d88-4fb2-bbe3-643da588f5bb', 1, 4, 0.009, 17288, NULL),
(872, 305, 1, 91, '586eebe7-bcc3-4e03-9637-f0094858bf27', 1, 6, 0, 0, NULL),
(873, 305, 2, 91, '28480e26-816f-436a-85d2-d172a969955e', -1, 0, 0, 0, NULL),
(874, 306, 1, 91, '60cda015-f307-40a0-b6aa-e19cfdf28ef2', 1, 6, 0, 0, NULL),
(875, 306, 2, 91, '63d0a163-0d03-41e8-9dfa-117e1c8551b8', -1, 0, 0, 0, NULL),
(876, 307, 1, 91, 'e779658b-0177-4631-aa6a-8cad51bf4c3f', 1, 6, 0, 0, NULL),
(877, 307, 2, 91, '458be049-418e-4eb6-a631-971af17846f0', -1, 0, 0, 0, NULL),
(878, 308, 1, 91, 'f1d6add2-6375-4bb3-847d-3cfd5048fdbb', 1, 3, 0.028, 23472, NULL),
(879, 309, 1, 91, '1b8aff45-64c3-48ff-8d0e-6e7755407bb1', 1, 3, 0.03, 21392, NULL),
(880, 310, 1, 91, '7cbee721-6efa-4211-b250-c68d24542c00', 1, 6, 0, 0, NULL),
(881, 311, 1, 91, '52e22ab5-4cca-4cf9-9593-f633f95a7a1f', 1, 4, 0.03, 18656, NULL),
(882, 312, 1, 91, 'd59b28eb-dfef-4ff8-8fea-201630a42b2d', 1, 6, 0, 0, NULL),
(883, 312, 2, 91, 'ed51c85d-77ad-4d4a-98a8-b6a61a6098da', -1, 0, 0, 0, NULL),
(884, 313, 1, 107, 'e62341e0-6844-4c94-9020-60fe6b91da59', 1, 3, 0.011, 28732, NULL),
(885, 313, 2, 107, 'cf9390c1-eee6-4f8d-af92-1baf285babf9', 1, 3, 0.01, 14176, NULL),
(886, 314, 1, 106, '08d59122-3e4c-465f-941c-474f953db995', 1, 3, 0.008, 16732, NULL),
(887, 314, 2, 107, 'd9234a98-bc8d-4a2f-b401-22bfaf99b97f', 1, 3, 0.013, 11392, NULL),
(889, 315, 1, 106, 'ab4910b2-1465-4427-838c-a9c5ef74672e', 1, 4, 0.01, 30184, NULL),
(890, 315, 2, 107, NULL, -1, 0, 0, 0, NULL),
(891, 316, 1, 106, 'b0f33b11-9dc4-4a88-aa28-cf2e75ea3f41', 1, 3, 0.009, 27756, NULL),
(892, 316, 2, 107, '144d2b6c-9303-4fef-9785-ba8318f6a0e5', 1, 3, 0.011, 29060, NULL),
(893, 317, 1, 106, 'a593789e-25bd-490d-ba11-65e6e84a68e5', 1, 3, 0.01, 21664, NULL),
(894, 317, 2, 107, '1da96032-a143-4c8a-948e-6b196562fded', 1, 3, 0.009, 27432, NULL),
(895, 318, 1, 106, 'fabdbb7c-8024-4feb-924d-31d0a3e931ff', 1, 3, 0.015, 21152, NULL),
(896, 318, 2, 107, '7909ad99-19f0-4573-936b-d35575696f08', 1, 3, 0.01, 21388, NULL),
(897, 319, 1, 91, 'af8ec185-7d76-47a0-bf0b-c08ab56db583', 1, 3, 0.01, 21456, NULL),
(898, 319, 2, 92, '572864ac-b384-4130-b186-464bac11a46d', 1, 3, 0.024, 19896, NULL),
(899, 320, 1, 91, '6415a882-eba4-4841-ac58-cfcd634c7d30', 1, 6, 0, 0, NULL),
(900, 320, 2, 92, NULL, -1, 0, 0, 0, NULL),
(901, 321, 1, 91, '682e70e7-7c41-4b5e-95f2-e92c8fa58ad7', 1, 6, 0, 0, NULL),
(902, 321, 2, 92, NULL, -1, 0, 0, 0, NULL),
(903, 322, 1, 91, '6114efbc-1df1-4ab4-8793-51a9e8d4a241', 1, 3, 0.01, 28484, NULL),
(904, 322, 2, 92, '234712db-f57d-4890-9145-58845d7ad181', 1, 3, 0.021, 30564, NULL),
(905, 323, 1, 91, 'b0f6ac88-933d-4d9f-b39e-8dab9de6796f', 1, 6, 0, 0, NULL),
(906, 323, 2, 92, NULL, -1, 0, 0, 0, NULL),
(907, 324, 1, 91, 'e2f1300e-ee9c-494d-a199-cab73de13dc0', 1, 6, 0, 0, NULL),
(908, 324, 2, 92, NULL, -1, 0, 0, 0, NULL),
(909, 325, 1, 91, '4712a028-c396-4f7b-b96e-40d1c0ef461a', 1, 3, 0.009, 18628, NULL),
(910, 325, 2, 92, 'cdf4e517-86dd-47d6-9613-191b3d04b26c', 1, 3, 0.019, 20076, NULL),
(911, 326, 1, 91, 'ed89e336-1636-4ab5-b26a-d46ab3fa87e7', 1, 3, 0.01, 12780, NULL),
(912, 326, 2, 92, 'cdbb242b-b63d-4485-a156-abe57adcd6ce', 1, 3, 0.019, 18860, NULL),
(913, 327, 1, 91, '37d66d8a-a255-4de5-8dca-909f76c43fa0', 1, 3, 0.011, 20268, NULL),
(914, 327, 2, 92, '180cdc37-bfba-4e5b-bc51-6fdf87d57782', 1, 3, 0.021, 24944, NULL),
(915, 328, 1, 91, 'e395a6d5-6780-48e9-9511-6d2940806116', 1, 3, 0.009, 25108, NULL),
(916, 328, 2, 92, '6730e940-408e-4b25-8e9e-0245c3ec2046', 1, 3, 0.02, 18492, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_case`
--

CREATE TABLE `test_case` (
  `testCaseId` int(11) NOT NULL,
  `testCaseIdHash` varchar(150) DEFAULT NULL,
  `problemId` int(11) NOT NULL,
  `testCaseAddedDate` datetime NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_case`
--

INSERT INTO `test_case` (`testCaseId`, `testCaseIdHash`, `problemId`, `testCaseAddedDate`, `userId`) VALUES
(91, 'f1a276233b43fade30fd73b9d69c13e0ef3444bbccfffa7266c4561f45a90ec3', 1, '2020-02-17 17:34:49', 1),
(92, '57deca365723608d75800f590ffc703d56821a413e3a69b2614e5e21006d8d7e', 1, '2020-02-17 20:09:45', 1),
(106, '0c06fcb8bafb56dce685732640682fe314457172d833da583390c2bc6d710229', 10, '2020-03-17 06:41:43', 1),
(107, '5e5c05db2fb09b2158c0c4cd872726493403bcf74633cb121dc17c5502f4f963', 10, '2020-03-17 06:42:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userFullName` text NOT NULL,
  `userHandle` varchar(15) NOT NULL,
  `userEmail` text NOT NULL,
  `userPhoto` text DEFAULT NULL,
  `userEwuId` text DEFAULT NULL,
  `userPassword` varchar(150) NOT NULL,
  `userRoles` int(11) NOT NULL DEFAULT 40,
  `userRegistrationDate` datetime NOT NULL,
  `userLastLoginInfo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userFullName`, `userHandle`, `userEmail`, `userPhoto`, `userEwuId`, `userPassword`, `userRoles`, `userRegistrationDate`, `userLastLoginInfo`) VALUES
(1, '', 'hamza05', 'sk.amirhamza@gmail.com', '', '', 'OTg4NDVhYzc5MWFhYWYxYWMyMDU5YjQ2YTg4MjcyOTAwZWU1YjNjMTA3NTZkYzg1ODU4NzU5ZjU2ODgyNmVhZA==', 20, '2020-01-18 00:00:00', '{\"ip\":\"::1\",\"url\":\"\\/project\\/EWUOJ\\/site_action.php\",\"time\":\"2020-03-15 05:26:04\"}'),
(5, 'test', 'test', 'test@gmail.com', NULL, '', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 40, '2020-01-20 23:08:00', NULL),
(6, 'test', 'test1', 'test1@gmail.com', NULL, '2017-1-60-0', 'NWJlMTBiMDFjNGIzMWRkNDNlYmExNzc0NGNkOTNmYzY3NDk2ZGZlYWUyMGRmYzQ3ODBlN2MyZWNiZTdmNGI2Zg==', 40, '2020-01-20 23:10:48', '{\"ip\":\"::1\",\"url\":\"\\/project\\/EWUOJ\\/site_action.php\",\"time\":\"2020-02-15 01:41:40\"}'),
(7, 'hamza', 'hamza051', 'hamza@gmail.com', NULL, '2017-1-60-091', 'NWJlMTBiMDFjNGIzMWRkNDNlYmExNzc0NGNkOTNmYzY3NDk2ZGZlYWUyMGRmYzQ3ODBlN2MyZWNiZTdmNGI2Zg==', 30, '2020-01-20 23:14:34', '{\"ip\":\"::1\",\"url\":\"\\/project\\/EWUOJ\\/site_action.php\",\"time\":\"2020-02-15 02:04:44\"}'),
(8, 'test2', 'test2', 'test2@gmail.com', NULL, '2017-1-60-091', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 40, '2020-01-20 23:20:14', NULL),
(9, 'user1', 'user1', 'user1@gmail.com', NULL, '2017-1-60-091', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 40, '2020-01-20 23:23:10', NULL),
(10, 'user4', 'user4', 'user4@gmaiil.com', NULL, '', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 35, '2020-01-20 23:36:10', NULL),
(11, 'user5', 'user5', 'user5@gmail.com', NULL, '{\"year\":2017,\"semister\":1,\"department\":60,\"id\":91}', 'NWJlMTBiMDFjNGIzMWRkNDNlYmExNzc0NGNkOTNmYzY3NDk2ZGZlYWUyMGRmYzQ3ODBlN2MyZWNiZTdmNGI2Zg==', 40, '2020-01-20 23:59:22', NULL),
(12, 'user6', 'user6', 'user6@gmail.com', NULL, '{\"year\":2017,\"semister\":1,\"department\":60,\"serial\":92}', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 40, '2020-01-21 00:01:24', NULL),
(13, 'dsf', 'asdf', 'a@gmail.com', NULL, '', 'NWJlMTBiMDFjNGIzMWRkNDNlYmExNzc0NGNkOTNmYzY3NDk2ZGZlYWUyMGRmYzQ3ODBlN2MyZWNiZTdmNGI2Zg==', 40, '2020-01-31 00:17:08', NULL),
(14, 'asdf', 'sadf', 'abc@gmail.com', NULL, '{\"year\":2017,\"semister\":1,\"department\":60,\"serial\":91}', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 40, '2020-01-31 00:18:12', NULL),
(15, 'Ruhul Amin', 'ruhulaminrul', 'ruhul.ok@gmail.com', NULL, '', 'Y2MwN2E2YmYzMmYzODQyNWRlYjRhYTMwYjZkYTFkMTdjYWYzYWVhNGE3NjQzZmMwZjQyMjlkYWIzYjIwYTFlNQ==', 40, '2020-02-08 08:14:38', '{\"ip\":\"192.168.0.109\",\"url\":\"\\/project\\/EWUOJ\\/site_action.php\",\"time\":\"2020-02-08 09:07:52\"}'),
(16, 'hey', 'test4', 't@gmail.com', NULL, '', 'NTc1MzlkNmI2MjJiYjAzZTA1OTEyZmY1NDkzMzZmZTY0MGE5YzEzYjdmZDNkYTJiYjQ4NTBiNmUwMzBhNmQ0Ng==', 35, '2020-02-17 01:19:38', '{\"ip\":\"::1\",\"url\":\"\\/project\\/EWUOJ\\/site_action.php\",\"time\":\"2020-02-17 01:49:10\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `judge_problem_list`
--
ALTER TABLE `judge_problem_list`
  ADD PRIMARY KEY (`judgeProblemListId`),
  ADD UNIQUE KEY `UC_ProblemId` (`problemId`);

--
-- Indexes for table `judge_setting`
--
ALTER TABLE `judge_setting`
  ADD PRIMARY KEY (`judgeSettingId`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`problemId`),
  ADD KEY `fk_problem_user` (`userId`);

--
-- Indexes for table `problem_moderator`
--
ALTER TABLE `problem_moderator`
  ADD PRIMARY KEY (`problemModeratorId`),
  ADD UNIQUE KEY `UC_UserProblem` (`userId`,`problemId`),
  ADD KEY `FK_ProblemModeratorProblem` (`problemId`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submissionId`),
  ADD KEY `FK_SubmissionUser` (`userId`),
  ADD KEY `FK_SubmissionProblem` (`problemId`);

--
-- Indexes for table `submissions_on_test_case`
--
ALTER TABLE `submissions_on_test_case`
  ADD PRIMARY KEY (`submissionTestCaseId`),
  ADD KEY `FK_SubmissionId` (`submissionId`),
  ADD KEY `FK_testCaseId` (`testCaseId`);

--
-- Indexes for table `test_case`
--
ALTER TABLE `test_case`
  ADD PRIMARY KEY (`testCaseId`),
  ADD KEY `fk_test_case_add_by` (`userId`) USING BTREE,
  ADD KEY `fk_test_case_problem_id` (`problemId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `uc_user_handle` (`userHandle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `judge_problem_list`
--
ALTER TABLE `judge_problem_list`
  MODIFY `judgeProblemListId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `judge_setting`
--
ALTER TABLE `judge_setting`
  MODIFY `judgeSettingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `problemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `problem_moderator`
--
ALTER TABLE `problem_moderator`
  MODIFY `problemModeratorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submissionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `submissions_on_test_case`
--
ALTER TABLE `submissions_on_test_case`
  MODIFY `submissionTestCaseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=917;

--
-- AUTO_INCREMENT for table `test_case`
--
ALTER TABLE `test_case`
  MODIFY `testCaseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `judge_problem_list`
--
ALTER TABLE `judge_problem_list`
  ADD CONSTRAINT `FK_ProblemId` FOREIGN KEY (`problemId`) REFERENCES `problems` (`problemId`);

--
-- Constraints for table `problems`
--
ALTER TABLE `problems`
  ADD CONSTRAINT `fk_problem_user` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `problem_moderator`
--
ALTER TABLE `problem_moderator`
  ADD CONSTRAINT `FK_ProblemModeratorProblem` FOREIGN KEY (`problemId`) REFERENCES `problems` (`problemId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ProblemModeratorUserId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `FK_SubmissionProblem` FOREIGN KEY (`problemId`) REFERENCES `problems` (`problemId`),
  ADD CONSTRAINT `FK_SubmissionUser` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `submissions_on_test_case`
--
ALTER TABLE `submissions_on_test_case`
  ADD CONSTRAINT `FK_SubmissionId` FOREIGN KEY (`submissionId`) REFERENCES `submissions` (`submissionId`);

--
-- Constraints for table `test_case`
--
ALTER TABLE `test_case`
  ADD CONSTRAINT `fk_test_case_add_by` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `fk_test_case_problem_id` FOREIGN KEY (`problemId`) REFERENCES `problems` (`problemId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;