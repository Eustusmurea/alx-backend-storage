-- create a stored procedure AddBonus that takes in a user_id, project_name, and score and adds the score to the user's total score for the project. If the project does not exist, it should be created. The project_name is unique. The project_id is the primary key of the projects table and the foreign key of the scores table. The user_id is the primary key of the users table and the foreign key of the scores table. The score is the score to be added to the user's total score for the project. The scores table has the following columns: user_id, project_id, score. The projects table has the following columns: id, name. The users table has the following columns: id, name. The AddBonus stored procedure should insert a new project into the projects table if the project does not exist. The AddBonus stored procedure should insert a new score into the scores table with the user_id, project_id, and score. The AddBonus stored procedure should return nothing. The AddBonus stored procedure should have the following signature: CREATE PROCEDURE AddBonus( IN user_id INT, project_name VARCHAR(255), IN score INT ) DO ...; The AddBonus stored procedure should be created within the 6-bonus.sql file. The AddBonus stored procedure should be created with the DELIMITER keyword. The AddBonus stored procedure should be created with the IF statement. The AddBonus stored procedure should be created with the SET statement. The AddBonus stored procedure should be created with the INSERT statement. The AddBonus stored procedure should be created with the LAST_INSERT_ID function
DELIMITER |
CREATE PROCEDURE AddBonus (
    IN user_id int,
    IN project_name varchar(255),
    IN score float
)
BEGIN
    INSERT INTO projects (name)
    SELECT project_name FROM DUAL

    WHERE NOT EXISTS (SELECT * FROM projects WHERE name = project_name);
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END;
|
