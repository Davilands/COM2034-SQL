USE QLDA

USE QLDA_Lab2

--TEST
SELECT *FROM dbo.NHANVIEN
SELECT * FROM dbo.PHONGBAN
SELECT * FROM dbo.THANNHAN
SELECT * FROM dbo.DIADIEM_PHG

--Cau 1: . Cho biêt nhân viên có lương cao nhất
DECLARE @Max_Luong FLOAT
SELECT @Max_Luong = MAX(luong)
	FROM dbo.NHANVIEN
SELECT @Max_Luong AS 'Luong Cao Nhat';

--Cau 2: Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
DECLARE @luongTB FLOAT, @maPhong INT
SELECT @maPhong = MAPHG
	FROM dbo.PHONGBAN
WHERE TENPHG = N'Nghiên cứu'

SELECT @luongTB = AVG(luong)
	FROM dbo.NHANVIEN
WHERE PHG = @maPhong

SELECT HONV +' '+TENLOT +' '+TENNV AS 'Ho va Ten' FROM dbo.NHANVIEN
WHERE luong > @luongTB

--Cau 3: Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
begin
	DECLARE @ThongKe TABLE (Phong INT, Luong_TB FLOAT, SL_NV INT)
	INSERT INTO @ThongKe SELECT PHG, AVG(LUONG) AS LuongTB, COUNT(MANV) AS SL_NhanVien
	FROM dbo.NHANVIEN
	GROUP BY PHG 
	HAVING AVG(luong)>30000

	SELECT b.maphg, b.tenphg, a.SL_NV FROM @ThongKe a INNER JOIN dbo.PHONGBAN b ON a.phong=b.MAPHG
END

--Cau 4: Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
BEGIN
	DECLARE @ThongkeSLDA TABLE (MaPhong INT, SL_DeAn INT)	
	INSERT INTO @ThongkeSLDA SELECT PHONG, COUNT(MADA) AS SL_DA
	FROM dbo.DEAN
	GROUP BY PHONG

	SELECT d.TENPHG, c.SL_DeAn FROM @ThongkeSLDA c INNER JOIN dbo.PHONGBAN d ON c.MaPhong = d.MAPHG
END







--BAI 03
--Cau 1: Cho biết thông tin Thân Nhân của Trưởng phòng phòng Điều hành
BEGIN
    DECLARE @maTP INT
	SELECT @maTP = TRPHG
		FROM dbo.PHONGBAN
	WHERE TenPHG = N'Điều hành'

	SELECT * FROM dbo.THANNHAN
	WHERE @maTP = MA_NVIEN
END

--Cau 2. Cho biết thông tin Trưởng phòng (MaNV,HoNV,TenLot,TenNV) và Địa điểm làm việc theo từng Phòng ban.
BEGIN
	DECLARE @ThongKeTP TABLE (MaNV INT,HovaTen VARCHAR(20), Diadiem VARCHAR(20) )
	INSERT INTO @ThongkeTP SELECT MaNV, hoNV + ' ' + tenlot + ' ' + tenNV AS HoVaTen, DIADIEM
	FROM dbo.NHANVIEN, dbo.DIADIEM_PHG ,dbo.PHONGBAN
	WHERE ( PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG ) AND ( TRPHG = MANV)

	SELECT * FROM @ThongKeTP

END


