USE QLDA

SELECT IIF (luong>30000, 'truong phong' , 'nhan vien')
AS chucvu, tennv, luong FROM dbo.NHANVIEN

SELECT phai,tennv = CASE phai 
WHEN 'nam' THEN 'Mr. '+[tennv]
WHEN N'Nữ' THEN 'Ms. '+[tennv]
END
FROM dbo.NHANVIEN

SELECT tennv,ChucVu = CASE 
WHEN (luong > 30000 ) THEN 'truong phong'
ELSE  'nhan vien'
END
FROM nhanvien
