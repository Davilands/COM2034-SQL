

--
--Bài 1
--1.1 In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn.  
drop proc xuat
CREATE PROC xuat @ten VARCHAR(50)
AS
BEGIN
    PRINT N'Xin chào ' + @ten;
END
go
--Gọi
EXEC dbo.xuat @ten = N'Đang' -- varchar(50)
--1.2 Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
CREATE PROC tinhtong
    @s1 INT,
    @s2 INT
AS
BEGIN
    DECLARE @tg INT;
    SET @tg = @s1 + @s2;
    PRINT N'Tổng là : ' + CAST(@tg AS NVARCHAR(10));
END
go
--Xuất
EXEC tinhtong @s1 = 5,@s2 = 6

--1.3 Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
CREATE PROC xuatso @n INT
AS
BEGIN
    DECLARE @i INT = 1;
    WHILE @i <= @n
    BEGIN
        IF (@i % 2 = 0)
            PRINT N'Số chẵn ' + CAST(@i AS NVARCHAR(10));
        SET @i = @i + 1;
    END;
END
go
--Gọi
EXEC xuatso @n = 15

--1.4 Nhập vào 2 số. In ra ước chung lớn nhất của chúng 
CREATE PROC UCLN
    @a INT,
    @b INT
AS
BEGIN
    WHILE (@a != @b)
    BEGIN
        IF (@a > @b)
            SET @a = @a - @b;
        ELSE
            SET @b = @b - @a;
    END;
    RETURN @a;
END
go
DECLARE @c INT
EXEC @c = UCLN 10, 20
PRINT @c

--Bài 2
--2.1 Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
CREATE PROC NV @MaNV VARCHAR(9)
AS 
BEGIN 
SELECT * FROM dbo.NHANVIEN WHERE MaNV = @MaNV
END
--Gọi 
EXEC NV '005'


--2.2 Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
CREATE PROC DA @MaDA INT
AS
BEGIN
    SELECT COUNT(MANV) AS N'Số nhân viên',
           MADA
    FROM dbo.NHANVIEN
        INNER JOIN dbo.PHONGBAN
            ON PHONGBAN.MAPHG = NHANVIEN.PHG
        INNER JOIN dbo.DEAN
            ON DEAN.PHONG = PHONGBAN.MAPHG
    WHERE MADA = @MaDA
    GROUP BY MADA;
END
--Xuất
EXEC DA 10

--2.3 Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA
CREATE PROC DA2 @MaDA INT,@DiaDiem NVARCHAR(15)
AS
BEGIN
    SELECT COUNT(MANV) AS N'Số nhân viên',
           MADA,DDIEM_DA
    FROM dbo.NHANVIEN
        INNER JOIN dbo.PHONGBAN
            ON PHONGBAN.MAPHG = NHANVIEN.PHG
        INNER JOIN dbo.DEAN
            ON DEAN.PHONG = PHONGBAN.MAPHG
    WHERE MADA = @MaDA AND DDIEM_DA = @DiaDiem
    GROUP BY MADA,DDIEM_DA;
END
--Xuất
EXEC DA2 20 , 'TP HCM'

--2.4 Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.
CREATE PROC Bai2_4 @MaTP NVARCHAR(5)
AS
BEGIN
SELECT HONV,TENNV,TENPHG,NHANVIEN.MANV,dbo.THANNHAN.* From NHANVIEN
INNER JOIN dbo.PHONGBAN ON PHONGBAN.MAPHG = NHANVIEN.PHG
LEFT OUTER JOIN dbo.THANNHAN ON THANNHAN.MA_NVIEN = NHANVIEN.MANV 
WHERE dbo.THANNHAN.MA_NVIEN IS NULL AND TRPHG = @MaTP
END
EXEC Bai2_4 '008'

--2.5 Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không
CREATE PROC Bai2_5
    @MaNV NVARCHAR(5),
    @MaPB NVARCHAR(5)
AS
BEGIN
    IF EXISTS (SELECT * FROM dbo.NHANVIEN WHERE MANV = @MaNV AND PHG = @MaPB)
        PRINT N'Nhân viên ' + @MaNV + N' có trong phòng ban ' + @MaPB;
    ELSE
        PRINT N'Nhân viên ' + @MaNV + N' không có trong phòng ban ' + @MaPB;
END;
EXEC Bai2_5 '009', 5;


--Bài 3
--3.1 Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.
CREATE PROC Bai3_1
    @TenPB NVARCHAR(15), @MaPB INT,
    @MaTP NVARCHAR(9),
    @NNC DATE
AS
BEGIN
    IF (EXISTS (SELECT * FROM dbo.PHONGBAN WHERE MAPHG = @MaPB))
        PRINT N'Thêm thất bại !';
    ELSE
    BEGIN
        INSERT INTO dbo.PHONGBAN
        VALUES
        (@TenPB, @MaPB, @MaTP, @NNC);
        PRINT N'Thêm thành công!';
    END;
END;

EXEC Bai3_1 'CNTT',9,'009','1995-01-03'

--3.2 Cập nhật phòng ban có tên CNTT thành phòng IT.
CREATE PROC CapNhat_PB
    @MaPB int,
    @TenPB nvarchar(15),
    @MaTP nvarchar(9),
    @NG_NHANCHUC date
AS
BEGIN
    if (exists(select * from phongban where maphg = @MaPB))
		update PHONGBAN set TENPHG = @tenpb, TRPHG = @MaTP,
		NG_NHANCHUC = @NG_NHANCHUC where maphg = @MaPB
	else 
		begin
			insert into PHONGBAN(MAPHG,tenphg, trphg, NG_NHANCHUC)
			values (@MaPB, @TenPB, @MaTP, @NG_NHANCHUC)
			print 'Them thanh cong'
		end
END
	
EXEC CapNhat_PB '8', 'IT', '008', '2022-01-03';

--Bai 3.3 Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu 
--vào với điều kiện:
create proc spInsertNhanVien
@HONV nvarchar(15) , @TENLOT nvarchar(15), @TENNV nvarchar(15),
@MANV nvarchar(6), @NGSINH date , @DCHI nvarchar(50), 
@PHAI nvarchar(3), @LUONG float,@MA_NQL nvarchar(3) = null, @PHG int
as 
begin 
	declare @age int
	set @age = YEAR(GETDATE()) - year(@ngsinh)
	if @phg = (select maphg from PHONGBAN where tenphg = 'IT')
		begin
			if @luong < 2500
				set @ma_nql = '009'
			else set @MA_NQL = '005'

			if (@phai = 'Nam' and (@age >= 18 and @age <=65)) or (@phai = N'Nữ' and (@age >= 18 and @age <=65))
				begin
					insert into NHANVIEN (honv,tenlot,tennv, manv,ngsinh,dchi,phai,luong,ma_nql,phg)
					values ('Tran','Huu','Dang','018','2022-02-06','Can Tho','Nam','25000','004','4')
				end
			else print 'Khong thuoc do tuoi lao dong'
		end
	else print 'Khong thuoc phong ban IT'
end

exec spInsertNhanVien 'Tran','Huu','Dang','018','2022-02-06','Can Tho','Nam','25000','004','4'

