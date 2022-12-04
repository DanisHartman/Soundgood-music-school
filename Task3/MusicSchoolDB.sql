CREATE TABLE contact_person_email_email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email  VARCHAR(500)UNIQUE NOT NULL
);

ALTER TABLE contact_person_email_email ADD CONSTRAINT PK_contact_person_email_email PRIMARY KEY (id);


CREATE TABLE contact_person_phone_phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone VARCHAR(500) NOT NULL
);

ALTER TABLE contact_person_phone_phone ADD CONSTRAINT PK_contact_person_phone_phone PRIMARY KEY (id);


CREATE TABLE ensemble_pricing (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price INT NOT NULL,
 skill_level VARCHAR(500) NOT NULL,
 discount INT NOT NULL
);

ALTER TABLE ensemble_pricing ADD CONSTRAINT PK_ensemble_pricing PRIMARY KEY (id);


CREATE TABLE ensemble_genre (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre  VARCHAR(500)UNIQUE NOT NULL
);

ALTER TABLE ensemble_genre ADD CONSTRAINT PK_ensemble_genre PRIMARY KEY (id);


CREATE TABLE group_lesson_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE group_lesson_instrument ADD CONSTRAINT PK_group_lesson_instrument PRIMARY KEY (id);


CREATE TABLE group_lesson_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 level  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE group_lesson_level ADD CONSTRAINT PK_group_lesson_level PRIMARY KEY (id);


CREATE TABLE individual_lesson_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE individual_lesson_instrument ADD CONSTRAINT PK_individual_lesson_instrument PRIMARY KEY (id);


CREATE TABLE individual_lesson_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 level  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE individual_lesson_level ADD CONSTRAINT PK_individual_lesson_level PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 personal_number  VARCHAR(12) UNIQUE NOT NULL,
 can_teach_ensemble BIT(1) NOT NULL,
 street VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 zip VARCHAR(500) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_can_teach_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument  VARCHAR(500) UNIQUE
);

ALTER TABLE instructor_can_teach_instrument ADD CONSTRAINT PK_instructor_can_teach_instrument PRIMARY KEY (id);


CREATE TABLE instructor_email_email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email  VARCHAR(500) UNIQUE
);

ALTER TABLE instructor_email_email ADD CONSTRAINT PK_instructor_email_email PRIMARY KEY (id);


CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 instructor_can_teach_instrument_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instructor_can_teach_instrument_id);


CREATE TABLE instructor_phone_phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(500) NOT NULL
);

ALTER TABLE instructor_phone_phone ADD CONSTRAINT PK_instructor_phone_phone PRIMARY KEY (id);


CREATE TABLE student_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE student_instrument ADD CONSTRAINT PK_student_instrument PRIMARY KEY (id);


CREATE TABLE instrument_brand (
 instrument_brand_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 brand  VARCHAR(500) Unique NOT NULL
);

ALTER TABLE instrument_brand ADD CONSTRAINT PK_instrument_brand PRIMARY KEY (instrument_brand_id);


CREATE TABLE instrument_type (
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type  VARCHAR(500) Unique  NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);








CREATE TABLE student_skill_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE student_skill_level ADD CONSTRAINT PK_student_skill_level PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 personal_number  VARCHAR(12) UNIQUE NOT NULL,
 street VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 zip VARCHAR(500) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_email_email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email  VARCHAR(500) UNIQUE NOT NULL
);

ALTER TABLE student_email_email ADD CONSTRAINT PK_student_email_email PRIMARY KEY (id);


CREATE TABLE student_phone_phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(500) NOT NULL
);

ALTER TABLE student_phone_phone ADD CONSTRAINT PK_student_phone_phone PRIMARY KEY (id);


CREATE TABLE time_slot (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 date DATE NOT NULL,
 time_from TIME(6) NOT NULL,
 time_to TIME(6) NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (id);


CREATE TABLE contact_person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE contact_person_email (
 contact_person_email_email_id INT NOT NULL,
 contact_person_id INT NOT NULL
);

ALTER TABLE contact_person_email ADD CONSTRAINT PK_contact_person_email PRIMARY KEY (contact_person_email_email_id,contact_person_id);


CREATE TABLE contact_person_phone (
 contact_person_phone_phone_id INT NOT NULL,
 contact_person_id INT NOT NULL
);

ALTER TABLE contact_person_phone ADD CONSTRAINT PK_contact_person_phone PRIMARY KEY (contact_person_phone_phone_id,contact_person_id);


CREATE TABLE ensemble (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 max_students INT NOT NULL,
 min_students INT NOT NULL,
 instructor_id INT NOT NULL,
 ensemble_genre_id INT NOT NULL,
 ensemble_pricing_id INT NOT NULL,
 time_slot_id INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE group_lesson_pricing (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price INT NOT NULL,
 discount INT,
 level VARCHAR(500) NOT NULL
);

ALTER TABLE group_lesson_pricing ADD CONSTRAINT PK_group_lesson_pricing PRIMARY KEY (id);


CREATE TABLE individual_lesson_pricing (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 level VARCHAR(500) NOT NULL,
 discount INT,
 price INT NOT NULL
);

ALTER TABLE individual_lesson_pricing ADD CONSTRAINT PK_individual_lesson_pricing PRIMARY KEY (id);


CREATE TABLE instructor_email (
 instructor_id INT NOT NULL,
 instructor_email_email_id INT NOT NULL
);

ALTER TABLE instructor_email ADD CONSTRAINT PK_instructor_email PRIMARY KEY (instructor_id,instructor_email_email_id);


CREATE TABLE instructor_phone (
 instructor_id INT NOT NULL,
 instructor_phone_phone_id INT NOT NULL
);

ALTER TABLE instructor_phone ADD CONSTRAINT PK_instructor_phone PRIMARY KEY (instructor_id,instructor_phone_phone_id);


CREATE TABLE instrument_in_stock (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price INT NOT NULL,
 instrument_type_id INT NOT NULL,
 instrument_brand_id INT NOT NULL
);

ALTER TABLE instrument_in_stock ADD CONSTRAINT PK_instrument_in_stock PRIMARY KEY (instrument_id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE skill_level_with_instrument (
 student_id INT NOT NULL,
 student_skill_level_id INT NOT NULL,
 student_instrument_id INT NOT NULL
);

ALTER TABLE skill_level_with_instrument ADD CONSTRAINT PK_skill_level_with_instrument PRIMARY KEY (student_id,student_skill_level_id,student_instrument_id);


CREATE TABLE student_email (
 student_id INT NOT NULL,
 student_email_id INT NOT NULL
);

ALTER TABLE student_email ADD CONSTRAINT PK_student_email PRIMARY KEY (student_id,student_email_id);


CREATE TABLE student_ensemble (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE student_instrument_rental (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 return_date DATE NOT NULL,
 start_date DATE NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT Unique NOT NULL
);


ALTER TABLE student_instrument_rental ADD CONSTRAINT PK_student_instrument_rental PRIMARY KEY (id);



CREATE TABLE student_phone (
 student_id INT NOT NULL,
 student_phone_id INT NOT NULL
);

ALTER TABLE student_phone ADD CONSTRAINT PK_student_phone PRIMARY KEY (student_id,student_phone_id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 max_students INT,
 min_students INT,
 instructor_id INT NOT NULL,
 group_lesson_pricing_id INT NOT NULL,
 group_lesson_level_id INT NOT NULL,
 group_lesson_instrument_id INT NOT NULL,
 time_slot_id INT
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 individual_lesson_pricing_id INT NOT NULL,
 individual_lesson_level_id INT NOT NULL,
 individual_lesson_instrument_id INT NOT NULL,
 time_slot_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE student_group_lesson (
 group_lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (group_lesson_id,student_id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instructor_can_teach_instrument_id) REFERENCES instructor_can_teach_instrument (id) ON DELETE CASCADE;


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;


ALTER TABLE contact_person_email ADD CONSTRAINT FK_contact_person_email_0 FOREIGN KEY (contact_person_email_email_id) REFERENCES contact_person_email_email (id) ON DELETE NO ACTION;
ALTER TABLE contact_person_email ADD CONSTRAINT FK_contact_person_email_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id) ON DELETE NO ACTION;


ALTER TABLE contact_person_phone ADD CONSTRAINT FK_contact_person_phone_0 FOREIGN KEY (contact_person_phone_phone_id) REFERENCES contact_person_phone_phone (id) ON DELETE NO ACTION;
ALTER TABLE contact_person_phone ADD CONSTRAINT FK_contact_person_phone_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id) ON DELETE NO ACTION;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (ensemble_genre_id) REFERENCES ensemble_genre (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (ensemble_pricing_id) REFERENCES ensemble_pricing (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_3 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id) ON DELETE NO ACTION;




ALTER TABLE instructor_email ADD CONSTRAINT FK_instructor_email_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_email ADD CONSTRAINT FK_instructor_email_1 FOREIGN KEY (instructor_email_email_id) REFERENCES instructor_email_email (id) ON DELETE CASCADE;


ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_1 FOREIGN KEY (instructor_phone_phone_id) REFERENCES instructor_phone_phone (id) ON DELETE CASCADE;


ALTER TABLE instrument_in_stock ADD CONSTRAINT FK_instrument_in_stock_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id) ON DELETE NO ACTION;;
ALTER TABLE instrument_in_stock ADD CONSTRAINT FK_instrument_in_stock_1 FOREIGN KEY (instrument_brand_id) REFERENCES instrument_brand (instrument_brand_id) ON DELETE NO ACTION;;


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE SET NULL;
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (id) ON DELETE SET NULL;


ALTER TABLE skill_level_with_instrument ADD CONSTRAINT FK_skill_level_with_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE skill_level_with_instrument ADD CONSTRAINT FK_skill_level_with_instrument_1 FOREIGN KEY (student_skill_level_id) REFERENCES student_skill_level (id) ON DELETE CASCADE;
ALTER TABLE skill_level_with_instrument ADD CONSTRAINT FK_skill_level_with_instrument_2 FOREIGN KEY (student_instrument_id) REFERENCES student_instrument (id) ON DELETE CASCADE;


ALTER TABLE student_email ADD CONSTRAINT FK_student_email_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE student_email ADD CONSTRAINT FK_student_email_1 FOREIGN KEY (student_email_id) REFERENCES student_email_email (id) ON DELETE CASCADE;


ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id) ON DELETE NO ACTION;


ALTER TABLE student_instrument_rental ADD CONSTRAINT FK_student_instrument_rental_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_instrument_rental ADD CONSTRAINT FK_student_instrument_rental_1 FOREIGN KEY (instrument_id) REFERENCES instrument_in_stock (instrument_id) ON DELETE NO ACTION;


ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_1 FOREIGN KEY (student_phone_id) REFERENCES student_phone_phone (id) ON DELETE CASCADE;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (group_lesson_pricing_id) REFERENCES group_lesson_pricing (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (group_lesson_level_id) REFERENCES group_lesson_level (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_3 FOREIGN KEY (group_lesson_instrument_id) REFERENCES group_lesson_instrument (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_4 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id) ON DELETE NO ACTION;


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (individual_lesson_pricing_id) REFERENCES individual_lesson_pricing (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (individual_lesson_level_id) REFERENCES individual_lesson_level (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_4 FOREIGN KEY (individual_lesson_instrument_id) REFERENCES individual_lesson_instrument (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_5 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id) ON DELETE NO ACTION;

ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id) ON DELETE NO ACTION;
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;


