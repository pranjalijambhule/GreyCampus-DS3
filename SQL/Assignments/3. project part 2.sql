
CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	department VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(12) UNIQUE NOT NULL
)


CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	phone VARCHAR(12) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE,
	graduation_year INTEGER NOT NULL
)

--Mark Watney (student_id=1) who has a phone number of 777-555-1234 and doesn't have an email.
-- He graduates in 2035 and has 5 as a homeroom number.
SELECT * FROM students;

INSERT INTO students (first_name, last_name, homeroom_number, phone,graduation_year)
VALUES
('Mark','Watney',5,'777-555-1234',2035);

-- Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. 
-- His contact info is: jsalk@school.org and a phone number of 777-555-4321.

SELECT * FROM teachers;

INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES
('Jonas','Salk',5,'Biology','jsalk@school.org','777-555-4321');

