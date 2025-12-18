-- 1.	List all courses a specific student is enrolled in.

SELECT s.name, c.course_title
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.student_id = 1;  

-- 2.	Calculate the course completion rate (percentage of enrollments with a completion_date).

SELECT 
    (COUNT(completion_date) * 100.0 / COUNT(*)) AS completion_rate_percent
FROM enrollments;


-- 3.	Find the instructor with the most courses.

SELECT i.name, COUNT(c.course_id) AS total_courses
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id
GROUP BY i.name
ORDER BY total_courses DESC
LIMIT 2;

-- 4.	Identify students who have enrolled in more than 5 courses.

SELECT s.student_id, s.name, COUNT(e.course_id) AS total_enrollments
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 5;

-- 5.	Calculate the total revenue generated per course category.

SELECT c.category, SUM(c.price) AS total_revenue
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.category;

-- 6. List all modules for a specific course in sequence

SELECT module_title, sequence_number
FROM modules
WHERE course_id = 101     
ORDER BY sequence_number;
 
--  7.	Find courses that have no enrolled students.

SELECT c.course_id, c.course_title
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- 8. Average number of enrollments per course

SELECT AVG(enrollment_count) AS avg_enrollments_per_course
FROM (
    SELECT course_id, COUNT(*) AS enrollment_count
    FROM enrollments
    GROUP BY course_id
) AS sub;

    
    
--  9.	Identify the most popular course category.

SELECT c.category, COUNT(e.enrollment_id) AS total
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.category
ORDER BY total DESC
LIMIT 1;

-- 10.	Find students who have not completed any courses they enrolled in.

SELECT DISTINCT s.student_id, s.name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.completion_date IS NULL
AND s.student_id NOT IN (
    SELECT student_id FROM enrollments WHERE completion_date IS NOT NULL
);

