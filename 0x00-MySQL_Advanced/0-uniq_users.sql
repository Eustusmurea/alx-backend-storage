-- 0. Create a table `users` with the following columns:
--    - `id` INT AUTO_INCREMENT PRIMARY KEY
--    - `email` STR(255) NOT NULL UNIQUE
--    - `name` STR(255) NOT NULL
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
);
