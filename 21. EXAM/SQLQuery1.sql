create proc usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
as
declare @emplDepartment int=(select e.DepartmentId from Employees e where e.Id=@EmployeeId)
declare @repDepartment int=(select c.DepartmentId from Categories c where c.Id in (select r.CategoryId from Reports r where r.Id=@ReportId))
if(@emplDepartment=@repDepartment) 
begin
update Reports 
set EmployeeId=@EmployeeId where Id=@ReportId
end
else raiserror('Employee doesn''t belong to the appropriate department!',16,2)

go