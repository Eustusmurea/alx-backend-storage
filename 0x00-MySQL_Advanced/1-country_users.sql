-- Create a table named users with the following columns:
-- - id INT AUTO_INCREMENT PRIMARY KEY
-- - email VARCHAR(255) NOT NULL UNIQUE
-- - name VARCHAR(255) NOT NULL
-- - country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
-- The country column should be an ENUM type with the default value of 'US'
-- The ENUM type is a string object with a value chosen from a list of permitted values that are enumerated explicitly in the column specification at table creation time.
-- The ENUM type can have a maximum of 65535 distinct elements.

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
    );
    