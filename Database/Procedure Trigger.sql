--1 create trigger insert thetu automatically when inserting new thanhvien
CREATE OR REPLACE TRIGGER TV_Tao_The_Tu 
    AFTER INSERT ON thanhvien
    for each row
DECLARE
    nghethan DATE;
    thetu_id thetu.mathe%type;
BEGIN
       begin
            select  mathe into thetu_id from thetu where matv = :new.matv;
        exception when NO_DATA_FOUND  then
            thetu_id := null;
        end;
        if thetu_id is null then
        nghethan:= add_months(:new.ngaydktv, 24);
            insert into thetu values ('TT' || :new.matv, :new.ngaydktv, nghethan, 'NV01', :new.matv);
        else 
            update thetu set ngayhethan = add_months(:new.ngaydktv, 24) where thetu_id = mathe;
        end if;
END;
--2. trigger khi xoa thanh vien thi phai xoa the tu, hoadon, muontrasach ma thanh vien do c� foreign key den do
CREATE OR REPLACE TRIGGER tv_xoa_tv
BEFORE DELETE ON thanhvien
FOR EACH ROW
DECLARE
    mtv thanhvien.matv%TYPE;
BEGIN
    BEGIN  
        SELECT matv INTO mtv FROM thetu WHERE thetu.matv = :OLD.matv;
    EXCEPTION WHEN no_data_found THEN
        mtv := NULL;
    END;
    
    DELETE FROM thetu WHERE matv = mtv;
    DELETE FROM hoadon WHERE matv = mtv;
    DELETE FROM muontrasach WHERE matv = mtv;
END;

-- check trigger tv_xoa_tv
INSERT INTO THANHVIEN VALUES ('tv99','Ng?c','USSH',TO_DATE('09-JAN-96','DD-MON-RR'),'QU?n 9','0903733351','nhanlh@gmail.com',TO_DATE('27-APR-22','DD-MON-RR'),'USERSVUSSH004','SVUSSH004TVTT');
INSERT INTO MUONTRASACH VALUES ('tv99','NV07','STV0001',TO_DATE('13-SEP-22','DD-MON-RR'),TO_DATE('13-DEC-22','DD-MON-RR'),'?� tr?');
INSERT INTO HOADON  VALUES ('HH0999',TO_DATE('31-JAN-21','DD-MON-RR'),'46000','h?ng s�ch','NV08','tv99');

select * from thetu where matv = 'tv99';
select * from hoadon where matv = 'tv99'
select * from thanhvien where matv = 'tv99'
select * from muontrasach where matv = 'tv99'

delete from thanhvien where matv = 'tv99'
 
 
 -- 3 Add new colum( Modified_Day) for each table, and create trigger when execute insert , update, Modified_Day is equal to sysdate 
 -- for tables: thanhvien, nhanvien, muontrasach, sach, truong, haodon, thetu
 alter table thanhvien
 add Modified_Day Date;
 update thanhvien
 set Modified_Day = sysdate;
 select * from thanhvien
/
CREATE OR REPLACE TRIGGER update_tv_modified_day
AFTER INSERT OR UPDATE  ON thanhvien
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE thanhvien SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER update_nv_modified_day
AFTER INSERT OR UPDATE  ON nhanvien
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE nhanvien SET MODIFIED_DAY = SYSDATE;
    END IF;
END;

CREATE OR REPLACE TRIGGER update_trg_modified_day
AFTER INSERT OR UPDATE  ON truong
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE truong SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER update_sach_modified_day
AFTER INSERT OR UPDATE  ON sach
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE sach SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
 /
CREATE OR REPLACE TRIGGER update_mts_modified_day
BEFORE INSERT OR UPDATE  ON muontrasach
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE muontrasach SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER update_hd_modified_day
AFTER INSERT OR UPDATE  ON hoadon
FOR EACH ROW
DECLARE
BEGIN
     IF ( inserting OR updating ) THEN
            UPDATE hoadon SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
 /
CREATE OR REPLACE TRIGGER update_tt_modified_day
AFTER INSERT OR UPDATE  ON thetu
FOR EACH ROW
DECLARE
BEGIN
    IF ( inserting OR updating ) THEN
            UPDATE THETU SET MODIFIED_DAY = SYSDATE;
    END IF;
END;
 -- 4 create trigger on table nhanvien, when inserting new nhanvien, the age of nhanvien is equal or greater than 18
 
 CREATE OR REPLACE TRIGGER nv_age_18
 BEFORE  INSERT ON nhanvien
 FOR EACH ROW
 DECLARE
    age number;
 BEGIN
        age := trunc(months_between(:new.ngvl, :new.ngaysinh)/12);
        if (age < 18) then
            raise_application_error(-20001, 'Nhan vien phai tu 18 tuoi tro len, vui long chen lai');
            rollback;
         end if;
 END;
 /
INSERT INTO NHANVIEN VALUES ('NV99','L? Xu?n Ho?ng',TO_DATE('28-SEP-18','DD-MON-RR'),TO_DATE('03-MAY-23','DD-MON-RR'),'128 Ng? Nh?n T?nh, Ph??ng 13, Qu?n 5',397008329,'063207361780','LXH@gmail.com','USERNV09','NV09TVTT', sysdate);
commit
--5 create trigger on table thanhvien , when inserting new thanhvien, the age of thanhvien is equal or greater than 16
CREATE OR REPLACE TRIGGER tv_age_16
 BEFORE  INSERT ON thanhvien
 FOR EACH ROW
 DECLARE
    age number;
 BEGIN
        age := trunc(months_between(:new.ngaysinh, :new.ngaydktv)/12);
        DBMS_OUTPUT.PUT_LINE(age);
        if (age < 16) then
            raise_application_error(-20002, 'Thanh vien phai tu 16 tuoi tro len, vui long chen lai');
            rollback;
         end if;
 END;
 INSERT INTO THANHVIEN  VALUES ('tv99','?o?n M?nh C??ng ','HCMUS',TO_DATE('26-MAR-16','DD-MON-RR'),'KTX khu B','0903902187','cuongdm@gmail.com',TO_DATE('27-APR-22','DD-MON-RR'),'USERSVHCMUS003','SVHCMUS003TVTT', TO_DATE('26-MAR-20','DD-MON-RR'));
 
 --6 create trigger when inserting muontrasach, check the number of books, which was borrowed with a member.
 -- If number of books is greater than 10, print  error messege 'Thanh vien khong duoc muon qua 10 quyen sach, vui long tra lai truoc khi muon'
 CREATE OR REPLACE TRIGGER MTS_number_10
 before INSERT ON muontrasach
 FOR EACH ROW
 DECLARE
    numberBook number;
 BEGIN
         select count(*) into numberBook from muontrasach where matv = :new.matv and (ghichu like 'C%' or ghichu like 'G%' or ghichu like 'H%'  ) group by :new.matv ;
        if (numberBook > 10) then
            RAISE_APPLICATION_ERROR(-20003, 'Thanh vien khong duoc muon qua 10 quyen sach, vui long tra lai truoc khi muon');
            rollback;
        end if;
 end;
 
select count(*)
from muontrasach  
where matv = 'SVUIT007' and (ghichu like 'C%' or ghichu like 'G%' or ghichu like 'H%'  )

INSERT INTO MUONTRASACH VALUES ('SVUIT007','NV01','STV0002',TO_DATE('17-SEP-22','DD-MON-RR'),TO_DATE('17-DEC-22','DD-MON-RR'),'H?t h?n', sysdate);

--7. Add column SoLuongTon on SACH adn update SoLuongTon, create trigger is soluongton = 0, show error 'Khong the muon, vi sach khong con trong thu vien'

CREATE OR REPLACE TRIGGER mts_soluongton_is_zero
BEFORE INSERT ON muontrasach
FOR EACH ROW
DECLARE
    soluongtonkho sach.soluongton%type;
BEGIN
        select count(*) into soluongtonkho from muontrasach where masach = :new.masach and (ghichu like 'C%' or ghichu like 'G%' or ghichu like 'H%'  );
        if (soluongtonkho = 0) then
            raise_application_error(-20004, 'Khong the muon, vi sach khong con trong thu vien');
            rollback;
        else
            update sach set soluongton = soluongton - 1 
            where masach = :new.masach;
        end if;
END;

--8. create procedure/ function to calculate the number of books, which a member is borrowing
CREATE OR REPLACE PROCEDURE cal_book_borrow (mtv thanhvien.matv%type)
IS
    dangmuon number;
BEGIN
          select count(*) into dangmuon from muontrasach where matv = mtv and (ghichu like 'C%' or ghichu like 'G%' or ghichu like 'H%'  );
          DBMS_OUTPUT.PUT_LINE('So sach ma thanh vien ' || mtv || ' dang muon la: ' || dangmuon);
END;

set serveroutput on
begin
    cal_book_borrow('SVUIT007');
end;

--9 create procedure/ function to calculate the number of hoadon, which a employee created
CREATE OR REPLACE PROCEDURE cal_hoadon_create (mnv nhanvien.manv%type)
IS
    created number;
BEGIN
          select count(*) into created from hoadon where manv = mnv;
          DBMS_OUTPUT.PUT_LINE('So hoa don ma nhan vien ' || mnv || ' da tao la: ' || created);
END;
      
begin
    cal_hoadon_create('NV01');
end;

--10. create a procedure/function that calculates the number of members lent books by an employee
CREATE OR REPLACE PROCEDURE cal_member_LentByEmployee (mnv nhanvien.manv%type)
IS
    lent number;
BEGIN
          select count(*) into lent from muontrasach where manv = mnv;
          DBMS_OUTPUT.PUT_LINE('So thanh vien duoc nhan vien ' || mnv || ' cho muon sach la: ' || lent);
END;

begin
    cal_member_LentByEmployee('NV01');
end;
--10. create a procedure/function that calculates money, which a member has paid 
CREATE OR REPLACE PROCEDURE cal_money_meber_paid (mtv thanhvien.matv%type)
IS
    money number;
BEGIN
          select sum(sotien) into money from hoadon where matv = mtv;
          DBMS_OUTPUT.PUT_LINE('So tien ma thanh vien ' || mtv || ' da tra la: ' || money);
END;

begin
    cal_money_meber_paid('GVUIT006');
end;
--11. create procedure/ function to calculate the number of books, which a member has retruned
CREATE OR REPLACE PROCEDURE cal_book_borrow (mtv thanhvien.matv%type)
IS
    returned number;
BEGIN
          select count(*) into returned from muontrasach where matv = mtv and (ghichu like '?%' );
          DBMS_OUTPUT.PUT_LINE('So sach ma thanh vien ' || mtv || ' da tra: ' || returned);
END;


begin
    cal_book_borrow('GVUIT005');
end;
--12. create procedure/ function to calculate money of all hoadon in a month of the year. And to calculate money of all hoadon in a the year
CREATE OR REPLACE PROCEDURE cal_money_hoadon_monthYear (month_ number, year_ number)
IS
    money number;
BEGIN
          select sum(sotien) into money from hoadon 
          where    (EXTRACT(YEAR FROM TO_DATE (nghd, 'dd-mon-rr') ) = year_ )
          and   ( EXTRACT(MONTH FROM TO_DATE (nghd, 'dd-mon-rr') ) = month_ ); 
          DBMS_OUTPUT.PUT_LINE('So tien hoa don thang  ' || month_ || ' nam ' || year_ || ' la: ' || money);
END;

begin
cal_money_hoadon_monthYear(5,2021);
end;

-- ----
CREATE OR REPLACE PROCEDURE cal_money_hoadon_Year ( year_ number)
IS
    money number;
BEGIN
          select sum(sotien) into money from hoadon 
          where    (EXTRACT(YEAR FROM TO_DATE (nghd, 'dd-mon-rr') ) = year_ );
          DBMS_OUTPUT.PUT_LINE('So tien hoa don thang  ' || month_ || ' nam ' || year_ || ' la: ' || money);
END;

begin
cal_money_hoadon_monthYear(5,2021);
end;

commit
