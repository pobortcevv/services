CREATE DATABASE sabra_database;
CREATE USER 'sabra'@'localhost' IDENTIFIED BY 'sabra_21';
GRANT ALL PRIVILEGES ON sabra_database.* TO 'sabra'@'localhost';
FLUSH PRIVILEGES;
