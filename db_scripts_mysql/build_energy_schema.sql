DROP DATABASE IF EXISTS energy;

DROP USER IF EXISTS 'energy'@'localhost';

CREATE DATABASE energy;

CREATE USER 'energy'@'localhost' IDENTIFIED BY 'energy';

GRANT ALL ON energy.* TO 'energy'@'localhost';

FLUSH PRIVILEGES;

USE energy;

SOURCE create_tables.sql;