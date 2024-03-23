-- add delimeter to change the default delimiter
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
