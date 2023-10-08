CREATE TABLE `allowance` (
  `allowanceID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `allowanceType` varchar(255) NOT NULL,
  `allowanceAmount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `attendance` (
  `attendanceID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `logdate` date NOT NULL,
  `timein` time NOT NULL,
  `timeout` time DEFAULT NULL,
  `shifttype` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `branch` (
  `branchID` int(11) NOT NULL,
  `branchname` varchar(25) NOT NULL,
  `address` varchar(255) NOT NULL,
  `managerID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `branchmanager` (
  `managerID` varchar(255) NOT NULL,
  `branchID` int(11) NOT NULL,
  `managertype` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `deduction` (
  `deductionID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `taxrate` float NOT NULL,
  `Pension` float NOT NULL,
  `deductionType` varchar(255) NOT NULL,
  `deductionAmount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `primary_phone` varchar(15) NOT NULL,
  `secondary_phone` varchar(15) NOT NULL,
  `dateofjoin` date NOT NULL,
  `education_status` varchar(255) NOT NULL,
  `employee_photo` blob NOT NULL,
  `email` varchar(255) NOT NULL,
  `employment_status` varchar(15) NOT NULL,
  `employeefile` mediumblob NOT NULL,
  `yearlyvacationdays` int(11) NOT NULL DEFAULT 16,
  `basesalary` double NOT NULL,
  `branchID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `departmentID` int(11) NOT NULL,
  `positionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `employee_leave` (
  `leaveID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `leavetype` varchar(50) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `login` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT 'email of employee',
  `password` varchar(255) NOT NULL,
  `role` enum('general manager(admin)','manger(branch manager)','employee','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `managerID` varchar(255) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `middlename` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `primary_phone` varchar(15) NOT NULL,
  `secondary_phone` varchar(15) NOT NULL,
  `dateofjoin` date NOT NULL,
  `education_status` varchar(255) NOT NULL,
  `manager_photo` blob NOT NULL,
  `email` varchar(255) NOT NULL,
  `managerfile` longblob NOT NULL,
  `yearlyvacationdays` int(11) NOT NULL DEFAULT 18,
  `basesalary` double NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `departmentID` int(11) NOT NULL,
  `positionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `position` (
  `positionID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `positionname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `qrimage` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `salary` (
  `salaryID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  `workdays` int(11) NOT NULL,
  `present_days` int(11) NOT NULL,
  `absent_days` int(11) DEFAULT 0,
  `late_days` int(11) NOT NULL,
  `overtimedworkeddays` int(11) NOT NULL,
  `salary` double NOT NULL,
  `allowance` double NOT NULL DEFAULT 0,
  `deduction` double NOT NULL DEFAULT 0,
  `net` double NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `allowance`
  ADD PRIMARY KEY (`allowanceID`),
  ADD KEY `employeeID` (`employeeID`);
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendanceID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `branchmanager`
  ADD PRIMARY KEY (`managerID`,`branchID`),
  ADD KEY `branchID` (`branchID`);
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`deductionID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`);
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `departmentID` (`departmentID`),
  ADD KEY `branchID` (`branchID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `positionID` (`positionID`);
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`leaveID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `login`
  ADD PRIMARY KEY (`userID`);
ALTER TABLE `manager`
  ADD PRIMARY KEY (`managerID`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `departmentID` (`departmentID`),
  ADD KEY `positionID` (`positionID`),
  ADD KEY `userID` (`userID`);
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionID`),
  ADD KEY `departmentID` (`departmentID`);
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salaryID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `managerID` (`managerID`);
ALTER TABLE `allowance`
  MODIFY `allowanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `attendance`
  MODIFY `attendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `branch`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `deduction`
  MODIFY `deductionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
ALTER TABLE `department`
  MODIFY `departmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
ALTER TABLE `employee_leave`
  MODIFY `leaveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `login`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `position`
  MODIFY `positionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `qrcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
ALTER TABLE `salary`
  MODIFY `salaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
ALTER TABLE `allowance`
  ADD CONSTRAINT `allowance_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`);
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
ALTER TABLE `branchmanager`
  ADD CONSTRAINT `branchmanager_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`),
  ADD CONSTRAINT `branchmanager_ibfk_2` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `login` (`userID`),
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`);
ALTER TABLE `employee_leave`
  ADD CONSTRAINT `employee_leave_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `employee_leave_ibfk_2` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  ADD CONSTRAINT `manager_ibfk_3` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`),
  ADD CONSTRAINT `manager_ibfk_4` FOREIGN KEY (`userID`) REFERENCES `login` (`userID`);
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);
ALTER TABLE `qrcode`
  ADD CONSTRAINT `qrcode_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `qrcode_ibfk_2` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`managerID`) REFERENCES `manager` (`managerID`);
COMMIT;
