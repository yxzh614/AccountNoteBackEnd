-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-11-03 13:23:47
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accountdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `monthlist`
--

CREATE TABLE `monthlist` (
  `ID` int(10) NOT NULL COMMENT 'ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `time` date NOT NULL COMMENT '年月',
  `zhanbi` json NOT NULL COMMENT '收支比例',
  `daycost` decimal(10,2) NOT NULL COMMENT '日均消费',
  `totalin` decimal(10,2) NOT NULL COMMENT '总收入',
  `totalout` decimal(10,2) NOT NULL COMMENT '总支出',
  `jieyu` decimal(10,2) NOT NULL COMMENT '结余',
  `chazhi` decimal(10,2) NOT NULL COMMENT '预算超支额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `monthlist`
--

INSERT INTO `monthlist` (`ID`, `username`, `time`, `zhanbi`, `daycost`, `totalin`, `totalout`, `jieyu`, `chazhi`) VALUES
(1, 'admin', '2017-10-13', '{"奖金": "+10%", "工资": "+90%", "房租": "-50%", "餐饮": "-50%"}', '67.00', '5001.00', '2000.00', '3000.00', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `shouzhilist`
--

CREATE TABLE `shouzhilist` (
  `ID` int(10) NOT NULL COMMENT 'ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '类别',
  `year` smallint(6) NOT NULL COMMENT '年',
  `month` tinyint(4) NOT NULL COMMENT '月',
  `day` tinyint(4) NOT NULL,
  `money` decimal(10,2) NOT NULL COMMENT '金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shouzhilist`
--

INSERT INTO `shouzhilist` (`ID`, `username`, `title`, `type`, `year`, `month`, `day`, `money`) VALUES
(1, 'admin', '本月工资', '工资', 2017, 10, 1, '4500.00'),
(2, 'admin', '租房子', '房租', 2017, 10, 2, '-1000.00'),
(3, 'admin', '吃', '餐饮', 2017, 10, 3, '-1000.00'),
(4, 'admin', '奖金', '奖金', 2017, 10, 4, '500.00'),
(5, 'admin', '上月结算工资', '工资', 2017, 10, 5, '4500.00'),
(6, 'admin', '本月工资', '工资', 2017, 10, 6, '4500.00'),
(7, 'admin', '租房子', '房租', 2017, 10, 7, '-1000.00'),
(8, 'admin', '吃', '餐饮', 2017, 10, 8, '-1000.00'),
(9, 'admin', '奖金', '奖金', 2017, 10, 9, '500.00'),
(10, 'admin', '上月结算工资', '工资', 2017, 10, 1, '4500.00'),
(11, 'admin', '本月工资', '工资', 2017, 10, 1, '4500.00'),
(12, 'admin', '租房子', '房租', 2017, 10, 1, '-1000.00'),
(13, 'admin', '吃', '餐饮', 2017, 10, 1, '-1000.00'),
(14, 'admin', '奖金', '奖金', 2017, 10, 1, '500.00'),
(15, 'admin', '上月结算工资', '工资', 2017, 10, 1, '4500.00'),
(16, 'admin', '本月工资', '工资', 2017, 10, 1, '4500.00'),
(17, 'admin', '租房子', '房租', 2017, 10, 1, '-1000.00'),
(18, 'admin', '吃', '餐饮', 2017, 10, 1, '-1000.00'),
(19, 'admin', '奖金', '奖金', 2017, 10, 1, '500.00'),
(20, 'admin', '上月结算工资', '工资', 2017, 10, 1, '4500.00'),
(21, 'admin', '本月工资', '工资', 2017, 9, 1, '4500.00'),
(22, 'admin', '租房子', '房租', 2017, 9, 1, '-1000.00'),
(23, 'admin', '吃', '餐饮', 2017, 9, 1, '-1000.00'),
(24, 'admin', '奖金', '奖金', 2017, 9, 1, '500.00'),
(25, 'admin', '上月结算工资', '工资', 2017, 9, 1, '4500.00'),
(26, 'admin', '本月工资', '工资', 2017, 9, 1, '4500.00'),
(27, 'admin', '租房子', '房租', 2017, 9, 1, '-1000.00'),
(28, 'admin', '吃', '餐饮', 2017, 9, 1, '-1000.00'),
(29, 'admin', '奖金', '奖金', 2017, 9, 1, '500.00'),
(30, 'admin', '上月结算工资', '工资', 2017, 9, 1, '4500.00'),
(31, 'admin', '本月工资', '工资', 2017, 9, 1, '4500.00'),
(32, 'admin', '租房子', '房租', 2017, 9, 1, '-1000.00'),
(33, 'admin', '吃', '餐饮', 2017, 9, 1, '-1000.00'),
(34, 'admin', '奖金', '奖金', 2017, 9, 1, '500.00'),
(35, 'admin', '上月结算工资', '工资', 2017, 9, 1, '4500.00'),
(36, 'admin', '本月工资', '工资', 2017, 9, 1, '4500.00'),
(37, 'admin', '租房子', '房租', 2017, 9, 1, '-1000.00'),
(38, 'admin', '吃', '餐饮', 2017, 9, 1, '-1000.00'),
(39, 'admin', '奖金', '奖金', 2017, 9, 1, '500.00'),
(40, 'admin', '上月结算工资', '工资', 2017, 9, 1, '4500.00'),
(45, 'admin', '123123', '餐饮', 2017, 10, 3, '213132.00'),
(46, 'admin', '1231', '房租', 2017, 10, 3, '12312.00'),
(47, 'admin', '132123', '', 2017, 10, 3, '123123.00'),
(48, 'admin', '3123123', '交通', 2017, 10, 3, '12312.00'),
(49, 'admin', '123123', '交通', 2017, 11, 3, '12123.00'),
(50, 'admin2', '3123', '123', 2017, 11, 3, '123123.00');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(160) NOT NULL COMMENT '密码（SHA1）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('admin', '123123'),
('admin2', '123123');

-- --------------------------------------------------------

--
-- 表的结构 `yusuanlist`
--

CREATE TABLE `yusuanlist` (
  `ID` int(10) NOT NULL COMMENT 'ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `type` varchar(255) NOT NULL COMMENT '类别',
  `year` smallint(6) NOT NULL,
  `month` tinyint(4) NOT NULL,
  `money` decimal(10,2) NOT NULL COMMENT '金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yusuanlist`
--

INSERT INTO `yusuanlist` (`ID`, `username`, `type`, `year`, `month`, `money`) VALUES
(1, 'admin', '房租', 2017, 10, '1000.00'),
(2, 'admin', '餐饮', 2017, 9, '1500.00'),
(3, 'admin', '餐饮', 2017, 10, '1000.00'),
(5, 'admin', '123', 2017, 11, '123123.00'),
(8, 'admin', '1234', 2017, 11, '123.00'),
(12, 'admin2', '123', 2017, 11, '123.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `monthlist`
--
ALTER TABLE `monthlist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `shouzhilist`
--
ALTER TABLE `shouzhilist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `yusuanlist`
--
ALTER TABLE `yusuanlist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username_2` (`username`,`type`,`year`,`month`),
  ADD KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `monthlist`
--
ALTER TABLE `monthlist`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `shouzhilist`
--
ALTER TABLE `shouzhilist`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=51;
--
-- 使用表AUTO_INCREMENT `yusuanlist`
--
ALTER TABLE `yusuanlist`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=13;
--
-- 限制导出的表
--

--
-- 限制表 `monthlist`
--
ALTER TABLE `monthlist`
  ADD CONSTRAINT `usernamemonth` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `shouzhilist`
--
ALTER TABLE `shouzhilist`
  ADD CONSTRAINT `usernameshouzhi` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `yusuanlist`
--
ALTER TABLE `yusuanlist`
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
