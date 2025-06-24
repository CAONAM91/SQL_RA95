drop database  if exists QL_Fresher;
create database QL_Fresher;
use QL_Fresher;
create table Trainee (
TraineeID int auto_increment primary key,
Full_Name varchar(50) not null,
Birth_Day date,
Gender enum ("Male","Female","Unknown"),
ET_IQ tinyint UNSIGNED, check (ET_IQ<=20),
ET_Gmath tinyint UNSIGNED,check (ET_Gmath<=20),
ET_English tinyint UNSIGNED,check (ET_English<=20),
Training_Class varchar(50),
Evaluation_Notes text,
 VTI_Account varchar(50) not null unique
);

-- Question 1: Thêm ít nhất 10 bản ghi vào table

insert into Trainee 
(Full_Name, Birth_Day, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
values
('Nguyen Van A', '1998-05-20', 'Male', 15, 16, 18, 'Java_FT01', 'Good progress', 'nv.a@vti.com'),
('Tran Thi B', '1999-03-15', 'Female', 13, 14, 15, 'Java_FT01', 'Active in class', 'tt.b@vti.com'),
('Le Van C', '1997-07-30', 'Male', 5, 4, 9, 'Python_BA02', 'Needs improvement', 'lv.c@vti.com'),
('Pham Thi D', '2000-12-01', 'Female', 18, 19, 18, 'Python_BA02', 'Excellent', 'pt.d@vti.com'),
('Hoang Van E', '1996-04-12', 'Male', 6, 8, 10, 'SQL_FS03', 'Struggles with logic', 'hv.e@vti.com'),
('Do Thi F', '1998-09-09', 'Female', 15, 11, 12, 'SQL_FS03', 'Very helpful to peers', 'dt.f@vti.com'),
('Nguyen Van G', '1995-11-25', 'Male', 14, 18, 17, 'DevOps_DL04', 'Consistent work', 'nv.g@vti.com'),
('Tran Van H', '1999-01-19', 'Male', 10, 17, 10, 'DevOps_DL04', 'Improving gradually', 'tv.h@vti.com'),
('Le Thi I', '1996-06-21', 'Female', 20, 19, 20, 'AI_ML05', 'Top of class', 'lt.i@vti.com'),
('Pham Van J', '1997-10-05', 'Male', 15, 14, 18, 'AI_ML05', 'Quiet but hard-working', 'pv.j@vti.com');

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
select Full_Name, month(Birth_Day) from Trainee 
where ET_IQ >=10 and  ET_Gmath >=10 and  ET_English >=10
group by month(Birth_Day), Full_Name
order by month(Birth_Day) ;

-- 3  Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
select * from Trainee
where char_length(Full_Name) = (select max(char_length(Full_Name) ) from Trainee);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:

-- ET_IQ + ET_Gmath>=20 ET_IQ>=8

-- ET_Gmath>=8 ET_English>=18

select Full_Name, month(Birth_Day) from Trainee 
where ET_IQ + ET_Gmath>=20 and ET_IQ>=8 or ET_Gmath>=8 and ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3
delete from Trainee where TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database

Update Trainee
set Training_Class = "2" where TraineeID = 5;
 select * from Trainee where TraineeID = 5;





