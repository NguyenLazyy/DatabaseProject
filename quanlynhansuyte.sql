-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 05:24 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlynhansuyte`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChoBietBacLuongTheoChucVu` (IN `ChucVu` VARCHAR(50))  BEGIN
select BacLuong from nhanvien
inner join chucvu
ON chucvu.MaCVu = nhanvien.MaCVu
where TenCvu = ChucVu;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ChoBietChucVuCuaNhanVienBangMa` (IN `MaNV` VARCHAR(10))  BEGIN
select chucvu.MaCVu,count(chucvu.TenCVu)
from chucvu
inner join nhanvien
on nhanvien.MaCVu=chucvu.MaCVu
where MaNV = nhanvien.MaNV ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Del_Staff_By_MaNv` (IN `MaNV` VARCHAR(10))  BEGIN
DELETE from nhanvien
WHERE MaNV = nhanvien.MaNV;
SELECT * from nhanvien;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Information_Staff_By_HoTen` (IN `HoTen` VARCHAR(50))  BEGIN
SELECT * FROM nhanvien
where HoTen = nhanvien.HoTen;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Information_Staff_By_MaNV` (IN `MaNv` VARCHAR(10))  BEGIN
SELECT * from nhanvien
where MaNV = nhanvien.MaNV;
End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_ChucVu` (IN `MaVu` VARCHAR(10), IN `TenVCu` VARCHAR(50))  begin
insert into chucvu
values(MaCvu, tenCvu);
SELECT * from chucvu;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_HopDongLaoDong` (IN `MaHD` VARCHAR(10), IN `MaNV` VARCHAR(10), IN `LoaiHD` VARCHAR(20), IN `TuNgay` DATETIME, IN `DenNgay` DATETIME)  begin
insert into hopdonglaodong
VALUES
(MaHD, MaNV, LoaiHD, TuNgay, DenNgay);
SELECT * from hopdonglaodong;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Staff` (IN `MaNV` VARCHAR(10), IN `HoTen` VARCHAR(50), IN `NgaySinh` DATE, IN `QueQuan` VARCHAR(100), IN `GioiTinh` ENUM('Nam','Nữ','Khác',''), IN `DanToc` VARCHAR(20), IN `SoDienThoai` VARCHAR(20), IN `MaPB` VARCHAR(10), IN `MaCvu` VARCHAR(10), IN `MaCV` VARCHAR(10), IN `MaTDHV` VARCHAR(10), IN `BacLuong` CHAR)  BEGIN
insert into nhanvien
VALUES(MaNV, HoTen, NgaySinh,
       QueQuan, GioiTinh,DanToc, SoDienThoai, MaPB, MaCVu, MaCV, MaTDHV,BacLuong);
       SELECT* from nhanvien;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `SoLuongHopDongTheoLoai` (`LoaiHD` VARCHAR(20)) RETURNS VARCHAR(20) CHARSET utf8mb4 BEGIN
RETURN
(SELECT count(hopdonglaodong.LoaiHD)
 from hopdonglaodong
 where LoaiHD = hopdonglaodong.LoaiHD
GROUP by hopdonglaodong.LoaiHD);
 END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `SoLuongNhanVienTrongPhongBan` (`MaPB` VARCHAR(10)) RETURNS INT(11) return (SELECT sl_nv_pb.SoLuongNV
        from sl_nv_pb
        where MaPB= sl_nv_pb.MaPB)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bacluongcuachucvutruongphong`
-- (See below for the actual view)
--
CREATE TABLE `bacluongcuachucvutruongphong` (
`BacLuong` char(1)
,`HoTen` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `chucvu`
--

CREATE TABLE `chucvu` (
  `MaCVu` varchar(10) NOT NULL,
  `TenCVu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chucvu`
--

INSERT INTO `chucvu` (`MaCVu`, `TenCVu`) VALUES
('NV', 'Nhan Vien'),
('PK', 'Pho Khoa'),
('TK', 'Thu Ky'),
('TP', 'Truong Khoa');

-- --------------------------------------------------------

--
-- Stand-in structure for view `cnganhcuanhanvientdhvdaihoc`
-- (See below for the actual view)
--
CREATE TABLE `cnganhcuanhanvientdhvdaihoc` (
`HoTen` varchar(50)
,`CNganh` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `congviec`
--

CREATE TABLE `congviec` (
  `MaCV` varchar(10) NOT NULL,
  `TenCV` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `congviec`
--

INSERT INTO `congviec` (`MaCV`, `TenCV`) VALUES
('BS', 'Bac Si'),
('BSPT', 'Bac Si Phau Thuat'),
('DD', 'Dieu Duong'),
('DS', 'Duoc Si'),
('YT', 'Y ta');

-- --------------------------------------------------------

--
-- Stand-in structure for view `danhsachnhanviencohopdongtunam2010`
-- (See below for the actual view)
--
CREATE TABLE `danhsachnhanviencohopdongtunam2010` (
`MaNV` varchar(10)
,`HoTen` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ds_nv_hethanhopdongnam2021`
-- (See below for the actual view)
--
CREATE TABLE `ds_nv_hethanhopdongnam2021` (
`MaNV` varchar(10)
,`DenNgay` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ds_nv_pb_khoanhi`
-- (See below for the actual view)
--
CREATE TABLE `ds_nv_pb_khoanhi` (
`MaNV` varchar(10)
,`HoTen` varchar(50)
,`TenPB` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `hopdonglaodong`
--

CREATE TABLE `hopdonglaodong` (
  `MaHD` varchar(10) NOT NULL,
  `MaNV` varchar(10) DEFAULT NULL,
  `LoaiHD` varchar(20) DEFAULT NULL,
  `TuNgay` datetime DEFAULT NULL,
  `DenNgay` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hopdonglaodong`
--

INSERT INTO `hopdonglaodong` (`MaHD`, `MaNV`, `LoaiHD`, `TuNgay`, `DenNgay`) VALUES
('DHNTML', 'NTML02', 'Dai Han', '2021-09-08 00:00:00', '2030-09-20 00:00:00'),
('NHDTMH', 'DTMH01', 'Ngan Han', '2021-11-15 00:00:00', '2015-11-20 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `hspc_cua_nv_pb_ks`
-- (See below for the actual view)
--
CREATE TABLE `hspc_cua_nv_pb_ks` (
`hoten` varchar(50)
,`HSPC` decimal(7,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `luong`
--

CREATE TABLE `luong` (
  `BacLuong` char(1) NOT NULL,
  `LuongCB` decimal(10,2) NOT NULL,
  `HSLuong` float(7,1) NOT NULL,
  `PhuCap` decimal(7,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `luong`
--

INSERT INTO `luong` (`BacLuong`, `LuongCB`, `HSLuong`, `PhuCap`) VALUES
('1', '15000000.00', 2.5, '250000.0'),
('2', '13000000.00', 2.3, '240000.0'),
('3', '10000000.00', 1.5, '210000.0'),
('4', '9000000.00', 0.9, '190000.0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `luongcb_nv_tdhv_daihoc`
-- (See below for the actual view)
--
CREATE TABLE `luongcb_nv_tdhv_daihoc` (
`HoTen` varchar(50)
,`LuongCB` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `luongcuanhanvien`
-- (See below for the actual view)
--
CREATE TABLE `luongcuanhanvien` (
`HoTen` varchar(50)
,`Luong` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` varchar(10) NOT NULL,
  `HoTen` varchar(50) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `QueQuan` varchar(100) DEFAULT NULL,
  `GioiTinh` enum('Nam','Nữ','Khác') DEFAULT NULL,
  `DanToc` varchar(20) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `MaPB` varchar(10) DEFAULT NULL,
  `MaCVu` varchar(10) DEFAULT NULL,
  `MaCV` varchar(10) DEFAULT NULL,
  `MaTDHV` varchar(10) DEFAULT NULL,
  `BacLuong` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `NgaySinh`, `QueQuan`, `GioiTinh`, `DanToc`, `SoDienThoai`, `MaPB`, `MaCVu`, `MaCV`, `MaTDHV`, `BacLuong`) VALUES
('DDA92', 'Dao Duy Anh', '1992-08-07', 'Da Nang', 'Nam', 'Kinh', '0986122345', 'KXN', 'TP', 'BS', 'DH', '1'),
('DTMH01', 'Doan Thi My Hanh', '1992-08-03', 'Quang Binh', 'Nữ', 'Kinh', '098613077', 'KNoi', 'NV', 'YT', 'CD', '3'),
('NTKL02', 'Nguyen Thi Khanh Linh', '2002-11-20', 'Quang Binh', 'Nữ', 'Kinh', '0838410058', 'KN', 'TP', 'BS', 'DH', '1'),
('NTML02', 'Nguyen Thi My Linh', '1991-09-04', 'Quang Binh', 'Nữ', 'Kinh', '0987130666', 'KS', 'PK', 'YT', 'DH', '2');

--
-- Triggers `nhanvien`
--
DELIMITER $$
CREATE TRIGGER `del_nhanvien` BEFORE DELETE ON `nhanvien` FOR EACH ROW DELETE from hopdonglaodong
WHERE MaNV=old.MaNV
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `nhanviencotrinhdotrendaihoc`
-- (See below for the actual view)
--
CREATE TABLE `nhanviencotrinhdotrendaihoc` (
`MaNV` varchar(10)
,`HoTen` varchar(50)
,`NgaySinh` date
,`QueQuan` varchar(100)
,`GioiTinh` enum('Nam','Nữ','Khác')
,`DanToc` varchar(20)
,`SoDienThoai` varchar(20)
,`MaPB` varchar(10)
,`MaCVu` varchar(10)
,`MaCV` varchar(10)
,`MaTDHV` varchar(10)
,`BacLuong` char(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `nhanvienlamvieclaunhat`
-- (See below for the actual view)
--
CREATE TABLE `nhanvienlamvieclaunhat` (
`MaNV` varchar(10)
,`HoTen` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `MaPB` varchar(10) NOT NULL,
  `TenPB` varchar(50) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `SDTPB` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`MaPB`, `TenPB`, `DiaChi`, `SDTPB`) VALUES
('KD', 'Khoa Duoc', '81 Le Huu Trac', '0236 3946 869'),
('KKBDK', 'Khoa Kham Benh Da Khoa', '81 Le Huu Trac', '0988670789'),
('KN', 'Khoa Nhi', '81 Le Huu Trac', '834524948'),
('KNgoai', 'Khoa Ngoai', '81 Le Huu Trac', '0838410058'),
('KNoi', 'Khoa Noi', '81 Le Huu Trac', '0934524360'),
('KS', 'Khoa San', '81 Le Huu Trac', '0986130777'),
('KXN', 'Khoa Xet Nghiem', '81 Le Huu Trac', '0884563458'),
('PB', 'Phong Benh', '81 Le Huu Trac', '09125621999');

-- --------------------------------------------------------

--
-- Stand-in structure for view `sl_nv_pb`
-- (See below for the actual view)
--
CREATE TABLE `sl_nv_pb` (
`SoLuongNV` bigint(21)
,`MaPB` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `trinhdohocvan`
--

CREATE TABLE `trinhdohocvan` (
  `MaTDHV` varchar(10) NOT NULL,
  `TTDHV` varchar(50) NOT NULL,
  `Cnganh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trinhdohocvan`
--

INSERT INTO `trinhdohocvan` (`MaTDHV`, `TTDHV`, `Cnganh`) VALUES
('CD', 'Cao Dang', 'Y Hoc Co Truyen'),
('DH', 'Dai Hoc', 'Rang Ham Mat'),
('TC', 'Trung Cap', 'Khoa Hoc Co Ban'),
('ThacS', 'Thac Si', 'Dieu Duong'),
('TienS', 'Tien Si', 'Khoa Y');

--
-- Triggers `trinhdohocvan`
--
DELIMITER $$
CREATE TRIGGER `del_trinhdohocvan` AFTER DELETE ON `trinhdohocvan` FOR EACH ROW DELETE from nhanvien
WHERE MaTDHV=old.MaTDHV
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_trinhdohocvan` BEFORE UPDATE ON `trinhdohocvan` FOR EACH ROW UPDATE hoadonnhapgoc
set MaTDHV = new.MaTDHV
where new.MaTDHV = old.MaTDHV
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `bacluongcuachucvutruongphong`
--
DROP TABLE IF EXISTS `bacluongcuachucvutruongphong`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bacluongcuachucvutruongphong`  AS SELECT `nhanvien`.`BacLuong` AS `BacLuong`, `nhanvien`.`HoTen` AS `HoTen` FROM `nhanvien` WHERE `nhanvien`.`MaCVu` = 'TP' ;

-- --------------------------------------------------------

--
-- Structure for view `cnganhcuanhanvientdhvdaihoc`
--
DROP TABLE IF EXISTS `cnganhcuanhanvientdhvdaihoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cnganhcuanhanvientdhvdaihoc`  AS SELECT `nhanvien`.`HoTen` AS `HoTen`, `trinhdohocvan`.`Cnganh` AS `CNganh` FROM (`trinhdohocvan` join `nhanvien` on(`trinhdohocvan`.`MaTDHV` = `nhanvien`.`MaTDHV`)) WHERE `trinhdohocvan`.`TTDHV` = 'Dai Hoc' ;

-- --------------------------------------------------------

--
-- Structure for view `danhsachnhanviencohopdongtunam2010`
--
DROP TABLE IF EXISTS `danhsachnhanviencohopdongtunam2010`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `danhsachnhanviencohopdongtunam2010`  AS SELECT `nhanvien`.`MaNV` AS `MaNV`, `nhanvien`.`HoTen` AS `HoTen` FROM (`nhanvien` join `hopdonglaodong` on(`hopdonglaodong`.`MaNV` = `nhanvien`.`MaNV`)) WHERE year(`hopdonglaodong`.`TuNgay`) = 2010 ;

-- --------------------------------------------------------

--
-- Structure for view `ds_nv_hethanhopdongnam2021`
--
DROP TABLE IF EXISTS `ds_nv_hethanhopdongnam2021`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ds_nv_hethanhopdongnam2021`  AS SELECT `nhanvien`.`MaNV` AS `MaNV`, `hopdonglaodong`.`DenNgay` AS `DenNgay` FROM (`nhanvien` join `hopdonglaodong` on(`hopdonglaodong`.`MaNV` = `nhanvien`.`MaNV`)) WHERE year(`hopdonglaodong`.`DenNgay`) = 2021 ;

-- --------------------------------------------------------

--
-- Structure for view `ds_nv_pb_khoanhi`
--
DROP TABLE IF EXISTS `ds_nv_pb_khoanhi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ds_nv_pb_khoanhi`  AS SELECT `nhanvien`.`MaNV` AS `MaNV`, `nhanvien`.`HoTen` AS `HoTen`, `phongban`.`TenPB` AS `TenPB` FROM (`nhanvien` join `phongban` on(`nhanvien`.`MaPB` = `phongban`.`MaPB`)) WHERE `phongban`.`MaPB` = 'KN' ;

-- --------------------------------------------------------

--
-- Structure for view `hspc_cua_nv_pb_ks`
--
DROP TABLE IF EXISTS `hspc_cua_nv_pb_ks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hspc_cua_nv_pb_ks`  AS SELECT `nhanvien`.`HoTen` AS `hoten`, `luong`.`PhuCap` AS `HSPC` FROM (`luong` join `nhanvien` on(`luong`.`BacLuong` = `nhanvien`.`BacLuong`)) WHERE `nhanvien`.`MaPB` = 'KS' ;

-- --------------------------------------------------------

--
-- Structure for view `luongcb_nv_tdhv_daihoc`
--
DROP TABLE IF EXISTS `luongcb_nv_tdhv_daihoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `luongcb_nv_tdhv_daihoc`  AS SELECT `nhanvien`.`HoTen` AS `HoTen`, `luong`.`LuongCB` AS `LuongCB` FROM (`luong` join `nhanvien` on(`luong`.`BacLuong` = `nhanvien`.`BacLuong`)) WHERE `nhanvien`.`MaTDHV` = 'DH' ;

-- --------------------------------------------------------

--
-- Structure for view `luongcuanhanvien`
--
DROP TABLE IF EXISTS `luongcuanhanvien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `luongcuanhanvien`  AS SELECT `nhanvien`.`HoTen` AS `HoTen`, `luong`.`LuongCB`* `luong`.`HSLuong` + `luong`.`PhuCap` AS `Luong` FROM (`luong` join `nhanvien` on(`nhanvien`.`BacLuong` = `luong`.`BacLuong`)) GROUP BY `nhanvien`.`HoTen` ;

-- --------------------------------------------------------

--
-- Structure for view `nhanviencotrinhdotrendaihoc`
--
DROP TABLE IF EXISTS `nhanviencotrinhdotrendaihoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nhanviencotrinhdotrendaihoc`  AS SELECT `nhanvien`.`MaNV` AS `MaNV`, `nhanvien`.`HoTen` AS `HoTen`, `nhanvien`.`NgaySinh` AS `NgaySinh`, `nhanvien`.`QueQuan` AS `QueQuan`, `nhanvien`.`GioiTinh` AS `GioiTinh`, `nhanvien`.`DanToc` AS `DanToc`, `nhanvien`.`SoDienThoai` AS `SoDienThoai`, `nhanvien`.`MaPB` AS `MaPB`, `nhanvien`.`MaCVu` AS `MaCVu`, `nhanvien`.`MaCV` AS `MaCV`, `nhanvien`.`MaTDHV` AS `MaTDHV`, `nhanvien`.`BacLuong` AS `BacLuong` FROM `nhanvien` WHERE `nhanvien`.`MaTDHV` = 'TienS' OR `nhanvien`.`MaTDHV` = 'ThacS' GROUP BY `nhanvien`.`MaNV` ;

-- --------------------------------------------------------

--
-- Structure for view `nhanvienlamvieclaunhat`
--
DROP TABLE IF EXISTS `nhanvienlamvieclaunhat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nhanvienlamvieclaunhat`  AS SELECT `nhanvien`.`MaNV` AS `MaNV`, `nhanvien`.`HoTen` AS `HoTen` FROM (`nhanvien` join `hopdonglaodong` on(`nhanvien`.`MaNV` = `hopdonglaodong`.`MaNV`)) WHERE 2021 - `hopdonglaodong`.`TuNgay` = (select max(2021 - `hopdonglaodong`.`TuNgay`) from `hopdonglaodong`) ;

-- --------------------------------------------------------

--
-- Structure for view `sl_nv_pb`
--
DROP TABLE IF EXISTS `sl_nv_pb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sl_nv_pb`  AS SELECT count(`nhanvien`.`MaNV`) AS `SoLuongNV`, `phongban`.`MaPB` AS `MaPB` FROM (`nhanvien` join `phongban` on(`phongban`.`MaPB` = `nhanvien`.`MaPB`)) GROUP BY `phongban`.`MaPB` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`MaCVu`);

--
-- Indexes for table `congviec`
--
ALTER TABLE `congviec`
  ADD PRIMARY KEY (`MaCV`);

--
-- Indexes for table `hopdonglaodong`
--
ALTER TABLE `hopdonglaodong`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `MaNV` (`MaNV`);

--
-- Indexes for table `luong`
--
ALTER TABLE `luong`
  ADD PRIMARY KEY (`BacLuong`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD KEY `MaPB` (`MaPB`),
  ADD KEY `MaCVu` (`MaCVu`),
  ADD KEY `MaCV` (`MaCV`),
  ADD KEY `MaTDHV` (`MaTDHV`),
  ADD KEY `BacLuong` (`BacLuong`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`MaPB`);

--
-- Indexes for table `trinhdohocvan`
--
ALTER TABLE `trinhdohocvan`
  ADD PRIMARY KEY (`MaTDHV`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hopdonglaodong`
--
ALTER TABLE `hopdonglaodong`
  ADD CONSTRAINT `hopdonglaodong_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaPB`) REFERENCES `phongban` (`MaPB`),
  ADD CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`MaCV`) REFERENCES `congviec` (`MaCV`),
  ADD CONSTRAINT `nhanvien_ibfk_4` FOREIGN KEY (`MaTDHV`) REFERENCES `trinhdohocvan` (`MaTDHV`),
  ADD CONSTRAINT `nhanvien_ibfk_5` FOREIGN KEY (`BacLuong`) REFERENCES `luong` (`BacLuong`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
