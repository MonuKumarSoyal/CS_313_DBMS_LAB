with updated_salaries(Name, Updated_Salary) AS
(SELECT inst.name, inst.salary as New_Salary FROM instructor as inst, department where inst.dept_name = department.dept_name and department.budget > 90000) 
UPDATE instructor SET salary = salary * (1.1) WHERE instructor.name IN (SELECT Name FROM updated_salaries);