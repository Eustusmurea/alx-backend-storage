-- create a table to store two numbers
CREATE TABLE IF NOT EXISTS numbers (
    a INT DEFAULT 0,
    b INT DEFAULT 0
);

DELIMITER //

-- create a function that will return the result of a safe division
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS DECIMAL(10, 2)
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
END;
//

DELIMITER ;
