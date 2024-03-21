-- craete tables and stored procedure for average weighted score
CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    average_score float default 0,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS projects (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    weight int default 1,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS corrections (
    user_id int not null,
    project_id int not null,
    score float default 0,
    KEY `user_id` (`user_id`),
    KEY `project_id` (`project_id`),
    CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
);
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_weight INT;

    -- Compute total weighted score and total weight
    SELECT SUM(score * weight), SUM(weight)
    INTO total_score, total_weight
    FROM grades
    WHERE user_id = p_user_id;

    -- Compute average weighted score
    DECLARE avg_weighted_score DECIMAL(10, 2);
    IF total_weight > 0 THEN
        SET avg_weighted_score = total_score / total_weight;
    ELSE
        SET avg_weighted_score = 0;
    END IF;

    -- Update or insert average weighted score for the user
    IF EXISTS (SELECT * FROM average_weighted_scores WHERE user_id = p_user_id) THEN
        UPDATE average_weighted_scores
        SET score = avg_weighted_score
        WHERE user_id = p_user_id;
    ELSE
        INSERT INTO average_weighted_scores (user_id, score)
        VALUES (p_user_id, avg_weighted_score);
    END IF;
END;
//

DELIMITER ;
