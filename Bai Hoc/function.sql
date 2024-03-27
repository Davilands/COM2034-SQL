use qlda

--Xóa hàm nếu đã có 
if object_id('fTuoi', 'FN') is not null 
	drop function fTuoi
go

--Tạo hàm FTuoi
create function fTuoi (@ns int)
returns int
As
begin
	return year(getdate()) - @ns
end
go

--Biên dịch hàm với f5
--Kiểm tra thử hàm
print dbo.fTuoi(1982) --Phải cps dbo.

--Câu lệnh tạo hàm giá tị vô hướng trả về tổng số lượng giá trị nhân viên theo giới tính
create function fDemNv_Gioitinh (@phai nvarchar(3))
returns int
begin
	return (select count(MANV)
	from NHANVIEN
	where PHAI like @phai)
end
go
--Xóa hàm nếu đã có 
if object_id('fDemNv_Gioitinh', 'FN') is not null 
	drop function fDemNv_Gioitinh
go

print 'Tong so luong nhan vien: ' + convert(varchar, dbo.fDemNv_Gioitinh(N'Nam'))

--Viet ham tra ve bang cac nhan vien
create function fDemNv_PhongBan (@phg int)
returns table
as
	return (select manv, honv, tennv from NHANVIEN
	where phg = @phg)
go
--Xóa hàm nếu đã có 
if object_id('fDemNv_PhongBan', 'FN') is not null 
	drop function fDemNv_PhongBan
go
select * from dbo.fDemNv_PhongBan(5)

select * from nhanvien

--Bang da cau lenh