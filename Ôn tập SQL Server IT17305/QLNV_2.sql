USE [master]
use qlda
GO
drop database QLNV
use QLNV
/****** Object:  Table [dbo].[DIADIEM_PHG]    Script Date: 21/06/2022 10:56:11 PM ******/
CREATE DATABASE [QLNV]
GO
ALTER DATABASE [QLNV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
USE [QLNV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIADIEM_PHG](
	[MAPHG] [int] NOT NULL,
	[DIADIEM] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_DiaDiemPhong] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC,
	[DIADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 21/06/2022 10:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[HONV] [nvarchar](15) NOT NULL,
	[TENLOT] [nvarchar](15) NOT NULL,
	[TENNV] [nvarchar](15) NOT NULL,
	[MANV] [nvarchar](9) NOT NULL,
	[NGSINH] [datetime] NOT NULL,
	[DCHI] [nvarchar](30) NOT NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[LUONG] [float] NOT NULL,
	[MA_NQL] [nvarchar](9) NULL,
	[PHG] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 21/06/2022 10:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[TENPHG] [nvarchar](15) NOT NULL,
	[MAPHG] [int] NOT NULL,
	[TRPHG] [nvarchar](9) NULL,
	[NG_NHANCHUC] [date] NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 21/06/2022 10:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MA_NVIEN] [nvarchar](9) NOT NULL,
	[TENTN] [nvarchar](15) NOT NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[NGSINH] [date] NOT NULL,
	[QUANHE] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ThanNhan] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[TENTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (1, N'TP HCM')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (4, N'Hà Nội')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'Nha Trang')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'TP HCM')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'Vũng Tàu')
GO
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh', N'Quỳnh', N'Như', N'001', CAST(N'1967-02-01T00:00:00.000' AS DateTime), N'291 Hồ Văn Huê, TP HCM', N'Nữ', 43000, N'006', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Phan', N'Viet', N'The', N'002', CAST(N'1984-01-11T00:00:00.000' AS DateTime), N'778 nguyễn kiệm , TP hcm', N'', 30000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Trần', N'Thanh', N'Tâm', N'003', CAST(N'1957-05-04T00:00:00.000' AS DateTime), N'34 Mai Thị Lự, Tp Hồ Chí Minh', N'Nam', 25000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Nguyễn', N'Mạnh ', N'Hùng', N'004', CAST(N'1967-03-04T00:00:00.000' AS DateTime), N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Nguễn', N'Thanh', N'Tùng', N'005', CAST(N'1962-08-20T00:00:00.000' AS DateTime), N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, N'006', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Phạm', N'Văn', N'Vinh', N'006', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'15 Trưng Vương, Hà Nội', N'Nữ', 55000, NULL, 1)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Bùi ', N'Ngọc', N'Hành', N'007', CAST(N'1954-03-11T00:00:00.000' AS DateTime), N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Trần', N'Hồng', N'Quang', N'008', CAST(N'1967-09-01T00:00:00.000' AS DateTime), N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh ', N'Bá ', N'Tiên', N'009', CAST(N'1960-02-11T00:00:00.000' AS DateTime), N'119 Cống Quỳnh, Tp HCM', N'N', 30000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh ', N'Bá ', N'Tiên', N'017', CAST(N'1960-02-11T00:00:00.000' AS DateTime), N'119 Cống Quỳnh, Tp HCM', N'N', 30000, N'005', 5)
GO
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Quản Lý', 1, N'006', CAST(N'1971-06-19' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Điều Hành', 4, N'008', CAST(N'1985-01-01' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Nghiên Cứu', 5, N'005', CAST(N'0197-05-22' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'IT', 6, N'008', CAST(N'1985-01-01' AS Date))
GO
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'001', N'Minh', N'Nam', CAST(N'1932-02-29' AS Date), N'Vợ Chồng')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Khang', N'Nam', CAST(N'1973-10-25' AS Date), N'Con Trai')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Phương', N'Nữ', CAST(N'1948-05-03' AS Date), N'Vợ Chồng')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Trinh', N'Nữ', CAST(N'1976-04-05' AS Date), N'Con Gái')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Châu ', N'Nữ', CAST(N'1978-09-30' AS Date), N'Con Gái')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Phương', N'Nữ', CAST(N'1957-05-05' AS Date), N'Vợ Chồng')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Tiến ', N'Nam', CAST(N'1978-01-01' AS Date), N'Con Trai')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'017', N'Tiến ', N'Nam', CAST(N'1978-01-01' AS Date), N'Con Trai')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'006', N'Khang', N'Nam', CAST(N'1973-10-25' AS Date), N'Con Trai')

GO
ALTER TABLE [dbo].[DIADIEM_PHG]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_DiaDiemPhg] FOREIGN KEY([MAPHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DIADIEM_PHG] CHECK CONSTRAINT [FK_PhongBan_DiaDiemPhg]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhanVien] FOREIGN KEY([MA_NQL])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_NhanVien] FOREIGN KEY([PHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_PhongBan_NhanVien]
GO
ALTER TABLE [dbo].[PHONGBAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([TRPHG])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHONGBAN] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ThanNhan] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_NhanVien_ThanNhan]
GO


--Yêu cầu: 
--Câu 1: Cho biết thông tin (MANV, HoTenNV) của nhân viên có lương cao nhất.--select * from NHANVIENDECLARE @Max_Luong FLOATselect @Max_Luong = max(luong) from nhanvienselect  MANV, honv+' ' + TENLOT + ' ' + TENNV + ' ' as 'HoTenNV' from NHANVIEN where	(LUONG = @Max_Luong)--Câu 2: Cho biết thông tin (MANV, HoTenNV, TENPHG) của các trưởng phòng.--select * from PHONGBAN--select * from NHANVIENselect TRPHG from PHONGBANselect MANV,honv+' ' + TENLOT + ' ' + TENNV + ' ' as 'HoTenNV', TENPHG 	from nhanvien, PHONGBAN where 		NHANVIEN.MANV = PHONGBAN.TRPHG --Câu 3: Cho biết số lượng thân nhân của các trưởng phòng.select MA_NVIEN, count(ma_nvien) as 'SLTN' from PHONGBAN, THANNHAN	where MA_NVIEN = TRPHG group by MA_NVIEN--Câu 4: Cho biết địa chỉ của nhân viên chỉ hiển thị phần tên tỉnh/thành phố, 
--không hiển thị các thông tin khác như số nhà hay tên đường.
select substring(DCHI,CHARINDEX(',',DCHI,1)+1, len(DCHI)-CHARINDEX(',',DCHI,1)+1   ) from NHANVIEN


--Câu 5: Cho biết thông tin thân nhân của những nhân viên có MANV là số le DECLARE @max INT
 SELECT @max = MAX(cast(MA_NVIEN AS int))
	FROM dbo.THANNHAN
DECLARE @number INT = 2;
WHILE @number <= @max
BEGIN
	IF @number % 2 != 0
		SELECT * FROM THANNHAN
		WHERE (@number = cast(MA_NVIEN AS int))
	SET @number = @number + 1
END;



--Câu 6: Thực hiện chèn thêm một dòng dữ liệu vào bảng THANNHAN theo 2 bước
		-- Nhận thông báo “Thêm dữ liệu thành công” từ khối Try 
begin try 
insert into THANNHAN 
	values ('001', N'Đang','Nam','2003-10-12',N'Bạn')
end try
begin catch
	print N'Thêm không thành công do xảy ra lỗi'
end catch
		-- Chèn sai kiểu dữ liệu cột MA_NVIEN để nhận thông báo lỗi “Thêm dữ liệu thất bại” từ khối Catch
begin try 
insert into THANNHAN 
	values ('098', N'Đang','Nam','2003-10-12',N'Bạn')
end try
begin catch
	print N'Thêm không thành công do xảy ra lỗi'
end catch
---
select * from THANNHAN
delete THANNHAN where QUANHE like N'Bạn'


---Câu 7: Tạo SP, nhập vào @MANV và @TENTN, kiểm tra nhân viên đó có thân nhân là  @TENTN hay không
select * from THANNHAN

if OBJECT_ID('Sp_Find_TN') is not null
DROP PROC Sp_Find_TN
go
CREATE PROC Sp_Find_TN
	@MaNV varchar(9),
	@TENTN nvarchar(15)
AS
BEGIN
	if EXISTS (select TENTN from THANNHAN, NHANVIEN where 
				TENTN = @TENTN and MANV = @MaNV)
		print N'Có ' + N'tồn '+N'tại'
	else 
		print N'Không ' + N'tồn '+ N'tại'
END
go
exec Sp_Find_TN '001' , 'Minh'


--Câu 8: Viết Trigger, ràng buộc khi thêm mới thân nhân thì tuổi thân nhân phải > 5
if OBJECT_ID('TuoiThanNhan') is not null
DROP trigger TuoiThanNhan
go
create trigger TuoiThanNhan on THANNHAN
for insert
as
DECLARE @Tuoi int
select  @Tuoi = DATEDIFF(year, NGSINH, GETDATE()) FROM inserted 
if (@Tuoi <= 5)
begin
	print N'tuổi thân nhân phải > 5'
	rollback transaction
end

insert into THANNHAN
values ('001',N'Đang','Nam','2022-10-10','Em');

DELETE FROM THANNHAN WHERE TENTN like N'Đang'
SELECT * FROM THANNHAN

--Câu 9: Tạo view hiển thị tên trưởng phòng và thông tin thân nhân của các trưởng phòng
if OBJECT_ID('vie_TruongPhong') is not null
DROP view vie_TruongPhong
go
create view vie_TruongPhong
as
	select a.TENNV, c.*  from nhanvien a,phongban b,thannhan c where 
		a.MANV = b.TRPHG and b.TRPHG = c.MA_NVIEN
select * from vie_TruongPhong

--Câu 10: Viết hàm truyền tham số đầu vào là Tên nhân viên, 
--cho biết thông tin người quản lý nhân viên đó và số lượng thân nhân của người quản lý
select * from NHANVIEN
if OBJECT_ID ('fn_QuanLy') is not null
drop function fn_QuanLy
go
create function fn_QuanLy(@TenNV nvarchar(15))
returns table
	as
	return select a.*, count(ma_nvien) as 'SLTN' from nhanvien a, THANNHAN
		where (manv =  
		(select MA_NQL from NHANVIEN where TENNV like @TenNV ) ) and a.MANV = thannhan.MA_NVIEN
		group by a.DCHI, a.HONV, a.LUONG, a.MA_NQL, a.MANV, a.NGSINH, a.PHAI, a.PHG, a.TENLOT, a.TENNV

go
select * from [dbo].fn_QuanLy(N'Như') 

--Câu 11: Trong bảng nhân viên, tùy vào thông tin phái là nam hay nữ, 
--thêm vào tiền tố phía trước tên nhân viên là ‘Ông’ hoặc “Bà’ trường hợp ngược lại không thêm tiền tố.SELECT tennv = CASE phai 
WHEN 'nam' THEN 'Ông '+[tennv]
WHEN N'Nữ' THEN 'Bà '+[tennv]
else [tennv]
END
FROM dbo.NHANVIEN--Câu 12: Cập nhật thông tin nhân viên có MANV ‘017’ chuyển sang làm việc tại phòng số 6, --sau đó cập nhật nhân viên này làm Trưởng phòng phòng IT select * from NHANVIENselect * from PHONGBANupdate nhanvien
set phg = 6 where MANV = '017'
update Phongban 
set trphg = '017', NG_NHANCHUC = '2022-06-26' where TENPHG = 'IT'

--Câu 13: Cho biết thông tin nhân viên có lương lớn hơn lương của trưởng phòng phòng nghiên cứu --select * from phongban--select * from nhanvienDECLARE @LuongTrPHGNC floatselect @LuongTrPHGNC = (select luong from nhanvien where  manv = ( select trphg from phongban where tenphg = N'Nghiên Cứu'  )     )select * from nhanvien where luong > @LuongTrPHGNC

--Câu 14: Dùng lệnh IF kiểm tra xem có nhân viên nào thuộc phòng số 6 hay không, 
--nếu có hiển thị thông tin những nhân viên đó, 
--ngược lại hiển thị thông báo ‘Không có nhân viên thuộc phòng số 6’ 
--select * from NHANVIEN
if exists (select * from nhanvien where phg = 6)
begin 
	print 'Danh sach nhan vien phong so 6'
	select * from nhanvien where phg = 6
end
else 
print N'Không có nhân viên thuộc phòng số 6'

--Câu 15: Tạo SP, nhập vào @MANV và @MANQL, 
--kiểm tra nhân viên đó có người quản lý là @MANQL hay không 
select * from nhanvien
if OBJECT_ID('Sp_Find_NQL') is not null
DROP PROC Sp_Find_NQL
go
CREATE PROC Sp_Find_NQL
	@MaNV varchar(9),
	@MaNQL nvarchar(9)
AS
BEGIN
	if exists (select * from nhanvien where MA_NQL = @MaNQL and manv = @MaNV)
		begin
			print 'Ton tai nguoi quan li voi ma NV'
		end
	else 
		print 'Khong ton tai nguoi quan li voi ma NV'
END
go
exec Sp_Find_NQL '001' , '006'
exec Sp_Find_NQL '001' , '012'

--Câu 16: Tạo SP, nhập vào @MANV và @TRGPHG, 
--kiểm tra nhân viên đó có trưởng phòng là @ TRGPHG hay không 
select * from nhanvien
select * from phongban
if OBJECT_ID('Sp_Find_TrPHG') is not null
DROP PROC Sp_Find_TrPHG
go
CREATE PROC Sp_Find_TrPHG
	@MaNV varchar(9),
	@MaTrPHG nvarchar(9)
AS
BEGIN
	if exists (select * from nhanvien where phg =  ( select maphg from phongban where trphg = @MaTrPHG  ) 
		and manv = @MaNV)
		begin
			print 'Ton tai truong phong voi ma NV'
		end
	else 
		print 'Khong ton tai truong phong voi ma NV'
END
go
exec Sp_Find_TrPHG '001' , '008'
exec Sp_Find_TrPHG '001' , '012'

--Câu 17: Viết Trigger, ràng buộc khi thêm mới thân nhân thì tất cả thông tin không được NULL, 
--nếu có bất kỳ thông tin nào là NULL thì không thêm mới và hiển thị thông báo. 
--select * from thannhan
if OBJECT_ID('ThanNhanFieldNotNULL') is not null
DROP trigger ThanNhanFieldNotNULL
go
create trigger ThanNhanFieldNotNULL on THANNHAN
for insert
as
if (select MA_NVIEN FROM inserted) =''
	print 'Khong de trong ma nhan vien '
if (select tentn FROM inserted) = ''
	print 'Khong de trong ten nhan vien '
if (select phai FROM inserted) = ''
	print 'Khong de trong phai '
if (select ngsinh FROM inserted) = '' 
	print 'Khong de trong ngay sinh '
if (select quanhe FROM inserted) ='' 
	print 'Khong de trong quan he '
rollback transaction
insert into THANNHAN
values ('001',N'Đang','','1999-10-10','');
--delete thannhan where tentn = N'Đang'