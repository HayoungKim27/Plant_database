SELECT * FROM Plants.general_edible;


USE Plants;

SELECT COUNT(*) AS hardiness_entries FROM hardiness_belgium;
SELECT COUNT(*) AS general_entries FROM general_edible;
SELECT COUNT(*) AS detail_entries FROM detailed_edible; 


SELECT * FROM hardiness_belgium LIMIT 10;

SELECT * FROM general_edible LIMIT 10;

SELECT * FROM detailed_edible LIMIT 10;

