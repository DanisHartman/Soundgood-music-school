SELECT * FROM lessons_per_month;
SELECT * FROM show_sibling_relations;
SELECT * FROM number_of_lessons_per_instructor;
SELECT * FROM list_all_ensembles;


/* ----------- Sibling ------------- */
    /* -------- VIEW -------*/
CREATE VIEW show_sibling_relations as
 SELECT
(SELECT COUNT(*)
FROM
(
SELECT id   
FROM student A  
WHERE NOT EXISTS (SELECT student_id      
                FROM sibling B
                WHERE A.id = B.student_id)
)AS sibling0
) AS zero_siblings,

(SELECT COUNT(*)
FROM 
(
    SELECT student_id, COUNT(student_id) 
    FROM sibling
    GROUP BY student_id
    HAVING COUNT(student_id) = 1 
) AS sibling1
) AS one_siblings,

(SELECT COUNT(*)
FROM 
(
    SELECT student_id, COUNT(student_id) 
    FROM sibling
    GROUP BY student_id
    HAVING COUNT(student_id) = 2 
) AS sibling2
) AS two_siblings;

    /* -------- VIEW -------*/

SELECT
(SELECT COUNT(*)
FROM
(
SELECT id   
FROM student A  
WHERE NOT EXISTS (SELECT student_id      
                FROM sibling B
                WHERE A.id = B.student_id)
)AS sibling0
) AS zero_siblings,

(SELECT COUNT(*)
FROM 
(
    SELECT student_id, COUNT(student_id) 
    FROM sibling
    GROUP BY student_id
    HAVING COUNT(student_id) = 1 
) AS sibling1
) AS one_siblings,

(SELECT COUNT(*)
FROM 
(
    SELECT student_id, COUNT(student_id) 
    FROM sibling
    GROUP BY student_id
    HAVING COUNT(student_id) = 2 
) AS sibling2
) AS two_siblings;

/* ----------- Sibling ------------- */

/* ----------- lessons per month ------------- */

/*SELECT e as ensembles,  g as group_lessons, COUNT(e)+COUNT(g) as total,  EXTRACT(MONTH FROM t.date) AS month
FROM time_slot t
    LEFT JOIN (SELECT DISTINCT time_slot_id,instructor_id from ensemble) e ON e.time_slot_id = t.id
    JOIN (SELECT DISTINCT time_slot_id, instructor_id from group_lesson) g ON g.time_slot_id = t.id
WHERE e.time_slot_id IS NOT NULL
OR g.time_slot_id IS NOT NULL 

AND t.date BETWEEN '2022-01-01' AND '2023-01-01'
GROUP BY month,e,g
ORDER BY month*/

    /* ----------- VIEW ------------- */

CREATE VIEW lessons_per_month as
SELECT COUNT(group_lesson) as group_lesson, COUNT(ensemble) as ensemble, COUNT(ensemble)+COUNT(group_lesson) as total, to_char(Z.t, 'Month') as month 
FROM ( 
        SELECT group_lesson, NULL as ensemble, null, time_slot,time_slot.date as t
        FROM group_lesson
            JOIN time_slot ON group_lesson.time_slot_id = time_slot.id
            
        UNION ALL

        SELECT NULL, ensemble, null, time_slot,time_slot.date as t
        FROM ensemble
            JOIN time_slot ON ensemble.time_slot_id = time_slot.id
)AS Z 
GROUP BY month
    
    /* ----------- VIEW ------------- */

SELECT COUNT(group_lesson) as group_lesson, COUNT(ensemble) as ensemble, COUNT(ensemble)+COUNT(group_lesson) as total, to_char(Z.t, 'Month') as month 
FROM ( 
        SELECT group_lesson, NULL as ensemble, null, time_slot,time_slot.date as t
        FROM group_lesson
            JOIN time_slot ON group_lesson.time_slot_id = time_slot.id
            
        UNION ALL

        SELECT NULL, ensemble, null, time_slot,time_slot.date as t
        FROM ensemble
            JOIN time_slot ON ensemble.time_slot_id = time_slot.id
)AS Z 
GROUP BY month

/* ----------- lessons per month ------------- */

/* ----------- number of lessons per instructor ------------- */

SELECT COUNT(Z.first_name) as lessons, Z.first_name as instructor, to_char(NOW(), 'Month') as month 
FROM ( 
        SELECT instructor.first_name 
        FROM instructor
            JOIN group_lesson ON group_lesson.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = group_lesson.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
        
        UNION ALL

        SELECT instructor.first_name 
        FROM instructor
            JOIN ensemble ON ensemble.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = ensemble.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
    )AS Z 
     
GROUP BY Z.first_name, month
HAVING COUNT(Z.first_name) > 0
ORDER BY Z.first_name
    
    /* ------------- VIEW ------------*/

CREATE VIEW number_of_lessons_per_instructor as 
SELECT COUNT(Z.first_name) as lessons, Z.first_name as instructor, to_char(NOW(), 'Month') as month 
FROM ( 
        SELECT instructor.first_name 
        FROM instructor
            JOIN group_lesson ON group_lesson.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = group_lesson.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
        
        UNION ALL

        SELECT instructor.first_name 
        FROM instructor
            JOIN ensemble ON ensemble.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = ensemble.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
    )AS Z 
     
GROUP BY Z.first_name, month
HAVING COUNT(Z.first_name) > 0
ORDER BY Z.first_name
    /* ------------- VIEW ------------*/

/* ----------- number of lessons per instructor ------------- */

/* ----------- list all ensembles ------------- */

SELECT es.genre, to_char(time_slot.date, 'Day') as day, 
CASE 
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) = 0 THEN 'Fully booked' 
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) > 0 THEN '1-2 spots left'
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) > 2 THEN 'More than 2 spots left'
END AS spotsLeft
FROM ensemble
JOIN student_ensemble s ON s.ensemble_id = ensemble.id 
JOIN ensemble_genre es ON ensemble.ensemble_genre_id = es.id
JOIN time_slot ON ensemble.time_slot_id = time_slot.id
WHERE time_slot.date BETWEEN  NOW() AND  NOW()+ interval '1 week'
GROUP BY s.ensemble_id, ensemble.id, es.genre, day
ORDER BY day, es.genre

CREATE VIEW list_all_ensembles as
SELECT es.genre, to_char(time_slot.date, 'Day') as day, 
CASE 
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) = 0 THEN 'Fully booked' 
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) > 0 THEN '1-2 spots left'
    WHEN (ensemble.max_students - COUNT(s.ensemble_id)) > 2 THEN 'More than 2 spots left'
END AS spotsLeft
FROM ensemble
JOIN student_ensemble s ON s.ensemble_id = ensemble.id 
JOIN ensemble_genre es ON ensemble.ensemble_genre_id = es.id
JOIN time_slot ON ensemble.time_slot_id = time_slot.id
WHERE time_slot.date BETWEEN  NOW() AND  NOW()+ interval '1 week'
GROUP BY s.ensemble_id, ensemble.id, es.genre, day
ORDER BY day, es.genre