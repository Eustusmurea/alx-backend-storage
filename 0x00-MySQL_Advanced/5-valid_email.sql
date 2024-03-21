-- Create a table users with the following columns:
CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT,
    email varchar(255) not null,
    name varchar(255),
    valid_email boolean not null default 0,
    PRIMARY KEY (id)
);
-- create a trigger that will set the valid_email column to 0 if the email is changed
DELIMITER //

CREATE TRIGGER reset_valid_email_after_email_change
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;
//

DELIMITER ;
