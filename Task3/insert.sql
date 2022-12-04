INSERT INTO ensemble_genre (genre)
VALUES
    ('Rock'),
    ('Metal'),
    ('Pop'),
    ('Alternative'),
    ('Synth-Pop');

INSERT INTO instrument_brand (brand)
VALUES
    ('Ibanez'),
    ('Fender'),
    ('Yamaha'),
    ('Pearl'),
    ('Vic Firth'),
    ('Schecter'),
    ('Ernie Ball'),
    ('Korg'),
    ('Roland');

INSERT INTO instrument_type (type)
VALUES
    ('Electric Guitar'),
    ('Acoustic Guitar'),
    ('Synth'),
    ('Drums'),
    ('Bass');
    
INSERT INTO student_instrument (instrument) 
VALUES
    ('Electric Guitar'),
    ('Acoustic Guitar'),
    ('Synth'),
    ('Drums'),
    ('Bass');  

INSERT INTO student_skill_level (skill_level) 
VALUES
    ('Beginner'),
    ('Intermediate'),
    ('Advanced');

INSERT INTO instructor_can_teach_instrument (instrument) 
VALUES
    ('Electric Guitar'),
    ('Acoustic Guitar'),
    ('Synth'),
    ('Drums'),
    ('Bass');  

INSERT INTO individual_lesson_instrument (instrument) 
VALUES
    ('Electric Guitar'),
    ('Acoustic Guitar'),
    ('Synth'),
    ('Drums'),
    ('Bass');  

INSERT INTO group_lesson_instrument (instrument) 
VALUES
    ('Electric Guitar'),
    ('Acoustic Guitar'),
    ('Synth'),
    ('Drums'),
    ('Bass');  

INSERT INTO group_lesson_level (level) 
VALUES
    ('Beginner'),
    ('Intermediate'),
    ('Advanced');

INSERT INTO individual_lesson_level (level) 
VALUES
    ('Beginner'),
    ('Intermediate'),
    ('Advanced');

INSERT INTO instrument_in_stock (price, instrument_type_id, instrument_brand_id)
VALUES
    (300, 
    (SELECT instrument_type_id FROM instrument_type WHERE type = 'Acoustic Guitar'),
    (SELECT instrument_brand_id FROM instrument_brand WHERE brand = 'Ibanez')),
    (200, 
    (SELECT instrument_type_id FROM instrument_type WHERE type = 'Electric Guitar'),
    (SELECT instrument_brand_id FROM instrument_brand WHERE brand = 'Ernie Ball')),
    (200, 
    (SELECT instrument_type_id FROM instrument_type WHERE type = 'Bass'),
    (SELECT instrument_brand_id FROM instrument_brand WHERE brand = 'Schecter')),
    (100, 
    (SELECT instrument_type_id FROM instrument_type WHERE type = 'Synth'),
    (SELECT instrument_brand_id FROM instrument_brand WHERE brand = 'Korg')),
    (400, 
    (SELECT instrument_type_id FROM instrument_type WHERE type = 'Drums'),
    (SELECT instrument_brand_id FROM instrument_brand WHERE brand = 'Pearl'));



INSERT INTO instructor (first_name, last_name, personal_number, can_teach_ensemble, street, city, zip)
VALUES
    ('Beau','Mercado','004273523445','1','Skövde','84877','P.O. Box 601, 7646 Orci Ave'),
    ('Malcolm','Ramsey','335207516931','0','Lerum','26430','Ap #189-6479 Vivamus Ave'),
    ('Porter','Wilkinson','587756275486','0','Stockholm','36954','8090 Tincidunt Rd.'),
    ('Xanthus','Weber','458073255375','0','Bollnäs','68228','557-3774 Facilisis. Rd.'),
    ('Zane','Pope','190927474741','0','Jönköping','78532','P.O. Box 351, 2680 Pede St.'),
    ('Dennis','Dean','273349306852','0','Ludvika','11906','Ap #764-4834 Ac Ave'),
    ('Damon','Padilla','462437417811','1','Vänersborg','88617','Ap #427-6534 Malesuada Ave'),
    ('Zeus','Todd','602532887176','0','Borås','62764','491-5311 Et Ave');
    

INSERT INTO student (first_name, last_name, personal_number, street, city, zip)
VALUES
    ('Barry','Hood','584584431088','Skövde','47203','Ap #740-5295 Nonummy Street'),
    ('Evan','Blankenship','615916466552','Jönköping','49107','Ap #757-3322 Nunc Avenue'),
    ('Hakeem','Chapman','606395340346','Avesta','17162','P.O. Box 861, 3651 Lobortis St.'),
    ('Aaron','Mcfarland','174570436426','Tumba','21364','822-9635 Magnis St.'),
    ('Mark','Wright','553868721860','Mjölby','11281','7544 Cras St.'),
    ('Mannix','Cross','103217089772','Ockelbo','11316','Ap #395-4374 Massa St.'),
    ('Cruz','Wilcox','267624744071','Finspång','91588','421-1257 Elit. Ave'),
    ('Murphy','Perez','418334876377','Gävle','70972','Ap #913-947 Vel Street'),
    ('Gage','Shelton','054195903239','Gävle','76111','6100 Tellus Av.'),
    ('Finn','Butler','387821348658','Nässjö','93458','965-7743 Vulputate St.');

INSERT INTO contact_person (first_name, last_name, student_id)
VALUES
    ('Mannix','Cross', 
    (SELECT id FROM student WHERE first_name = 'Barry')),
    ('Cruz','Wilcox', 
    (SELECT id FROM student WHERE first_name = 'Evan')),
    ('Murphy','Perez', 
    (SELECT id FROM student WHERE first_name = 'Hakeem')),
    ('Gage','Shelton', 
    (SELECT id FROM student WHERE first_name = 'Aaron')),
    ('Finn','Butler', 
    (SELECT id FROM student WHERE first_name = 'Mark')),
    ('Porter','Webb', 
    (SELECT id FROM student WHERE first_name = 'Mannix')),
    ('Lucian','Mcguire', 
    (SELECT id FROM student WHERE first_name = 'Cruz')),
    ('Fitzgerald','Munoz', 
    (SELECT id FROM student WHERE first_name = 'Murphy')),
    ('Todd','Shields', 
    (SELECT id FROM student WHERE first_name = 'Gage')),
    ('Hedley','Frederick', 
    (SELECT id FROM student WHERE first_name = 'Finn'));
 /*-------------------------------------------------------------------------------*/

INSERT INTO contact_person_email_email (email)
VALUES
    ('Shields@protonmail.edu'),
    ('Shields2@aol.couk'),
    ('Butler@outlook.edu'),
    ('Chapman@aol.ca'),
    ('Munoz@aol.ca'),
    ('Cross@outlook.ca'),
    ('Wilcox@icloud.org'),
    ('Wilcox@gmail.com'),
    ('Perez@outlook.edu'),
    ('Webb@outlook.edu'),
    ('Mcguire@outlook.edu'),
    ('Frederick@outlook.edu'),
    ('Shelton@outlook.edu');

INSERT INTO contact_person_email ( contact_person_email_email_id, contact_person_id)
VALUES
    ((SELECT id FROM contact_person_email_email where email = 'Shields@protonmail.edu'), 
    (SELECT id FROM contact_person where last_name = 'Shields')),
    ((SELECT id FROM contact_person_email_email where email = 'Shields2@aol.couk'), 
    (SELECT id FROM contact_person where last_name = 'Shields')),
    ((SELECT id FROM contact_person_email_email where email = 'Butler@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Butler')),
    ((SELECT id FROM contact_person_email_email where email = 'Munoz@aol.ca'), 
    (SELECT id FROM contact_person where last_name = 'Munoz')),
    ((SELECT id FROM contact_person_email_email where email = 'Cross@outlook.ca'), 
    (SELECT id FROM contact_person where last_name = 'Cross')),
    ((SELECT id FROM contact_person_email_email where email = 'Perez@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Perez')),
    ((SELECT id FROM contact_person_email_email where email = 'Frederick@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Frederick')),
    ((SELECT id FROM contact_person_email_email where email = 'Mcguire@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Mcguire')),
    ((SELECT id FROM contact_person_email_email where email = 'Webb@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Webb')),
    ((SELECT id FROM contact_person_email_email where email = 'Shelton@outlook.edu'), 
    (SELECT id FROM contact_person where last_name = 'Shelton')),
    ((SELECT id FROM contact_person_email_email where email = 'Wilcox@gmail.com'), 
    (SELECT id FROM contact_person where last_name = 'Wilcox'));
 
 
 /*-------------------------------------------------------------------------------*/

INSERT INTO contact_person_phone_phone (phone)
VALUES
    ('+4679398488886'),
    ('+4671412508817'),
    ('+4675793910828'),
    ('+4672019015975'),
    ('+4675000561387'),
    ('+4675965310485'),
    ('+4673645859973'),
    ('+4675141643187'),
    ('+4674766723511'),
    ('+4671411203829'),
    ('+4671377884015'),
    ('+4677874054846');

    
INSERT INTO contact_person_phone (contact_person_phone_phone_id, contact_person_id)
VALUES
    ((SELECT id FROM contact_person_phone_phone where phone = '+4679398488886'), 
    (SELECT id FROM contact_person where last_name = 'Shields')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4671412508817'), 
    (SELECT id FROM contact_person where last_name = 'Shields')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4675793910828'), 
    (SELECT id FROM contact_person where last_name = 'Butler')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4672019015975'), 
    (SELECT id FROM contact_person where last_name = 'Munoz')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4675000561387'), 
    (SELECT id FROM contact_person where last_name = 'Cross')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4675965310485'), 
    (SELECT id FROM contact_person where last_name = 'Perez')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4673645859973'), 
    (SELECT id FROM contact_person where last_name = 'Frederick')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4675141643187'), 
    (SELECT id FROM contact_person where last_name = 'Mcguire')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4674766723511'), 
    (SELECT id FROM contact_person where last_name = 'Webb')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4671411203829'), 
    (SELECT id FROM contact_person where last_name = 'Shelton')),
    ((SELECT id FROM contact_person_phone_phone where phone = '+4671377884015'), 
    (SELECT id FROM contact_person where last_name = 'Wilcox'));

 /*-------------------------------------------------------------------------------*/

INSERT INTO instructor_email_email (email)
VALUES
    ('Mercado@protonmail.edu'),
    ('Ramsey@aol.couk'),
    ('Wilkinson@outlook.edu'),
    ('Weber@aol.ca'),
    ('Pope@aol.ca'),
    ('Dean@outlook.ca'),
    ('Padilla@icloud.org'),
    ('Todd@gmail.com');
   
    
INSERT INTO instructor_email ( instructor_email_email_id, instructor_id)
VALUES
    ((SELECT id FROM instructor_email_email where email = 'Mercado@protonmail.edu'), 
    (SELECT id FROM  instructor where last_name = 'Mercado')),
    ((SELECT id FROM instructor_email_email where email = 'Ramsey@aol.couk'), 
    (SELECT id FROM  instructor where last_name = 'Ramsey')),
    ((SELECT id FROM instructor_email_email where email = 'Wilkinson@outlook.edu'), 
    (SELECT id FROM  instructor where last_name = 'Wilkinson')),
    ((SELECT id FROM instructor_email_email where email = 'Weber@aol.ca'), 
    (SELECT id FROM  instructor where last_name = 'Weber')),
    ((SELECT id FROM instructor_email_email where email = 'Pope@aol.ca'), 
    (SELECT id FROM  instructor where last_name = 'Pope')),
    ((SELECT id FROM instructor_email_email where email = 'Dean@outlook.ca'), 
    (SELECT id FROM  instructor where last_name = 'Dean')),
    ((SELECT id FROM instructor_email_email where email = 'Padilla@icloud.org'), 
    (SELECT id FROM  instructor where last_name = 'Padilla')),
    ((SELECT id FROM instructor_email_email where email = 'Todd@gmail.com'), 
    (SELECT id FROM  instructor where last_name = 'Todd'));
 
 /*-------------------------------------------------------------------------------*/

INSERT INTO instructor_phone_phone (phone_number)
VALUES
    ('+4672384550513'),
    ('+4675420661822'),
    ('+4675368498267'),
    ('+4671797663644'),
    ('+4676248314351'),
    ('+4671275156284'),
    ('+4674681112104'),
    ('+4676054412414');

   
    
INSERT INTO instructor_phone ( instructor_phone_phone_id, instructor_id)
VALUES
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4672384550513'), 
    (SELECT id FROM  instructor where last_name = 'Mercado')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4675420661822'), 
    (SELECT id FROM  instructor where last_name = 'Ramsey')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4675368498267'), 
    (SELECT id FROM  instructor where last_name = 'Wilkinson')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4671797663644'), 
    (SELECT id FROM  instructor where last_name = 'Weber')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4676248314351'), 
    (SELECT id FROM  instructor where last_name = 'Pope')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4671275156284'), 
    (SELECT id FROM  instructor where last_name = 'Dean')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4674681112104'), 
    (SELECT id FROM  instructor where last_name = 'Padilla')),
    ((SELECT id FROM instructor_phone_phone where phone_number = '+4676054412414'), 
    (SELECT id FROM  instructor where last_name = 'Todd'));

     /*-------------------------------------------------------------------------------*/

INSERT INTO student_phone_phone (phone_number)
VALUES
    ('+4672383550517'),
    ('+4675433661821'),
    ('+4675363498260'),
    ('+4671697663642'),
    ('+4676348314358'),
    ('+4671275666285'),
    ('+4674681312102'),
    ('+4674683312102'),
    ('+4674681312122'),
    ('+4673544312418');

   
INSERT INTO student_phone (student_phone_id, student_id)
VALUES
    ((SELECT id FROM student_phone_phone where phone_number = '+4672383550517'), 
    (SELECT id FROM  student where last_name = 'Hood')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4675433661821'), 
    (SELECT id FROM  student where last_name = 'Blankenship')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4671697663642'), 
    (SELECT id FROM  student where last_name = 'Chapman')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4675363498260'), 
    (SELECT id FROM  student where last_name = 'Mcfarland')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4676348314358'), 
    (SELECT id FROM  student where last_name = 'Wright')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4671275666285'), 
    (SELECT id FROM  student where last_name = 'Cross')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4674681312102'), 
    (SELECT id FROM  student where last_name = 'Wilcox')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4674683312102'), 
    (SELECT id FROM  student where last_name = 'Shelton')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4674681312122'), 
    (SELECT id FROM  student where last_name = 'Butler')),
    ((SELECT id FROM student_phone_phone where phone_number = '+4673544312418'), 
    (SELECT id FROM  student where last_name = 'Perez'));

 /*-------------------------------------------------------------------------------*/

INSERT INTO student_email_email (email)
VALUES
    ('Hood@protonmail.edu'),
    ('Blankenship@aol.couk'),
    ('Chapman@outlook.edu'),
    ('Mcfarland@aol.ca'),
    ('Wright@aol.ca'),
    ('Cross@outlook.ca'),
    ('Wilcox@icloud.org'),
    ('Butler@icloud.org'),
    ('Perez@icloud.org'),
    ('Shelton@gmail.com');
   
    
INSERT INTO student_email (student_email_id, student_id)
VALUES
    ((SELECT id FROM student_email_email where email = 'Hood@protonmail.edu'), 
    (SELECT id FROM  student where last_name = 'Hood')),
    ((SELECT id FROM student_email_email where email = 'Blankenship@aol.couk'), 
    (SELECT id FROM  student where last_name = 'Blankenship')),
    ((SELECT id FROM student_email_email where email = 'Chapman@outlook.edu'), 
    (SELECT id FROM  student where last_name = 'Chapman')),
    ((SELECT id FROM student_email_email where email = 'Mcfarland@aol.ca'), 
    (SELECT id FROM  student where last_name = 'Mcfarland')),
    ((SELECT id FROM student_email_email where email = 'Wright@aol.ca'), 
    (SELECT id FROM  student where last_name = 'Wright')),
    ((SELECT id FROM student_email_email where email = 'Cross@outlook.ca'), 
    (SELECT id FROM  student where last_name = 'Cross')),
    ((SELECT id FROM student_email_email where email = 'Wilcox@icloud.org'), 
    (SELECT id FROM  student where last_name = 'Wilcox')),
    ((SELECT id FROM student_email_email where email = 'Shelton@gmail.com'), 
    (SELECT id FROM  student where last_name = 'Shelton')),
    ((SELECT id FROM student_email_email where email = 'Butler@icloud.org'), 
    (SELECT id FROM  student where last_name = 'Butler')),
    ((SELECT id FROM student_email_email where email = 'Perez@icloud.org'), 
    (SELECT id FROM  student where last_name = 'Perez'));

INSERT INTO student_instrument_rental (student_id, return_date, start_date, instrument_id)
VALUES
    (1, '2023-11-27', '2022-11-27', 2),
    (3, '2023-11-27', '2022-11-27', 3),
    (2, '2023-11-27', '2022-11-27', 1),
    (2, '2023-11-27', '2022-11-27', 4);


insert into time_slot (date, time_from, time_to)
VALUES
    ('2022-12-22','08:00:00','10:00:00'),
    ('2022-12-05','10:00:00','12:00:00'),
    ('2022-12-08','13:00:00','15:00:00'),
    ('2022-12-07','10:00:00','11:00:00'),
    ('2022-03-01','10:00:00','12:00:00'),
    ('2022-01-26','13:00:00','15:00:00'),
    ('2022-07-29','10:00:00','13:00:00'),
    ('2022-05-30','09:00:00','10:00:00'),
    ('2022-12-12','13:00:00','15:00:00'),
    ('2022-12-16','11:00:00','15:00:00'),
    ('2022-12-09','12:00:00','15:00:00'),
    ('2022-02-23','14:00:00','15:00:00'),
    ('2022-03-14','11:00:00','15:00:00'),
    ('2022-02-13','15:00:00','16:00:00'),
    ('2022-12-04','12:00:00','15:00:00'),
    ('2022-11-05','16:00:00','17:00:00'),
    ('2022-04-10','08:00:00','10:00:00'),
    ('2022-07-31','14:00:00','15:00:00'),
    ('2022-01-11','12:00:00','15:00:00'),
    ('2022-10-05','09:00:00','10:00:00'),
    ('2022-07-18','11:00:00','13:00:00'),
    ('2022-10-15','16:00:00','17:00:00'),
    ('2022-11-08','14:00:00','15:00:00'),
    ('2022-07-07','11:00:00','12:00:00'),
    ('2022-08-04','16:00:00','18:00:00'),
    ('2022-02-19','12:00:00','15:00:00'),
    ('2022-11-08','13:00:00','15:00:00');


INSERT INTO ensemble_pricing(price, skill_level, discount)
VALUES
    (200, 'Ensemble', 0);

INSERT INTO ensemble (max_students, min_students, instructor_id, ensemble_genre_id, ensemble_pricing_id, time_slot_id)
VALUES
    (
        4,
        3, 
        (SELECT id FROM instructor WHERE first_name = 'Beau'), 
        (SELECT id FROM ensemble_genre WHERE genre = 'Metal'),
        (SELECT id FROM ensemble_pricing WHERE skill_level = 'Ensemble' ), 
        (SELECT id FROM time_slot WHERE time_slot.id = 2) 
    ),
    (
        5,
        3, 
        (SELECT id FROM instructor WHERE first_name = 'Porter'), 
        (SELECT id FROM ensemble_genre WHERE genre = 'Rock'),
        (SELECT id FROM ensemble_pricing WHERE skill_level = 'Ensemble' ), 
        (SELECT id FROM time_slot WHERE  time_slot.id = 6) 
    ),

    (8,4,5,1,1,3),
    (4,2,4,1,1,2),
    (6,3,3,4,1,10),
    (8,4,5,3,1,12),
    (6,3,1,2,1,13);

INSERT INTO student_ensemble (student_id, ensemble_id)
VALUES
    ((SELECT id FROM student WHERE first_name = 'Barry'), 1),
    ((SELECT id FROM student WHERE first_name = 'Aaron'), 1),
    ((SELECT id FROM student WHERE first_name = 'Mark'), 1),
    ((SELECT id FROM student WHERE first_name = 'Cruz'), 1),

     ((SELECT id FROM student WHERE first_name = 'Barry'), 2),
    ((SELECT id FROM student WHERE first_name = 'Aaron'), 2),
    ((SELECT id FROM student WHERE first_name = 'Mark'), 2),
    ((SELECT id FROM student WHERE first_name = 'Cruz'), 2),

    (1,3),
    (4,3),
    (3,3),
    (5,3),
    (7,3),

    (1,4),
    (8,4),
    (9,4),
    (7,4),

    (5,5),
    (3,5),
    (4,5),

    (3,6),
    (2,6),
    (1,6),

    (4,7),
    (8,7),
    (9,7),
    (7,7);


INSERT INTO individual_lesson_pricing (level, discount, price)
VALUES
    ('Beginner', 10, 200),
    ('Intermediate', 10, 300),
    ('Advanced', 10, 400);

INSERT INTO group_lesson_pricing (level, discount, price)
VALUES
    ('Beginner', 10, 200),
    ('Intermediate', 10, 300),
    ('Advanced', 10, 400);


INSERT INTO individual_lesson (instructor_id, student_id, individual_lesson_pricing_id, individual_lesson_level_id, individual_lesson_instrument_id,time_slot_id)
VALUES
    (
        (SELECT id FROM instructor WHERE first_name = 'Xanthus'),
        (SELECT id FROM student WHERE first_name = 'Aaron'),
        (SELECT id FROM individual_lesson_pricing WHERE level = 'Beginner'),
        (SELECT id FROM individual_lesson_level WHERE level = 'Beginner'),
        (SELECT id FROM individual_lesson_instrument WHERE instrument = 'Electric Guitar'),
        13
    ),
    (1,3,2,2,2,10),
    (2,2,2,2,1,10),
    (1,3,2,2,2,13),
    (2,2,2,2,1,13),
    (1,7,1,1,4,2),
    (2,6,3,3,4,6);


INSERT INTO group_lesson (max_students, min_students, instructor_id, group_lesson_pricing_id, group_lesson_level_id, group_lesson_instrument_id,time_slot_id)
VALUES
    (
        2,
        7,
        (SELECT id FROM instructor WHERE first_name = 'Beau'),
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_instrument WHERE instrument = 'Synth'),
        4
    ),

    (
        3,
        5,
        (SELECT id FROM instructor WHERE first_name = 'Porter'),
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_instrument WHERE instrument = 'Synth'),
        5
    ),

     (
        2,
        5,
        4,
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_instrument WHERE instrument = 'Synth'),
        6
    ),

    (
        2,
        6,
        2,
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_instrument WHERE instrument = 'Synth'),
        7
    ),

     (
        2,
        4,
        6,
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        2,
        8
    ),

    (
        2,
        6,
        7,
        (SELECT id FROM group_lesson_pricing WHERE level = 'Intermediate'),
        (SELECT id FROM group_lesson_level WHERE level = 'Intermediate'),
        3,
        10
    );

INSERT INTO student_group_lesson(group_lesson_id, student_id)
VALUES
        (1, (SELECT id FROM student WHERE first_name = 'Barry')),
        (1, (SELECT id FROM student WHERE first_name = 'Aaron')),
        (1, (SELECT id FROM student WHERE first_name = 'Mark')),
        (1, (SELECT id FROM student WHERE first_name = 'Cruz')),

        (2, 3),
        (2, 4),
        (2, 5),

        (3, 1),
        (3, 4),
        (3, 3),
        (3, 5),
        (3, 7),

        (4, 10),
        (4, 8),
        (4, 9),
        (4, 7),

        (5, 5),
        (5, 3),
        (5, 4),
        
        (6, 3),
        (6, 2),
        (6, 10);

INSERT INTO sibling(student_id, sibling_id)
VALUES
    (1,2),
    (1,5),
    (1,6),
    (2,1),
    (2,5),
    (2,6),
    (3,4),
    (3,10),
    (4,3),
    (4,10),
    (5,1),
    (5,2),
    (5,6),
    (6,1),
    (6,2),
    (6,5),
    (10,3),
    (10,4);
    




CREATE VIEW lessons_per_month as
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
GROUP BY month;

/* --- */

CREATE VIEW show_sibling_relations as
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
ORDER BY siblings;

/* --- */

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
ORDER BY day, es.genre;

/* --- */

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

        UNION ALL
       
        SELECT instructor.first_name 
        FROM instructor
            JOIN individual_lesson ON individual_lesson.instructor_id = instructor.id
            JOIN time_slot ON time_slot.id = individual_lesson.time_slot_id
            WHERE EXTRACT(MONTH FROM time_slot.date) = EXTRACT(MONTH FROM NOW())
    )AS Z 
     
GROUP BY Z.first_name, month
HAVING COUNT(Z.first_name) > 0
ORDER BY Z.first_name;