USE sql_part_two;

-- 4
SELECT *
FROM deliveries
WHERE quantity BETWEEN 300 AND 750;

-- 7
SELECT supplier_id, detail_id, project_id
FROM deliveries
JOIN detail ON detail.id = detail_id
JOIN supplier ON supplier.id = supplier_id
JOIN project ON project.id = project_id
WHERE supplier.city <> detail.city AND supplier.city <> project.city AND detail.city <> project.city;

-- 11
SELECT project.city AS "project city", supplier.city AS "supplier city"
FROM deliveries
JOIN supplier ON supplier.id = supplier_id
JOIN project ON project.id = project_id;

-- 15
SELECT COUNT(DISTINCT project_id) AS "Count"
FROM deliveries
JOIN project ON project.id = project_id
WHERE supplier_id LIKE "П1";

-- 21
SELECT DISTINCT detail_id
FROM deliveries
JOIN detail ON detail.id = detail_id
JOIN project ON project.id = project_id
WHERE project.city LIKE "Лондон";

-- 22
SElECT DISTINCT project_id
FROM deliveries
JOIN supplier ON supplier.id = supplier_id
JOIN project ON project.id = project_id
WHERE supplier.id LIKE "П1";

-- 25
SELECT id
FROM project
ORDER BY city
LIMIT 1;

-- 29
SELECT project_id
FROM deliveries
WHERE supplier_id LIKE "П1" AND project_id IN (
	SELECT project_id
    FROM deliveries
	GROUP BY project_id
    HAVING COUNT(DISTINCT supplier_id) = 1
);

-- 33
SELECT city
FROM project
UNION
SELECT city
FROM supplier
UNION
SELECT city
FROM detail;

-- 36
SELECT DISTINCT d1.supplier_id AS "ID 1", d2.supplier_id AS "ID 2"
FROM deliveries d1
JOIN deliveries d2
ON (
	SELECT COUNT(DISTINCT t.detail_id) FROM deliveries t WHERE t.supplier_id = d1.supplier_id
	) = (
    SELECT COUNT(DISTINCT t.detail_id) FROM deliveries t WHERE t.supplier_id = d2.supplier_id
    ) 
    AND d1.supplier_id <> d2.supplier_id;