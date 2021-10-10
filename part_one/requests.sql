USE sql_part_one;
-- 1.1
SELECT *
FROM teacher;

-- 1.2
SELECT *
FROM student_group
WHERE speciality LIKE "ЭВМ";

-- 1.3
SELECT teacher_id, audience_number
FROM timetable
WHERE subject_id LIKE "18П";

-- 1.4
SELECT DISTINCT subject.id, subject.name
FROM subject
JOIN timetable ON subject.id = subject_id
JOIN teacher ON teacher.id = teacher_id
WHERE teacher.surname LIKE "Костин";

-- 1.5
SELECT DISTINCT student_group.id
FROM student_group
JOIN timetable ON student_group.id = student_group_id
JOIN teacher ON teacher.id = teacher_id
WHERE teacher.surname LIKE "Фролов";

-- 1.6
SELECT *
FROM subject
WHERE speciality LIKE "АСОИ";

-- 1.7
SELECT *
FROM teacher
WHERE teacher.speciality LIKE "%АСОИ%";

-- 1.8
SELECT DISTINCT teacher.surname
FROM teacher
JOIN timetable ON teacher.id = teacher_id
WHERE audience_number = 210;

-- 1.9
SELECT subject.name AS subject, student_group.name AS group_name
FROM timetable
JOIN subject ON subject.id = subject_id
JOIN student_group ON student_group.id = student_group_id
WHERE audience_number BETWEEN 100 AND 200;

-- 1.10
SELECT first.id AS group1, second.id AS group2
FROM student_group first
JOIN student_group AS second 
	ON first.speciality = second.speciality AND first.id <> second.id;
    
-- 1.11
SELECT SUM(number_of_students) AS "All student ЭВМ"
FROM student_group
WHERE speciality LIKE "ЭВМ";

-- 1.12
SELECT id
FROM teacher
WHERE speciality LIKE "%ЭВМ%";

-- 1.13
SELECT subject_id
FROM timetable
GROUP BY subject_id
HAVING COUNT(student_group_id) = (
	SELECT COUNT(id) 
    FROM student_group
);

-- 1.14
SELECT DISTINCT t1.surname
FROM timetable tt1
JOIN teacher t1 ON tt1.teacher_id = t1.id
WHERE tt1.subject_id IN (
	SELECT DISTINCT tt2.subject_id
    FROM timetable tt2
    WHERE tt2.teacher_id IN (
		SELECT DISTINCT tt3.teacher_id
        FROM timetable tt3
        WHERE tt3.subject_id LIKE "14П"
    )
);

-- 1.15
SELECT *
FROM subject
WHERE id NOT IN (
	SELECT DISTINCT subject_id
    FROM timetable
    WHERE teacher_id LIKE "221Л"
);

-- 1.16
SELECT *
FROM subject 
WHERE subject.id NOT IN (
	SELECT DISTINCT subject_id
    FROM timetable
    JOIN student_group ON timetable.student_group_id = student_group.id
    WHERE student_group.name LIKE "М-6"
);

-- 1.17
SELECT *
FROM teacher
WHERE teacher.position LIKE "Доцент" AND teacher.id IN (
	SELECT teacher_id
    FROM timetable
    WHERE student_group_id REGEXP "3Г|8Г"
);

-- 1.18
SELECT student_group_id, subject_id, teacher_id
FROM timetable
JOIN teacher ON teacher.id = timetable.teacher_id
WHERE department LIKE "ЭВМ" AND speciality LIKE "%АСОИ%";

-- 1.19
SELECT DISTINCT student_group_id
FROM timetable
JOIN teacher ON teacher.id = teacher_id
JOIN student_group ON student_group.id = student_group_id
WHERE teacher.speciality = student_group.speciality;

-- 1.20
SELECT DISTINCT teacher_id
FROM timetable
JOIN teacher ON teacher.id = teacher_id
JOIN student_group ON student_group.id = student_group_id
WHERE teacher.department LIKE "ЭВМ" AND student_group.speciality = teacher.speciality;

-- 1.21
SELECT DISTINCT student_group.speciality
FROM student_group
JOIN timetable ON student_group.id = timetable.student_group_id
JOIN teacher ON teacher.id = timetable.teacher_id
WHERE teacher.department LIKE "АСУ";

-- 1.22
SELECT DISTINCT subject_id
FROM timetable
JOIN student_group ON id = student_group_id
WHERE name LIKE "АС-8";

-- 1.23
SELECT DISTINCT student_group_id
FROM timetable
JOIN student_group ON id = student_group_id
WHERE name NOT LIKE "АС-8" AND subject_id IN (
	SELECT DISTINCT subject_id
    FROM timetable
    JOIN student_group ON id = student_group_id
    WHERE name LIKE "АС-8"
);

-- 1.24
SELECT DISTINCT student_group_id
FROM timetable
JOIN student_group ON id = student_group_id
WHERE name NOT LIKE "АС-8" AND student_group_id NOT IN (
	SELECT DISTINCT student_group_id
    FROM timetable
    JOIN student_group ON id = student_group_id
    WHERE subject_id IN (
		SELECT DISTINCT subject_id
		FROM timetable
		JOIN student_group ON id = student_group_id
		WHERE name LIKE "АС-8"
	)
);

-- 1.25
SELECT DISTINCT student_group_id
FROM timetable
JOIN student_group ON id = student_group_id
WHERE student_group_id NOT IN (
	SELECT DISTINCT student_group_id
    FROM timetable
    JOIN student_group ON id = student_group_id
    WHERE subject_id IN (
		SELECT DISTINCT subject_id
		FROM timetable
		JOIN teacher ON id = teacher_id
        WHERE teacher_id LIKE "430Л"
	)
);

-- 1.26
SELECT DISTINCT teacher_id
FROM timetable
JOIN student_group ON student_group_id = id
WHERE name LIKE "Э-15" AND teacher_id NOT IN (
	SELECT DISTINCT teacher_id
    FROM timetable
    WHERE subject_id LIKE "12П"
)