-- create table named users with the following columns:
CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    average_score float default 0,
    PRIMARY KEY (id)
);
-- create a table named projects with the following columns:
CREATE TABLE IF NOT EXISTS projects (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    PRIMARY KEY (id)
);
-- craete a table named corrections with the following columns:
CREATE TABLE IF NOT EXISTS corrections (
    user_id int not null,
    project_id int not null,
    score int default 0,
    KEY `user_id` (`user_id`),
    KEY `project_id` (`project_id`),
    CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
);
DELIMITER //
-- create a trigger that will update the average_score of the user after a correction is inserted
CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    -- Compute average score for the user
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    -- Update average score in the users table
    UPDATE users
    SET average_score = avg_score
    WHERE id = p_user_id;
END;
//

DELIMITER ;
