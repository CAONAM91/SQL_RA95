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
GroupID int auto_increment primary key,
AccountID int,
JoinDate date,
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
isCorrect enum("Correct","Not Correct"),
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
foreign key(CategoryID) references Question(CategoryID), 
foreign key(CreatorID) references Account(AccountID) 
); 
create table ExamQuestion  (
ExamID int,
QuestionID int,
foreign key(ExamID) references Exam(ExamID), 
foreign key(QuestionID) references Question(QuestionID)
);