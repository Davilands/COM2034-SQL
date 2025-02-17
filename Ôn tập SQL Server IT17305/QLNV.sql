USE [master]
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


--Câu 5: Cho biết thông tin thân nhân của những nhân viên có MANV là số leselect * from thannhan where (cast(MA_NVIEN AS int) % 2 != 0)



--===========================BUỔI 2 ====================

--Câu 6: Thực hiện chèn thêm một dòng dữ liệu vào bảng THANNHAN theo 2 bước
	select * from THANNHAN
		-- Nhận thông báo “Thêm dữ liệu thành công” từ khối Try 
		begin try
			insert into THANNHAN
			values ('001',N'An','Nam','2003-03-03','SugarDaddy')
			print 'Them du lieu thanh cong'
		end try
		begin catch
			print 'Them du lieu khong thanh cong'
		end catch
		-- Chèn sai kiểu dữ liệu cột MA_NVIEN để nhận thông báo lỗi “Thêm dữ liệu thất bại” từ khối Catch
		begin try
			insert into THANNHAN
			values ('012',N'An','Nam','2003-03-03','SugarDaddy')
			print 'Them du lieu thanh cong'
		end try
		begin catch
			print 'Them du lieu khong thanh cong'
		end catch

---Câu 7: Tạo SP, nhập vào @MANV và @TENTN, kiểm tra nhân viên đó có thân nhân là  @TENTN hay không
select * from THANNHAN
create proc Sp_Find_TN
	@MANV varchar(9),
	@TENTN nvarchar(15)
as
begin
	if EXISTS (select TENTN from THANNHAN, NHANVIEN where 
			TENTN = @TENTN and manv = @MANV)
		print 'Co ton tai'
	else 
		print 'Khong ton tai'
		
end
go 
exec Sp_Find_TN '012', 'Khang'

--Câu 8: Viết Trigger, ràng buộc khi 'thêm mới' thân nhân thì tuổi thân nhân phải > 5
create trigger TuoiTN on Thannhan
for insert 
as 
declare @Tuoi int 
select @Tuoi = DATEDIFF(year, ngsinh, GETDATE()) from inserted
if (@Tuoi <= 5 )
	begin
		print 'Tuoi than nhan phai > 5'
		rollback transaction
	end
	insert into THANNHAN
			values ('001',N'Nam','Nam','1999-03-03','SugarDaddy')


--Câu 9: Tạo view hiển thị tên trưởng phòng và thông tin thân nhân của các trưởng phòng
select * from  nhanvien
select * from PHONGBAN

select * from THANNHAN
create view vie_TrPhong
as
	select a.TENNV, c.* from NHANVIEN a, PHONGBAN b, THANNHAN c where 
		a.MANV = b.TRPHG and b.TRPHG = c.MA_NVIEN 

select * from vie_TrPhong

--Câu 10: Viết hàm(function) truyền tham số đầu vào là Tên nhân viên, 
--cho biết thông tin người quản lý nhân viên đó và số lượng thân nhân của người quản lý count(ma_nvien)
select * from NHANVIEN
select * from THANNHAN
create function fn_QuanLy(@TenNV nvarchar(15))
returns table 
as 
	return select a.* , count(ma_nvien) as 'SLTN' from NHANVIEN a, THANNHAN b where 
	(manv = (select MA_NQL from NHANVIEN where TENNV = @TenNV) and a.MANV = b.MA_NVIEN )
		group by a.honv, a.tenlot, a.tennv, a.manv, a.ngsinh, a.dchi, a.phai, a.luong, a.ma_nql, a.phg
go
select * from fn_QuanLy(N'Như')

/*
HÀM (FUNCTION) --> DL TRẢ VỀ(KIỂU DL)
RETURN  =  DL TRẢ VỀ 
			nếu là bảng (select)
			nếu là int --> số
RETURNS = KIỂU DL TRẢ VỀ [varchar nvarchar int float...]
*/


--Câu 11: Trong bảng nhân viên, tùy vào thông tin phái là nam hay nữ, 
--thêm vào tiền tố phía trước tên nhân viên là ‘Ông’ hoặc “Bà’ trường hợp ngược lại không thêm tiền tố.--select * from nhanvienselect tennv = case phai when 'Nam' then 'Ông ' + [tennv]when N'Nữ' then 'Bà ' + [tennv]else [tennv]endfrom nhanvien --Câu 12: Cập nhật thông tin nhân viên có MANV ‘017’ chuyển sang làm việc tại phòng số 6, --sau đó cập nhật nhân viên này làm Trưởng phòng phòng IT select * from nhanvien
select * from phongban 
update NHANVIEN
set PHG = 6 where MANV = '017'
update PHONGBAN
set TRPHG = '017' where TENPHG = 'IT'




--Câu 13: Cho biết thông tin nhân viên có lương lớn, nho hơn lương của trưởng phòng phòng nghiên cứu --select * from phongban--select * from nhanvienselect * from NHANVIENselect * from PHONGBANdeclare @LuongTrPhgNC float
select @LuongTrPhgNC = 	(select luong from NHANVIEN where 
	MANV = (select trphg from PHONGBAN where tenphg = N'Nghiên Cứu'))
	select * from NHANVIEN where LUONG < @LuongTrPhgNC


--Câu 14: Dùng lệnh IF kiểm tra xem có nhân viên nào thuộc phòng số 6 hay không, 
	--(kt có tồn tại NV nào thuộc phòng 6)
--nếu có hiển thị thông tin những nhân viên đó, 
--ngược lại hiển thị thông báo ‘Không có nhân viên thuộc phòng số 6’ 
--select * from NHANVIEN
	if exists (select * from NHANVIEN where phg = 6)
		select * from NHANVIEN where phg = 6
	else 
		print N'Không có nhân viên thuộc phòng số 6'


--Câu 15: Tạo SP, nhập vào @MANV và @MANQL, 
--kiểm tra nhân viên đó có người quản lý là @MANQL hay không 
select * from NHANVIEN
create proc Sp_Find_NQL
	@MANV varchar(9),
	@MANQL nvarchar(9)
as
begin
	if exists (select * from NHANVIEN where MANV = @MANV and MA_NQL = @MANQL)
		print 'Co ton tai'
	else 
		print 'Khong ton tai'
end
exec Sp_Find_NQL '002', '001'
exec Sp_Find_NQL '012', '001'


--Câu 16: Tạo SP, nhập vào @MANV và @TRGPHG, 
--kiểm tra nhân viên đó có trưởng phòng là @TRGPHG hay không 
select * from PHONGBAN
select * from NHANVIEN
create proc Sp_Find_TrPHG
	@MANV varchar(9),
	@TRPhg nvarchar(9)
as
begin
	if exists (select * from NHANVIEN where phg = (select maphg from PHONGBAN where TRPHG = @TRPhg) 
		and manv = @MANV)
		print 'Co ton tai'
	else 
		print 'Khong ton tai'
end
exec Sp_Find_TrPHG '001', '008'
exec Sp_Find_TrPHG '003', '005'



--Câu 17: Viết Trigger, ràng buộc khi 'thêm mới' = insert(ed) thân nhân thì tất cả thông tin không được NULL, 
--nếu có bất kỳ thông tin nào là NULL thì không thêm mới và hiển thị thông báo. 
--select * from thannhan
create trigger ThanNhanFieldNotNULL on thannhan
for insert
as
	if (select ma_nvien from inserted) = ''
		print 'Khong de trong ma nhan vien'
	if (select TENTN from inserted) = ''
		print 'Khong de trong ten than nhan'
	if (select PHAI from inserted) = ''
		print 'Khong de trong gioi tinh'
	if (select NGSINH from inserted) = ''
		print 'Khong de trong ngay sinh'
	if (select QUANHE from inserted) = ''
		print 'Khong de trong quan he'
	rollback transaction

insert into THANNHAN
values ('001','Hoa','','2003-03-04','Sugar Bayby');




--Câu 18: Tạo view hiển thị tên nhân viên và thông tin thân nhân của các nhân viên. 
--select * from NHANVIEN
create view vie_NVTN
as
	select a.TENNV, b.* from NHANVIEN a, THANNHAN b where 
		a.MANV = b.MA_NVIEN

select * from vie_NVTN


--Câu 19: Viết hàm truyền tham số đầu vào là mã @TRGPHG, --cho biết những nhân viên có tuổi lớn hơn @TRGPHG 
SELECT MANV, TENNV, DATEDIFF(YEAR, NgSinh, GETDATE())  FROM dbo.NHANVIEN INNER JOIN dbo.PHONGBAN ON PHONGBAN.TRPHG = NHANVIEN.MANV
drop function fn_selectNV
create FUNCTION fn_selectNV (@trgphg NVARCHAR(9) = NULL)	
RETURNS TABLE
RETURN(
	SELECT *, DATEDIFF(YEAR, NgSinh, GETDATE()) AS Tuoi FROM NHANVIEN
	WHERE DATEDIFF(YEAR, NgSinh, GETDATE()) >
	(SELECT DATEDIFF(YEAR, NgSinh, GETDATE()) FROM NHANVIEN NV INNER JOIN PHONGBAN PB ON PB.TRPHG = NV.MANV
		WHERE @trgphg = trphg))	SELECT * FROM fn_selectNV ('005')--Câu 20: Viết hàm lấy ra thông tin những nhân viên có thân nhân lớn hơn 50 tuổiselect * from THANNHANselect * from NHANVIENdrop function fn_SelectNV50create function fn_SelectNV50()
returns table 
as 
	return 
		select a.* from NHANVIEN a, THANNHAN b where 
			a.MANV = b.MA_NVIEN and a.MANV in
			(select b.MA_NVIEN from THANNHAN b, NHANVIEN a where a.MANV = b.MA_NVIEN 
				and DATEDIFF(year, b.ngsinh, GETDATE()) > 50)
go

select * from fn_SelectNV50()