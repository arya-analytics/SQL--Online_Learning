Create Database Online_Learning;

use Online_Learning;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    bio TEXT,
    expertise VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(200),
    instructor_id INT,
    category VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    completion_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE modules (
    module_id INT PRIMARY KEY,
    course_id INT,
    module_title VARCHAR(200),
    sequence_number INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE quizzes (
    quiz_id INT PRIMARY KEY,
    module_id INT,
    quiz_title VARCHAR(200),
    max_score INT,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

INSERT INTO students (student_id, name, email, country, signup_date) VALUES
(1, 'Aarav Sharma', 'aarav@example.com', 'India', '2024-01-10'),
(2, 'Sophia Patel', 'sophia@example.com', 'India', '2024-02-15'),
(3, 'Rohan Verma', 'rohan@example.com', 'USA', '2024-03-05'),
(4, 'Emily Smith', 'emily@example.com', 'UK', '2024-01-22'),
(5, 'Kabir Khan', 'kabir@example.com', 'Canada', '2024-03-18'),
(6, 'Mia Thomas', 'mia@example.com', 'Australia', '2024-04-01');

INSERT INTO instructors (instructor_id, name, bio, expertise) VALUES
(1, 'Dr. Raj Mehta', 'Expert in Data Science and ML', 'Data Science'),
(2, 'Ananya Rao', 'Software Developer and Trainer', 'Web Development'),
(3, 'John Wick', 'Cybersecurity Specialist', 'Cybersecurity');


INSERT INTO courses (course_id, course_title, instructor_id, category, price) VALUES
(101, 'Python for Beginners', 1, 'Programming', 1999.00),
(102, 'Advanced Machine Learning', 1, 'Data Science', 4999.00),
(103, 'Full Stack Web Development', 2, 'Web Development', 3999.00),
(104, 'Ethical Hacking Basics', 3, 'Cybersecurity', 2999.00),
(105, 'React JS Mastery', 2, 'Web Development', 2499.00);

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_date) VALUES
(1, 1, 101, '2024-03-01', '2024-03-20'),
(2, 1, 103, '2024-03-15', NULL),
(3, 2, 101, '2024-03-05', '2024-03-25'),
(4, 2, 102, '2024-03-10', NULL),
(5, 3, 104, '2024-03-20', NULL),
(6, 4, 103, '2024-04-01', NULL),
(7, 5, 105, '2024-04-05', '2024-04-25'),
(8, 6, 102, '2024-04-10', NULL);


INSERT INTO modules (module_id, course_id, module_title, sequence_number) VALUES
(1, 101, 'Introduction to Python', 1),
(2, 101, 'Python Basics', 2),
(3, 101, 'Control Statements', 3),
(4, 103, 'HTML & CSS Basics', 1),
(5, 103, 'JavaScript Fundamentals', 2),
(6, 104, 'Cybersecurity Overview', 1),
(7, 104, 'Types of Attacks', 2),
(8, 105, 'React Components', 1);


INSERT INTO quizzes (quiz_id, module_id, quiz_title, max_score) VALUES
(1, 1, 'Python Intro Quiz', 20),
(2, 2, 'Python Basics Quiz', 25),
(3, 4, 'HTML/CSS Quiz', 15),
(4, 6, 'Cybersecurity Fundamentals Quiz', 20),
(5, 8, 'React Components Quiz', 30);








