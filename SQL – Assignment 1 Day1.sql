drop database  if exists Testing_System_Assignment_1;
create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;
create table Department (
DepartmentID int auto_increment primary key,
DepartmentName varchar(50)
);
create table `Position`(
PositionID int auto_increment primary key,
PositionName enum( "Dev", "Test", "Scrum Master", "PM")
);
create table Account (
AccountID int auto_increment primary key,
Username varchar (50),
DepartmentID int,
PositionID int,
CreateDate date,
foreign key (DepartmentID) references Department (DepartmentID),
foreign key (PositionID) references `Position` (PositionID)
);
create table `Group` (
GroupID int auto_increment primary key,
GroupName varchar(50),
CreatorID int,
CreatorDate date,
foreign key(CreatorID) references Account(AccountID)
);

create table GroupAccount(
GroupID int,
AccountID int,
JoinDate date,
primary key (GroupID, AccountID),
foreign key(GroupID) references `Group`(GroupID),
foreign key(AccountID) references Account(AccountID)
);

create table TypeQuestion(
TypeID int auto_increment primary key,
TypeName enum("Essay","Multiple-Choice")
);
create table CategoryQuestion(
CategoryID int auto_increment primary key, 
CategoryName varchar(50)
);
create table Question(
QuestionID  int auto_increment primary key,
Content varchar(50),
CategoryID int,
TypeID int,
CreatorID int,
CreateDate date,
foreign key(CategoryID) references CategoryQuestion(CategoryID),
foreign key(TypeID) references TypeQuestion(TypeID),
foreign key(CreatorID) references Account(AccountID)
);
create table Answer (
AnswerID int auto_increment primary key,
Content varchar(50),
QuestionID int,
isCorrect char(1),
foreign key(QuestionID) references Question(QuestionID)
);
create table Exam  (
ExamID int auto_increment primary key,
Code varchar(50),
Title varchar(50), 
CategoryID int, 
Duration time, 
CreatorID int, 
CreateDate date,
foreign key(CategoryID) references CategoryQuestion(CategoryID), 
foreign key(CreatorID) references Account(AccountID) 
); 
create table ExamQuestion  (
ExamID int,
QuestionID int,
foreign key(ExamID) references Exam(ExamID), 
foreign key(QuestionID) references Question(QuestionID)
);


insert into Department (DepartmentName) values ('Services');
insert into Department (DepartmentName) values ('Legal');
insert into Department (DepartmentName) values ('Accounting');
insert into Department (DepartmentName) values ('Marketing');
insert into Department (DepartmentName) values ('Sales');
insert into Department (DepartmentName) values ('Business Development');
insert into Department (DepartmentName) values ('Product Management');
insert into Department (DepartmentName) values ('Services');
insert into Department (DepartmentName) values ('Engineering');
insert into Department (DepartmentName) values ('Human Resources');
insert into Department (DepartmentName) values ('Sales');
insert into Department (DepartmentName) values ('Product Management');
insert into Department (DepartmentName) values ('Engineering');
insert into Department (DepartmentName) values ('Research and Development');
insert into Department (DepartmentName) values ('Marketing');
insert into Department (DepartmentName) values ('Legal');
insert into Department (DepartmentName) values ('Product Management');
insert into Department (DepartmentName) values ('Training');
insert into Department (DepartmentName) values ('Product Management');
insert into Department (DepartmentName) values ('Training');
insert into Department (DepartmentName) values ('Support');
insert into Department (DepartmentName) values ('Legal');
insert into Department (DepartmentName) values ('Product Management');
insert into Department (DepartmentName) values ('Services');
insert into Department (DepartmentName) values ('Engineering');


-- Position
INSERT INTO `Position` (PositionName) VALUES ('Dev');
INSERT INTO `Position` (PositionName) VALUES ('Test');
INSERT INTO `Position` (PositionName) VALUES ('Scrum Master');
INSERT INTO `Position` (PositionName) VALUES ('PM');

-- Account
-- (Sử dụng ngẫu nhiên DepartmentID: 1–25, PositionID: 1–4)
INSERT INTO Account (Username, DepartmentID, PositionID, CreateDate) VALUES 
('User_1', 4, 1, '2023-05-02'),
('User_2', 19, 3, '2023-07-09'),
('User_3', 22, 3, '2023-06-01'),
('User_4', 17, 2, '2023-01-12'),
('User_5', 8, 2, '2023-02-01'),
('User_6', 21, 4, '2023-06-27'),
('User_7', 5, 1, '2023-08-17'),
('User_8', 10, 3, '2023-10-10'),
('User_9', 3, 2, '2023-12-19'),
('User_10', 14, 1, '2023-11-15'),
('User_11', 24, 4, '2023-03-03'),
('User_12', 12, 1, '2023-09-27'),
('User_13', 25, 2, '2023-02-18'),
('User_14', 11, 2, '2023-05-21'),
('User_15', 6, 4, '2023-08-11'),
('User_16', 13, 1, '2023-04-14'),
('User_17', 7, 3, '2023-03-25'),
('User_18', 2, 4, '2023-01-05'),
('User_19', 23, 1, '2023-07-30'),
('User_20', 1, 3, '2023-12-05'),
('User_21', 15, 2, '2023-06-08'),
('User_22', 20, 1, '2023-10-18'),
('User_23', 18, 4, '2023-09-01'),
('User_24', 9, 3, '2023-03-09'),
('User_25', 16, 2, '2023-04-20');

-- Group
INSERT INTO `Group` (GroupName, CreatorID, CreatorDate) VALUES 
('Group_1', 12, '2023-02-20'),
('Group_2', 2, '2023-06-30'),
('Group_3', 19, '2023-09-01'),
('Group_4', 8, '2023-11-11'),
('Group_5', 4, '2023-10-10'),
('Group_6', 23, '2023-08-20'),
('Group_7', 15, '2023-05-22'),
('Group_8', 7, '2020-03-17'),
('Group_9', 10, '2018-04-15'),
('Group_10', 1, '2023-01-01'),
('Group_11', 17, '2023-09-09'),
('Group_12', 3, '2023-12-12'),
('Group_13', 6, '2017-06-06'),
('Group_14', 11, '2023-02-14'),
('Group_15', 5, '2023-07-07'),
('Group_16', 21, '2023-08-08'),
('Group_17', 9, '2023-05-05'),
('Group_18', 20, '2023-03-30'),
('Group_19', 14, '2023-04-04'),
('Group_20', 13, '2023-10-01'),
('Group_21', 16, '2023-12-01'),
('Group_22', 25, '2023-02-25'),
('Group_23', 22, '2023-11-11'),
('Group_24', 18, '2023-09-20'),
('Group_25', 24, '2023-06-06');

-- GroupAccount
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) VALUES 
(1, 3, '2023-03-12'),
(2, 5, '2023-05-19'),
(3, 8, '2023-06-25'),
(4, 12, '2023-09-10'),
(5, 7, '2023-02-28'),
(6, 15, '2023-08-23'),
(7, 20, '2023-01-15'),
(8, 14, '2023-11-22'),
(9, 2, '2023-10-05'),
(10, 4, '2023-03-03'),
(11, 17, '2023-07-18'),
(12, 6, '2023-04-09'),
(13, 9, '2023-12-01'),
(14, 11, '2023-10-14'),
(15, 13, '2023-06-11'),
(16, 10, '2023-05-25'),
(17, 21, '2023-09-17'),
(18, 1, '2023-01-30'),
(19, 16, '2023-04-04'),
(20, 23, '2023-07-03'),
(21, 18, '2023-08-08'),
(22, 19, '2023-02-02'),
(23, 22, '2023-11-29'),
(24, 24, '2023-03-21'),
(25, 25, '2023-12-15');

-- TypeQuestion
INSERT INTO TypeQuestion (TypeName) VALUES ('Essay');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multiple-Choice');

-- CategoryQuestion
INSERT INTO CategoryQuestion (CategoryName) VALUES 
('Category_1'), ('Category_2'), ('Category_3'), ('Category_4'), ('Category_5'),
('Category_6'), ('Category_7'), ('Category_8'), ('Category_9'), ('Category_10'),
('Category_11'), ('Category_12'), ('Category_13'), ('Category_14'), ('Category_15'),
('Category_16'), ('Category_17'), ('Category_18'), ('Category_19'), ('Category_20'),
('Category_21'), ('Category_22'), ('Category_23'), ('Category_24'), ('Category_25');

-- Question
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES 
('Question_1', 2, 1, 5, '2023-04-01'),
('Question_2', 3, 2, 8, '2023-06-12'),
('Question_3', 1, 1, 15, '2023-03-22'),
('Question_4', 7, 1, 2, '2023-07-10'),
('Question_5', 5, 2, 10, '2023-08-18'),
('Question_6', 6, 1, 18, '2023-10-30'),
('Question_7', 4, 2, 7, '2023-01-14'),
('Question_8', 9, 1, 12, '2023-09-29'),
('Question_9', 10, 2, 3, '2023-11-04'),
('Question_10', 11, 1, 9, '2023-05-06'),
('Question_11', 12, 2, 14, '2023-02-08'),
('Question_12', 13, 1, 6, '2023-06-15'),
('Question_13', 8, 2, 11, '2023-04-18'),
('Question_14', 14, 1, 13, '2023-12-25'),
('Question_15', 15, 2, 4, '2023-07-01'),
('Question_16', 16, 1, 21, '2023-09-10'),
('Question_17', 17, 2, 1, '2023-02-20'),
('Question_18', 18, 1, 20, '2023-11-11'),
('Question_19', 19, 2, 19, '2023-03-03'),
('Question_20', 20, 1, 16, '2023-12-03'),
('Question_21', 21, 2, 17, '2023-05-25'),
('Question_22', 22, 1, 24, '2023-08-08'),
('Question_23', 23, 2, 23, '2023-10-02'),
('Question_24', 24, 1, 22, '2023-04-04'),
('Question_25', 25, 2, 25, '2023-06-06');

-- Answer
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES 
('Answer_1', 1, 'Y'),
('Answer_2', 2, 'N'),
('Answer_3', 3, 'Y'),
('Answer_4', 4, 'Y'),
('Answer_5', 5, 'N'),
('Answer_6', 6, 'Y'),
('Answer_7', 7, 'N'),
('Answer_8', 8, 'Y'),
('Answer_9', 8, 'Y'),
('Answer_10', 8, 'N'),
('Answer_11', 8, 'N'),
('Answer_12', 12, 'Y'),
('Answer_13', 13, 'Y'),
('Answer_14', 14, 'N'),
('Answer_15', 15, 'Y'),
('Answer_16', 16, 'N'),
('Answer_17', 17, 'Y'),
('Answer_18', 18, 'Y'),
('Answer_19', 19, 'N'),
('Answer_20', 20, 'Y'),
('Answer_21', 21, 'N'),
('Answer_22', 22, 'Y'),
('Answer_23', 23, 'Y'),
('Answer_24', 24, 'N'),
('Answer_25', 25, 'Y');

-- Exam
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES 
('EX001', 'Exam_1', 1, '00:30:00', 5, '2023-04-01'),
('EX002', 'Exam_2', 2, '01:00:00', 8, '2023-06-12'),
('EX003', 'Exam_3', 3, '00:45:00', 12, '2023-01-22'),
('EX004', 'Exam_4', 4, '00:20:00', 9, '2023-07-30'),
('EX005', 'Exam_5', 5, '01:30:00', 7, '2023-03-11'),
('EX006', 'Exam_6', 6, '00:25:00', 10, '2023-08-22'),
('EX007', 'Exam_7', 7, '00:55:00', 11, '2023-11-03'),
('EX008', 'Exam_8', 8, '00:40:00', 14, '2023-10-14'),
('EX009', 'Exam_9', 9, '01:15:00', 13, '2023-12-18'),
('EX010', 'Exam_10', 10, '00:35:00', 6, '2023-09-09'),
('EX011', 'Exam_11', 11, '01:20:00', 1, '2023-06-16'),
('EX012', 'Exam_12', 12, '00:45:00', 4, '2023-03-30'),
('EX013', 'Exam_13', 13, '01:10:00', 3, '2023-07-04'),
('EX014', 'Exam_14', 14, '00:50:00', 18, '2023-04-05'),
('EX015', 'Exam_15', 15, '01:00:00', 20, '2023-08-08'),
('EX016', 'Exam_16', 16, '00:20:00', 19, '2023-01-15'),
('EX017', 'Exam_17', 17, '01:25:00', 2, '2023-11-11'),
('EX018', 'Exam_18', 18, '00:30:00', 16, '2023-02-28'),
('EX019', 'Exam_19', 19, '00:45:00', 22, '2023-10-01'),
('EX020', 'Exam_20', 20, '00:50:00', 21, '2023-09-25'),
('EX021', 'Exam_21', 21, '01:10:00', 24, '2023-06-20'),
('EX022', 'Exam_22', 22, '00:40:00', 23, '2023-12-05'),
('EX023', 'Exam_23', 23, '01:00:00', 15, '2023-05-17'),
('EX024', 'Exam_24', 24, '00:30:00', 25, '2023-03-01'),
('EX025', 'Exam_25', 25, '01:20:00', 17, '2023-07-12');

-- ExamQuestion
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25);


-- Question 2: Lấy ra tất cả các phòng ban 
select * from Department;

-- Question 3: Lấy ra id của phòng ban "Sale" 
select DepartmentId from Department where DepartmentName = "Sales" ;

-- Question 4: Lấy ra thông tin account có full name dài nhất 
select * from Account where CHAR_LENGTH(Username) = (select   max(CHAR_LENGTH(Username)) from Account) ;


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id  = 3 
select * from Account where (CHAR_LENGTH(Username) = (select max(CHAR_LENGTH(Username)) from Account)) and DepartmentId = 3 ;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
select GroupName from `Group` where CreatorDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
select  QuestionId, count(Content) as AnswerQuantity from Answer 
group by QuestionId
having AnswerQuantity >=4 ;


-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
select Code from Exam  where  Duration >= '01:00:00' AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất 
 select *  from `Group` 
 order by CreatorDate desc
 limit 5;
 

 
-- Question 10: Đếm số nhân viên thuộc department có id = 2 
select count(1) from Account where DepartmentId = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
select Username from Account where Username like "D%" and Username like "%o";

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019  

delete from Exam where CreateDate < "2019-12-20";

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 

delete from Question where Content like "câu hỏi";

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn 
update  Account
set Username = "Nguyễn Bá Lộc" 
where AccountID = 5;

select * from Account;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 








