-- A
SELECT student.id,name, dept_name,course_id,grade FROM student,takes WHERE student.id = takes.id AND takes.course_id LIKE 'CS%' AND takes.grade LIKE 'A%' ORDER BY name;

-- B
SELECT instructor.name,student.name,takes.grade FROM instructor,advisor,student,takes WHERE instructor.id = advisor.i_id AND advisor.s_id=student.id AND takes.id = student.id AND (takes.grade='C' OR takes.grade='C+' OR takes.grade='C-' OR takes.grade='F');

-- C
(SELECT dept_name FROM course,takes WHERE course.course_id=takes.course_id)
EXCEPT (SELECT dept_name FROM course,takes WHERE course.course_id=takes.course_id AND (takes.grade='C' OR takes.grade='F'));

-- D
(SELECT instructor.name, takes.course_id, takes.grade
FROM instructor, course, takes, advisor
WHERE instructor.id = advisor.i_id AND advisor.s_id = takes.id AND course.course_id = takes.course_id)
EXCEPT (
    SELECT instructor.name, takes.course_id, takes.grade
    FROM instructor, course, takes, advisor
    WHERE instructor.id = advisor.i_id AND advisor.s_id = takes.id AND course.course_id = takes.course_id AND takes.grade ='A'
);

-- E
SELECT DISTINCT time_slot.time_slot_id, title
FROM time_slot, course, section
WHERE end_hr < 13 AND section.time_slot_id = time_slot.time_slot_id AND course.course_id = section.course_id
ORDER BY time_slot.time_slot_id;