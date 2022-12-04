--Remove the old database
\c postgres;
DROP DATABASE IF EXISTS sgms;

--Create a new database
CREATE DATABASE sgms;
\c sgms;

--Create database structure
\i 'D:/Skola/DataLagring/SQL/MusicSchoolDB.sql'

\i 'D:/Skola/DataLagring/SQL/insert.sql'