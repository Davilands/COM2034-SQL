drop database QLNV
use master

--TRAN HUU DANG
SELECT * FROM dbo.NHANVIEN
--BAI 1

--Viết chương trình xem xét có tăng lương cho nhân viên hay không.
DECLARE @thongKe TABLE (PHG INT, LuongTB INT)
INSERT INTO @thongKe
SELECT phg, AVG(luong) AS 'luongtb' FROM dbo.NHANVIEN GROUP BY PHG
SELECT a.LUONG, b.LuongTB , a.TENNV, XetLuong= CASE 
	WHEN a.LUONG < b.LuongTB THEN 'Tang Luong'
	ELSE 'Khong Tang'
end
	FROM dbo.NHANVIEN a INNER JOIN @thongKe b ON a.phg = b.PHG

--Viết chương trình phân loại nhân viên dựa vào mức lương.
DECLARE @thongKe_2 TABLE (PHG INT, LuongTB INT)
INSERT INTO @thongKe_2
SELECT phg, AVG(luong) AS 'luongtb' FROM dbo.NHANVIEN GROUP BY PHG
SELECT a.LUONG, b.LuongTB , a.TENNV, XetLuong= CASE 
	WHEN a.LUONG < b.LuongTB THEN 'Truong Phong'
	ELSE 'Nhan Vien'
end
	FROM dbo.NHANVIEN a INNER JOIN @thongKe_2 b ON a.phg = b.PHG

--Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
SELECT tennv = CASE phai 
WHEN 'nam' THEN 'Mr. '+[tennv]
WHEN N'Nữ' THEN 'Ms. '+[tennv]
END
FROM dbo.NHANVIEN

--Viết chương trình tính thuế mà nhân viên phải đóng theo công thức
SELECT TENNV, LUONG, Thue = CASE
WHEN luong BETWEEN 0 AND 25000 THEN LUONG * 0.1
WHEN luong BETWEEN 25000 AND 30000 THEN LUONG * 0.12
WHEN luong BETWEEN 30000 AND 40000 THEN LUONG * 0.15
WHEN luong BETWEEN 40000 AND 50000 THEN LUONG * 0.2
ELSE LUONG*0.25 
end
FROM dbo.NHANVIEN


--BAI 02
--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.
 DECLARE @max INT
 SELECT @max = MAX(cast(manv AS int))
	FROM dbo.NHANVIEN
DECLARE @number INT = 2;
WHILE @number <= @max
BEGIN
	IF @number % 2 = 0
		SELECT honv, TENLOT, tennv 
		FROM dbo.NHANVIEN
		WHERE (@number = cast(manv AS int))
	SET @number = @number + 1
END;

--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.
 DECLARE @max_2 INT
 SELECT @max_2 = MAX(cast(manv AS int))
	FROM dbo.NHANVIEN
DECLARE @number_2 INT = 2;
WHILE @number_2 <= @max_2
BEGIN
	IF @number_2 % 2 = 0 AND @number_2 != 4
		SELECT honv, TENLOT, tennv 
		FROM dbo.NHANVIEN
		WHERE (@number_2 = cast(manv AS int))
	SET @number_2 = @number_2 + 1
END;

-- BAI 03
SELECT * FROM dbo.PHONGBAN
--Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan, 
--Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
BEGIN TRY
	INSERT INTO PHONGBAN 
		VALUES (N'Sản xuất', 7 , '009', '2020-03-02');
	PRINT N'Dữ liệu chèn thành công';
END TRY 
BEGIN CATCH
	PRINT N'Dữ liệu chèn thất bại'
END CATCH

--Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi 
-- “Them dư lieu that bai” từ khối Catch
BEGIN TRY
	INSERT INTO PHONGBAN 
		VALUES (N'Sản xuất', 8 , '009', '2020-03-02');
	PRINT N'Dữ liệu chèn thành công';
END TRY 
BEGIN CATCH
	PRINT N'Dữ liệu chèn thất bại'
END CATCH

--Viết chương trình khai báo biến @chia, thực hiện phép chia 
--@chia cho số 0 và dùng RAISERROR để thông báo lỗi.
BEGIN TRY 
	DECLARE @chia INT 
	SET @chia = 69/0
END TRY
BEGIN CATCH
	DECLARE
		@ErMasage NVARCHAR(2048),
		@ErSeverity INT,
		@State INT
	SELECT
		@ErMasage = ERROR_MESSAGE(),
		@ErSeverity = ERROR_SEVERITY(),
		@State = ERROR_STATE()
	RAISERROR (
		@ErMasage,
		@ErSeverity,
		@State 
		)
END CATCH

--BAI 4
--1.	Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số lẻ 
 DECLARE @max INT
 SELECT @max = MAX(cast(manv AS int))
	FROM dbo.NHANVIEN
DECLARE @number INT = 2;
WHILE @number <= @max
BEGIN
	IF @number % 2 != 0
		SELECT honv, TENLOT, tennv 
		FROM dbo.NHANVIEN
		WHERE (@number = cast(manv AS int))
	SET @number = @number + 1
END;

--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có 
--MaNV là số lẻ nhưng không tính nhân viên có MaNV là 5.
DECLARE @max_2 INT
 SELECT @max_2 = MAX(cast(manv AS int))
	FROM dbo.NHANVIEN
DECLARE @number_2 INT = 2;
WHILE @number_2 <= @max_2
BEGIN
	IF @number_2 % 2 = 0 AND @number_2 != 4
		SELECT honv, TENLOT, tennv 
		FROM dbo.NHANVIEN
		WHERE (@number_2 = cast(manv AS int))
	SET @number_2 = @number_2 + 1
END;