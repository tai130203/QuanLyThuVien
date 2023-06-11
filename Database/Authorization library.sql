CONNECT     c##orclTHUVIEN;
grant dba to c##orclTHUVIEN;
set serveroutput on
create user c##quanli identified by "quanli";
grant dba to  c##quanli;

--create role c##roleexamle;
--grant select on nhanvien to c##roleexamle;
--grant c##roleexamle to c##adminuser3;

--Create roles to c##role1_quanli
create role c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT  ON sach TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT  ON nhanvien TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT  ON thanhvien TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON truong TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON muontrasach TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON hoadon TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON thetu TO c##role1_quanli;
--assign c##role1_quanli to user c##quanli
grant c##role1_quanli to c##quanli;

disconnect  c##orclTHUVIEN;

create user c##nhanvien identified by "nhanvien";
grant dba to  c##nhanvien;
--Create roles to c##role1_nhanvien
create role c##role2_nhanvien;

GRANT SELECT,UPDATE, DELETE, INSERT  ON thanhvien TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON truong TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON muontrasach TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON hoadon TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON thetu TO c##role2_nhanvien;
--assign c##role2_nhanvien to user c##nhanvien
grant c##role2_nhanvien to c##nhanvien;

create user c##admin1 identified by "admin1";
grant dba to  c##admin1;
--Create roles to c##role1_nhanvien
create role c##role3_admin;



grant c##role1_quanli to c##admin1;
grant c##role3_admin to c##admin1;


--3 user
--c##admin1
--c##nhanvien
--c##quanli
----

-- MAIN ROLES
--
--CONNECTION  PERMISSION
grant connect to c##admin1;
grant connect to c##nhanvien;
grant connect to c##quanli;

--
--EXECUTION  PERMISSION.
connect c##orclthuvien
create role c##execute_procedure;
grant execute on cal_book_borrow to c##execute_procedure;
grant execute on cal_hoadon_create to c##execute_procedure;
grant execute on cal_member_LentByEmployee to c##execute_procedure;
grant execute on cal_money_meber_paid to c##execute_procedure;
grant execute on cal_book_borrow to c##execute_procedure;
grant execute on cal_money_hoadon_monthYear to c##execute_procedure;
grant execute on cal_money_hoadon_Year to c##execute_procedure;

grant c##execute_procedure to c##admin1;
grant c##execute_procedure to c##quanli;
grant c##execute_procedure to c##nhanvien;


--
--CREATE TRIGGER
create role c##execute_trigger;
grant trigger on nhanvien to c##admin1;
grant trigger on thanhvien to c##admin1;
grant trigger on hoadon to c##admin1;
grant trigger on thetu to c##admin1;
grant trigger on muontrasach to c##admin1;

grant trigger on nhanvien to c##quanli;
grant trigger on sach to c##quanli;

grant trigger on thanhvien to c##nhanvien;
grant trigger on muontrasach to c##nhanvien;
grant trigger on hoadon to c##nhanvien;
grant trigger on thetu to c##nhanvien;

--DML PERMISSION
--create role c##role1_quanli;
create role c##role1_quanli;

GRANT SELECT,UPDATE, DELETE, INSERT  ON sach TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT  ON nhanvien TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT  ON thanhvien TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON truong TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON muontrasach TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON hoadon TO c##role1_quanli;
GRANT SELECT,UPDATE, DELETE, INSERT ON thetu TO c##role1_quanli;
grant c##role1_quanli to c##quanli;


create role c##role2_nhanvien;

GRANT SELECT,UPDATE, DELETE, INSERT  ON thanhvien TO c##role2_nhanvien;
GRANT SELECT, INSERT ON truong TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON muontrasach TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON hoadon TO c##role2_nhanvien;
GRANT SELECT,UPDATE, DELETE, INSERT ON thetu TO c##role2_nhanvien;

grant c##role2_nhanvien to c##nhanvien;

grant c##role2_nhanvien to c##admin1;
grant c##role1_quanli to c##admin1;
grant c##execute_trigger to c##admin1;
grant c##execute_procedure to c##admin1;
