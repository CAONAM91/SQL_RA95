drop database  if exists SQL_Assignment_5;
create database SQL_Assignment_5;
use SQL_Assignment_5;



create table Employee (
EmployeeId int auto_increment primary key,
EmployeeLastName varchar(50),
EmployeeFirstName varchar(50),
EmployeeHireDate date,
EmployeeStatus varchar(50),
SupervisorId int,
foreign key(SupervisorId) references Employee(EmployeeId),
SocialSecurityNumber varchar(50)
);

create table Project (
ProjectId int auto_increment primary key,
managerId int,
ProjectName varchar(50),
ProjectStartDate date,
ProjectDescription varchar(50),
ProjectDetail varchar(50),
ProjectCompletedOn date ,
foreign key(managerId) references Employee(EmployeeId)
);

create table ProjectModules (
ModuleId int auto_increment primary key,
ProjectId int,
EmployeeId int,
ProjectModuleDate date,
ProjectModulesCompleteOn date,
ProjectModuleDescription text ,
foreign key(ProjectId) references Project(ProjectId),
foreign key(EmployeeId) references Employee(EmployeeId)
);


create table Work_Done (
WorkDoneId int auto_increment primary key,
EmployeeId int,
ModuleId int,
WorkDoneDate date default null,
WorkDoneDescription text,
WorkDoneStatus enum("Done", "Processing","On Hold","Cancelled"),
foreign key(EmployeeId) references Employee(EmployeeId),
foreign key(ModuleId) references ProjectModules(ModuleId)
);

INSERT INTO Employee (EmployeeLastName, EmployeeFirstName, EmployeeHireDate, EmployeeStatus, SupervisorId, SocialSecurityNumber)
VALUES 
('Nguyen', 'An', '2023-01-10', 'Active', NULL, '123-45-6789'),
('Tran', 'Binh', '2023-02-15', 'Active', 1, '234-56-7890'),
('Le', 'Cuong', '2023-03-20', 'Inactive', 1, '345-67-8901');



INSERT INTO Project (ProjectId, managerId, ProjectName, ProjectStartDate, ProjectDescription, ProjectDetail, ProjectCompletedOn)
VALUES 
(4, 1, 'Smart Home System', '2024-06-01', 'Điều khiển nhà thông minh', 'IoT, Mobile App', NULL),
(5, 2, 'E-Learning Platform', '2024-07-01', 'Nền tảng học trực tuyến', 'Web + AI Quiz', NULL),
(6, 3, 'Blockchain Wallet', '2024-05-20', 'Ví điện tử bảo mật cao', 'Blockchain + UI', NULL),
(7, 2, 'Food Delivery App', '2024-06-15', 'Ứng dụng đặt đồ ăn', 'Mobile + Backend', NULL),
(8, 1, 'Online Booking System', '2024-07-05', 'Hệ thống đặt lịch online', 'Calendar + SMS', NULL),
(99, 1, 'Test Project Old', '2023-12-01', 'Project test xoa', 'Dummy', '2024-03-01');



INSERT INTO ProjectModules (ModuleId, ProjectId, EmployeeId, ProjectModuleDate, ProjectModulesCompleteOn, ProjectModuleDescription)
VALUES 
(4, 4, 1, '2024-06-02', NULL, 'Điều khiển thiết bị bằng giọng nói'),
(5, 5, 2, '2024-07-02', NULL, 'Tính năng làm bài trắc nghiệm AI'),
(6, 6, 3, '2024-05-22', NULL, 'Giao diện ví điện tử'),
(7, 7, 1, '2024-06-16', NULL, 'Tối ưu hóa lộ trình giao hàng'),
(8, 8, 2, '2024-07-06', NULL, 'Tích hợp lịch và gửi tin nhắn SMS'),
(99, 99, 1, '2024-01-01', '2024-02-01', 'Module test');

INSERT INTO Work_Done (WorkDoneId, EmployeeId, ModuleId, WorkDoneDate, WorkDoneDescription, WorkDoneStatus)
VALUES 
(4, 1, 4, '2024-06-05', 'Phân tích yêu cầu thiết bị IoT', 'Processing'),
(5, 2, 5, '2024-07-03', 'Thiết kế câu hỏi trắc nghiệm', 'Done'),
(6, 3, 6, '2024-06-01', 'Xây dựng giao diện ví', 'On Hold'),
(7, 1, 7, '2024-06-18', 'Tối ưu hóa thuật toán định tuyến', 'Processing'),
(8, 2, 8, '2024-07-07', 'Kết nối API gửi tin nhắn', 'Processing'),
(99, 1, 99, '2024-02-15', 'Hoan thanh test', 'Done');




-- Tạo table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào mỗi table trên

-- Viết stored procedure (không có parameter) để Remove tất cả thông tin project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã remove từ các table liên quan trong khi removing (dùng lệnh print)
Drop procedure if exists Remove_3monthsago_Project;
DELIMITER $$
CREATE PROCEDURE Remove_3monthsago_Project ()
begin 
declare RecordDeleteWorkdone int default 0;
 declare RecordDeleteProjectModules int default 0;
 declare RecordDeleteProject int default 0;

Delete from Work_Done where ModuleId in (select * from( select  pm.ModuleId from ProjectModules pm join Project p on p.ProjectId = pm.ProjectId
where ProjectCompletedOn is not null and p.ProjectCompletedOn < (curdate() - interval 3 month)
) as temp1
);
set RecordDeleteWorkdone = ROW_COUNT();

delete from ProjectModules  where ProjectId in (select * from( select p.ProjectId from Project p 
where ProjectCompletedOn is not null and ProjectCompletedOn < (curdate() -interval 3 month)) as temp2
);
set RecordDeleteProjectModules = ROW_COUNT();

delete from Project 
where ProjectCompletedOn is not null and ProjectCompletedOn < (curdate() -interval 3 month);
set RecordDeleteProject = ROW_COUNT();

select RecordDeleteWorkdone as Record_DeleteWorkdone ,
 RecordDeleteProjectModules as Record_DeleteProjectModules,
 RecordDeleteProject as Record_DeleteProject ;

end$$
DELIMITER ;

  call Remove_3monthsago_Project();


SELECT * 
FROM Project 
WHERE ProjectCompletedOn IS NOT NULL
  AND ProjectCompletedOn < (CURDATE() - INTERVAL 3 MONTH);







-- Viết stored procedure (có parameter) để in ra các module đang được thực hiện)


Drop procedure if exists ModulesOnProcessing;
DELIMITER $$
CREATE PROCEDURE ModulesOnProcessing ( in Employee_Id int , in Project_Id int)
begin 
select pm.ModuleId,
        pm.ProjectId,
        p.ProjectName,
        e.EmployeeFirstName,
        e.EmployeeLastName,
        wd.WorkDoneDate,
        wd.WorkDoneDescription,
        wd.WorkDoneStatus
from ProjectModules pm
join Work_Done wd on pm.ModuleId = wd.ModuleId 
JOIN Employee e ON pm.EmployeeId = e.EmployeeId
JOIN Project p ON pm.ProjectId = p.ProjectId
where WorkDoneStatus = "Processing" and  e.EmployeeId = Employee_Id or p.ProjectId = Project_Id;

end$$
DELIMITER ;

call ModulesOnProcessing( 1,1);


-- Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works)

