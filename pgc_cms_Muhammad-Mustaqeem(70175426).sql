
create database pgc_cms;

use pgc_cms;

create table departments (
    department_id int primary key,
    department_name varchar(100) not null,
    description varchar(255)
);

create table classes (
    class_id int primary key,
    class_name varchar(50) not null,
    section varchar(20),
    shift varchar(20)
);

create table students (
    student_id int primary key,
    name varchar(100) not null,
    father_name varchar(100),
    gender varchar(10),
    date_of_birth date,
    contact varchar(50),
    address varchar(255),
    department_id int,
    class_id int,
    foreign key (department_id) references departments(department_id),
    foreign key (class_id) references classes(class_id)
);

create table teachers (
    teacher_id int primary key,
    name varchar(100) not null,
    qualification varchar(100),
    contact varchar(50),
    department_id int,
    foreign key (department_id) references departments(department_id)
);

create table courses (
    course_id int primary key,
    course_name varchar(100) not null,
    credit_hours int,
    class_id int,
    teacher_id int,
    foreign key (class_id) references classes(class_id),
    foreign key (teacher_id) references teachers(teacher_id)
);

create table attendance (
    attendance_id int primary key,
    student_id int,
    course_id int,
    date date,
    status varchar(10),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

create table exams (
    exam_id int primary key,
    exam_type varchar(20),
    class_id int,
    exam_date date,
    foreign key (class_id) references classes(class_id)
);

create table results (
    result_id int primary key,
    student_id int,
    course_id int,
    exam_id int,
    marks_obtained int,
    grade varchar(5),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id),
    foreign key (exam_id) references exams(exam_id)
);

create table fee_records (
    fee_id int primary key,
    student_id int,
    amount decimal(10,2),
    fee_month varchar(20),
    status varchar(10),
    payment_date date,
    foreign key (student_id) references students(student_id)
);

create table users (
    user_id int primary key,
    username varchar(50) not null unique,
    password varchar(100) not null,
    role varchar(20),
    reference_id int
);


-- departments
insert into departments values
(1, 'computer science', 'cs department'),
(2, 'commerce', 'commerce department'),
(3, 'english', 'english department'),
(4, 'mathematics', 'math department'),
(5, 'physics', 'physics department'),
(6, 'chemistry', 'chemistry department'),
(7, 'biology', 'biology department'),
(8, 'economics', 'economics department'),
(9, 'urdu', 'urdu department'),
(10, 'islamic studies', 'islamic studies department');

-- classes
insert into classes values
(1, 'ics', 'a', 'morning'),
(2, 'ics', 'b', 'evening'),
(3, 'fsc', 'a', 'morning'),
(4, 'fsc', 'b', 'evening'),
(5, 'icom', 'a', 'morning'),
(6, 'icom', 'b', 'evening'),
(7, 'ba', 'a', 'morning'),
(8, 'ba', 'b', 'evening'),
(9, 'ma', 'a', 'morning'),
(10, 'ma', 'b', 'evening');

-- students
insert into students values
(1, 'mustaqeem', 'mumtaz', 'male', '2005-03-12', '03001234567', 'lahore', 1, 1),
(2, 'abdullah', 'babar', 'male', '2006-07-21', '03012345678', 'lahore', 2, 5),
(3, 'naish', 'iftikhar', 'male', '2004-11-02', '03023456789', 'gujranwala', 3, 7),
(4, 'aisha', 'imran', 'female', '2005-01-15', '03034567890', 'lahore', 4, 3),
(5, 'bilal', 'nadeem', 'male', '2006-09-09', '03045678901', 'multan', 5, 4),
(6, 'sana', 'waqar', 'female', '2005-05-05', '03056789012', 'lahore', 6, 6),
(7, 'hamza', 'iftikhar', 'male', '2004-12-25', '03067890123', 'faisalabad', 7, 2),
(8, 'maryam', 'aslam', 'female', '2006-02-18', '03078901234', 'lahore', 8, 8),
(9, 'ahsan', 'zubair', 'male', '2005-06-30', '03089012345', 'lahore', 9, 9),
(10, 'hiba', 'shahzad', 'female', '2004-04-14', '03090123456', 'lahore', 10, 10);

-- teachers
insert into teachers values
(1, 'dr. khalid', 'phd cs', '03011111111', 1),
(2, 'mr. imran', 'msc commerce', '03022222222', 2),
(3, 'ms. sara', 'ma english', '03033333333', 3),
(4, 'mr. zafar', 'msc math', '03044444444', 4),
(5, 'dr. nadeem', 'phd physics', '03055555555', 5),
(6, 'ms. hina', 'msc chemistry', '03066666666', 6),
(7, 'mr. arif', 'msc biology', '03077777777', 7),
(8, 'ms. ayesha', 'ma economics', '03088888888', 8),
(9, 'mr. qasim', 'ma urdu', '03099999999', 9),
(10, 'dr. farah', 'phd islamic studies', '03100000000', 10);

-- courses
insert into courses values
(1, 'programming fundamentals', 3, 1, 1),
(2, 'accounting basics', 3, 5, 2),
(3, 'english literature', 3, 7, 3),
(4, 'calculus', 3, 3, 4),
(5, 'mechanics', 3, 4, 5),
(6, 'organic chemistry', 3, 6, 6),
(7, 'cell biology', 3, 2, 7),
(8, 'microeconomics', 3, 8, 8),
(9, 'urdu poetry', 3, 9, 9),
(10, 'islamic history', 3, 10, 10);

-- attendance
insert into attendance values
(1, 1, 1, '2026-01-01', 'present'),
(2, 2, 2, '2026-01-01', 'absent'),
(3, 3, 3, '2026-01-01', 'present'),
(4, 4, 4, '2026-01-01', 'present'),
(5, 5, 5, '2026-01-01', 'absent'),
(6, 6, 6, '2026-01-01', 'present'),
(7, 7, 7, '2026-01-01', 'present'),
(8, 8, 8, '2026-01-01', 'absent'),
(9, 9, 9, '2026-01-01', 'present'),
(10, 10, 10, '2026-01-01', 'present');

-- exams
insert into exams values
(1, 'midterm', 1, '2026-02-10'),
(2, 'final', 2, '2026-06-15'),
(3, 'midterm', 3, '2026-02-12'),
(4, 'final', 4, '2026-06-18'),
(5, 'midterm', 5, '2026-02-14'),
(6, 'final', 6, '2026-06-20'),
(7, 'midterm', 7, '2026-02-16'),
(8, 'final', 8, '2026-06-22'),
(9, 'midterm', 9, '2026-02-18'),
(10, 'final', 10, '2026-06-25');

-- results
insert into results values
(1, 1, 1, 1, 85, 'a'),
(2, 2, 2, 2, 70, 'b'),
(3, 3, 3, 3, 90, 'a'),
(4, 4, 4, 4, 65, 'c'),
(5, 5, 5, 5, 75, 'b'),
(6, 6, 6, 6, 88, 'a'),
(7, 7, 7, 7, 60, 'c'),
(8, 8, 8, 8, 95, 'a'),
(9, 9, 9, 9, 72, 'b'),
(10, 10, 10, 10, 80, 'b');

-- fee_records
insert into fee_records values
(1, 1, 5000, 'january', 'paid', '2026-01-05'),
(2, 2, 4500, 'january', 'unpaid', null),
(3, 3, 6000, 'january', 'paid', '2026-01-06'),
(4, 4, 5500, 'january', 'paid', '2026-01-07'),
(5, 5, 5000, 'january', 'unpaid', null),
(6, 6, 4500, 'january', 'paid', '2026-01-08'),
(7, 7, 6000, 'january', 'paid', '2026-01-09'),
(8, 8, 5500, 'january', 'unpaid', null),
(9, 9, 5000, 'january', 'paid', '2026-01-10'),
(10, 10, 4500, 'january', 'paid', '2026-01-11');

-- users
insert into users values
(1, 'admin1', 'pass123', 'admin', null),
(2, 'admin2', 'pass456', 'admin', null),
(3, 'teacher1', 'pass123', 'teacher', 1),
(4, 'teacher2', 'pass123', 'teacher', 2),
(5, 'teacher3', 'pass123', 'teacher', 3),
(6, 'student1', 'pass123', 'student', 1),
(7, 'student2', 'pass123', 'student', 2),
(8, 'student3', 'pass123', 'student', 3),
(9, 'student4', 'pass123', 'student', 4),
(10, 'student5', 'pass123', 'student', 5);



select student_id, name, gender from students;

select course_id, course_name from courses order by course_name asc;

select teacher_id, name, qualification from teachers where qualification like '%phd%';

select s.name, d.department_name, c.class_name
from students s
join departments d on s.department_id = d.department_id
join classes c on s.class_id = c.class_id;

select s.name, f.amount, f.status
from students s
join fee_records f on s.student_id = f.student_id
where f.status = 'unpaid';

select s.name, r.marks_obtained, e.exam_type
from results r
join students s on r.student_id = s.student_id
join exams e on r.exam_id = e.exam_id
order by r.marks_obtained desc;

select count(*) as total_teachers from teachers;

select avg(credit_hours) as avg_credit_hours from courses;

select fee_month, sum(amount) as total_amount
from fee_records
group by fee_month;

select s.name, r.marks_obtained
from results r
join students s on r.student_id = s.student_id
where r.grade = 'a'
order by r.marks_obtained desc;

select department_id, count(*) as student_count
from students
group by department_id
order by student_count desc;

select exam_type, max(marks_obtained) as highest_marks
from results r
join exams e on r.exam_id = e.exam_id
group by exam_type;

 -- drop database pgc_cms;
