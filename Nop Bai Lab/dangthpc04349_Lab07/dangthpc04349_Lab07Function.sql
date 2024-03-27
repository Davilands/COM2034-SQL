USE QLDA
--Bài 1
--1.1  Nhập vào MaNV cho biết tuổi của nhân viên này
if OBJECT_ID('TuoiNV') is not null
DROP function TuoiNV
go
create function TuoiNV (@manv nvarchar(9))
returns int
as
begin
return (select (year(getdate()) - year(NGSINH)) as N'Tuổi' from NHANVIEN where MANV = @manv)
end

print N'Tuổi của nhân viên là: '+Convert(varchar,dbo.TuoiNV('054'))

--1.2 Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
if OBJECT_ID('Bai1_2') is not null
DROP function Bai1_2
go
create function Bai1_2 (@Manv nvarchar(9))
returns int
as
begin
return (select Count(MADA) from PHANCONG where MA_NVIEN = @Manv)
end
print N'Số nhân viên là: '+Convert(varchar,dbo.Bai1_2('009'))

--1.3 Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
if OBJECT_ID('dbo.fDemNV_gioitinh') is not null
DROP PROC dbo.fDemNV_gioitinh
go
create function dbo.fDemNV_gioitinh(@phai nvarchar(3))
returns int
begin
return (select count(MANV)
from NHANVIEN where PHAI like @phai)
end
print N'Tổng số lượng nhân viên: '+Convert(varchar,dbo.fDemNV_gioitinh(N'Nam'))

--1.4 Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng đó.
if OBJECT_ID('Bai1_4') is not null
DROP function Bai1_4
go
create function Bai1_4(@Tenphong nvarchar(15))
RETURNS FLOAT
as 
BEGIN
RETURN(select AVG(b.Luong)
FROM PHONGBAN a INNER JOIN NHANVIEN b 
ON a.MAPHG = b.PHG
WHERE a.TENPHG like '%'+ @Tenphong + '%'
)
END
select HONV,TENLOT,TENNV FROM NHANVIEN a inner join  PHONGBAN b on a.PHG =b.MAPHG
WHERE LUONG > dbo.Bai1_4 (N'Nghiên Cứu') and TENPHG like N'%Nghiên Cứu%'


--1.5 Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
if OBJECT_ID('Bai1_5') is not null
drop function Bai1_5
go
create function Bai1_5(@MAPHG int)
returns @prodlist table (TenPhong nvarchar(20),TenTruongPhong nvarchar(20),SoLuongDeAn int)
as 
begin
	insert into @prodlist
	select a.TENPHG,b.HONV +''+b.TENLOT+' '+b.TENNV,
	(select count(c.MADA) FROM DEAN c where c.PHONG =a.MAPHG)
	from Phongban a inner join NHANVIEN b on a.MAPHG =b.PHG where MAPHG=@MAPHG ;
	return;
end
go

SELECT *FROM Bai1_5(4)

--Bài 2
--2.1 Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
if OBJECT_ID('Bai2_1') is not null
DROP view Bai2_1
go
CREATE VIEW Bai2_1
AS
SELECT HONV,TENNV,TENPHG,DIADIEM FROM NHANVIEN INNER JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG INNER JOIN DIADIEM_PHG ON PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG

SELECT * FROM Bai2_1

--2.2 Hiển thị thông tin TenNv, Lương, Tuổi.
if OBJECT_ID('Bai2_2') is not null
DROP function Bai2_2
go
CREATE VIEW Bai2_2
AS
SELECT TENNV,LUONG,DATEDIFF(YEAR,NGSINH,GETDATE())AS 'TUOI' from NHANVIEN

SELECT * FROM Bai2_2

--2.3 Hiển thị tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất
if OBJECT_ID('Bai2_3') is not null
DROP function Bai2_3
go
CREATE FUNCTION Bai2_3()
RETURNS @MaSLNV TABLE(maphong int , slnv int )
as 
BEGIN
	INSERT into @MaSLNV(maphong,slnv)
	SELECT top 1 PHG,COUNT(MANV) as SLNV from NHANVIEN
	GROUP BY PHG
	ORDER BY SLNV DESC
	RETURN
end 
go
SELECT * FROM dbo.Bai2_3();

select nhanvien.HONV, nhanvien.TENNV from NHANVIEN inner join
		PHONGBAN on PHONGBAN.TRPHG = NHANVIEN.MANV inner join 
		Bai2_3() on PHONGBAN.MAPHG = Bai2_3().maphong


CREATE view v_phongbanDongNV
AS
select a.TENPHG,b.HONV +''+b.TENLOT+' '+b.TENNV AS HovaTen