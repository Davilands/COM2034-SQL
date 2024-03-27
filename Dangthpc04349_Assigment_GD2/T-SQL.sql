--Dangthpc04349
USE qlgh_Dangthpc04349
CREATE DATABASE QLGH_Dangthpc04349
DROP DATABASE QLGH_Dangthpc04349

CREATE TABLE NHANVIEN
(
	MANV VARCHAR(9) PRIMARY KEY,
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	PHAI NVARCHAR(4),
	DIACHI NVARCHAR(40),
	SDT VARCHAR(12),
	LUONG INT,
	MADIADIEM INT 
)
--NHANVIEN

ALTER TABLE dbo.KHACHHANG ADD FOREIGN KEY(MADIADIEM) REFERENCES diadiem (MADIADIEM)
ALTER TABLE dbo.DONHANG ADD FOREIGN KEY(MANV) REFERENCES dbo.NHANVIEN(MANV)
ALTER TABLE dbo.DONHANG ADD FOREIGN KEY(MADIADIEM) REFERENCES  dbo.DIADIEM(MADIADIEM)

INSERT INTO dbo.NHANVIEN
VALUES
(   '005', N'Bành', N'Bé', N'Na', N'Nữ' , N'119 Cổng Quỳnh, Tp HCM', '0392023332', 30000,1),
(   '009', N'Nông', N'Văn', N'Nụ','Nam' ,N'220 Nguyễn Văn Cừ, Tp Cantho', '0392029862', 20000,2),
(   '008', N'Trương', N'Hoàng', N'Yasou', 'Nam' ,N'229 Nguyễn Văn Linh, Tp Cantho','0392343332', 12000,3),
(   '023', N'Nguyễn', N'Bún', N'Đậu','Nam' ,N'229 trần Hoàng Na, Tp Cantho','0987643332', 19000,4),
(   '069', N'Trần', N'Hoàng', N'Thượng', 'Nam' ,N'112 Nguyễn Văn Cừ (nd), Tp Cantho','0392343331', 50000,5),
(   '028', N'Phùng', N'Bé', N'Vinh','Nam' ,N'227 Hoàng Văn Thụ, Tp Cantho','0398743332', 30000,6),
(   '012', N'Gia', N'Cát', N'Lượng',  'Nam' ,N'219 Nguyễn Văn Linh, Tp Cantho','0125343332', 12000,7)

CREATE TABLE KHACHHANG
(
	MAKH VARCHAR(9) PRIMARY KEY,
	TENKH NVARCHAR(25),
	MADIADIEM INT,
	SDT VARCHAR(12),
	PHAI NVARCHAR(4),
	DCHI NVARCHAR(40),
	EMAIL VARCHAR(20)
)

DROP TABLE dbo.KHACHHANG
--ALTER TABLE dbo.KHACHHANG ADD FOREIGN KEY(MAKH) REFERENCES DONHANG(MAKH)
delete from dbo.KHACHHANG  SELECT * FROM dbo.KHACHHANG
delete from dbo.NHANVIEN	SELECT * FROM dbo.NHANVIEN
delete from dbo.DIADIEM		SELECT * FROM diadiem 
delete from dbo.DONHANG		SELECT * FROM dbo.DONHANG

DROP TABLE dbo.DONHANG

INSERT INTO KHACHHANG
VALUES
(   '199', N'Bích Nụ',4,'0987154398',N'Nữ', N'228 Nguyễn Văn Linh, Tp Cantho','bichnu098@gmail.com'),
(   '099', N'Dr Strange',5,'0345632198','Nam', N'209 Cách mạng tháng 8, Tp Cantho','dudu0998@gmail.com'),
(   '101', N'Đậu Xanh',7,'0905612098','LGBT', N'219 Phạm Ngũ Lão, Tp Cantho','dxlgbt@gmail.com'),
(   '187', N'Đen Không Vâu',1,'0980123498','Nam', N'187 Đề Thám, Tp Cantho','denkovau@gmail.com'),
(   '236', N'Bé Sỹ',4,'0989874354',N'Nữ', N'98 Nguyễn Thị Minh Khai, Tp Cantho','sy.cute@gmail.com'),
(   '544', N'Trần Dần',1,'0987091231',N'Nam', N'228 Nguyễn Văn Linh, Tp Cantho','bichnu098@gmail.com'),
(   '033', N'Ng Khánh Lan',6,'0980496600',N'Nữ', N'209 Hùng Vương, Tp Cantho','kdan@gmail.com')

CREATE TABLE DONHANG
(
	MADH VARCHAR(9) PRIMARY KEY,
	TENDH NVARCHAR(15),
	MAKH VARCHAR(9),
	TENKH NVARCHAR(20),
	MANV VARCHAR(9),
	PHIVC INT,
	--TENDIADIEM NVARCHAR(40),  XOA
	MADIADIEM INT,
	--VOUCHER VARCHAR(10), --VD: VOUCHER: -15K, -200K
	--MOTA NVARCHAR(30),
	GC NVARCHAR(30) --Ghi chú địa chỉ cụ thể
)

SELECT * FROM dbo.KHACHHANG
--ALTER TABLE dbo.DONHANG ADD FOREIGN KEY(DIADIEM) REFERENCES PHANCONG(DIADIEM)
INSERT INTO DONHANG
VALUES
--MaDH		TenDH    TenKH    TÉNSHOP         MaNV  PHIVC    DCHI                             VOUCHER 
('119', N'Súng Nước','199', N'Bích Nụ', '028',15000,6 , N'Gần FPL Cantho'),
('987', N'Váy Ngắn', '101',N'Bé Sỹ', '069', 55000, 5, null),
('807', N'Khăn Trãi Bàn','187', N'Ng Khánh Lan','005',35000, 1, N'Gần vincom Hùng Vương'),
('207', N'bàn phím cơ', '033',N'Thần sấm', '008', 67300, 4, null),
('127', N'Giày Nike', '236',N'Đậu Xanh', '012', 67300,7, N'Gần quán cafe Đangdz')

CREATE TABLE DIADIEM
(
	MADIADIEM INT,
	MNV VARCHAR(9),
	TENDIADIEM NVARCHAR(40),
	PRIMARY KEY(MNV,MADIADIEM)
)
INSERT INTO DIADIEM
VALUES 
(6, '028', N'Bình Thủy, Tp Cantho'),
(5, '069', N'An Khánh, Tp Cantho'),
(1, '005', N'Hùng Vương, Tp Cantho'),
(7, '012', N'Ninh Kiều, Tp Cantho'),
(4, '023', N'An Cư, Tp Cantho')

use QLGH_Dangthpc04349
select* from khachhang
--TRUY VẤN DỮ LIỆU
--Y3.1.a
--SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
-- DROP PROC sp_NguoiDung_insert
if OBJECT_ID('sp_KhachHang_insert') is not null
DROP PROC sp_KhachHang_insert
go
CREATE PROC sp_KhachHang_insert
	@MaKH nvarchar(9),
	@TenKH nvarchar(25),
	@MaDiaDiem int,
	@DienThoai varchar(12),
	@Phai nvarchar(4),
	@DiaChi nvarchar(40),
	@Email varchar(20)
AS
BEGIN
	INSERT INTO KHACHHANG VALUES (@MaKH,@TenKH,@MaDiaDiem,@DienThoai,@Phai,@DiaChi,@Email)
END
go
--3. thực thi
exec sp_KhachHang_insert '0A67', 'Nguyen Van An', 6, '0989878987', 'Nam', '209 Hùng Vương, Tp Cantho', 'anvn@gmail.com'
go
--4. Truy vấn lại xem có dữ liệu không
SELECT * FROM KhachHang
go

--Y3.1.b
--SP thứ nhất thực hiện chèn dữ liệu vào bảng DONHANG
-- DROP PROC sp_NguoiDung_insert
if OBJECT_ID('sp_DonHang_insert') is not null
DROP PROC sp_DonHang_insert
go
CREATE PROC sp_DonHang_insert
	@MaDH varchar(9),
	@TenDH nvarchar(15),
	@MaKH varchar(9),
	@TenKH nvarchar(20),
	@MaNV varchar(9),
	@PhiVC int,
	@MaDiaDiem int,
	@GC nvarchar(30)
AS
BEGIN
	INSERT INTO DONHANG VALUES (@MaDH,@TenDH,@MaKH,@TenKH,@MaNV,@PhiVC,@MaDiaDiem,@GC)
END
go
--3. thực thi
exec sp_DonHang_insert '107', N'Giày Nike','033', N'Ng Khánh Lan','008',12000,6,'Gần FPL Cantho'
go
--4. Truy vấn lại xem có dữ liệu không
SELECT * FROM DONHANG
--select * from NHANVIEN
--select * from khachhang
go


--Y3.1.c
--SP thứ nhất thực hiện chèn dữ liệu vào bảng DIADIEM
if OBJECT_ID('sp_DiaDiem_insert') is not null
DROP PROC sp_DiaDiem_insert
go
CREATE PROC sp_DiaDiem_insert
	@MaDiaDiem int,
	@MaNV varchar(9),
	@TenDiaDiem nvarchar(40)
AS
BEGIN
	INSERT INTO DIADIEM VALUES (@MaDiaDiem,@MaNV,@TenDiaDiem)
END
go
--3. thực thi
exec sp_DiaDiem_insert '8', '008','Hùng Vương, Tp Cantho'
go
--4. Truy vấn lại xem có dữ liệu không
select * from diaDiem 
go



select * from donhang
-----2_TRUY VẤN THÔNG TIN------
/*
2. Truy vấn thông tin
a. Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm Đơn hàng có 
	max đơn hàng = mã đơn hàng nhập vào
*/

if OBJECT_ID('sp_DonHang_select') is not null
DROP PROC sp_DonHang_select
go
CREATE PROC sp_DonHang_select
	@MaDH varchar(9)
AS
BEGIN
	select madh, tendh,tenkh,manv, 
	(REPLACE(LEFT(CONVERT(varchar,phivc,1),LEN(CONVERT(varchar,phivc,1))-3),',','.') + N' nghìn VNĐ') as 'Phí vận chuyển', gc
	from donhang where madh = @madh
END
go
--Truy vấn 
exec sp_DonHang_select '807'

/*
b. Viết một hàm có các tham số đầu vào tương ứng với tất cả các cột của bảng 
	KHACHHANG. Hàm này trả về mã người dùng (giá trị của cột khóa chính của bảng 
	KHACHHANG) thỏa mãn các giá trị được truyền vào tham số.
*/
if OBJECT_ID('fn_MaKhachHang') is not null
drop function fn_MaKhachHang
go
create function fn_MaKhachHang(
	@TenNguoiDung nvarchar(25) = N'%',
	@Dienthoai varchar(12) = N'%',
	@DiaChi nvarchar(40) = N'%')
returns table
return (select MaKH
		from KhachHang
		where (TenKH like @TenNguoiDung)
		and (Dchi like @Diachi)
		and (sdt like @Dienthoai) )
---Truy vấn
go
select * from dbo.fn_MaKhachHang(default, '0989878987', default)
select * from khachhang

select * from donhang
/*
c. Viết một hàm có tham số đầu vào là tên đơn hàng (một sản phẩm có thể có nhiều đơn hàng). 		Hàm này trả về tổng số phí vận chuyển của các đơn hàng có tên đơn hàng này.
*/
if OBJECT_ID ('fn_TongPhi') is not null
drop function fn_TongPhi
go
create function fn_TongPhi(@TenDH nvarchar(15))
returns int
as
begin
	return 
		(select sum(phiVC) from donhang where tendh like @tendh)
end
go
print N'Tổng phí vận chuyển của đơn hàng Giày Nike là: ' +  convert(varchar, [dbo].fn_TongPhi( N'Giày Nike') ) 
select * from donhang
select * from diadiem


select * from nhanvien
select * from donhang
/*
d. Tạo một View lưu thông tin nhân viên của TOP 1 nhân viên có nhiều đơn hàng nhất  	
*/
if OBJECT_ID ('NV_Top1DH') is not null
drop view NV_Top1DH
go
create view NV_Top1DH
as
	select top 1 ( count(donhang.madh)) as 'SL DH', nhanvien.manv
	from donhang inner join nhanvien on donhang.MANV = nhanvien.MANV 
		group by nhanvien.MANV 
		ORDER BY count(donhang.madh) DESC
select * from NV_Top1DH inner join nhanvien on nhanvien.MANV = NV_Top1DH.MANV

/*
e. Viết một Stored Procedure nhận tham số đầu vào là mã nhân viên .
		xuất ra số đơn hàng của nhân viên này	
*/

if OBJECT_ID('sp_SoDonHang_select') is not null
DROP PROC sp_SoDonHang_select
go
CREATE PROC sp_SoDonHang_select
	@MaNV varchar(9)
AS
BEGIN
	select a.*, count(madh) as 'SLDH'   from nhanvien a , donhang b where 
	(b.Manv = a.MANV and a.MANV = @MaNV)
	group by 
		a.DIACHI, a.HONV, a.LUONG, a.MADIADIEM, a.MANV, a.PHAI, a.SDT, a.TENLOT, a.TENNV
END
go
exec sp_SoDonHang_select '008'
select * from nhanvien
select * from DONHANG


--3.
/*
a. Viết một PC có tham số đầu vào là tên đơn hàng (một sản phẩm có thể có nhiều đơn hàng). 		PC này xóa các đơn hàng có tên đơn hàng này.
*/
select * from DONHANG
if OBJECT_ID ('sp_Xoa') is not null
drop proc sp_Xoa
go
create proc sp_Xoa(@TenDH nvarchar(15))
as
begin
	 delete  from donhang where TENDH = @TenDH		
end
go
EXEC sp_Xoa 'bàn phím cơ'

/*
b. Viết một PC có tham số đầu vào phí vận chuyển (một sản phẩm có thể có nhiều đơn hàng). 		PC này xóa các đơn hàng có phí vận chuyển thấp hơn phí vận chuyển này.
*/
select * from DONHANG
if OBJECT_ID ('sp_Xoa') is not null
drop proc sp_Xoa
go
create proc sp_Xoa(@PhiVC int)
as
begin
	 delete  from donhang where phivc < @PhiVC		
end
go
EXEC sp_Xoa 1000