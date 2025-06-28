-- Bài toán 2:
-- Một siêu thị mini cần xây dựng hệ thống quản lý bán hàng, nhằm theo dõi:
-- Các sản phẩm đang kinh doanh.
-- Khách hàng mua sản phẩm.
-- Mỗi khách hàng có thể mua nhiều sản phẩm khác nhau trong nhiều lần mua (đơn hàng).
-- Mỗi đơn hàng có thể gồm nhiều sản phẩm.
-- Mỗi sản phẩm thuộc một loại hàng hóa (category).
-- Một khách hàng có thể có thẻ thành viên để tích điểm (loyalty card), nhưng không bắt buộc.

drop database  if exists Baitoan2;
create database Baitoan2;
use Baitoan2;

create table Customer (
CustomerId int auto_increment primary key,
CustomerName varchar(50)
);
create table Category (
CategoryId int auto_increment primary key,
CategoryName varchar(50)

);

create table Product (
ProductId int auto_increment primary key,
ProductName varchar(50),
CategoryId int,
foreign key (CategoryId) references Category(CategoryId)
);
create table `Order` (
OrderId int auto_increment primary key,
OrderDate date,
CustumerId int,
foreign key (CustomerId) references Customer(CustomerId)
);

create table OrderProduct (
ProductId int,
OrderId int,
primary key (ProductId,OrderId),
foreign key (ProductId) references Product(ProductId),
foreign key (OrderId) references `Order`(OrderId)

);

create table LoyalCard(

CustomerId int primary key,
IssueDate date,
foreign key (CustomerId) references Customer(CustomerId)
);



