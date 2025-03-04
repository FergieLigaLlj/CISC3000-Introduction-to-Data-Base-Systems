use university;
delete from prereq;
delete from time_slot;
delete from advisor;
delete from takes;
delete from student;
delete from teaches;
delete from section;
delete from instructor;
delete from course;
delete from department;
delete from classroom;
insert into classroom values ('Packard', '101', '500');
insert into classroom values ('Painter', '514', '10');
insert into classroom values ('Taylor', '3128', '70');
insert into classroom values ('Watson', '100', '30');
insert into classroom values ('Watson', '120', '50');
insert into department values ('Biology', 'Watson', '90000');
insert into department values ('Comp. Sci.', 'Taylor', '100000');
insert into department values ('Elec. Eng.', 'Taylor', '85000');
insert into department values ('Finance', 'Painter', '120000');
insert into department values ('History', 'Painter', '50000');
insert into department values ('Music', 'Packard', '80000');
insert into department values ('Physics', 'Watson', '70000');
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instructor values ('12121', 'Wu', 'Finance', '90000');
insert into instructor values ('15151', 'Mozart', 'Music', '40000');
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
insert into instructor values ('32343', 'El Said', 'History', '60000');
insert into instructor values ('33456', 'Gold', 'Physics', '87000');
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instructor values ('58583', 'Califieri', 'History', '62000');
insert into instructor values ('76543', 'Singh', 'Finance', '80000');
insert into instructor values ('76766', 'Crick', 'Biology', '72000');
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');
insert into section values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B');
insert into section values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A');
insert into section values ('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');
insert into section values ('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F');
insert into section values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'E');
insert into section values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'A');
insert into section values ('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D');
insert into section values ('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B');
insert into section values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C');
insert into section values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A');
insert into section values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C');
insert into section values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B');
insert into section values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C');
insert into section values ('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D');
insert into section values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A');
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2017');
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2018', null);
insert into advisor values ('00128', '45565');
insert into advisor values ('12345', '10101');
insert into advisor values ('23121', '76543');
insert into advisor values ('44553', '22222');
insert into advisor values ('45678', '22222');
insert into advisor values ('76543', '45565');
insert into advisor values ('76653', '98345');
insert into advisor values ('98765', '98345');
insert into advisor values ('98988', '76766');
insert into time_slot values ('A', 'M', '8', '0', '8', '50');
insert into time_slot values ('A', 'W', '8', '0', '8', '50');
insert into time_slot values ('A', 'F', '8', '0', '8', '50');
insert into time_slot values ('B', 'M', '9', '0', '9', '50');
insert into time_slot values ('B', 'W', '9', '0', '9', '50');
insert into time_slot values ('B', 'F', '9', '0', '9', '50');
insert into time_slot values ('C', 'M', '11', '0', '11', '50');
insert into time_slot values ('C', 'W', '11', '0', '11', '50');
insert into time_slot values ('C', 'F', '11', '0', '11', '50');
insert into time_slot values ('D', 'M', '13', '0', '13', '50');
insert into time_slot values ('D', 'W', '13', '0', '13', '50');
insert into time_slot values ('D', 'F', '13', '0', '13', '50');
insert into time_slot values ('E', 'T', '10', '30', '11', '45 ');
insert into time_slot values ('E', 'R', '10', '30', '11', '45 ');
insert into time_slot values ('F', 'T', '14', '30', '15', '45 ');
insert into time_slot values ('F', 'R', '14', '30', '15', '45 ');
insert into time_slot values ('G', 'M', '16', '0', '16', '50');
insert into time_slot values ('G', 'W', '16', '0', '16', '50');
insert into time_slot values ('G', 'F', '16', '0', '16', '50');
insert into time_slot values ('H', 'W', '10', '0', '12', '30');
insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');

use university;

-- select 
select * from instructor;
select * from instructor where dept_name='Physics';
select * from instructor where dept_name='Physics' and salary>90000;

-- projection
select ID, name, salary from instructor;

-- union
select * from section;

select course_id from section where semester='Fall' and year=2017;

select course_id from section where semester='Spring' and year=2018;

select course_id from section where semester='Fall' and year=2017
union
select course_id from section where semester='Spring' and year=2018;

-- set-intersect
-- mysql does not support INTERSECT command
select course_id from section 
where semester='Fall' and year=2017 
and course_id in (select course_id from section where semester='Spring' and year=2018);

-- set-difference
-- mysql does not support MINUS command
select course_id from section 
where semester='Fall' and year=2017 
and course_id not in (select course_id from section where semester='Spring' and year=2018);

-- join (Cartisian product)
select * from instructor, teaches;
select * from instructor, teaches where instructor.ID = teaches.ID;

-- assignment and rename
select course_id, sec_id from section;
select course_id as cid, sec_id as sid from section as sec;








use university;
show tables;

-- basic query structure
select * from student where dept_name = 'Comp. Sci.';

-- distinct
select distinct dept_name from student;

-- all
select all dept_name from student;

-- asterisk *
select * from student where dept_name = 'Comp. Sci.';

-- literal attribute without from
select '437';

-- as 
select dept_name as department_name from student;

-- literal attribute with from
select 'A' from instructor;

-- arithmetic expressions
select ID, name, salary/12 as monthly_salary from instructor;

-- where clause
-- logical connectives and, or, and not
-- comparison operators <, <=, >, >=, =, and <>
select name from instructor where dept_name = 'Comp. Sci.' and salary > 70000;

-- from clause
-- no 'Art', change to 'Comp. Sci.'
-- Cartesian product
select * from instructor, teaches;
select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID and instructor.dept_name = 'Comp. Sci.';
    
-- Rename
select distinct T.name 
from instructor as T, instructor as S 
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

-- String Operations
select name from instructor where name like '%a%';
select name from instructor where name like 'W_';

-- Ordering
select distinct name from instructor order by name;
select distinct name from instructor order by name desc;

-- Where Clause Predicates
-- between
select name from instructor where salary between 90000 and 100000;
-- tuple
select name, course_id from instructor, teaches where (instructor.ID, dept_name) = (teaches.ID, 'Biology');

-- Set Operations
-- no 'sem', change to 'semester'
(select course_id from section where semester = 'Fall' and year = 2017)
union 
(select course_id from section where semester = 'Spring' and year = 2018);
-- 'intersect' is not supported 
select course_id from section where semester = 'Fall' and year = 2017
and course_id in
(select course_id from section where semester = 'Spring' and year = 2018);
-- so to 'except'
select course_id from section where semester = 'Fall' and year = 2017
and course_id not in
(select course_id from section where semester = 'Spring' and year = 2018);
-- union all
-- pass

-- is null
select name from instructor where salary is null;
select name from instructor where salary is not null; 
select name from instructor;

-- null value
-- try by yourselves
select name from instructor where salary < null or salary > 65000;

-- Aggregate Functions
select avg (salary) from instructor where dept_name= 'Comp. Sci.';
select count(distinct ID) from teaches where semester = 'Spring' and year = 2018;
select count(*) from course;

-- Aggregate Functions – Group By
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name;

-- Aggregate Functions – Having Clause
select dept_name, avg(salary) as avg_salary 
from instructor 
where name <> 'Eric' 
group by dept_name 
having avg(salary) > 42000;

-- Nested Subqueries
-- Where clause
-- Set Membership - in, not in
select distinct course_id 
from section 
where semester = 'Fall' and year= 2017 and 
course_id in (select course_id from section
				where semester = 'Spring' and year= 2018);

-- Set Comparison - some, all
select name from instructor 
where salary > some (select salary
					from instructor where dept_name = 'Biology');

select name from instructor 
where salary > all (select salary from instructor where dept_name = 'Biology');

-- Empty relations - exists, not exists
select course_id from section as S 
where semester = 'Fall' 
and year = 2017 
and exists (select * from section as T 
 				where semester = 'Spring' 
 					and year= 2018
 					and S.course_id = T.course_id);

-- from clause
select dept_name, avg_salary
from ( select dept_name, avg (salary) as avg_salary
 		from instructor
 		group by dept_name) as dept_avg
where avg_salary > 42000;

-- With 
with max_budget (value) as 
(select max(budget) from department) 
select department.dept_name 
from department, max_budget 
where department.budget = max_budget.value;

-- Select clause
-- 
select count(*) from instructor where instructor.dept_name='Com. Sci';

-- Modification of the Database
-- Deletion

select * from instructor;

start transaction;
delete from instructor;
select * from instructor;
rollback;

-- Insertion
select * from course;

start transaction;
insert into course values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);
select * from course;
rollback;

-- Updates 
select * from instructor;
start transaction;
update instructor set salary = salary * 2;
select * from instructor;
rollback;

-- Updates - Cases
select * from instructor;
start transaction;
update instructor 
set salary = case 
when salary <= 50000 then salary * 1.01
 					else salary * 0.99
 					end;
select * from instructor;
rollback;






use university;
-- Joined Relations

select name, course_id
from  student, takes
where student.ID = takes.ID;

select name, course_id
from student natural join takes;

select name, title    
from student natural join takes, course       
where takes.course_id = course.course_id;

-- Natural Join with Using Clause

select name, title
from  (student natural join takes)  join course using (course_id);

-- Join Condition

select *
from  student join takes on student.ID  = takes.ID;

-- Outer Join

select * from course natural left outer join prereq;

select * from course natural right outer join prereq;

select * from course natural left join prereq union select * from course natural right join prereq;

-- Inner join

select *from course inner join prereq on
course.course_id = prereq.course_id;



-- Assignment 2 in Chapter 3_3.3
-- a
use university;
select salary from instructor;
update instructor
set salary = salary * 110/100
where dept_name = "Comp. Sci.";
select salary from instructor;
-- b
DELETE c
FROM course c
LEFT JOIN section s ON c.course_id = s.course_id
WHERE s.course_id IS NULL;
-- c
select * from student;
desc instructor;
select * from instructor;
ALTER TABLE instructor DROP CONSTRAINT instructor_chk_1;
INSERT INTO instructor
SELECT s.ID, s.name, s.dept_name, 10000
FROM student s
WHERE s.tot_cred > 100;
select * from instructor;