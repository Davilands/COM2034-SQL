use qlda
if OBJECT_ID ('NV_PB') is not null
drop view NV_PB
go
create view NV_PB 
as
select tennv, tenphg
from nhanvien inner join phongban on NHANVIEN.phg = phongban.maphg

select * from NV_PB