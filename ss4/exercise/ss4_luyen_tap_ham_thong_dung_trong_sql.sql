drop database if exists quan_ly_sinh_vien_ss4;

create database quan_ly_sinh_vien_ss4;

use quan_ly_sinh_vien_ss4;

create table Class(
	ClassID int not null primary key auto_increment ,
    ClassName varchar(60) not null,
    StartDate datetime not null,
    `Status` bit
);

insert into Class
values (1, 'A1', '2008-12-20', 1),
	   (2, 'A2', '2008-12-22', 1),
	   (3, 'B3', current_date, 0);

create table Student(
	StudentID int not null primary key auto_increment ,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    `Status` Bit,
    ClassID int not null,
    foreign key (ClassID) 
		references Class(ClassID)
);

insert into Student (StudentName, Address, Phone, `Status`, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1),('Manh', 'HCM', '0123123123', 0, 2);
insert into Student (StudentName, Address, `Status`, ClassId)
values ('Hoa', 'Hai phong', 1, 1);

create table `Subject`(
	SubID int not null primary key auto_increment ,
    SubName varchar(30) not null,
    Creadit tinyint not null default 1 check (Creadit >= 1),
    `Status` bit default 1
);

insert into `Subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

create table Mark (
	MarkID int not null primary key auto_increment ,
    SubID int not null ,
    StudentID int not null,
    Mark float default 0 check (Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (SubID, StudentID),
    foreign key (SubID)
		references `Subject`(SubID),
    foreign key (StudentID) 
		references Student(StudentID)
);

insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

select *
from `Subject` s
order by s.SubID desc
limit 1;

select 
    *
from
    `Subject` s
where
    Creadit = (select 
            max(Creadit)
        from
            `Subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select 
    s.*, m1.Mark
from
    `Subject` s
        join
    Mark m1 on s.SubID = m1.SubID
where
    m1.Mark = (select 
            max(m.Mark)
        from
            Mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
       
select 
    stu.*, avg(m.Mark) as diem_trung_binh
from
    Student stu
       left join
    Mark m on stu.StudentID = m.StudentID
group by stu.StudentID 
order by diem_trung_binh desc;