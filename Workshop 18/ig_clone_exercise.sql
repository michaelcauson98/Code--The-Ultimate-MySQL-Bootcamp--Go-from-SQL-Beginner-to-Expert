-- Workshop 18, Instagram DB challenges

-- Populate the DB by running ig_clone_data.sql.

-- Q1, Reward the 5 users that have been around the longest.
SELECT username, created_at FROM users ORDER BY created_at LIMIT 5;

-- Q2, What day of the week do most users register on?
SELECT
	DAYNAME(created_at) AS day,
    COUNT(*) AS count
FROM users
GROUP BY day
ORDER BY count DESC;

-- Q3, Find the users who have never posted a photo.
SELECT username FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Q4, Who got the most likes on a single photo?
SELECT
	users.username AS username, 
	photos.id AS ID,
    photos.image_url AS image_url,
    COUNT(*) AS total_likes
FROM likes
INNER JOIN photos ON likes.photo_id = ID
INNER JOIN users ON photos.user_id = users.id
GROUP BY ID
ORDER BY total_likes DESC LIMIT 1;

-- Q5, How many times does the average user post?
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS average_post_count;

-- Q6, What are the top 5 most commonly used hashtags?
SELECT tag_name, COUNT(*) AS total FROM photo_tags
INNER JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- Q7, Find users who have liked every single photo on the site.
SELECT
	username,
	COUNT(*) AS total_likes
FROM likes
JOIN users ON likes.user_id = users.id
GROUP BY username
HAVING total_likes = (SELECT COUNT(*) FROM photos);