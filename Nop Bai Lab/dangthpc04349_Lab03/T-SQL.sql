
SELECT * FROM dbo.DEAN
SELECT * FROM dbo.CONGVIEC
SELECT * FROM dbo.PHANCONG
SELECT * FROM dbo.PHONGBAN
SELECT * FROM dbo.NHANVIEN
SELECT * FROM dbo.THANNHAN

--Bai 1 
--Bai1.1: Chỉnh sửa cột thời trong bảng PhanCong với dữ liệu như sau
SELECT MA_NVIEN,MADA,STT, CAST(THOIGIAN AS DECIMAL(5,1)) AS	'Thời gian' FROM dbo.PHANCONG;
SELECT MA_NVIEN,MADA,STT, CONVERT(DECIMAL(5,1),THOIGIAN) AS 'Thời gian' FROM dbo.PHANCONG;

--Bai1.2 Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó. 
--a. Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.
--		CAST
SELECT tendean, CAST(SUM(thoigian) as decimal(5,2)) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN
--		CONVERT
SELECT tendean, CONVERT(decimal(5,2),SUM(thoigian)) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN



--b. Xuất định dạng “tổng số giờ làm việc” kiểu varchar
--		CAST
SELECT tendean, CAST(SUM(thoigian) as varchar) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN
--		CONVERT
SELECT tendean, CONVERT(VARCHAR,SUM(thoigian)) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN


--Bai 1.3 Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--a. Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân,
--			sử dụng dấu phẩy để phân biệt phần nguyên và phần thập phân.
--		CAST
SELECT TENPHG, FORMAT(CAST(AVG(luong) AS DECIMAL(8,2)),'N','vi-VN') AS 'Luong TB' FROM dbo.PHONGBAN
	INNER JOIN dbo.NHANVIEN 
		ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
GROUP BY TENPHG
--		CONVERT
SELECT TENPHG,  FORMAT(CONVERT(DECIMAL(8,2),AVG(luong)),'N','vi-VN') AS 'Luong TB' FROM dbo.PHONGBAN
	INNER JOIN dbo.NHANVIEN 
		ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
GROUP BY TENPHG


--b. Xuất định dạng “luong trung bình” kiểu varchar. 
--			Sử dụng dấu phẩy tách cứ mỗi 3 chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace
SELECT TENPHG, LEFT(CAST(AVG(luong) AS VARCHAR),3) + REPLACE(CAST(AVG(luong) AS VARCHAR),LEFT(CAST(AVG(luong) AS VARCHAR),3),',') AS 'Luong TB'
FROM dbo.PHONGBAN
	INNER JOIN dbo.NHANVIEN 
		ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
GROUP BY TENPHG

SELECT TENPHG,  FORMAT(CAST(AVG(luong) AS DECIMAL(8,3)),'N','vi-VN') AS 'Luong TB' FROM dbo.PHONGBAN
	INNER JOIN dbo.NHANVIEN 
		ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
GROUP BY TENPHG



--Bai 2
--Bai 2.1 Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó. 
--a: Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
SELECT tendean, ceiling(CAST(SUM(thoigian) as decimal(5,2))) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN


--b: Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
SELECT tendean, FLOOR(CAST(SUM(thoigian) as decimal(5,2))) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN

--c: Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân
SELECT tendean, ROUND(CAST(SUM(thoigian) as decimal(5,2)),2) AS 'Tong so gio' FROM dbo.CONGVIEC
	INNER JOIN dbo.DEAN ON dbo.CONGVIEC.MADA = dbo.DEAN.MADA
	INNER JOIN dbo.PHANCONG ON dbo.CONGVIEC.MADA = dbo.PHANCONG.MADA
GROUP BY TENDEAN



--Bai 2.2 Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
--			trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"

DECLARE @luongTB FLOAT
SELECT @luongTB = AVG(dbo.NHANVIEN.LUONG) FROM dbo.NHANVIEN
SELECT  HONV +' '+TENLOT +' '+TENNV AS 'Ho va Ten', luong, @luongTB AS 'Luong TB' FROM dbo.NHANVIEN 
	WHERE ( luong >(SELECT ROUND(AVG(luong),2) FROM dbo.NHANVIEN WHERE PHG = ( SELECT MAPHG FROM dbo.PHONGBAN WHERE TENPHG =  N'Nghiên cứu')))










--Bai 3
--Bai 3.1: Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân, thỏa các yêu cầu
--		A. Dữ liệu cột HONV được viết in hoa toàn bộ
BEGIN
DECLARE @thongKeTN TABLE (SL_TN INT, MNV int)
INSERT INTO @thongKeTN SELECT COUNT(MA_NVIEN), MA_NVIEN FROM dbo.THANNHAN 
INNER JOIN dbo.NHANVIEN 
	ON NHANVIEN.MANV = THANNHAN.MA_NVIEN 
	GROUP BY dbo.THANNHAN.MA_NVIEN
--SELECT * FROM @thongKeTN
 SELECT UPPER(honv), TENLOT, TENNV,DCHI FROM dbo.NHANVIEN 
	INNER JOIN @thongKeTN 
		ON (SL_TN > 2 AND MNV = MANV)
END


--		B. Dữ liệu cột TENLOT được viết chữ thường toàn bộ
BEGIN
DECLARE @thongKeTN_b TABLE (SL_TN INT, MNV int)
INSERT INTO @thongKeTN_b SELECT COUNT(MA_NVIEN), MA_NVIEN FROM dbo.THANNHAN 
INNER JOIN dbo.NHANVIEN 
	ON NHANVIEN.MANV = THANNHAN.MA_NVIEN 
	GROUP BY dbo.THANNHAN.MA_NVIEN
 SELECT honv, LOWER(TENLOT) AS 'TenLot', TENNV,DCHI FROM dbo.NHANVIEN 
	INNER JOIN @thongKeTN_b 
		ON (SL_TN > 2 AND MNV = MANV)
END



--		C. Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
BEGIN
DECLARE @thongKeTN_c TABLE (SL_TN INT, MNV int)
INSERT INTO @thongKeTN_c SELECT COUNT(MA_NVIEN), MA_NVIEN FROM dbo.THANNHAN 
INNER JOIN dbo.NHANVIEN 
	ON NHANVIEN.MANV = THANNHAN.MA_NVIEN 
	GROUP BY dbo.THANNHAN.MA_NVIEN
 SELECT honv, TENLOT, LEFT(TENNV,1) + (UPPER(SUBSTRING (TENNV,2,1)) + SUBSTRING(TENNV,3,LEN(TENNV)-2)),DCHI FROM dbo.NHANVIEN 
	INNER JOIN @thongKeTN_c 
		ON (SL_TN > 2 AND MNV = MANV)
END



--		D. Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.
BEGIN
DECLARE @thongKeTN_d TABLE (SL_TN INT, MNV int)
INSERT INTO @thongKeTN_d SELECT COUNT(MA_NVIEN), MA_NVIEN FROM dbo.THANNHAN 
INNER JOIN dbo.NHANVIEN 
	ON NHANVIEN.MANV = THANNHAN.MA_NVIEN 
	GROUP BY dbo.THANNHAN.MA_NVIEN
 SELECT honv, TENLOT, TENNV, (SUBSTRING(DCHI,CHARINDEX(' ',DCHI), CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI))) AS 'Tên đường' FROM dbo.NHANVIEN 
	INNER JOIN @thongKeTN_d 
		ON (SL_TN > 2 AND MNV = MANV)
END




--Cau 3.2 Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất,
--				hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”
BEGIN
DECLARE @thongKePHG TABLE (SL_NV INT, Phong INT)
INSERT INTO @thongKePHG SELECT COUNT(PHG), PHG  FROM dbo.NHANVIEN
	INNER JOIN dbo.PHONGBAN 
		ON PHONGBAN.MAPHG = NHANVIEN.PHG
	GROUP BY PHG
DECLARE @max_NV INT, @ma_PHG INT, @ma_QL INT
SELECT @max_NV = MAX(SL_NV) FROM @thongKePHG
	--SELECT @max_NV
SELECT @ma_PHG = Phong FROM @thongKePHG 
	WHERE SL_NV = @max_NV
	--SELECT @ma_PHG
SELECT @ma_QL = MA_NQL FROM dbo.NHANVIEN 
	WHERE PHG = @ma_PHG
	--SELECT @ma_QL  ma nguoi quan ly cua phong dong nhan vien nhat
--SELECT @ma_PHG Phong dong nhan vien nhat
	SELECT dbo.PHONGBAN.TENPHG, dbo.NHANVIEN.HONV +' '+ dbo.NHANVIEN.TENLOT +' '+ dbo.NHANVIEN.TENNV AS 'Họ tên trưởng phòng', 
		REPLACE(dbo.NHANVIEN.TENNV,dbo.NHANVIEN.TENNV,'Fpoly') AS 'Tên trưởng phòng'
		FROM dbo.PHONGBAN, dbo.NHANVIEN
		WHERE PHG = @ma_PHG AND MANV = @ma_QL AND TRPHG = @ma_QL
END


--			Bai 4: Sử dụng các hàm ngày tháng năm 
--	bai 4.1: Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
SELECT * FROM dbo.NHANVIEN
	WHERE DATENAME(YEAR, NGSINH) >=1960 AND DATENAME(YEAR, NGSINH) <=1965



--	bai 4.2: Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại
SELECT *, DATEDIFF(YEAR, NGSINH, GETDATE()) AS 'Tuổi' FROM dbo.NHANVIEN;



--	bai 4.3: Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy
SELECT *, DATENAME(WEEKDAY, NGSINH) AS 'Week Day' FROM dbo.NHANVIEN;



--	bai 4.4: Cho biết số lượng nhân viên, tên trưởng phòng, 
--			ngày nhận chức trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)

SELECT trphg, HONV +' '+TENLOT +' '+TENNV AS 'Ho va Ten', CONVERT(VARCHAR,NG_NHANCHUC, 105 ) AS 'Ngay sinh' FROM dbo.PHONGBAN 
	INNER JOIN  (SELECT phg, COUNT(phg) AS 'SL NV' FROM dbo.NHANVIEN GROUP BY PHG)a
		ON PHONGBAN.MAPHG= a.PHG 
	INNER JOIN dbo.NHANVIEN 
		ON dbo.PHONGBAN.TRPHG = dbo.NHANVIEN.MANV

