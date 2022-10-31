-- Question. 8(i)
 -- this is to add some data values inside the respective tables
INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES ('Civil', 'abheri', '3234234');
INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES ('CE-134', 'Design enineering', 'Civil', '4');
INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES ('abheri', '111', '1200');
INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES ('CE-134', '1', 'Fall', '2009', 'abheri', '111', 'A');
INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES ('45565', 'CE-134', '1', 'Fall', '2009');

-- this is the main command for question no. 8(i)
SELECT course.course_id, course.title, instructor.ID, instructor.name FROM instructor, teaches, course WHERE instructor.ID = teaches.ID AND instructor.dept_name = 'Comp. Sci.' AND teaches.course_id LIKE 'CE%' AND teaches.year = 2009 AND course.course_id = teaches.course_id;
SELECT DISTINCT inst.ID,inst.name,teaches.course_id,course.title FROM instructor AS inst,teaches,course,section
WHERE inst.ID in (SELECT ID FROM instructor WHERE dept_name = 'Comp. Sci.') 
AND inst.ID = teaches.ID AND teaches.course_id = course.course_id
AND course.course_id = section.course_id AND course.dept_name = 'Civil'
and section.year = '2009' 
ORDER BY inst.name ASC;

-- Question. 8(ii)
-- First Inserting 2 courses 'CS-303' and 'CS-333'


INSERT INTO course(course_id, title, dept_name, credits) VALUES ('CS-303','Discrete Mathematics','Comp. Sci.','8');
INSERT INTO course(course_id, title, dept_name, credits) VALUES ('CS-333','Database Management Systems','Comp. Sci.','6');
-- Now inserting the required entry into the prereq table
INSERT INTO prereq(course_id, prereq_id) VALUES ('CS-333','CS-303');

-- Question. 8(iii)
-- Using Temporary Table updated_salaries

WITH updated_salaries(Name, Updated_Salary) AS
(SELECT inst.name, inst.salary as New_Salary FROM instructor as inst,department
WHERE inst.dept_name = department.dept_name AND department.budget > 90000)
-- Updating Instructor Table as per requirements
UPDATE instructor SET salary = salary * 1.1 WHERE instructor.name IN (SELECT Name FROM updated_salaries);
SELECT instructor.ID,instructor.name,instructor.dept_name,instructor.salary FROM instructor,department 
WHERE instructor.dept_name = department.dept_name AND department.budget > 90000;

-- Question. 8(iv)

WITH selected_courses(Course_ID,Title,num_students) AS 
(SELECT course.course_id,course.title,count(student.ID) FROM course,student,section,takes 
WHERE course.course_id = section.course_id AND section.semester = 'Fall' 
AND section.year = '2007' AND section.sec_id = takes.sec_id 
AND student.ID = takes.ID AND takes.course_id = course.course_id
GROUP BY course.course_id)
-- Displaying all such courses which have 15+ students undertaking it in the year 2007
SELECT Course_ID,Title,num_students FROM selected_courses WHERE num_students > 15
ORDER BY Course_ID ASC;