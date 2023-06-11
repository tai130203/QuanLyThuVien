--create table truong
CREATE TABLE TRUONG
(	"MATRG" VARCHAR2(10), 
	"TENTRG" VARCHAR2(50), 
	"SDT" NUMBER, 
	"EMAIL" VARCHAR2(20), 
	"DIACHI" NVARCHAR2(200), 
	 PRIMARY KEY ("MATRG")
);

-- create table sach
CREATE TABLE SACH
(	"MASACH" VARCHAR2(15), 
	"TENSACH" NVARCHAR2(50), 
	"NXB" NVARCHAR2(50), 
	"TACGIA" NVARCHAR2(50), 
	"SOLUONG" NUMBER(*,0), 
	"TINHTRANG" NVARCHAR2(10), 
	"GIA" VARCHAR2(20), 
	"NAMXB" VARCHAR2(20), 
	 PRIMARY KEY ("MASACH")
); 

-- create table nhanvien
CREATE TABLE NHANVIEN
(	"MANV" VARCHAR2(15), 
	"TENNV" NVARCHAR2(50), 
	"NGAYSINH" DATE, 
	"NGVL" DATE, 
	"DIACHI" NVARCHAR2(200), 
	"SODT" NUMBER, 
	"CCCD" VARCHAR2(12), 
	"EMAIL" VARCHAR2(20), 
	"USERNAME" VARCHAR2(100), 
	"PASSWORDNV" VARCHAR2(100), 
	 PRIMARY KEY ("MANV")
); 

-- create table thanhvien

CREATE TABLE THANHVIEN
(	"MATV" VARCHAR2(15), 
	"TENTV" NVARCHAR2(80), 
	"MADV" VARCHAR2(10) , 
	"NGAYSINH" DATE, 
	"DIACHI" NVARCHAR2(200), 
	"SODT" VARCHAR2(10), 
	"EMAIL" VARCHAR2(50), 
	"NGAYDKTV" DATE, 
	"USERNAME" VARCHAR2(100), 
	"PASSWORDTV" VARCHAR2(100), 
	 PRIMARY KEY ("MATV"),
	 CONSTRAINT "FK_MADV_MATRUONG" FOREIGN KEY ("MADV") REFERENCES TRUONG("MATRG") ENABLE
);

   -- create table muontrasach
CREATE TABLE MUONTRASACH
(	"MATV" VARCHAR2(15), 
	"MANV" VARCHAR2(15), 
	"MASACH" VARCHAR2(15), 
	"NGAYMUON" DATE, 
	"NGAYTRA" DATE, 
	"GHICHU" NVARCHAR2(400), 
	 PRIMARY KEY ("MATV", "MANV", "MASACH"),
	 CONSTRAINT "FK_MATV_MTS" FOREIGN KEY ("MATV") REFERENCES "THANHVIEN" ("MATV") ENABLE, 
	 CONSTRAINT "FK_MANV_MTS" FOREIGN KEY ("MANV") REFERENCES "NHANVIEN" ("MANV") ENABLE, 
	 CONSTRAINT "FK_MASACH_MTS" FOREIGN KEY ("MASACH") REFERENCES "SACH" ("MASACH") ENABLE
);

   -- create table hoadon

CREATE TABLE HOADON
(	"MAHD" VARCHAR2(15), 
	"NGHD" DATE, 
	"SOTIEN" VARCHAR2(20), 
	"GHICHU" NVARCHAR2(400), 
	"MANV" VARCHAR2(15), 
	"MATV" VARCHAR2(15), 
	 PRIMARY KEY ("MAHD"),
	 CONSTRAINT "FK_MANV_HD" FOREIGN KEY ("MANV") REFERENCES "NHANVIEN" ("MANV") ENABLE, 
	 CONSTRAINT "FK_MATV_HD" FOREIGN KEY ("MATV") REFERENCES "THANHVIEN" ("MATV") ENABLE
); 

-- create table thetu

CREATE TABLE THETU
(	
  "MATHE" VARCHAR2(25), 
	"NGAYTAO" DATE, 
	"NGAYHETHAN" DATE, 
	"MANV" VARCHAR2(15), 
	"MATV" VARCHAR2(15), 
	 PRIMARY KEY ("MATHE"),
	 CONSTRAINT "FK_MATV" FOREIGN KEY ("MATV") REFERENCES THANHVIEN ("MATV") ENABLE, 
	 CONSTRAINT "FK_MANV" FOREIGN KEY ("MANV") REFERENCES NHANVIEN ("MANV") ENABLE
); 
COMMIT;
--insert truong

Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('IU','Đại học Quốc Tế',425466326,'iu@gm.iu.vn','Phường Linh Trung-Thủ Đức');
Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('UIT','Đại học CNTT',942562652,'uit@gm.uit.vn','Phường Linh Trung-Thủ Đức');
Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('HCMUS','Đại học KHTN',966627484,'hcmus@gm.hcmus.vn','Phường Linh Trung-Thủ Đức');
Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('HCMUT','Đại học Bách Khoa',425466326,'bku@gm.hcmut.vn','Phường Linh Trung-Thủ Đức');
Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('UEL','Đại học Kinh Tế Luật',437539535,'uel@gm.uel.vn','Phường Linh Trung-Thủ Đức');
Insert into TRUONG (MATRG,TENTRG,SDT,EMAIL,DIACHI) values ('USSH','Đại học KHXH-NV',942525255,'ussh@gm.ussh.vn','Phường Linh Trung-Thủ Đức');

COMMIT;


-- insert nhanvien

Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV02','Nguyễn Phạm Ngọc Dung',to_date('20-NOV-96','DD-MON-RR'),to_date('24-JUN-10','DD-MON-RR'),'27 Trần Quốc Thảo, Phường 6, Quận 3',374799681,'096207362300','NPND@gmail.com','USERNV02','113');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV03','Nguyễn Thị Duyên',to_date('06-MAY-94','DD-MON-RR'),to_date('01-JAN-12','DD-MON-RR'),'Số 02 Lê Đại Hành, P. Minh Khai, Q. Hồng Bàng, Tp. HP',919723524,'091269737380','NTD@gmail.com','USERNV03','NV03TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV04','Phạm Ngọc Thành',to_date('26-MAR-96','DD-MON-RR'),to_date('02-JAN-12','DD-MON-RR'),'66S Lý Long Tường, Quận 7, TP.HCM',937057757,'008327282828','PNT@gmail.com','USERNV04','NV04TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV05','Nguyễn Thị Trường An',to_date('20-APR-90','DD-MON-RR'),to_date('03-FEB-11','DD-MON-RR'),'65 An Dương Vương, Phường 8, Quận 5, Thành phố Hồ Chí Minh',838428972,'096272831021','NTTA@gmail.com','USERNV05','HAHA');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV06','Bùi Đức Anh',to_date('30-NOV-97','DD-MON-RR'),to_date('10-MAY-13','DD-MON-RR'),' 38 Nguyễn Ư Dĩ, St, Quận 2, Thành phố Hồ Chí Minh',966604027,'096273848587','BDA@gmail.com','USERNV06','NV06TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV07','Nguyễn Đoàn Thiên Cung',to_date('08-OCT-95','DD-MON-RR'),to_date('01-JAN-13','DD-MON-RR'),'1 Phan Đăng Lưu, Phường 3, Bình Thạnh',937017035,'001207365601','NDTC@gmail.com','USERNV07','NV07TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV08','Trần Hoài Rin',to_date('27-JUN-94','DD-MON-RR'),to_date('03-APR-13','DD-MON-RR'),' Parkview Phú Mỹ Hưng, P Tân Phong, 138 Hà Huy Tập, Quận 6',944287082,'005307362091','THR@gmail.com','USERNV08','NV08TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV09','Lê Xuân Hoàng',to_date('28-SEP-94','DD-MON-RR'),to_date('03-MAY-16','DD-MON-RR'),'128 Ngô Nhân Tịnh, Phường 13, Quận 5',397008329,'063207361780','LXH@gmail.com','USERNV09','NV09TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV10','Đoàn Thị Ánh Ngọc',to_date('16-AUG-92','DD-MON-RR'),to_date('05-JUL-09','DD-MON-RR'),'243/29G Đường Tôn Đản, Phường 15, Quận 4',839060655,'061220262990','DTAD@gmail.com','USERNV01','114');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV13','Đoàn Ngọc Tuấn',to_date('09-NOV-88','DD-MON-RR'),to_date('16-JUL-22','DD-MON-RR'),'Đường An Dương Vương, Quận 1',945881905,'082207362017','PNA@gmail.com','USERNV13','NV13TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('QL01','Phạm Duy Mạnh',to_date('29-MAR-85','DD-MON-RR'),to_date('29-JUN-17','DD-MON-RR'),'46 Phan Đình Giót, Phường 2, Tân Bình, Thành phố Hồ Chí Minh ',395222457,'047202300436','THA@gmail.com','USERQL01','11');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV01','Phạm Ngọc Anh',to_date('09-NOV-95','DD-MON-RR'),to_date('29-JUN-17','DD-MON-RR'),'Đường An Dương Vương, Quận 6',945881905,'082207362017','PNA@gmail.com','USERNV01','12');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV11','Phạm Vĩnh An',to_date('24-JUN-93','DD-MON-RR'),to_date('12-DEC-15','DD-MON-RR'),'Đường Lê Văn Chí, Phường Linh Chiểu, Thủ Đức',338764889,'023245652301','avp2015@gmail.com','USERNV11','NV11TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV12','Ninh Dương Lan Ngọc',to_date('10-NOV-88','DD-MON-RR'),to_date('29-JUN-17','DD-MON-RR'),'Đường An Dương Vương, Quận 1',945881905,'082207362017','PNA@gmail.com','USERNV12','NV12TVTT');
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,NGVL,DIACHI,SODT,CCCD,EMAIL,USERNAME,PASSWORDNV) values ('NV14','Hoàng Thị Minh Anh',to_date('10-NOV-88','DD-MON-RR'),to_date('29-JUN-17','DD-MON-RR'),'Đường An Dương Vương, Quận 1',945881905,'082207362017','PNA@gmail.com','USERNV14','NV14TVTT');

COMMIT;

-- insert sach

Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0001','Toeic Listening Practice','Nhà xuất bản Trẻ','Nguyen Lan Anh',21,'Cũ','23000','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0002','Grammar For You (Basic)','Nhà xuất bản Trẻ','Geraldine Woods',14,'Mới','42000','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0003','Speak English like an American','Đại học Quốc gia Thành phố Hồ Chí Minh','Raymond Murphy',20,'Cũ','25500','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0004','Tactics For Listening','Nhà xuất bản Kim Đồng','Sidney Greenbaum',16,'Mới','26000','2021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0005','Sơ đồ tư duy 3300 chữ Hán','NXB Quốc gia Hà Nội','L.G. Alexander',17,'Mới','32000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0006','Giáo trình Minna No Nihongo','Nhà xuất bản Kim Đồng','Betty Schrampfer Azar',18,'Mới','59700','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0008','English Grammar in use','Nhà xuất bản Trẻ','The Windy',20,'Mới','270000','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0009','Oxford English Grammar','Nhà xuất bản Trẻ','Du Mẫn Hồng',25,'Mới','130800','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0010','Longman English Grammar Practice','Nhà xuất bản Kim Đồng','J. R. R. Tolkien',22,'Mới','50000','2009');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0011','Understanding and Using English Grammar','Nhà xuất bản Hà Nội','J. K. Rowling',23,'Cũ','21000','2015');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0012','Tự học 2000 từ vựng tiếng Anh','Nhà xuất bản Hà Nội','Theodor Seuss Geisel',20,'Cũ','24000','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0013','Joyful English – Easy Vocabulary For Daily Life','Nhà xuất bản Hà Nội','Roald Dahl',25,'Cũ','24800','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0014','5000 từ vựng tiếng Anh thông dụng nhất','Đại học Quốc gia Thành phố Hồ Chí Minh','Harper Lee',30,'Cũ','35000','2008');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SNN0015','Enrich Your IELTS Vocabulary','Nhà xuất bản Kim Đồng','Bruce Cumings',30,'Mới','23000','2016');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0001','Python lập trình thuật toán','Nhà xuất bản Hà Nội','Kevin Kelly',10,'Mới','58900','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0002','12 Xu Hướng Công Nghệ Trong Thời Đại 4.0','Nhà xuất bản Kim Đồng','Alec Ross',11,'Cũ','25500','2003');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0003','Khoa Học Khám Phá – Dữ Liệu Lớn','Nhà xuất bản Hà Nội','Hồ Anh Thái',12,'Cũ','26000','2015');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0004','Công Nghiệp Tương Lai','Nhà xuất bản Kim Đồng','Bích Thúy Đỗ',13,'Cũ','25500','1021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0005','Deep Learning – Cuộc Cách Mạng Học Sâu','Nhà xuất bản Trẻ','Hamlet Trương',14,'Mới','17600','2017');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0006','Nghệ Thuật Ẩn Mình','Nhà xuất bản Kim Đồng','Nguyễn Trương Quý',15,'Cũ','36120','2014');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0007','Hacker Lược Sử','Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh','Mai Chi Nguyễn',16,'Cũ','15000','2003');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0009','Cải Tổ Doanh Nghiệp Trong Thời Đại Số','Nhà xuất bản Lao Động ','Kazuo Ishiguro',18,'Cũ','36000','2005');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0010','Ký Sự BrSE – Những Nẻo Đường Nghề BrSE','Nhà xuất bản Trẻ','Kate DiCamillo',19,'Mới','21000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0012','Khoa Học Khám Phá: Trí Tuệ Giả Tạo','Nhà xuất bản Lao Động ','Charles Dickens',20,'Cũ','36600','2015');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0013','Thiết Kế Mạng Intranet','Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh','Mai Lan Hương',20,'Cũ','62000','2007');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0014','Cuộc Chiến Công Nghệ Số','Nhà xuất bản Trẻ','Kenneth Grahame',20,'Cũ','35000','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0015','AI Trong Cuộc Cách Mạng Công Nghệ 4.0','Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh','George Orwell',20,'Cũ','18000','2008');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0001','Giáo trình giải tích đa trị','Nhà xuất bản Hội Nhà văn','Nguyễn Đông Yên',13,'Cũ','23000','2010');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0002','Phương trình vi phân đạo hàm riêng tập 1','Nhà xuất bản Hội Nhà văn','Trần Đức Vân',14,'Mới','42000','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0003','Phương trình vi phân đạo hàm riêng tập 2','Nhà xuất bản Hà Nội','Trần Đức Vân',15,'Cũ','25500','2015');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0004','Nhập môn lý thuyết điều khiển','Nhà xuất bản Lao Động ','Vũ Ngọc Phát',16,'Cũ','26000','2005');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0005','Giáo trình đại số tuyến tính','Đại học Quốc gia Thành phố Hồ Chí Minh','Ngô Việt Trung',17,'Cũ','42300','2003');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0006','Lý thuyết hệ động lực','Nhà xuất bản Hội Nhà văn','Nguyễn Đình Công',18,'Cũ','17600','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0007','Giáo trình đại số hiện đại','Đại học Quốc gia Thành phố Hồ Chí Minh','Nguyễn Tự Cường',19,'Mới','38000','2021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0008','Lôgic toán và cơ sở toán học','Nhà xuất bản Hội Nhà văn','Phan Đình Diệu',20,'Mới','30000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0009','Hàm thực và giải tích hàm','Nhà xuất bản Hội Nhà văn','Hoàng Tụy',20,'Mới','50000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0010','Lý thuyết không gian Orlicz','Nhà xuất bản Hội Nhà văn','Hà Huy Bảng',20,'Mới','21000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0011','Đại số máy tính: Cơ sở Groebner','Nhà xuất bản Lao Động ','Lê Tuấn Hoa',27,'Mới','35000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0012','Mã hóa thông tin - Cơ sở toán học và ứng dụng','Nhà xuất bản Chính trị quốc gia Sự thật ','Phạm Huy Điển, Hà Huy Khoái',20,'Mới','16000','2028');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0013','Xác suất và thống kê','Nhà xuất bản Chính trị quốc gia Sự thật ','Trần Mạnh Tuấn',20,'Mới','35000','2016');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0014','Lý thuyết tổ hợp và đồ thị','Nhà xuất bản Lao Động ','Ngô Đắc Tân',34,'Mới','23000','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0008','Mấy vấn đề về Đảng cầm quyền','Nhà xuất bản Chính trị quốc gia Sự thật ','Stein tonnesson',40,'Cũ','42000','2014');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STT0015','Công thức kiểu Hopf-Lax-Oleinik','Nhà xuất bản Hà Nội','Ngô Việt Trung',30,'Cũ','25500','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SCT0011','Đảng lãnh đạo xây dựng nền kinh tế thị trường','Nhà xuất bản Phụ nữ Việt Nam','Nguyễn Văn Xuân',40,'Cũ','32700','2011');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0001','Các Siêu Cường AI – Trung Quốc, Thung Lũng Silicon','Nhà xuất bản Hà Nội ','Nghiêm Hùng',15,'Cũ','32000','2015');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0002','Cơ sở lý thuyết của phương pháp sắc ký khí','Nhà xuất bản Lao Động ','Phạm Hùng Việt',15,'Mới','17600','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0003','Thành Phố Thông Minh ','Nhà xuất bản Lao Động ','Lê Mậu Quyền',20,'Cũ','37000','2008');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0004','Chạy Đua Với Robot','Nhà xuất bản Hà Nội','Từ Văn Mạc',12,'Cũ','30000','2009');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0005','Trí Tuệ Giả Tạo','Nhà xuất bản Lao Động ','Tam Long Kim',57,'Mới','18900','2017');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0006','Kỷ Nguyên Trí Tuệ Nhân Tạo','Nhà xuất bản Hà Nội','Tư Hải Giản',26,'Mới','21000','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0007','LIFE 3.0 – Loài Người ','Nhà xuất bản Hà Nội','Mahadev Desai',25,'Cũ','24000','2002');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0008','Phát Minh Cuối Cùng','Nhà xuất bản Lao Động ','Cat Hellisen',41,'Cũ','24800','2007');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0009','Ứng Dụng Trí Tuệ Nhân Tạo Để Dẫn Đầu','Đại học Quốc gia Thành phố Hồ Chí Minh','Vĩnh Bá',20,'Cũ','35000','2005');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0010','Cách Mạng Công Nghiệp Lần Thứ Tư','Nhà xuất bản Lao Động ','E B White',16,'Cũ','23000','2012');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0001','Hành trình về phương Đông','Nhà xuất bản Lao Động ','Quan Kế Huy',18,'Cũ','42000','2012');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0002','Cơ thể tự chữa lành','Nhà xuất bản Lao Động ','Jamie Lee Curtis',20,'Mới','25500','2016');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0003','Đảo mộng mơ','Nhà xuất bản Hà Nội','Navalny',20,'Cũ','26000','2004');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0004','Siêu nhí hỏi, nhà khoa học trả lời','Nhà xuất bản Hà Nội','An Irish Goodbye',14,'Cũ','32000','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0005','Học viện - The Institute','Nhà xuất bản Trẻ','The Whale',20,'Cũ','54000','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0006','Người bí ẩn khoác áo hồng y','Nhà xuất bản Hà Nội','Women Talking',20,'Cũ','70000','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0007','Đức Phật và kẻ nổi loạn','Nhà xuất bản Trẻ','Rosie Nguyễn',25,'Mới','30000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0008','Đắc Nhân Tâm','Nhà xuất bản Trẻ','Dale Carnegie',35,'Mới','50000','2021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0009','Nhà giả kim','Đại học Quốc gia Thành phố Hồ Chí Minh','Paulo Coelho',35,'Mới','21000','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SGT0010','Tội Ác Và Hình Phạt','Đại học Quốc gia Thành phố Hồ Chí Minh','Fyodor Dostoevsky',25,'Mới','24000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0001','Cuốn sách khổng lồ ','Nhà xuất bản Hà Nội','Nguyễn Quang Riệu',32,'Mới','3000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0002','Sách tương tác vừa học vừa chơi','Nhà xuất bản Hà Nội','Stephen Hawking',21,'Cũ','68000','2005');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0003','Vũ trụ','Nhà xuất bản Hà Nội','Carl Sagan',35,'Cũ','23000','2010');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0004','Vật lý thiên văn cho người vội vã','Nhà xuất bản Hà Nội','Trang Hạ',36,'Mới','42000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0005','Những câu chuyện thiên văn thú vị','Đại học Quốc gia Thành phố Hồ Chí Minh','Nguyễn Phong Việt',32,'Mới','25500','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0006','Vũ trụ trong vỏ hạt dẻ','Nhà xuất bản Hà Nội','Anh Khang',50,'Mới','82800','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0007','Bách khoa tri thức về khám phá ','Nhà xuất bản Hà Nội','Nguyễn Ngọc Thạch',30,'Mới','32000','2019');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0008','Lịch Sử Vạn Vật','Đại học Quốc gia Thành phố Hồ Chí Minh','Hamlet Trương',25,'Mới','17600','2019');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0009','Huyền thoại về các chòm sao','Đại học Quốc gia Thành phố Hồ Chí Minh','Bill Bryson',16,'Cũ','96000','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('STV0010','The Secrect - Bí Mật Luật Hấp Dẫn','Nhà xuất bản Kim Đồng','BILL AULET',30,'Mới','30000','2021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0001','Quốc Gia Khởi Nghiệp','Đại học Quốc gia Thành phố Hồ Chí Minh','John Brooks',28,'Cũ','50000','2013');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0002','Trump - 100 Lời Khuyên Đầu Tư','Nhà xuất bản Kim Đồng','Robert T. Kiyosaki',33,'Mới','45100','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0003','45 Giây Tạo Nên Thay Đổi','Đại học Quốc gia Thành phố Hồ Chí Minh','John Perkins',30,'Mới','24000','2021');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0004','Nếu Tôi Được Biết Khi Còn 20','Nhà xuất bản Kim Đồng','Jim Collins',27,'Mới','3000','2020');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0005','Những Bài Học Đầu Tư Từ Warren Buffett','Đại học Quốc gia Thành phố hcm','Jerry I. Porras',28,'Mới','134000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0006','Thiên Nga Đen','Nhà xuất bản Trẻ','Jim Collins',27,'Mới','50000','2022');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0007','The Four - Tứ Đại Quyền Lực','Đại học Quốc gia Thành phố Hồ Chí Minh','Thomas L.Friedman',29,'Cũ','21000','2005');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0008','Báo Cáo Tài Chính Dưới Góc Nhìn Của Warren Buffett','Nhà xuất bản Trẻ','Timothy Ferress',20,'Cũ','24000','2006');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0009','Phân Tích Chứng Khoán - Security Analysis','Đại học Quốc gia Thành phố Hồ Chí Minh','Richard H. Thaler',40,'Cũ','3000','2007');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SKT0010','Nhà Đầu Tư Thông Minh','Đại học Quốc gia Thành phố Hồ Chí Minh','Cass R. Sunstein',18,'Mới','35000','2023');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('IT002','Lập trình hướng đối tượng OOP C++','Đại học Quốc gia Thành phố Hồ Chí Minh','Nguyễn Thanh Sơn',29,'Mới','23000','2018');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('IT001','Lập trình C++ cơ bản','Đại học Quốc gia Thành phố Hồ Chí Minh','Nguyễn Thanh Sơn',29,'Cũ','30000','2016');
Insert into SACH (MASACH,TENSACH,NXB,TACGIA,SOLUONG,TINHTRANG,GIA,NAMXB) values ('SAI0011','Công nghiệp hóa- hiện đại hóa','Nhà xuất bản Lao Động ','E B White',16,'Cũ','23000','2018');


COMMIT;

--insert thanhvien

Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT001','Nguyen Thi Nga','UIT',to_date('04-MAY-98','DD-MON-RR'),'TP Thủ đức','0526270573','ngatn@gmail.com',to_date('10-APR-22','DD-MON-RR'),'USERGVUIT001','778');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT002','Hồ Thị Hồng','UIT',to_date('11-APR-93','DD-MON-RR'),'phường Linh Trung, TP Thủ đức','0914162689','haht@gmail.com',to_date('10-APR-22','DD-MON-RR'),'USERGVUIT002','GVUIT002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT003','Trần Thị Minh Nguyệt','UIT',to_date('11-NOV-96','DD-MON-RR'),'TP Thủ đức','0166978867','nguyetttm@gmail.com',to_date('10-APR-22','DD-MON-RR'),'USERGVUIT003','GVUIT003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT004','Nguyễn Thị Ánh Hồng','UIT',to_date('06-MAR-97','DD-MON-RR'),'Quận Bình Thạnh','0978178764','huyennta@gmail.com',to_date('10-APR-22','DD-MON-RR'),'GVUIT005','114');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT005','Ngô Thị Nhạn','UIT',to_date('13-SEP-97','DD-MON-RR'),'Quận 6','0776094853','thaonp@gmail.com',to_date('10-APR-22','DD-MON-RR'),'USERGVUIT005','GVUIT005TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT006','Huỳnh Thị Tuyết','UIT',to_date('12-AUG-94','DD-MON-RR'),'TP Thủ đức','0905682529','tuyetht@gmail.com',to_date('10-APR-22','DD-MON-RR'),'GVUIT006','113');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT001','Trương Thị Hoàng Anh','UIT',to_date('08-FEB-98','DD-MON-RR'),'Phường Phúc thành','0918612410','anhtth@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT001','567');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT002','Trương Hoàng Giang','UIT',to_date('10-MAY-93','DD-MON-RR'),'Số 287 Đường 21-8  ','0914421796','giangth@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT002','HVUIT002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT003','Nguyễn Huỳnh Minh Thuận','UIT',to_date('05-OCT-91','DD-MON-RR'),'Quận 1','0976054844','thuannhm@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT003','HVUIT003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT004','Nguyễn Thành Lập','UIT',to_date('23-OCT-97','DD-MON-RR'),'Quận 1','0986109656','lapnt@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT004','HVUIT004TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT005','Huỳnh Nhật Tài','UIT',to_date('10-MAY-97','DD-MON-RR'),'Số 19 Trần Hưng Đạo','0164384506','taihn@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT005','HVUIT005TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT006','Nguyễn Trần Gia Huy','UIT',to_date('01-MAR-98','DD-MON-RR'),'Quận 1','0167451899','huyntg@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT006','HVUIT006TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT007','Nguyễn Văn Tiện','UIT',to_date('28-FEB-90','DD-MON-RR'),'Quận 1','0975861551','tiennv@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT007','HVUIT007TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT008','Bùi Văn Khánh','UIT',to_date('08-OCT-92','DD-MON-RR'),'Phường Hồng Hà','0936053286','khanhbv@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT008','HVUIT008TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT009','Lý Hùng Nhẫn','UIT',to_date('25-FEB-96','DD-MON-RR'),'Đường Hùng vương','0974131489','nhanlh@gmail.com',to_date('31-JUL-19','DD-MON-RR'),'USERHVUIT009','HVUIT009TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH002','Nguyễn Thị Thuận Hòa','USSH',to_date('01-SEP-99','DD-MON-RR'),'Quận 1','0913806107','hoantt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH002','SVUSSH002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH003','Hoàng Tấn Lộc','USSH',to_date('15-MAY-00','DD-MON-RR'),'Trần Hưng Đạo, Quận 4','0903900203','locht@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH003','SVUSSH003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH004','Lê Hồng Nhân','USSH',to_date('09-JAN-96','DD-MON-RR'),'Quận 9','0903733351','nhanlh@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH004','SVUSSH004TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH005','Nguyễn Hải Nam','USSH',to_date('15-JUL-98','DD-MON-RR'),'Quận 1','0913725954','namnh@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH005','SVUSSH005TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH006','Phạm Viết Đăng Khoa','USSH',to_date('11-SEP-97','DD-MON-RR'),'Phường LinhChiểu, Thủ Đức','0903951109','khoapvd@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH006','SVUSSH006TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH007','Trần Thị Bích Trâm','USSH',to_date('07-NOV-96','DD-MON-RR'),'108 Phạm Văn Đồng, TP Thủ Đức','0908000615','tramthb@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH007','SVUSSH007TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS001','Lê Đoàn Thanh Tâm','HCMUS',to_date('11-NOV-00','DD-MON-RR'),'Quận 9','0903003525','tamldt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS001','SVHCMUS001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS002','Nguyễn Thị Lan','HCMUS',to_date('07-JUL-96','DD-MON-RR'),'Quận 1','0903988910','lannt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS002','SVHCMUS002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS003','Đoàn Mạnh Cường ','HCMUS',to_date('26-MAR-00','DD-MON-RR'),'KTX khu B','0903902187','cuongdm@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS003','SVHCMUS003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS004','Vũ Kim Hoàng','HCMUS',to_date('18-OCT-01','DD-MON-RR'),'KTX khu B','0913806101','hoangvk@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS004','SVHCMUS004TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS005','Hà Thị Bé Tho','HCMUS',to_date('14-MAY-00','DD-MON-RR'),'KTX khu B','0903333369','thohtb@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS005','SVHCMUS005TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS006','Kim Thị Mụm','HCMUS',to_date('19-JUN-00','DD-MON-RR'),'KTX khu A','0903331930','mumkt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS006','SVHCMUS006TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS007','Phù Bửu Đan','HCMUS',to_date('10-JAN-00','DD-MON-RR'),'KTX khu A','0913905045','danpb@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS007','SVHCMUS007TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS008','Sơn Thị Sáu','HCMUS',to_date('19-NOV-00','DD-MON-RR'),'KTX khu A','0903609699','saust@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS008','SVHCMUS008TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUS009','Trương Thị Phương Dung','HCMUS',to_date('16-MAR-00','DD-MON-RR'),'KTX khu B','0903749243','dungttp@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVHCMUS009','SVHCMUS009TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVIU001','Lê Khánh Linh','IU',to_date('15-APR-00','DD-MON-RR'),'Quận 9','0913913508','linhlk@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVIU001','SVIU001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVIU002','Kiên Thị Na','IU',to_date('20-MAR-00','DD-MON-RR'),'Quân 5','0908677378','nakt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVIU002','SVIU002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVIU003','Lê Thị Hà','IU',to_date('07-FEB-01','DD-MON-RR'),'Quận 9','0913926325','halt@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVIU003','SVIU003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVIU004','Lê Văn Thắng ','IU',to_date('26-MAR-01','DD-MON-RR'),'Quận 9','0903906370','thanglv@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVIU004','SVIU004TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788092','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc23462@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788092','SVHCMUT788092TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150292','Nguyễn Thành An','UIT',to_date('10-FEB-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0922247159','ngan22002@gmail.com',to_date('12-FEB-21','DD-MON-RR'),'USERSVUIT2150292','SVUIT2150292TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880915','Phạm Thu Hằng','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1534615@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880915','SVHCMUT7880915TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880919','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1934619@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880919','SVHCMUT7880919TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880924','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2434624@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880924','SVHCMUT7880924TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880929','Nguyễn Thúy An','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2934629@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880929','SVHCMUT7880929TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000279','Trần Thị Xuân','HCMUT',to_date('10-JUL-25','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1979@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000279','GVHCMUT7000279TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000287','Trần Thị Hương','HCMUT',to_date('10-MAR-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1987@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000287','GVHCMUT7000287TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000292','Nguyễn Xuân Bằng','HCMUT',to_date('10-AUG-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1992@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000292','GVHCMUT7000292TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000296','Trần Thị Xuân','HCMUT',to_date('10-DEC-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1996@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000296','GVHCMUT7000296TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUSSH001','Nguyễn Trần Phương','USSH',to_date('17-AUG-91','DD-MON-RR'),'Đường Tô Hiệu, TP. Sơn La, Sơn La','974808483','phuongnt@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERHVUSSH001','HVUSSH001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT006','Võ Ngọc Thắm','UIT',to_date('17-JAN-99','DD-MON-RR'),'Thị trấn Gia Bình, Huyện Gia Bình, Tỉnh Bắc Ninh','0903911924','thamvn@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT006','SVUIT006TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT007','Trần Bé Mười','UIT',to_date('02-SEP-00','DD-MON-RR'),'Thôn Cầu Đào, Xã Nhân Thắng, Huyện Gia Bình, Tỉnh Bắc Ninh','0903805991','muoitb@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT007','SVUIT007TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT008','Lê Văn Sinh','UIT',to_date('17-JUN-00','DD-MON-RR'),'Thôn Thành Dền, xã Đào Viên, huyện Quế Võ, tỉnh Bắc Ninh','903852827','sinhlv@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT008','SVUIT008TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT009','Nguyễn Lương Minh Tân','UIT',to_date('04-JUN-98','DD-MON-RR'),'Khu 3, TT. An Châu, H. Sơn Động, T. Bắc Giang','907262626','tannlm@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT009','SVUIT009TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH001','Nguyễn Thị Hải Oanh','USSH',to_date('23-FEB-01','DD-MON-RR'),'Tiểu khu 4, TT. Neo, H. Yên Dũng, T. Bắc Giang','903676772','oanhnth@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUSSH001','SVUSSH001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150293','Nguyễn Thành An','UIT',to_date('10-MAR-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0923347159','ngan32003@gmail.com',to_date('13-MAR-21','DD-MON-RR'),'USERSVUIT2150293','SVUIT2150293TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150296','Phạm Hà','UIT',to_date('10-JUN-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0926647159','ngan62006@gmail.com',to_date('16-JUN-21','DD-MON-RR'),'USERSVUIT2150296','SVUIT2150296TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788093','Võ Duy Anh','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc33463@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788093','SVHCMUT788093TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788096','Lâm Minh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0258962727','lmngoc63466@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'SVHCMUT788096','114');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880911','Lê Văn Hùng','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1134611@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880911','SVHCMUT7880911TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880916','Nguyễn Hoàn Dững','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1634616@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880916','SVHCMUT7880916TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880920','Trường Thế đan','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2034620@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880920','SVHCMUT7880920TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880925','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2534625@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880925','SVHCMUT7880925TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000280','Trần Thi Hường','HCMUT',to_date('10-AUG-25','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1980@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000280','GVHCMUT7000280TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000283','Lê Lan Anh','HCMUT',to_date('10-NOV-25','DD-MON-RR'),'Quận 12-Tp HCM','0258962727','gvtoan1983@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000283','GVHCMUT7000283TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000288','Trần Thị Xuân','HCMUT',to_date('10-APR-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1988@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000288','GVHCMUT7000288TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000293','Nguyễn Nga','HCMUT',to_date('10-SEP-26','DD-MON-RR'),'Quận 2-Tp HCM','0258962727','gvtoan1993@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000293','GVHCMUT7000293TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000297','Trần Thị Xuân','HCMUT',to_date('10-JAN-27','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1997@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000297','GVHCMUT7000297TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUSSH001','Phan Thế Long','USSH',to_date('12-MAR-93','DD-MON-RR'),'342, Nam Kỳ Khởi Nghĩa, Quận Phú Nhuận, TPHCM','0338268244','longtpussh@gmail.com',to_date('10-MAY-21','DD-MON-RR'),'USERGVUSSH001','GVUSSH001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUSSH002','Nguyễn Xuân Dương','USSH',to_date('18-DEC-00','DD-MON-RR'),'khu phố 5,phương Ling Trung, thủ đức','0988425556','dngxuanussh@gmail.com',to_date('10-MAY-21','DD-MON-RR'),'USERGVUSSH002','GVUSSH002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT007','Nguyễn Lý Đăng Khoa','UIT',to_date('16-AUG-96','DD-MON-RR'),'TP Thủ đức','0905682529','tuyetht@gmail.com',to_date('26-JAN-23','DD-MON-RR'),'USERGVUIT007','GVUIT007TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUSSH004','Lê Long Hưng','USSH',to_date('18-DEC-83','DD-MON-RR'),'khu phố 5,phương Ling Trung, thủ đức','0228373575','hunglongl@gmail.com',to_date('10-MAY-21','DD-MON-RR'),'USERGVUSSH004','GVUSSH004TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH008','Hoàng Long','USSH',to_date('15-MAY-03','DD-MON-RR'),'Trần Hưng đạo, Quận 4','0903900203','locht@gmail.com',to_date('27-APR-22','DD-MON-RR'),'USERSVUSSH008','SVUSSH008TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUSSH009','Hồ Tấn Tài','USSH',to_date('15-MAY-04','DD-MON-RR'),'ktx khu B','0903900203','locht@gmail.com',to_date('23-MAY-23','DD-MON-RR'),'USERSVUSSH009','SVUSSH009TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150294','Nguyễn Thành An','UIT',to_date('10-APR-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0924447159','ngan42004@gmail.com',to_date('14-APR-21','DD-MON-RR'),'USERSVUIT2150294','SVUIT2150294TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150297','Nguyễn Thành An','UIT',to_date('10-JUL-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0927747159','ngan72007@gmail.com',to_date('17-JUL-21','DD-MON-RR'),'USERSVUIT2150297','SVUIT2150297TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788094','Lâm Minh Châu','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc43464@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788094','SVHCMUT788094TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788097','Phạm duy Khánh','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc73467@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788097','SVHCMUT788097TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880912','Phạm Khành An','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0258962727','lmngoc1234612@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880912','SVHCMUT7880912TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880917','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1734617@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880917','SVHCMUT7880917TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880921','Hoàng Long','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2134621@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880921','SVHCMUT7880921TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880926','Lâm Minh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2634626@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880926','SVHCMUT7880926TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000281','Trần Thị Xuân','HCMUT',to_date('10-SEP-05','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1981@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000281','GVHCMUT7000281TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000284','Nguyễn Như Ngọc','HCMUT',to_date('10-DEC-03','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1984@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000284','GVHCMUT7000284TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000289','Trần Thị Xuân','HCMUT',to_date('10-MAY-00','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1989@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000289','GVHCMUT7000289TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000294','Hưa Ngọc Nhi','HCMUT',to_date('10-OCT-04','DD-MON-RR'),'Quận 4-Tp HCM','0258962727','gvtoan1994@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000294','GVHCMUT7000294TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000298','Nguyễn Trần Diễm Quỳnh','HCMUT',to_date('10-FEB-07','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1998@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000298','GVHCMUT7000298TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880910','NGuyễn Minh Chánh','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1034610@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880910','SVHCMUT7880910TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT003','Tạ Thùy Linh','UIT',to_date('27-DEC-96','DD-MON-RR'),'Xã An Nhơn Tây, Huyện Củ Chi, TP Hồ Chí Minh','903870088','linhtt@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT003','114');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT011','Trần Trọng Tín','UIT',to_date('05-JUN-03','DD-MON-RR'),'ktx khu A','907262626','tannlm@gmail.com',to_date('01-JUN-23','DD-MON-RR'),'USERSVUIT011','SVUIT011TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT009','Phạm Học Trà My','UIT',to_date('16-AUG-96','DD-MON-RR'),'Quận Tân Phú','0905682529','tuyetht@gmail.com',to_date('26-JAN-23','DD-MON-RR'),'USERGVUIT009','GVUIT009TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('Thanhvien9000','Trương Thu Anh','UIT',to_date('29-MAR-03','DD-MON-RR'),'BÌNH THẠNH','0395222457','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERThanhvien9000','Thanhvien9000TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('Thanhvien9001','NguyễnQuốc Trạng','UIT',to_date('29-MAR-03','DD-MON-RR'),'Tân Phú','0926867543','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERThanhvien9001','Thanhvien9001TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('Thanhvien9002','Lê Bá Nhất Long','UIT',to_date('29-MAR-03','DD-MON-RR'),'Quận 1','0926463778','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERThanhvien9002','Thanhvien9002TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('Thanhvien9003','Nguyễn Tấn Tài','UIT',to_date('29-MAR-03','DD-MON-RR'),'BÌNH THẠNH','0326373789','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERThanhvien9003','Thanhvien9003TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99992','Nguyễn Việt Hoàng','UIT',to_date('29-MAR-03','DD-MON-RR'),'Quận 1','0926463778','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99992','SVUIT99992TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99993','Lê Bá Nhất Long','UIT',to_date('29-MAR-03','DD-MON-RR'),'Quận 9','0326373789','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99993','SVUIT99993TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99980','Huỳnh Lê Phong','UIT',to_date('29-MAR-03','DD-MON-RR'),'phường Linh Trung, Thủ Đức','0395222457','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99980','SVUIT99980TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99981','Phạm trọng Tuấn','UIT',to_date('29-MAR-03','DD-MON-RR'),'Thủ Đức','0926867543','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99981','SVUIT99981TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99990','Trần Hoàng Phúc','UIT',to_date('29-MAR-03','DD-MON-RR'),'phường Linh Trung, Thủ Đức','0395222457','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99990','SVUIT99990TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99991','Ngô Tất Tố','UIT',to_date('29-MAR-03','DD-MON-RR'),'phường Linh Trung, Thủ Đức','0926867543','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99991','SVUIT99991TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99982','Nguyễn Dương','UIT',to_date('29-MAR-03','DD-MON-RR'),'Quận 1','0926463778','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99982','SVUIT99982TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT99983','NGuyễn Duy khánh','UIT',to_date('29-MAR-03','DD-MON-RR'),'phường Linh Trung, Thủ Đức','0326373789','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERSVUIT99983','SVUIT99983TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2159991','Trần Xuân Bằng','UIT',to_date('10-JAN-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0921147159','ngan12001@gmail.com',to_date('11-JAN-21','DD-MON-RR'),'USERSVUIT2159991','SVUIT2159991TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150291','Nguyễn Thành An','UIT',to_date('10-JAN-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0921147159','ngan12001@gmail.com',to_date('11-JAN-21','DD-MON-RR'),'USERSVUIT2150291','SVUIT2150291TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150091','Nguyễn Phước Thịnh','UIT',to_date('10-JAN-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0921147159','ngan12001@gmail.com',to_date('11-JAN-21','DD-MON-RR'),'USERSVUIT2150091','SVUIT2150091TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150295','Huỳnh Bảo Long','UIT',to_date('10-MAY-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0925547159','ngan52005@gmail.com',to_date('15-MAY-21','DD-MON-RR'),'USERSVUIT2150295','SVUIT2150295TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150298','Lương Văn Đại','UIT',to_date('10-AUG-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0928847159','ngan82008@gmail.com',to_date('18-AUG-21','DD-MON-RR'),'USERSVUIT2150298','SVUIT2150298TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788091','Trần DUy Khang','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc13461@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788091','SVHCMUT788091TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788095','Trần Văn Dũng','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc53465@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788095','SVHCMUT788095TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788098','Nguyễn Thị Thảo','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc83468@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788098','SVHCMUT788098TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880913','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1334613@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880913','SVHCMUT7880913TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880922','Hà Hương','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2234622@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880922','SVHCMUT7880922TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880927','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2734627@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880927','SVHCMUT7880927TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000278','Trần Thị Xuân','HCMUT',to_date('10-JUN-25','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1978@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000278','GVHCMUT7000278TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000282','Trấn Thành','HCMUT',to_date('10-OCT-25','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1982@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000282','GVHCMUT7000282TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000285','Trần Hoàng Bách','HCMUT',to_date('10-JAN-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1985@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000285','GVHCMUT7000285TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000290','Trần Thị Xuân','HCMUT',to_date('10-JUN-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1990@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000290','GVHCMUT7000290TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUIT008','Nguyễn Thị Mai Liên','UIT',to_date('24-AUG-00','DD-MON-RR'),'TP Thủ đức','0905682529','lngthimai@gmail.com',to_date('09-MAR-23','DD-MON-RR'),'USERGVUIT008','GVUIT008TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUIT45926242','Nguyễn Nhã Khanh','UIT',to_date('29-MAR-03','DD-MON-RR'),'BÌNH thạn','0326373789','THA@gmail.com',to_date('29-JUN-19','DD-MON-RR'),'USERHVUIT45926242','HVUIT45926242TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('HVUSSH4296026','Trần Duy Khánh','UIT',to_date('21-OCT-03','DD-MON-RR'),'BÌNH thạn','0326373789','THA@gmail.com',to_date('21-OCT-18','DD-MON-RR'),'USERHVUSSH4296026','HVUSSH4296026TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT788099','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc93469@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT788099','SVHCMUT788099TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880914','Nguyễn THị Hương Ly','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1434614@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880914','SVHCMUT7880914TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880918','Lâm Minh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc1834618@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880918','SVHCMUT7880918TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT2150299','Nguyễn Trong Phúc','UIT',to_date('10-SEP-03','DD-MON-RR'),'KTX khu B-DHQG TPHCM','0929947159','ngan92009@gmail.com',to_date('19-SEP-21','DD-MON-RR'),'USERSVUIT2150299','SVUIT2150299TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880923','LâmMinh Ngọc','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2334623@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880923','SVHCMUT7880923TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVHCMUT7880928','Hứa Thư','HCMUT',to_date('10-APR-03','DD-MON-RR'),'KTX khu A-DHQG TPHCM','0258962727','lmngoc2834628@gmail.com',to_date('17-JUN-21','DD-MON-RR'),'USERSVHCMUT7880928','SVHCMUT7880928TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000286','Mai Xuân Hùng','HCMUT',to_date('10-FEB-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1986@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000286','GVHCMUT7000286TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000291','Trần Văn Hùng','HCMUT',to_date('10-JUL-26','DD-MON-RR'),'Quận 7-Tp HCM','0258962727','gvtoan1991@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000291','GVHCMUT7000291TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT7000295','Trần Chức Thiện','HCMUT',to_date('10-NOV-26','DD-MON-RR'),'Quận 5-Tp HCM','0258962727','gvtoan1995@gmail.com',to_date('05-MAR-21','DD-MON-RR'),'USERGVHCMUT7000295','GVHCMUT7000295TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVUSSH003','Nguyễn Như Ngọc','USSH',to_date('18-DEC-92','DD-MON-RR'),'Đường Trần Hưng Đạo, Phường 5, quận 5 tphcm','0235988472','ngocnguyen@gmail.com',to_date('10-MAY-23','DD-MON-RR'),'USERGVUSSH003','GVUSSHTVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('GVHCMUT005','Nguyễn Thế Đan','HCMUT',to_date('12-MAR-97','DD-MON-RR'),'Quận Bình Thạnh','0978178764','huyennta@gmail.com',to_date('12-APR-22','DD-MON-RR'),'USERGVHCMUT005','GVHCMUT005TVTT');
Insert into THANHVIEN (MATV,TENTV,MADV,NGAYSINH,DIACHI,SODT,EMAIL,NGAYDKTV,USERNAME,PASSWORDTV) values ('SVUIT010','Nguyễn Tiến Đạt','UIT',to_date('04-JUN-03','DD-MON-RR'),'Khu 3, TT. An Châu, H. Sơn Động, T. Bắc Giang','907262626','tannlm@gmail.com',to_date('15-MAY-20','DD-MON-RR'),'USERSVUIT010','SVUIT010TVTT');


COMMIT;

--insert muontrasach

Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT001','NV01','SNN0001',to_date('27-JAN-22','DD-MON-RR'),to_date('27-JAN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT002','NV01','SNN0002',to_date('12-MAY-22','DD-MON-RR'),to_date('12-OCT-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT003','NV03','SNN0003',to_date('23-MAY-22','DD-MON-RR'),to_date('23-OCT-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT004','NV03','SNN0004',to_date('17-MAR-22','DD-MON-RR'),to_date('17-AUG-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT005','NV06','SNN0005',to_date('31-MAY-22','DD-MON-RR'),to_date('31-OCT-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT006','NV01','SNN0006',to_date('08-SEP-22','DD-MON-RR'),to_date('08-MAR-23','DD-MON-RR'),'Gia hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT001','NV05','SAI0006',to_date('12-JAN-22','DD-MON-RR'),to_date('12-MAY-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT002','NV05','SAI0007',to_date('12-FEB-22','DD-MON-RR'),to_date('12-JUN-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT003','NV07','SAI0008',to_date('15-MAR-22','DD-MON-RR'),to_date('15-JUL-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT004','NV05','SKT0001',to_date('12-APR-22','DD-MON-RR'),to_date('12-SEP-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT005','NV05','SKT0002',to_date('12-JUN-22','DD-MON-RR'),to_date('12-OCT-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV05','SKT0003',to_date('12-JUL-22','DD-MON-RR'),to_date('12-NOV-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT007','NV02','SKT0004',to_date('12-AUG-22','DD-MON-RR'),to_date('12-DEC-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT008','NV06','SKT0005',to_date('12-SEP-22','DD-MON-RR'),to_date('12-JAN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT009','NV06','SKT0006',to_date('12-OCT-22','DD-MON-RR'),to_date('12-FEB-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUSSH001','NV06','SKT0007',to_date('01-JAN-23','DD-MON-RR'),to_date('01-MAY-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT003','NV07','STV0001',to_date('13-SEP-22','DD-MON-RR'),to_date('13-DEC-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT006','NV09','STV0004',to_date('16-SEP-22','DD-MON-RR'),to_date('16-DEC-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT007','NV09','STV0005',to_date('17-SEP-22','DD-MON-RR'),to_date('17-DEC-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT008','NV06','STV0006',to_date('18-SEP-22','DD-MON-RR'),to_date('18-DEC-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT009','NV09','STV0007',to_date('12-SEP-22','DD-MON-RR'),to_date('12-DEC-22','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH001','NV08','STV0008',to_date('11-MAR-23','DD-MON-RR'),to_date('11-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH002','NV08','STV0009',to_date('21-SEP-22','DD-MON-RR'),to_date('21-DEC-22','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH003','NV08','STV0010',to_date('15-MAR-23','DD-MON-RR'),to_date('15-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH004','NV09','SNN0010',to_date('30-SEP-22','DD-MON-RR'),to_date('31-JAN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH005','NV09','SNN0011',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH006','NV09','SNN0012',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH007','NV09','SNN0013',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV01','SKT0005',to_date('03-JUN-23','DD-MON-RR'),to_date('03-OCT-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV06','SKT0004',to_date('12-MAY-23','DD-MON-RR'),to_date('12-SEP-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT004','NV08','SGT0002',to_date('12-APR-23','DD-MON-RR'),to_date('12-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV02','SAI0001',to_date('24-MAY-23','DD-MON-RR'),to_date('24-SEP-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT002','NV09','SAI0006',to_date('12-MAR-23','DD-MON-RR'),to_date('12-AUG-23','DD-MON-RR'),'Gia hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT004','NV05','STT0001',to_date('12-MAR-23','DD-MON-RR'),to_date('12-JUN-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV02','IT001',to_date('03-FEB-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000294','NV05','SAI0005',to_date('17-MAR-23','DD-MON-RR'),to_date('17-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000298','NV04','SAI0005',to_date('19-JAN-23','DD-MON-RR'),to_date('19-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000289','NV04','SNN0003',to_date('17-MAR-23','DD-MON-RR'),to_date('17-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT004','NV04','SGT0002',to_date('03-MAR-23','DD-MON-RR'),to_date('03-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880910','NV05','SNN0005',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT006','NV02','SGT0002',to_date('03-MAR-23','DD-MON-RR'),to_date('03-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT2150298','NV07','SAI0006',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT002','NV08','SAI0007',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT003','NV09','SGT0004',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT004','NV09','SKT0001',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT2150298','NV04','SKT0002',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV02','SKT0003',to_date('20-APR-23','DD-MON-RR'),to_date('20-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880923','NV03','SKT0004',to_date('18-APR-23','DD-MON-RR'),to_date('18-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000286','NV03','SKT0005',to_date('17-APR-23','DD-MON-RR'),to_date('17-SEP-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT009','NV07','SKT0006',to_date('09-APR-23','DD-MON-RR'),to_date('09-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUSSH001','NV08','SKT0007',to_date('08-APR-23','DD-MON-RR'),to_date('08-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000291','NV04','STV0001',to_date('10-APR-23','DD-MON-RR'),to_date('10-SEP-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT788094','NV02','STV0004',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT788097','NV04','STV0005',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT008','NV04','SCT0015',to_date('21-APR-23','DD-MON-RR'),to_date('21-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880926','NV05','SCT0013',to_date('07-MAR-23','DD-MON-RR'),to_date('07-JUN-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880921','NV08','STV0008',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH002','NV08','SKT0004',to_date('17-APR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH004','NV09','SGT0005',to_date('17-APR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH005','NV09','SCT0013',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH006','NV09','SKT0003',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH007','NV09','SKT0006',to_date('17-MAR-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000278','NV07','SAI0001',to_date('15-JAN-23','DD-MON-RR'),to_date('15-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000278','NV07','SAI0004',to_date('03-JAN-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880924','NV07','SCT0003',to_date('17-JAN-23','DD-MON-RR'),to_date('17-APR-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880924','NV07','STV0003',to_date('17-JAN-23','DD-MON-RR'),to_date('17-APR-23','DD-MON-RR'),'Gia hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000280','NV01','SCT0007',to_date('17-JAN-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880929','NV01','STV0006',to_date('19-JAN-23','DD-MON-RR'),to_date('19-APR-23','DD-MON-RR'),'Gia hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000289','NV01','SAI0001',to_date('17-FEB-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000285','NV01','SGT0004',to_date('03-FEB-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880910','NV01','SAI0003',to_date('17-FEB-23','DD-MON-RR'),to_date('17-MAY-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000285','NV02','SGT0004',to_date('03-FEB-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT788098','NV02','SGT0005',to_date('17-FEB-23','DD-MON-RR'),to_date('17-MAY-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV02','SKT0002',to_date('03-FEB-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT006','NV02','SNN0014',to_date('03-FEB-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Hết hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT004','NV02','SGT0007',to_date('17-FEB-23','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT003','NV02','SKT0005',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT008','NV02','SNN0015',to_date('20-MAR-23','DD-MON-RR'),to_date('20-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT788096','NV08','SNN0013',to_date('18-MAR-23','DD-MON-RR'),to_date('18-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000287','NV08','SKT0007',to_date('17-MAR-23','DD-MON-RR'),to_date('17-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT45926242','NV08','SKT0007',to_date('09-MAR-23','DD-MON-RR'),to_date('09-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT45926242','NV04','SKT0007',to_date('08-MAR-23','DD-MON-RR'),to_date('08-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000291','NV08','STV0001',to_date('10-MAR-23','DD-MON-RR'),to_date('10-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT2150295','NV05','SNN0015',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT006','NV05','STV0005',to_date('03-MAR-23','DD-MON-RR'),to_date('03-JUN-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT008','NV05','SCT0015',to_date('21-APR-23','DD-MON-RR'),to_date('21-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUIT45926242','NV09','SCT0013',to_date('07-APR-23','DD-MON-RR'),to_date('07-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT006','NV09','SNN0011',to_date('17-APR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH002','NV05','STT0001',to_date('17-APR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('HVUSSH4296026','NV09','SGT0005',to_date('17-APR-23','DD-MON-RR'),to_date('17-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUS005','NV09','SKT0003',to_date('03-APR-23','DD-MON-RR'),to_date('03-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000294','NV09','SKT0006',to_date('17-APR-23','DD-MON-RR'),to_date('17-SEP-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000292','NV08','SKT0004',to_date('14-MAY-23','DD-MON-RR'),to_date('14-OCT-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT99983','NV09','SGT0005',to_date('14-MAY-23','DD-MON-RR'),to_date('14-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVHCMUT7000292','NV09','SCT0013',to_date('14-MAY-23','DD-MON-RR'),to_date('14-OCT-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT99983','NV04','SKT0003',to_date('03-MAY-23','DD-MON-RR'),to_date('03-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT99991','NV09','SKT0006',to_date('14-MAY-23','DD-MON-RR'),to_date('14-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUIT008','NV04','STT0001',to_date('14-MAY-23','DD-MON-RR'),to_date('14-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880921','NV08','SAI0007',to_date('14-MAY-23','DD-MON-RR'),to_date('14-AUG-23','DD-MON-RR'),'Đã trả');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH005','NV02','STT0006',to_date('17-APR-23','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVHCMUT7880926','NV05','SGT0004',to_date('07-MAY-23','DD-MON-RR'),to_date('07-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('SVUSSH004','NV08','STT0002',to_date('23-MAY-23','DD-MON-RR'),to_date('23-AUG-23','DD-MON-RR'),'Còn hạn');
Insert into MUONTRASACH (MATV,MANV,MASACH,NGAYMUON,NGAYTRA,GHICHU) values ('GVUIT009','NV04','IT001',to_date('06-JUN-23','DD-MON-RR'),to_date('06-NOV-23','DD-MON-RR'),'Còn hạn');



COMMIT;

--insert HOAdon

Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0024',to_date('31-JAN-20','DD-MON-RR'),'30000','Trả sách quá hạn','NV06','HVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0027',to_date('31-JAN-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV08','HVUIT004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0031',to_date('31-JAN-20','DD-MON-RR'),'5000','Trả sách quá hạn','NV09','HVUIT008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0029',to_date('31-JAN-20','DD-MON-RR'),'20000','Trả sách quá hạn','NV09','HVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0199',to_date('20-MAY-23','DD-MON-RR'),'36000','Làm hư hại sách','NV09','SVHCMUS003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0032',to_date('20-FEB-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV07','HVUIT009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0026',to_date('28-MAR-20','DD-MON-RR'),'25000','Trả sách quá hạn','NV05','HVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0066',to_date('05-MAY-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV01','SVUIT009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0028',to_date('15-MAY-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV03','HVUIT005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0030',to_date('26-JUN-20','DD-MON-RR'),'30000','Trả sách quá hạn','NV07','HVUIT007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0064',to_date('15-JUL-20','DD-MON-RR'),'5000','Trả sách quá hạn','NV01','SVUIT007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0063',to_date('20-AUG-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV08','SVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0065',to_date('17-SEP-20','DD-MON-RR'),'10000','Trả sách quá hạn','NV04','SVUIT008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0025',to_date('30-OCT-20','DD-MON-RR'),'15000','Trả sách quá hạn','NV06','HVUIT002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0062',to_date('15-NOV-20','DD-MON-RR'),'5000','Trả sách quá hạn','NV07','HVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0067',to_date('15-NOV-20','DD-MON-RR'),'35000','Trả sách quá hạn','NV02','SVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0033',to_date('31-JAN-21','DD-MON-RR'),'23000','Làm hư hại sách','NV05','HVUIT002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0034',to_date('31-JAN-21','DD-MON-RR'),'46000','Làm hư hại sách','NV08','HVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0032',to_date('31-JAN-21','DD-MON-RR'),'21300','Làm hư hại sách','NV06','HVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0035',to_date('31-JAN-21','DD-MON-RR'),'25000','Làm hư hại sách','NV03','HVUIT004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0039',to_date('31-JAN-21','DD-MON-RR'),'26000','Làm hư hại sách','NV08','HVUIT008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0036',to_date('31-JAN-21','DD-MON-RR'),'37000','Làm hư hại sách','NV04','HVUIT005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0037',to_date('31-JAN-21','DD-MON-RR'),'42000','Làm hư hại sách','NV07','HVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0038',to_date('31-JAN-21','DD-MON-RR'),'31000','Làm hư hại sách','NV09','HVUIT007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0040',to_date('31-JAN-21','DD-MON-RR'),'27000','Làm hư hại sách','NV07','HVUIT009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0020',to_date('01-FEB-21','DD-MON-RR'),'31000','Làm hư hại sách','NV08','SVUSSH006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0073',to_date('24-FEB-21','DD-MON-RR'),'10000','Trả sách quá hạn','NV03','SVHCMUT7880916');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0057',to_date('25-FEB-21','DD-MON-RR'),'35000','Trả sách quá hạn','NV08','SVHCMUT7880929');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0072',to_date('09-APR-21','DD-MON-RR'),'10000','Trả sách quá hạn','NV08','SVHCMUT7880911');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0074',to_date('04-MAY-21','DD-MON-RR'),'20000','Trả sách quá hạn','NV03','SVHCMUT7880920');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0015',to_date('04-MAY-21','DD-MON-RR'),'41000','Trả sách quá hạn','NV02','HVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0059',to_date('12-MAY-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV09','GVHCMUT7000287');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0021',to_date('09-JUL-21','DD-MON-RR'),'145000','Làm hư hại sách','NV02','SVUSSH007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0053',to_date('12-AUG-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV08','SVUIT2150292');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0055',to_date('25-AUG-21','DD-MON-RR'),'20000','Trả sách quá hạn','NV06','SVHCMUT7880919');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0095',to_date('05-SEP-21','DD-MON-RR'),'30000','Trả sách quá hạn','NV05','GVHCMUT7000284');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0097',to_date('05-SEP-21','DD-MON-RR'),'15000','Trả sách quá hạn','NV07','GVHCMUT7000294');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0098',to_date('05-SEP-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV06','GVHCMUT7000298');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0061',to_date('05-SEP-21','DD-MON-RR'),'10000','Trả sách quá hạn','NV09','GVHCMUT7000296');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0077',to_date('05-SEP-21','DD-MON-RR'),'45000','Trả sách quá hạn','NV07','GVHCMUT7000283');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0058',to_date('05-SEP-21','DD-MON-RR'),'55000','Trả sách quá hạn','NV03','GVHCMUT7000279');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0079',to_date('05-SEP-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV03','GVHCMUT7000293');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0068',to_date('13-SEP-21','DD-MON-RR'),'5000','Trả sách quá hạn','NV08','SVUIT2150293');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0086',to_date('14-OCT-21','DD-MON-RR'),'35000','Trả sách quá hạn','NV08','SVUIT2150294');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0060',to_date('14-OCT-21','DD-MON-RR'),'15000','Trả sách quá hạn','NV07','GVHCMUT7000292');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0084',to_date('10-NOV-21','DD-MON-RR'),'40000','Trả sách quá hạn','NV06','GVUSSH004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0082',to_date('10-NOV-21','DD-MON-RR'),'35000','Trả sách quá hạn','NV02','GVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0081',to_date('10-NOV-21','DD-MON-RR'),'35000','Trả sách quá hạn','NV02','GVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0070',to_date('12-NOV-21','DD-MON-RR'),'5000','Trả sách quá hạn','NV06','SVHCMUT788093');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0073',to_date('15-NOV-21','DD-MON-RR'),'43000','Làm hư hại sách','NV06','SVUIT008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0070',to_date('15-NOV-21','DD-MON-RR'),'28000','Làm hư hại sách','NV02','HVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0074',to_date('15-NOV-21','DD-MON-RR'),'15000','Làm hư hại sách','NV04','SVUIT009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0075',to_date('15-NOV-21','DD-MON-RR'),'32000','Làm hư hại sách','NV02','SVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0072',to_date('15-NOV-21','DD-MON-RR'),'26000','Làm hư hại sách','NV04','SVUIT007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0071',to_date('15-NOV-21','DD-MON-RR'),'31000','Làm hư hại sách','NV05','SVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0054',to_date('01-DEC-21','DD-MON-RR'),'20000','Trả sách quá hạn','NV06','SVHCMUT7880915');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0069',to_date('16-DEC-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV04','SVUIT2150296');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0093',to_date('17-DEC-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV05','SVHCMUT7880926');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0052',to_date('17-DEC-21','DD-MON-RR'),'25000','Trả sách quá hạn','NV02','SVHCMUT788092');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0099',to_date('17-DEC-21','DD-MON-RR'),'35000','Trả sách quá hạn','NV06','SVHCMUT7880910');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0071',to_date('17-DEC-21','DD-MON-RR'),'15000','Trả sách quá hạn','NV04','SVHCMUT788096');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0091',to_date('17-DEC-21','DD-MON-RR'),'55000','Trả sách quá hạn','NV04','SVHCMUT7880917');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0090',to_date('17-DEC-21','DD-MON-RR'),'10000','Trả sách quá hạn','NV09','SVHCMUT7880912');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0088',to_date('17-DEC-21','DD-MON-RR'),'20000','Trả sách quá hạn','NV09','SVHCMUT788094');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0056',to_date('23-DEC-21','DD-MON-RR'),'5000','Trả sách quá hạn','NV05','SVHCMUT7880924');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0087',to_date('17-JAN-22','DD-MON-RR'),'55000','Trả sách quá hạn','NV05','SVUIT2150297');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0050',to_date('26-JAN-22','DD-MON-RR'),'15000','Trả sách quá hạn','NV07','SVIU003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0023',to_date('03-FEB-22','DD-MON-RR'),'30000','Làm hư hại sách','NV10','SVHCMUS002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0051',to_date('17-FEB-22','DD-MON-RR'),'5000','Trả sách quá hạn','NV07','SVIU004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0038',to_date('24-MAR-22','DD-MON-RR'),'10000','Trả sách quá hạn','NV08','SVUSSH007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0022',to_date('04-MAY-22','DD-MON-RR'),'158000','Làm hư hại sách','NV08','SVHCMUS001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0034',to_date('02-JUN-22','DD-MON-RR'),'5000','Trả sách quá hạn','NV01','SVUSSH003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0018',to_date('05-JUN-22','DD-MON-RR'),'17000','Làm hư hại sách','NV07','SVUSSH004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0003',to_date('05-JUN-22','DD-MON-RR'),'25000','Trả sách quá hạn','NV01','GVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0002',to_date('05-JUN-22','DD-MON-RR'),'45000','Trả sách quá hạn','NV10','GVUIT002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0096',to_date('09-JUN-22','DD-MON-RR'),'20000','Trả sách quá hạn','NV07','GVHCMUT7000289');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0036',to_date('22-JUN-22','DD-MON-RR'),'5000','Trả sách quá hạn','NV01','SVUSSH005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0035',to_date('22-JUL-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV10','SVUSSH004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0061',to_date('12-AUG-22','DD-MON-RR'),'32000','Làm hư hại sách','NV06','SVUIT2150292');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0043',to_date('18-AUG-22','DD-MON-RR'),'20000','Trả sách quá hạn','NV03','SVHCMUS005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0044',to_date('19-AUG-22','DD-MON-RR'),'40000','Trả sách quá hạn','NV09','SVHCMUS006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0037',to_date('26-AUG-22','DD-MON-RR'),'10000','Trả sách quá hạn','NV02','SVUSSH006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0087',to_date('05-SEP-22','DD-MON-RR'),'38000','Làm hư hại sách','NV04','GVHCMUT7000293');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0088',to_date('05-SEP-22','DD-MON-RR'),'63000','Làm hư hại sách','NV08','GVHCMUT7000297');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0086',to_date('05-SEP-22','DD-MON-RR'),'51000','Làm hư hại sách','NV06','GVHCMUT7000288');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0085',to_date('05-SEP-22','DD-MON-RR'),'34000','Làm hư hại sách','NV07','GVHCMUT7000283');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0084',to_date('05-SEP-22','DD-MON-RR'),'26000','Làm hư hại sách','NV08','GVHCMUT7000280');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0069',to_date('05-SEP-22','DD-MON-RR'),'36000','Làm hư hại sách','NV05','GVHCMUT7000296');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0066',to_date('05-SEP-22','DD-MON-RR'),'34000','Làm hư hại sách','NV08','GVHCMUT7000279');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0067',to_date('05-SEP-22','DD-MON-RR'),'27000','Làm hư hại sách','NV05','GVHCMUT7000287');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0068',to_date('05-SEP-22','DD-MON-RR'),'24000','Làm hư hại sách','NV05','GVHCMUT7000292');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0076',to_date('13-SEP-22','DD-MON-RR'),'37000','Làm hư hại sách','NV03','SVUIT2150293');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0003',to_date('01-OCT-22','DD-MON-RR'),'30000','Làm hư hại sách','NV06','HVUIT008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0004',to_date('02-OCT-22','DD-MON-RR'),'25000','Làm hư hại sách','NV10','HVUIT009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0018',to_date('07-OCT-22','DD-MON-RR'),'30000','Trả sách quá hạn','NV02','GVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0015',to_date('09-OCT-22','DD-MON-RR'),'43000','Làm hư hại sách','NV08','SVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0023',to_date('10-OCT-22','DD-MON-RR'),'15000','Trả sách quá hạn','NV08','GVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0021',to_date('10-OCT-22','DD-MON-RR'),'15000','Trả sách quá hạn','NV05','GVUIT004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0029',to_date('11-OCT-22','DD-MON-RR'),'85000','Làm hư hại sách','NV02','GVUIT004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0094',to_date('14-OCT-22','DD-MON-RR'),'35000','Làm hư hại sách','NV09','SVUIT2150294');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0019',to_date('20-OCT-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV05','GVUIT002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0020',to_date('21-OCT-22','DD-MON-RR'),'20000','Trả sách quá hạn','NV05','GVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0022',to_date('27-OCT-22','DD-MON-RR'),'15000','Trả sách quá hạn','NV02','GVUIT005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0033',to_date('27-OCT-22','DD-MON-RR'),'20000','Trả sách quá hạn','NV07','SVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0047',to_date('27-OCT-22','DD-MON-RR'),'45000','Trả sách quá hạn','NV07','SVHCMUS009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0041',to_date('27-OCT-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV05','SVHCMUS003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0085',to_date('27-OCT-22','DD-MON-RR'),'30000','Trả sách quá hạn','NV05','SVUSSH008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0049',to_date('27-OCT-22','DD-MON-RR'),'30000','Trả sách quá hạn','NV01','SVIU002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0048',to_date('27-OCT-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV07','SVIU001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0039',to_date('27-OCT-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV06','SVHCMUS001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0040',to_date('27-OCT-22','DD-MON-RR'),'25000','Trả sách quá hạn','NV06','SVHCMUS002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0090',to_date('10-NOV-22','DD-MON-RR'),'37000','Làm hư hại sách','NV10','GVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0089',to_date('10-NOV-22','DD-MON-RR'),'162000','Làm hư hại sách','NV07','GVUSSH001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0092',to_date('10-NOV-22','DD-MON-RR'),'19000','Làm hư hại sách','NV07','GVUSSH004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0042',to_date('18-NOV-22','DD-MON-RR'),'10000','Trả sách quá hạn','NV08','SVHCMUS004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0045',to_date('18-NOV-22','DD-MON-RR'),'75000','Trả sách quá hạn','NV07','SVHCMUS007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0014',to_date('20-NOV-22','DD-MON-RR'),'47000','Trả sách quá hạn','NV06','HVUIT005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0046',to_date('24-NOV-22','DD-MON-RR'),'35000','Trả sách quá hạn','NV09','SVHCMUS008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0077',to_date('16-DEC-22','DD-MON-RR'),'57000','Làm hư hại sách','NV09','SVUIT2150296');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0064',to_date('17-DEC-22','DD-MON-RR'),'26000','Làm hư hại sách','NV03','SVHCMUT7880924');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0065',to_date('17-DEC-22','DD-MON-RR'),'20000','Làm hư hại sách','NV03','SVHCMUT7880929');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0078',to_date('17-DEC-22','DD-MON-RR'),'22000','Làm hư hại sách','NV07','SVHCMUT788093');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0079',to_date('17-DEC-22','DD-MON-RR'),'23000','Làm hư hại sách','NV08','SVHCMUT788096');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0080',to_date('17-DEC-22','DD-MON-RR'),'26000','Làm hư hại sách','NV07','SVHCMUT7880911');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0081',to_date('17-DEC-22','DD-MON-RR'),'25000','Làm hư hại sách','NV07','SVHCMUT7880916');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0082',to_date('17-DEC-22','DD-MON-RR'),'27000','Làm hư hại sách','NV05','SVHCMUT7880920');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0083',to_date('17-DEC-22','DD-MON-RR'),'28000','Làm hư hại sách','NV07','SVHCMUT7880925');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0063',to_date('17-DEC-22','DD-MON-RR'),'67000','Làm hư hại sách','NV05','SVHCMUT7880919');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0062',to_date('17-DEC-22','DD-MON-RR'),'36000','Làm hư hại sách','NV05','SVHCMUT7880915');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0099',to_date('17-DEC-22','DD-MON-RR'),'80000','Làm hư hại sách','NV02','SVHCMUT7880917');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0060',to_date('17-DEC-22','DD-MON-RR'),'46900','Làm hư hại sách','NV08','SVHCMUT788092');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0096',to_date('17-DEC-22','DD-MON-RR'),'45000','Làm hư hại sách','NV05','SVHCMUT788094');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0097',to_date('17-DEC-22','DD-MON-RR'),'64000','Làm hư hại sách','NV07','SVHCMUT788097');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0098',to_date('17-DEC-22','DD-MON-RR'),'37000','Làm hư hại sách','NV09','SVHCMUT7880912');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0013',to_date('25-DEC-22','DD-MON-RR'),'30000','Trả sách quá hạn','NV08','HVUIT004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0010',to_date('08-JAN-23','DD-MON-RR'),'5000','Trả sách quá hạn','NV02','HVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0026',to_date('12-JAN-23','DD-MON-RR'),'25000','Làm hư hại sách','NV01','GVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0078',to_date('17-JAN-23','DD-MON-RR'),'20000','Trả sách quá hạn','NV07','GVHCMUT7000288');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0095',to_date('17-JAN-23','DD-MON-RR'),'23000','Làm hư hại sách','NV10','SVUIT2150297');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0028',to_date('19-JAN-23','DD-MON-RR'),'34900','Làm hư hại sách','NV01','GVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0080',to_date('30-JAN-23','DD-MON-RR'),'35000','Trả sách quá hạn','NV02','GVHCMUT7000297');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0025',to_date('01-FEB-23','DD-MON-RR'),'24000','Làm hư hại sách','NV08','SVHCMUS004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0024',to_date('02-FEB-23','DD-MON-RR'),'25000','Làm hư hại sách','NV02','SVHCMUS003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0017',to_date('08-FEB-23','DD-MON-RR'),'125000','Làm hư hại sách','NV05','HVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0016',to_date('08-FEB-23','DD-MON-RR'),'125000','Trả sách quá hạn','NV06','HVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0092',to_date('07-MAR-23','DD-MON-RR'),'6000','Trả sách quá hạn','NV05','SVHCMUT7880921');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0089',to_date('15-MAR-23','DD-MON-RR'),'10000','Trả sách quá hạn','NV07','SVHCMUT788097');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0030',to_date('16-MAR-23','DD-MON-RR'),'332000','Làm hư hại sách','NV08','GVUIT005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0094',to_date('29-MAR-23','DD-MON-RR'),'20000','Trả sách quá hạn','NV04','GVHCMUT7000281');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0016',to_date('20-APR-23','DD-MON-RR'),'41000','Làm hư hại sách','NV03','SVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0001',to_date('21-APR-23','DD-MON-RR'),'43000','Trả sách quá hạn','NV01','GVUIT001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0017',to_date('21-APR-23','DD-MON-RR'),'12000','Làm hư hại sách','NV04','SVUSSH003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0009',to_date('23-APR-23','DD-MON-RR'),'26000','Làm hư hại sách','NV09','SVUSSH005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0027',to_date('02-MAY-23','DD-MON-RR'),'42000','Làm hư hại sách','NV10','GVUIT002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0076',to_date('02-MAY-23','DD-MON-RR'),'15000','Trả sách quá hạn','NV08','GVHCMUT7000280');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0075',to_date('04-MAY-23','DD-MON-RR'),'10000','Trả sách quá hạn','NV07','SVHCMUT7880925');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0057',to_date('20-MAY-23','DD-MON-RR'),'146000','Làm hư hại sách','NV07','SVIU002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0058',to_date('20-MAY-23','DD-MON-RR'),'231000','Làm hư hại sách','NV10','SVIU003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0059',to_date('20-MAY-23','DD-MON-RR'),'45000','Làm hư hại sách','NV02','SVIU004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0091',to_date('20-MAY-23','DD-MON-RR'),'67000','Làm hư hại sách','NV09','GVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0093',to_date('20-MAY-23','DD-MON-RR'),'31000','Làm hư hại sách','NV05','SVUSSH008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0056',to_date('20-MAY-23','DD-MON-RR'),'35800','Làm hư hại sách','NV05','SVIU001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0055',to_date('20-MAY-23','DD-MON-RR'),'47000','Làm hư hại sách','NV02','SVHCMUS009');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0054',to_date('20-MAY-23','DD-MON-RR'),'132000','Làm hư hại sách','NV05','SVHCMUS008');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0053',to_date('20-MAY-23','DD-MON-RR'),'27000','Làm hư hại sách','NV09','SVHCMUS007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0052',to_date('20-MAY-23','DD-MON-RR'),'34000','Làm hư hại sách','NV10','SVHCMUS006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0051',to_date('20-MAY-23','DD-MON-RR'),'23000','Làm hư hại sách','NV08','SVHCMUS005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0050',to_date('20-MAY-23','DD-MON-RR'),'23000','Làm hư hại sách','NV10','SVHCMUS004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0049',to_date('20-MAY-23','DD-MON-RR'),'36000','Làm hư hại sách','NV09','SVHCMUS003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0048',to_date('20-MAY-23','DD-MON-RR'),'20000','Làm hư hại sách','NV05','SVHCMUS002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0047',to_date('20-MAY-23','DD-MON-RR'),'18000','Làm hư hại sách','NV07','SVHCMUS001');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0046',to_date('20-MAY-23','DD-MON-RR'),'17000','Làm hư hại sách','NV06','SVUSSH007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0045',to_date('20-MAY-23','DD-MON-RR'),'35900','Làm hư hại sách','NV08','SVUSSH006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0044',to_date('20-MAY-23','DD-MON-RR'),'23000','Làm hư hại sách','NV10','SVUSSH005');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0043',to_date('20-MAY-23','DD-MON-RR'),'37000','Làm hư hại sách','NV07','SVUSSH004');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0042',to_date('20-MAY-23','DD-MON-RR'),'28000','Làm hư hại sách','NV10','SVUSSH003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0041',to_date('20-MAY-23','DD-MON-RR'),'33000','Làm hư hại sách','NV08','SVUSSH002');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('HH0031',to_date('20-MAY-23','DD-MON-RR'),'45000','Làm hư hại sách','NV06','GVUIT006');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0083',to_date('20-MAY-23','DD-MON-RR'),'20000','Trả sách quá hạn','NV06','GVUIT007');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0224',to_date('04-MAY-21','DD-MON-RR'),'41000','Trả sách quá hạn','NV10','HVUIT003');
Insert into HOADON (MAHD,NGHD,SOTIEN,GHICHU,MANV,MATV) values ('QH0225',to_date('04-MAY-21','DD-MON-RR'),'41000','Trả sách quá hạn','NV10','HVUIT003');


COMMIT;

-- insert the tu

Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT011',to_date('01-JUN-23','DD-MON-RR'),to_date('01-JUN-26','DD-MON-RR'),'NV04','SVUIT011');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT009',to_date('26-JAN-23','DD-MON-RR'),to_date('26-JAN-26','DD-MON-RR'),'NV04','GVUIT009');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000285',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV02','GVHCMUT7000285');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT001',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV01','GVUIT001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT002',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV02','GVUIT002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT003',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV02','GVUIT003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT004',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV05','GVUIT004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT005',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV05','GVUIT005');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT006',to_date('10-APR-22','DD-MON-RR'),to_date('10-APR-24','DD-MON-RR'),'NV04','GVUIT006');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT001',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV04','HVUIT001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT002',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV05','HVUIT002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT003',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV05','HVUIT003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT004',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV06','HVUIT004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT005',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV04','HVUIT005');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT006',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV07','HVUIT006');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT007',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV01','HVUIT007');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT008',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV04','HVUIT008');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT009',to_date('31-JUL-19','DD-MON-RR'),to_date('31-JUL-21','DD-MON-RR'),'NV03','HVUIT009');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH002',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV05','SVUSSH002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH003',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV04','SVUSSH003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH004',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV02','SVUSSH004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH005',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV04','SVUSSH005');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH006',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV06','SVUSSH006');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH007',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV09','SVUSSH007');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS001',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV09','SVHCMUS001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS002',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV08','SVHCMUS002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS003',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV03','SVHCMUS003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS004',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV04','SVHCMUS004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS005',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV03','SVHCMUS005');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS006',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV05','SVHCMUS006');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS007',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV07','SVHCMUS007');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS008',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV07','SVHCMUS008');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUS009',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV07','SVHCMUS009');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVIU001',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV07','SVIU001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVIU002',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV09','SVIU002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVIU003',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV08','SVIU003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVIU004',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-24','DD-MON-RR'),'NV02','SVIU004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788092',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV01','SVHCMUT788092');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150292',to_date('12-FEB-21','DD-MON-RR'),to_date('12-FEB-23','DD-MON-RR'),'NV04','SVUIT2150292');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880915',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880915');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880919',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880919');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880924',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880924');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880929',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880929');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000279',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV05','GVHCMUT7000279');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000287',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV05','GVHCMUT7000287');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000292',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV03','GVHCMUT7000292');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000296',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV06','GVHCMUT7000296');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUSSH001',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV06','HVUSSH001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT006',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV04','SVUIT006');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT007',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV05','SVUIT007');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT008',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV04','SVUIT008');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT009',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV09','SVUIT009');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH001',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV09','SVUSSH001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150293',to_date('13-MAR-21','DD-MON-RR'),to_date('13-MAR-23','DD-MON-RR'),'NV02','SVUIT2150293');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150296',to_date('16-JUN-21','DD-MON-RR'),to_date('16-JUN-23','DD-MON-RR'),'NV07','SVUIT2150296');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788093',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV01','SVHCMUT788093');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788096',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV08','SVHCMUT788096');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880911',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880911');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880916',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880916');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880920',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV08','SVHCMUT7880920');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880925',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV08','SVHCMUT7880925');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000280',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV07','GVHCMUT7000280');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000283',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV07','GVHCMUT7000283');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000288',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV07','GVHCMUT7000288');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000293',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV04','GVHCMUT7000293');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000297',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV06','GVHCMUT7000297');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUSSH001',to_date('10-MAY-21','DD-MON-RR'),to_date('10-MAY-23','DD-MON-RR'),'NV07','GVUSSH001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUSSH002',to_date('10-MAY-21','DD-MON-RR'),to_date('10-MAY-23','DD-MON-RR'),'NV06','GVUSSH002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT007',to_date('26-JAN-23','DD-MON-RR'),to_date('26-JAN-25','DD-MON-RR'),'NV04','GVUIT007');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUSSH004',to_date('10-MAY-21','DD-MON-RR'),to_date('10-MAY-23','DD-MON-RR'),'NV09','GVUSSH004');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150294',to_date('14-APR-21','DD-MON-RR'),to_date('14-APR-23','DD-MON-RR'),'NV09','SVUIT2150294');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150297',to_date('17-JUL-21','DD-MON-RR'),to_date('17-JUL-23','DD-MON-RR'),'NV04','SVUIT2150297');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788094',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT788094');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788097',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV05','SVHCMUT788097');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880912',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV05','SVHCMUT7880912');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880917',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV06','SVHCMUT7880917');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880921',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880921');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880926',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV04','SVHCMUT7880926');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000281',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV01','GVHCMUT7000281');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000284',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV01','GVHCMUT7000284');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000289',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV01','GVHCMUT7000289');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000294',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV07','GVHCMUT7000294');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000298',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV06','GVHCMUT7000298');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880910',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV06','SVHCMUT7880910');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT003',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-22','DD-MON-RR'),'NV05','SVUIT003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTThanhvien9000',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV06','Thanhvien9000');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTThanhvien9001',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV04','Thanhvien9001');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTThanhvien9002',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV04','Thanhvien9002');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTThanhvien9003',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV04','Thanhvien9003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99992',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV05','SVUIT99992');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99993',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV04','SVUIT99993');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99980',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV04','SVUIT99980');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99981',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV01','SVUIT99981');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99990',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV01','SVUIT99990');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99991',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV03','SVUIT99991');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99982',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV01','SVUIT99982');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT99983',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV01','SVUIT99983');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2159991',to_date('11-JAN-21','DD-MON-RR'),to_date('11-JAN-23','DD-MON-RR'),'NV04','SVUIT2159991');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150291',to_date('11-JAN-21','DD-MON-RR'),to_date('11-JAN-23','DD-MON-RR'),'NV04','SVUIT2150291');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150091',to_date('11-JAN-21','DD-MON-RR'),to_date('11-JAN-23','DD-MON-RR'),'NV04','SVUIT2150091');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150295',to_date('15-MAY-21','DD-MON-RR'),to_date('15-MAY-23','DD-MON-RR'),'NV05','SVUIT2150295');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150298',to_date('18-AUG-21','DD-MON-RR'),to_date('18-AUG-23','DD-MON-RR'),'NV02','SVUIT2150298');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788091',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT788091');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788095',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT788095');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788098',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT788098');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880913',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT7880913');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880922',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT7880922');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880927',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV03','SVHCMUT7880927');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000278',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV01','GVHCMUT7000278');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000282',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV04','GVHCMUT7000282');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000290',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV03','GVHCMUT7000290');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUIT008',to_date('09-MAR-23','DD-MON-RR'),to_date('09-MAR-25','DD-MON-RR'),'NV03','GVUIT008');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUIT45926242',to_date('29-JUN-19','DD-MON-RR'),to_date('29-JUN-21','DD-MON-RR'),'NV03','HVUIT45926242');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTHVUSSH4296026',to_date('21-OCT-18','DD-MON-RR'),to_date('21-OCT-20','DD-MON-RR'),'NV02','HVUSSH4296026');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT788099',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV07','SVHCMUT788099');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880914',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV08','SVHCMUT7880914');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880918',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV05','SVHCMUT7880918');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT2150299',to_date('19-SEP-21','DD-MON-RR'),to_date('19-SEP-23','DD-MON-RR'),'NV05','SVUIT2150299');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880923',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV05','SVHCMUT7880923');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVHCMUT7880928',to_date('17-JUN-21','DD-MON-RR'),to_date('17-JUN-23','DD-MON-RR'),'NV07','SVHCMUT7880928');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000286',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV07','GVHCMUT7000286');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000291',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV09','GVHCMUT7000291');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT7000295',to_date('05-MAR-21','DD-MON-RR'),to_date('05-MAR-23','DD-MON-RR'),'NV04','GVHCMUT7000295');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVUSSH003',to_date('10-MAY-23','DD-MON-RR'),to_date('10-MAY-25','DD-MON-RR'),'NV04','GVUSSH003');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTGVHCMUT005',to_date('12-APR-22','DD-MON-RR'),to_date('12-APR-24','DD-MON-RR'),'NV01','GVHCMUT005');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH008',to_date('27-APR-22','DD-MON-RR'),to_date('27-APR-25','DD-MON-RR'),'NV07','SVUSSH008');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUSSH009',to_date('23-MAY-23','DD-MON-RR'),to_date('23-MAY-26','DD-MON-RR'),'NV08','SVUSSH009');
Insert into THETU (MATHE,NGAYTAO,NGAYHETHAN,MANV,MATV) values ('TTSVUIT010',to_date('15-MAY-20','DD-MON-RR'),to_date('15-MAY-23','DD-MON-RR'),'NV08','SVUIT010');

COMMIT;