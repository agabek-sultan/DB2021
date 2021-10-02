-- A
SELECT dept_name, avg(salary) AS avg_salary FROM instructor GROUP BY dept_name ORDER BY avg(salary);

-- B
SELECT building, count(*)
FROM department, course
WHERE department.dept_name = course.dept_name
GROUP BY building
HAVING count(*) =
       (SELECT max(course_count)
        FROM (
                 SELECT count(*) AS course_count
                 FROM department, course
                 WHERE department.dept_name = course.dept_name
                 GROUP BY building
             ) AS mx
       );

-- C
SELECT department.dept_name, count(*)
FROM department, course
WHERE department.dept_name = course.dept_name
GROUP BY department.dept_name
HAVING count(*) =
       (SELECT min(course_count)
        FROM (
                 SELECT count(*) AS course_count
                 FROM department, course
                 WHERE department.dept_name = course.dept_name
                 GROUP BY department.dept_name
             ) AS mn
       );

-- D
SELECT student.name, takes.id, count(takes.course_id)
FROM course, takes, student
WHERE takes.course_id = course.course_id AND takes.id = student.id AND course.dept_name = 'Comp. Sci.'
GROUP BY student.name, takes.id
HAVING count(*) > 3;

-- E
SELECT * FROM instructor
WHERE dept_name in ('Music', 'Biology', 'Philosophy');

-- F
SELECT distinct id
FROM teaches
WHERE year = 2018 AND id not IN (
    SELECT id FROM teaches
    WHERE year = 2017
    );
