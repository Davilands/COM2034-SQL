CREATE DATABASE demo

USE demo 
drop 

CREATE TRIGGER themNhanVien_2 ON nhanvien
FOR insert
AS
IF (SELECT luong FROM inserted ) < 20000
BEGIN
PRINT 'Tien luong toi thieu phai lon hon 5000.'
ROLLBACK TRANSACTION
END 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    Luong,
    DiaChi
)
VALUES
(   N'005', -- MaNV - nvarchar(10)
    N'Tran Van A', -- TenNV - nvarchar(10)
    40000, -- Luong - float
    N'Can Tho'  -- DiaChi - nvarchar(50)
    )

update NhanVien set luong = 2000 
where manv like 005


--trigger delete
create trigger XoaNV 
on nhanvien 
for delete
as
if '005' in (select manv from deleted)
begin 
	print 'Khong the xoa'
	ROLLBACK TRANSACTION
end

DELETE FROM  nhanvien where manv like '005'

--
create trigger Xoa_NV
on nhanvien
after delete 
as
begin
	DECLARE @num nchar;
	select @num = count(*) from deleted
	print 'So luong nhan vien da xoa ' + @num
end

--xóa thân nhân có liên quan
create trigger Delete_NV_ThanNhan
on NhanVien 
instead of delete 
as 
brgin
delete from Thanhnhan where manv in 
(select manv from deleted)
delete from nhanvien where manv in 
(select manv from deleted)