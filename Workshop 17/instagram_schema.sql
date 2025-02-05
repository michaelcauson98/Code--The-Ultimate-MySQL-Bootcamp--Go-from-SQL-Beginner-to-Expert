-- Workshop 17: Instagram Database Clone
DROP DATABASE Instagram;
CREATE DATABASE Instagram;
USE Instagram;

-- Create users table
CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create photos table
CREATE TABLE photos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create comments table
CREATE TABLE comments (
	id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

-- Create likes table
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);

-- Create follows table
CREATE TABLE follows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

-- Create hashtags table
CREATE TABLE tags (
	id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create hashtags/photos table
CREATE TABLE photo_tags (
	photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id,tag_id)
);

