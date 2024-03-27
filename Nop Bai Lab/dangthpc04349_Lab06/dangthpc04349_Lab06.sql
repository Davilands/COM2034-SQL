use qlda


--Bài 1.1 Ràng buộc khi thêm mới nhân viên thì mức lương phải lớn hơn 15000, nếu vi phạm thì 
--xuất thông báo “luong phải >15000’

create trigger LUONG_NHANVIEN on NHANVIEN
for insert
as
if (select LUONG from inserted)< 15000
begin
	print N'Tiền lương phải lớn hơn 15000.'
	rollback transaction
end

insert into NHANVIEN
values (N'Trần',N'Hữu',N'Đang','012','1997-02-04',N'Cần Thơ','Nam',10000,'001',4);

DELETE FROM NHANVIEN WHERE MANV = '012'
SELECT * FROM NHANVIEN

--Bài 1.2 Ràng buộc khi thêm mới nhân viên thì độ tuổi phải nằm trong khoảng 18 <= tuổi <=65.
create trigger TUOI_NHANVIEN on NHANVIEN
for insert
as
DECLARE @Tuoi int
select  @Tuoi = DATEDIFF(year, NGSINH, GETDATE()) FROM NHANVIEN
if (18 <= (@Tuoi) and (@Tuoi) <= 65)
begin
	print N'Tuổi phải lớn hơn hoặc bằng 18 và nhỏ hơn hoặc bằng 65.'
	rollback transaction
end

insert into NHANVIEN
values (N'Trần',N'Hữu',N'Đang','015','2022-02-04',N'Cần Thơ','Nam',20000,'001',4);

select * from nhanvien
--bài1.3  Ràng buộc khi cập nhật nhân viên thì không được cập nhật những nhân viên ở TP HCM
create trigger diaChi_NhanVien on NHANVIEN
for update
as
if ((select DCHI from inserted) like N'%Tp HCM') or 
	((select DCHI from inserted) like N'%Tp Hồ Chí Minh') or 
	((select DCHI from inserted) like N'%TP HCM')
begin
	print N'không được cập nhật những nhân viên ở TP HCM'
	rollback transaction
end

update NHANVIEN set DCHI = N'Tp HCM' Where MaNV like '006'
----

-- Bài 2
-- 2.1
Create trigger TR_DemNV on NHANVIEN
after insert
AS 
BEGIN
declare @nu int, @nam int;
select @nu = count(MANV) from NHANVIEN where PHAI = N'Nữ';
select @nam = count(MANV) from NHANVIEN where PHAI = 'Nam';
	PRINT N'Tổng số nhân viên nữ: ' + cast(@nu as varchar);
	PRINT N'Tổng số nhân viên nam: ' + cast(@nam as varchar);
END

insert into NHANVIEN values 
(N'Trần', N'Hữu', N'Đang', '064', '2007-04-06', N'Cần Thơ', N'Nam', 14000, '005', 5);

--delete NHANVIEN where MANV = '064'

-- 2.2
Create trigger TR_CapNhatPhai on NHANVIEN
after update
AS 
if(select phai from deleted) != (select phai from inserted)		
BEGIN
declare @nu int, @nam int;
select @nu = count(MANV) from NHANVIEN where PHAI = N'Nữ';
select @nam = count(MANV) from NHANVIEN where PHAI = 'Nam';
	PRINT N'Tổng số nhân viên nữ: ' + cast(@nu as varchar);
	PRINT N'Tổng số nhân viên nam: ' + cast(@nam as varchar);
END

update NHANVIEN set PHAI = N'Nam' where MANV = '001'
--select * from NHANVIEN

-- 2.3
Create trigger TR_DemDa on dean
after delete
AS 
BEGIN
select MA_NVIEN, count(MADA) as 'Tổng số đề án đã tham gia' from PHANCONG
group by MA_NVIEN
END

delete DEAN where MADA = 31
-- select * from DEAN
-- insert into DEAN values (N'Sản phẩm N', 31, N'Cần Thơ', 5);

------------------------------------------------------

-- Bài 3
-- 3.1
Create trigger TR_XoaThanNhan on NHANVIEN
instead of delete
AS 
BEGIN
delete from THANNHAN where MA_NVIEN in (select MANV from deleted)
delete from NHANVIEN where MANV in (select MANV from deleted)
END

delete NHANVIEN where MANV = '064'

-- insert into THANNHAN values ('064', 'A', N'Nữ', '2007-04-06', N'Con');

-- 3.2
Create trigger TR_themNvVaoDA1 on NHANVIEN
after insert
AS 
BEGIN
insert into PHANCONG values ((select MANV from inserted), 1, 1, 100)
END

insert into NHANVIEN values 
(N'Trần', N'Hữu', N'Đang', '064', '2007-04-06', N'Cần Thơ', N'Nữ', 14000, '005', 5);
-- delete PHANCONG where THOIGIAN = 100
-- delete NHANVIEN where MANV = '064'