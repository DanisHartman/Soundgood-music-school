SELECT * FROM lessons_per_month;
SELECT * FROM show_sibling_relations;
SELECT * FROM number_of_lessons_per_instructor;
SELECT * FROM list_all_ensembles;

/* ----------- Sibling ------------- */

SELECT  students, COUNT( students)-1 as siblings FROM (
    SELECT student_id ,COUNT( sibling_id)+1 as students 
    FROM sibling
    GROUP BY student_id
    

) AS sub
GROUP BY students
UNION 
    SELECT (
        SELECT COUNT(id) as no_sibling FROM student
            FULL OUTER JOIN sibling 
                ON student.id = sibling.student_id
        WHERE student.id IS NULL or sibling.student_id IS NULL), 0
        FROM sibling
ORDER BY siblings

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


SELECT COUNT(group_lesson) as group_lesson, COUNT(ensemble) as ensemble, COUNT(individual_lesson) as individual_lesson, COUNT(ensemble)+COUNT(group_lesson)+COUNT(individual_lesson) as total, to_char(Z.t, 'Month') as month 
FROM ( 
        SELECT group_lesson, NULL as ensemble, NULL as individual_lesson, null, time_slot,time_slot.date as t
        FROM group_lesson
            JOIN time_slot ON group_lesson.time_slot_id = time_slot.id
       
        UNION ALL
       
        SELECT NULL, ensemble, NULL, NULL, time_slot,time_slot.date as t
        FROM ensemble
            JOIN time_slot ON ensemble.time_slot_id = time_slot.id
        
        UNION ALL
       
        SELECT NULL, NULL,CAST(individual_lesson as text), null , time_slot,time_slot.date as t
        FROM individual_lesson
            JOIN time_slot ON individual_lesson.time_slot_id = time_slot.id
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

        UNION ALL
       
        SELECT instructor.first_name 
        FROM instructor
            JOIN individual_lesson ON individual_lesson.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = individual_lesson.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
    )AS Z 
     
GROUP BY Z.first_name, month
HAVING COUNT(Z.first_name) > 0
ORDER BY Z.first_name
    


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
