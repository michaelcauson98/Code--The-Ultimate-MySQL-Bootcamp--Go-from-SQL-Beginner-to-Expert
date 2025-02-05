-- Workshop 10, Database Triggers

CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users (
	username VARCHAR(100),
    age INT
);

-- Trigger example.
DELIMITER $$
CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age < 18
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an adult!';
		END IF;
    END;
$$ DELIMITER ;

--  Example
INSERT INTO users VALUES ("bobby",25);
INSERT INTO users VALUES ("yang", 14);

-- Create trigger to prevent user from following themselves with IG database.
USE ig_clone;
SELECT * FROM follows;

DELIMITER $$
CREATE TRIGGER prevent_self_follow
	BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
		IF NEW.follower_id = NEW.followee_id
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot follow yourself';
		END IF;
    END;
$$ DELIMITER ;

-- Trigger example.
INSERT INTO follows(follower_id,followee_id) VALUES(2,2);

-- Logging unfollows with IG data.alter
CREATE TABLE unfollows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id,followee_id)
);

DELIMITER $$
CREATE TRIGGER capture_unfollow
	AFTER DELETE ON follows FOR EACH ROW
    BEGIN
		INSERT INTO unfollows(follower_id,followee_id)
        VALUES (OLD.follower_id,OLD.followee_id); 
    END;
$$ DELIMITER ;

-- Trigger example.
DELETE FROM follows WHERE follower_id = 2 AND followee_id = 1;
SELECT * FROM unfollows;

SHOW TRIGGERS;

