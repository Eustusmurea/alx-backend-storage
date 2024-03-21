-- create a table named users with the following columns:
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Changed 'int' to 'INT' and added PRIMARY KEY
    name VARCHAR(255) NOT NULL,
    average_score FLOAT DEFAULT 0  -- Changed 'float' to 'FLOAT'
);

-- create a table named projects with the following columns:
CREATE TABLE IF NOT EXISTS projects (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Changed 'int' to 'INT' and added PRIMARY KEY
    name VARCHAR(255) NOT NULL
);

-- create a table named corrections with the following columns:
CREATE TABLE IF NOT EXISTS corrections (
    user_id INT NOT NULL,
    project_id INT NOT NULL,
    score INT DEFAULT 0,
    KEY fk_user_id (user_id),  -- Changed KEY name to 'fk_user_id'
    KEY fk_project_id (project_id),  -- Changed KEY name to 'fk_project_id'
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,  -- Removed backticks from table names
    CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES projects (id) ON DELETE CASCADE  -- Removed backticks from table names
);

DELIMITER //

-- create a trigger that will update the average_score of the user after a correction is inserted
CREATE TRIGGER update_average_score_after_correction_insert
AFTER INSERT ON corrections
FOR EACH ROW
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_corrections INT;
    
    -- Calculate total score and total corrections for the user
    SELECT SUM(score), COUNT(*)
    INTO total_score, total_corrections
    FROM corrections
    WHERE user_id = NEW.user_id;
    
    -- Update average score for the user
    UPDATE users
    SET average_score = IF(total_corrections > 0, total_score / total_corrections, 0)
    WHERE id = NEW.user_id;
END;
//

DELIMITER ;
