CREATE PROC sp_Tong @so1 INT, @so2 INT
AS 
BEGIN 
	DECLARE @tong INT;
	SET @tong = @so1 + @so2
	PRINT @tong
END

EXEC sp_Tong 5, -9


--dien tich
CREATE PROC sp_dienTich @dai INT, @rong INT
AS 
BEGIN 
	DECLARE @dienTich INT;
	SET @dienTich = @dai * @rong
	PRINT @dienTich
END

EXEC sp_dienTich 7,5



--
USE QLDA;

CREATE PROC sp_Infor @MaNV NVARCHAR(9)
AS
BEGIN
	SELECT * FROM dbo.NHANVIEN WHERE manv = @maNV
END
GO
EXEC sp_Infor '005'

--Them phong ban CNTT
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhongBan]    Script Date: 6/12/2022 1:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ThemPhongBan]
 @TenPHG nvarchar(15),  @MaPHG int,
 @TRPHG nvarchar(9),  @NG_NHANCHUC date
 AS
 IF EXISTS(SELECT * From PHONGBAN Where MAPHG = @MaPHG)
 UPDATE PHONGBAN SET TENPHG =  @TenPHG, TRPHG = @Trphg,NG_NHANCHUC=@NG_NHANCHUC
 WHERE MAPHG = @MaPHG
 ELSE
 INSERT INTO PHONGBAN
 VALUES (@TenPHG,@MaPHG,@TRPHG,@NG_NHANCHUC)
 DROP PROC dbo.sp_ThemPhongBan
 EXEC sp_ThemPhongBan 'CNTT',6,'008','1985-01-01'
 SELECT * FROM dbo.PHONGBAN


 --
 CREATE PROC sp_timNV @namSinh INT
 AS 
 BEGIN 
	SELECT tennv, ngsinh FROM dbo.NHANVIEN
	WHERE DATENAME(YEAR, NGSINH) = @namSinh
 END 

 EXEC sp_timNV 1967


 ---
--Viết store procedure đếm số lượng thân nhân của nhân viên có mã nhân viên được nhập từ người dùng
 CREATE PROCEDURE sp_demslThanNhan
	@ma_nvien nvarchar(9)
AS
begin
	select MA_NVIEN, COUNT(ma_nvien) as slthanhnhan
	from THANNHAN
	where MA_NVIEN = @ma_nvien
	group by MA_NVIEN
end

select * from THANNHAN
exec sp_demslThanNhan '005'