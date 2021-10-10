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