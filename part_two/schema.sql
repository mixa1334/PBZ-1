DROP DATABASE IF EXISTS sql_part_two;
CREATE DATABASE sql_part_two;

USE sql_part_two;

DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier(
	id VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    status SMALLINT NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO supplier VALUES
	("П1",	"Петров",	20,	"Москва"),
    ("П2",	"Синицин",	10,	"Таллинн"),
    ("П3",	"Федоров",	30,	"Таллинн"),
    ("П4",	"Чаянов",	20,	"Минск"),
    ("П5",	"Крюков",	30,	"Киев");
    
DROP TABLE IF EXISTS detail;
CREATE TABLE detail(
	id VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    size SMALLINT NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO detail VALUES
	("Д1",	"Болт",	"Красный",	12,	"Москва"),
    ("Д2",	"Гайка",	"Зеленая",	17,	"Минск"),
    ("Д3",	"Диск",	"Черный",	17,	"Вильнюс"),
    ("Д4",	"Диск",	"Черный",	14,	"Москва"),
    ("Д5",	"Корпус",	"Красный",	12,	"Минск"),
    ("Д6",	"Крышки",	"Красный",	19,	"Москва");
    
DROP TABLE IF EXISTS project;
CREATE TABLE project(
	id VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO project VALUES
	("ПР1",	"ИПР1",	"Минск"),
    ("ПР2",	"ИПР2",	"Таллинн"),
    ("ПР3",	"ИПР3",	"Псков"),
    ("ПР4",	"ИПР4",	"Псков"),
    ("ПР5",	"ИПР4",	"Москва"),
    ("ПР6",	"ИПР6",	"Саратов"),
    ("ПР7",	"ИПР7",	"Москва");
    
DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries(
	supplier_id VARCHAR(50) NOT NULL,
    detail_id VARCHAR(50) NOT NULL,
    project_id VARCHAR(50) NOT NULL,
    quantity SMALLINT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES supplier (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (detail_id) REFERENCES detail (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO deliveries VALUES
	("П1",	"Д1",	"ПР1",	200),
    ("П1",	"Д1",	"ПР2",	700),
    ("П2",	"Д3",	"ПР1",	400),
    ("П2",	"Д2",	"ПР2",	200),
    ("П2",	"Д3",	"ПР3",	200),
    ("П2",	"Д3",	"ПР4",	500),
    ("П2",	"Д3",	"ПР5",	600),
    ("П2",	"Д3",	"ПР6",	400),
    ("П2",	"Д3",	"ПР7",	800),
    ("П2",	"Д5",	"ПР2",	100),
    ("П3",	"Д3",	"ПР1",	200),
    ("П3",	"Д4",	"ПР2",	500),
    ("П4",	"Д6",	"ПР3",	300),
    ("П4",	"Д6",	"ПР7",	300),
    ("П5",	"Д2",	"ПР2",	200),
    ("П5",	"Д2",	"ПР4",	100),
    ("П5",	"Д5",	"ПР5",	500),
    ("П5",	"Д5",	"ПР7",	100),
    ("П5",	"Д6",	"ПР2",	200),
    ("П5",	"Д1",	"ПР2",	100),
    ("П5",	"Д3",	"ПР4",	200),
    ("П5",	"Д4",	"ПР4",	800),
    ("П5",	"Д5",	"ПР4",	400),
    ("П5",	"Д6",	"ПР4",	500);