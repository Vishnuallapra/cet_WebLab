create database university;
use university;

-- Table Student 
create table student(Name varchar(50) not null,Student_Number int(10) primary key,Class int(5),Major varchar(10));
insert into student values("Smith",17,1,"CS");
insert into student values("Brown",8,2,"CS");

-- Table Course

create table course(Course_name varchar(30),Course_number varchar(10) primary key,Credit_hours int(5),Department varchar(20));
insert into course values("Intro to Computer Science","CS1310",4,"CS");
insert into course values("Data Structures","CS3320",4,"CS");
insert into course values("Discrete Mathematics","MATH2410",3,"MATH");
insert into course values("Database","CS3380",3,"CS");

-- Table Section  

create table section(Section_identifier int(5) primary key,Course_number varchar(10) not null,Semester varchar(10),Year int(5),Instructor varchar(20),foreign key(Course_number) references course(Course_number) ON DELETE CASCADE ON UPDATE CASCADE);
insert into section values(85,"MATH2410","Fall",07,"King");
insert into section values(92,"CS1310","Fall",07,"Andreson");
insert into section values(102,"CS3320","Spring",08,"Knuth");
insert into section values(112,"MATH2410","Fall",08,"Chang");
insert into section values(119,"CS1310","Fall",08,"Andreson");
insert into section values(135,"CS3380","Fall",08,"Stone");


-- Table Grade

create table grade_report(Student_number int(10) not null,Section_identifier int(5) not null,Grade varchar(5),foreign key(Student_number) references student(Student_number) ON DELETE CASCADE ON UPDATE CASCADE,foreign key(Section_identifier) references section(Section_identifier) ON DELETE CASCADE ON UPDATE CASCADE);
insert into grade_report values(17,112,'B');
insert into grade_report values(17,119,'C');
insert into grade_report values(8,85,'A');
insert into grade_report values(8,92,'A');
insert into grade_report values(8,102,'B');
insert into grade_report values(8,135,'A');


-- Table Pre-Req

create table prerequisite(Course_number varchar(10) not null,prerequisite_number varchar(10) primary key,foreign key(Course_number) references course(Course_number));
insert into prerequisite values('CS3380','CS3320');
insert into prerequisite values('CS3380','MATH2410');
insert into prerequisite values('CS3320','CS1310');


select grade_report.Grade,section.* from grade_report inner join section where grade_report.Section_identifier=section.Section_identifier;
select grade_report.Grade,section.*,course.Course_name from grade_report inner join section where grade_report.Section_identifier=section.Section_identifier and inner join course on course.Course_number=section.Section_number;
-- select Grade from grade_report where Student_number=(select Student_number from student where Name='Smith');