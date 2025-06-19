drop database  if exists Assignment2;
create database Assignment2;
use Assignment2;
 -- Bảng bên dưới sẽ có ít nhất 1 triệu bản ghi, có chứa các thông tin sau:
-- Bạn phải chọn 1 kiểu dữ liệu phù hợp để tối ưu không gian lưu trữ mỗi hàng của bảng 

create table Data_Type (
ID bigint auto_increment primary key ,
Name text,
Code char(5),
ModifiedDate datetime default(to_days())
);