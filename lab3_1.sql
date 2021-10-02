-- A
SELECT * FROM course WHERE credits > 3;

-- B
SELECT * FROM classroom WHERE building = 'Watson' OR building = 'Packard';

-- C
SELECT * FROM course WHERE dept_name = 'Comp. Sci. ';

-- D
SELECT * FROM section WHERE semestr = 'Fall';

-- E
SELECT * FROM student WHERE tot_cred > 45 And tot_cred < 90;

-- F
SELECT * FROM student WHERE name LIKE '%a' OR name LIKe '%e' OR name LIKE '%y' OR name LIKE '%i' OR name LIKE '%u' OR name LIKE '%o';

-- G
SELECT * FROM prereq, course WHERE prereq.course_id = course.course_id AND prereq.prereq_id = 'CS-101';