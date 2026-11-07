# Install mysql
- Download mysql through the link https://www.mysql.com/downloads/ 
- Initial configuration: root password, port, service start

# Git 
- Fork then Clone https://github.com/datacharmer/test_db into local machine 
- test_db local directory: D:\USTH\test_db\sakila

# Database installation
- Open MySQL 8.0 Command Line => show mysql>
- Install employees database 
  Navigate to the folder: cd /d D:\USTH\test_db
  mysql -u root -p < employees.sql (then enter the password)

# Verify database 
- In sql terminal:
  SHOW DATABASES;
  USE employees;
  SHOW TABLES;