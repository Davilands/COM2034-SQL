CREATE DATABASE QLDA_LAB2
GO
USE QLDA_Lab2
GO
USE QLGH_Dangthpc04349

CREATE TABLE NHANVIEN
(
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	MANV VARCHAR(9) PRIMARY KEY,
	NGSINH DATE,
	DCHI NVARCHAR(30),
	PHAI NVARCHAR(3),
	LUONG INT,
	MA_NQL VARCHAR(9),
	PHG INT,
)

CREATE TABLE PHONGBAN
(
	TENPHG NVARCHAR(15),
	MAPHG INT PRIMARY KEY,
	TRPHG VARCHAR(9),
	NG_NHANCHUC DATE
)

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT,
	DIADIEM NVARCHAR(15),
	PRIMARY KEY(MAPHG,DIADIEM),
)

CREATE TABLE THANNHAN
(
	MA_NVIEN VARCHAR(9),
	TENTN NVARCHAR(15),
	PHAI NVARCHAR(3),
	NGSINH DATE,
	QUANHE NVARCHAR(15),
	PRIMARY KEY(MA_NVIEN,TENTN)
)

CREATE TABLE DEAN
(
	TENDA NVARCHAR(15),
	MADA INT PRIMARY KEY,
	DDIEM_DA NVARCHAR(15),
	PHONG INT
)

CREATE TABLE CONGVIEC
(
	MADA INT,
	STT INT,
	TEN_CONG_VIEC NVARCHAR(50),
	PRIMARY KEY(MADA,STT)
)

CREATE TABLE PHANCONG
(
	MA_NVIEN VARCHAR(9),
	MADA INT,
	STT INT,
	THOIGIAN REAL,
	PRIMARY KEY(MA_NVIEN,MADA,STT)
)

--DIADIEM
ALTER TABLE dbo.DIADIEM_PHG ADD FOREIGN KEY(MAPHG) REFERENCES dbo.PHONGBAN(MAPHG) 
--PHONGBAN
ALTER TABLE PHONGBAN ADD FOREIGN KEY(TRPHG) REFERENCES NHANVIEN(MANV)
--NHANVIEN
ALTER TABLE dbo.NHANVIEN ADD FOREIGN KEY(PHG) REFERENCES dbo.PHONGBAN(MAPHG)

ALTER TABLE dbo.NHANVIEN ADD FOREIGN KEY(MA_NQL) REFERENCES dbo.NHANVIEN(MANV)
--THANNHAN
ALTER TABLE dbo.THANNHAN ADD FOREIGN KEY(MA_NVIEN) REFERENCES dbo.NHANVIEN(MANV)
--DEAN
ALTER TABLE dbo.DEAN ADD FOREIGN KEY(PHONG) REFERENCES dbo.PHONGBAN(MAPHG)
--CONGVIEC
ALTER TABLE dbo.CONGVIEC ADD FOREIGN KEY(MADA) REFERENCES dbo.DEAN(MADA)
--PHANCONG
ALTER TABLE dbo.PHANCONG ADD FOREIGN KEY(MADA,STT) REFERENCES dbo.CONGVIEC(MADA,STT)
ALTER TABLE dbo.PHANCONG ADD FOREIGN KEY(MA_NVIEN) REFERENCES dbo.NHANVIEN(MANV)

INSERT INTO dbo.NHANVIEN
VALUES
(   N'Đình', N'Bá', N'Tiên', '009',  '1960-02-11',N'119 Cổng Quỳnh, Tp HCM',N'Nam',30000,'005','5' ),
(   N'Nguyễn', N'Thanh', N'Tùng', '005',  '1962-08-20',N'222 Nguyễn Văn Cừ, Tp HCM',N'Nam',40000,'006','5' ),
(   N'Bùi', N'Ngọc', N'Hằng', '007',  '1954-3-11',N'332 Nguyễn Thái Học, Tp HCM',N'Nam',25000,'001','4' ),
(   N'Lê', N'Quỳnh', N'Như', '001',  '1967-02-01',N'291 Hồ Văn Huê, Tp HCM',N'Nữ',43000,'006','4' ),
(   N'Nguyễn', N'Mạnh', N'Hùng', '004',  '1967-03-04',N'95 Bà Rịa, Vùng Tàu',N'Nam',38000,'005','5' ),
(   N'Trần', N'Thanh', N'Tâm', '003',  '1957-05-04',N'34 Mai Thị Lự, Tp HCM',N'Nam',25000,'005','5' ),
(   N'Trần', N'Hồng', N'Quang', '008',  '1967-09-01',N'80 Lê Hồng Phong, Tp HCM',N'Nam',25000,'001','4' ),
(   N'Phạm', N'Văn', N'Vinh', '006',  '1965-01-01',N'45 Trưng Vương, Hà Nội',N'Nữ',55000, NULL,'1' )

INSERT INTO dbo.PHONGBAN
VALUES
(   N'Nghiên cứu', 5, '005', '1978-05-22' ),
(   N'Điều hành', 4, '008', '1985-01-01' ),
(   N'Quản lý', 1, '006', '1971-06-19' )

INSERT INTO dbo.DIADIEM_PHG
VALUES
(  1, N'TP HCM'),
(  4, N'Hà Nội'),
(  5, N'Vũng Tàu'),
(  5, N'NHA TRANG'),
(  5, N'TP HCM')

INSERT INTO dbo.THANNHAN
VALUES
(   '005', N'Trinh', N'Nữ', '1976-04-05',N'Con gái' ),
(   '005', N'Khang', N'Nam', '1973-10-25',N'Con trai' ),
(   '005', N'Phương', N'Nữ', '1948-05-03',N'Vợ chồng' ),
(   '001', N'Minh', N'Nam', '1932-02-29',N'Vợ chồng' ),
(   '009', N'Tiến', N'Nam', '1978-01-01',N'Con trai' ),
(   '009', N'Châu', N'Nữ', '1978-12-30',N'Con gái' ),
(   '009', N'Phương', N'Nữ', '1957-05-05',N'Vợ chồng' )

INSERT INTO dbo.DEAN
VALUES
(   N'Sản phẩm X', 1, N'Vũng Tàu', 5 ),
(   N'Sản phẩm Y', 2, N'Nha Trang', 5 ),
(   N'Sản phẩm Z', 3, N'TP HCM', 5 ),
(   N'Tin học hóa', 10, N'Hà Nội', 4 ),
(   N'Cáp quang', 20, N'TP HCM', 1 ),
(   N'Đào tạo', 30, N'Hà Nội', 4 )


INSERT INTO dbo.CONGVIEC
VALUES
(   1, 1, N'Thiết kế sản phẩm X'),
(   1, 2, N'Thử nghiệm sản phẩm X'),
(   2, 1, N'Sản xuất sản phẩm Y'),
(   2, 2, N'Quảng cáo sản phẩm Y'),
(   3, 1, N'Khuyến mãi sản phẩm Z'),
(   10, 1, N'Tin học hóa phòng nhân sự'),
(   10, 2, N'Tin học hóa phòng kinh doanh'),
(   20, 1, N'Lắp đặt cáp quang'),
(   30, 1, N'Đào tạo nhân viên Marketing'),
(   30, 2, N'Đào tạo chuyên viên thiết kế')

INSERT INTO dbo.PHANCONG
VALUES
(   '009', 1, 1, 32),
(   '009', 2, 2, 8),
(   '004', 3, 1, 40),
(   '003', 1, 2, 20.0),
(   '003', 2, 1, 20.0),
(   '008', 10, 1, 35),
(   '008', 30, 2, 5),
(   '001', 30, 1, 20),
(   '001', 20, 1, 15),
(   '006', 20, 1, 30),
(   '005', 3, 1, 10),
(   '005', 10, 2, 10),
(   '005', 20, 1, 10),
(   '007', 30, 2, 30),
(   '007', 10, 2, 10)

