 -- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
-- Hướng dẫn:
-- Sử dụng Sub Query để lấy ra tất cả các ID của ProductSubcategory có name = 'Saddles'.
-- Sau đó trong outer query, sử dụng kết quả từ Sub Query để lấy ra yêu cầu của đề bài.
-- Kết quả sẽ như sau:
-- Name
-----------------------------
-- Mountain Seat/Saddle ML Mountain Seat/Saddle HL Mountain Seat/Saddle LL Road Seat/Saddle ML Road Seat/Saddle HL Road Seat/Saddle LL Touring Seat/Saddle ML Touring Seat/Saddle HL Touring Seat/Saddle
-- (9 row(s) affected)


with CTE_Bai1 as ( select ProductSubcategoryID from ProductSubcategory
where name = "Saddles")
select Name from Product where ProductSubcategoryID in ( select ProductSubcategoryID from CTE_Bai1);

-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.
-- Hướng dẫn:
-- Mệnh đề WHERE trong subquery sẽ sử dụng ký tự wildcard ‘Bo%’ .
-- Kết quả sẽ như sau:
-- Name
----------------------------
-- Water Bottle - 30 oz.
-- Mountain Bottle Cage
-- Road Bottle Cage
-- Bottom Bracket ML Bottom Bracket HL Bottom Bracket

with CTE_Bai2 as ( select ProductSubcategoryID from ProductSubcategory
where name like "Bo%")
select Name from Product where ProductSubcategoryID in ( select ProductSubcategoryID from CTE_Bai2);

-- Question 3:
-- Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
-- Hướng dẫn: sử dụng hàm MIN() trong subquery để trả về ListPrice thấp nhất
-- Kết quả sẽ như sau:
-- Name
--------------------------
-- Touring-3000 Blue, 54
-- Touring-3000 Blue, 58
-- Touring-3000 Blue, 62
-- ………
-- Touring-3000 Yellow, 62
-- Touring-3000 Blue, 44
-- Touring-3000 Blue, 50
-- (10 row(s) affected)

with Cte_Bai3_MinListPrice as ( select Min(ListPrice) as MinPrice  from product group by ProductSubcategoryID   ),
Cte_Bai3_Touring as ( select ProductSubcategoryID from ProductSubcategory where name like "Touring Bike%")
select Name ,ProductSubcategoryID, ListPrice from product
where ListPrice in (select MinPrice from Cte_Bai3_MinListPrice) and ProductSubcategoryID in  (select ProductSubcategoryID from Cte_Bai3_Touring) ;




-- Exercise 2: JOIN nhiều bảng
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.



select cr.Name country, sp.Name province from countryregion cr
join stateprovince sp on cr.CountryRegionCode = sp.CountryRegionCode;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
 -- Chú ý: sủ dụng sort order và column heading
select cr.Name country, sp.Name province from countryregion cr
join stateprovince sp on cr.CountryRegionCode = sp.CountryRegionCode
where cr.Name in ("Germany", "Canada")
order by country ;


-- Question 3:
-- Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate
-- Hướng dẫn: Join SalesOrderHeader và SalesPerson để chỉ lấy ra kết quả non-Internet orders (order được xử lý trên Internet có OnlineOrderFlag = 1 và cột SalesPersonID = null)

select SalesOrderID,soh.OrderDate, sp.SalesPersonID as BusinessEntityID, Bonus , SalesYTD  from SalesPerson sp
right join SalesOrderHeader soh on sp.SalesPersonID = soh.SalesPersonID 
where OnlineOrderFlag = 0 and sp.SalesPersonID is not null;


-- Question 4:
-- Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.




select soh.salesorderid,  e.title as jobttitle, sp.bonus, sp.salesytd
from salesperson sp 
join SalesOrderHeader soh on sp.salespersonid = soh.salespersonid
join employee e on sp.salespersonid = e.employeeid;



select * from salesperson;
select * from employee;
select * from SalesOrderHeader;