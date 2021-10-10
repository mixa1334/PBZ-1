DROP DATABASE IF EXISTS sql_part_one;
CREATE DATABASE sql_part_one;

USE sql_part_one;

DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher(
	id VARCHAR(50) PRIMARY KEY NOT NULL  UNIQUE,
    surname VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    speciality VARCHAR(100) NOT NULL,
    phone SMALLINT NOT NULL
);
INSERT INTO teacher VALUES 
	("221Л", "Фролов", "Доцент", "ЭВМ", "АСОИ, ЭВМ", 487),
	("222Л", "Костин", "Доцент", "ЭВМ", "ЭВМ", 543),
	("225Л", "Бойко", "Профессор", "АСУ", "АСОИ, ЭВМ", 112),
    ("430Л", "Глазов", "Ассистент", "ТФ", "СД", 421),
    ("110Л", "Петров", "Ассистент", "Экономики", "Международная экономика", 324);
    
DROP TABLE IF EXISTS subject;
CREATE TABLE subject(
	id VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    hours SMALLINT NOT NULL,
	speciality VARCHAR(100) NOT NULL,
    term SMALLINT NOT NULL
);
INSERT INTO subject VALUES
	("12П", "Мини ЭВМ",	36,	"ЭВМ", 1),
    ("14П",	"ПЭВМ", 72, "ЭВМ", 2),
    ("17П",	"СУБД ПК",	48, "АСОИ",	4),
    ("18П",	"ВКСС",	52, "АСОИ",	6),
    ("34П", "Физика", 30, "СД", 6),
    ("22П",	"Аудит", 24, "Бухучета", 3);
    
DROP TABLE IF EXISTS student_group;
CREATE TABLE student_group(
	id VARCHAR(50) UNIQUE NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    number_of_students SMALLINT NOT NULL,
	speciality VARCHAR(100) NOT NULL,
    surname_of_heaman VARCHAR(50) NOT NULL
);
INSERT INTO student_group VALUES
	("8Г", "Э-12", 18, "ЭВМ", "Иванова"),
    ("7Г", "Э-15", 22, "ЭВМ", "Сеткин"),
    ("4Г", "АС-9", 24, "АСОИ", "Балабанов"),
    ("3Г",	"АС-8",	20,	"АСОИ",	"Чижов"),
    ("17Г",	"С-14",	29,	"СД",	"Амросов"),
    ("12Г",	"М-6",	16,	"Международная экономика",	"Трубин"),
    ("10Г",	"Б-4",	21,	"Бухучет",	"Зязюткин");
    
DROP TABLE IF EXISTS timetable;
CREATE TABLE timetable(
	student_group_id VARCHAR(50) NOT NULL,
    subject_id VARCHAR(50) NOT NULL,
    teacher_id VARCHAR(50) NOT NULL,
    audience_number SMALLINT NOT NULL,
    FOREIGN KEY (student_group_id) REFERENCES student_group (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (teacher_id) REFERENCES teacher (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO timetable VALUES
	("8Г",	"12П",	"222Л",	112),
    ("8Г",	"14П",	"221Л",	220),
    ("8Г",	"17П",	"222Л",	112),
    ("7Г",	"14П",	"221Л",	220),
    ("7Г",	"17П",	"222Л",	241),
    ("7Г",	"18П",	"225Л",	210),
    ("4Г",	"12П",	"222Л",	112),
    ("4Г",	"18П",	"225Л",	210),
    ("3Г",	"12П",	"222Л",	112),
    ("3Г",	"17П",	"221Л",	241),
    ("3Г",	"18П",	"225Л",	210),
    ("17Г",	"12П",	"222Л",	112),
    ("17Г",	"22П",	"110Л",	220),
    ("17Г",	"34П",	"430Л",	118),
    ("12Г",	"12П",	"222Л",	112),
    ("12Г",	"22П",	"110Л",	210),
    ("10Г",	"12П",	"222Л",	210),
    ("10Г",	"22П",	"110Л",	210)