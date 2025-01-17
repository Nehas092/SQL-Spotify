CREATE TABLE spotify_tb(Artist VARCHAR (255),
Track	VARCHAR(255),
Album	VARCHAR (255),
Album_type	VARCHAR (15),
Danceability FLOAT,
Energy	FLOAT,
Loudness FLOAT,
Speechiness FLOAT,
Acousticness FLOAT,
Instrumentalness FLOAT,
Liveness FLOAT,	
Valence	FLOAT,
Tempo	FLOAT,
Duration_min FLOAT,
Title VARCHAR (200),
Channel	VARCHAR (60),
Views FLOAT,
Likes BIGINT,	
Comments BIGINT,
Licensed BOOLEAN,
official_video BOOLEAN,
Stream	BIGINT,
EnergyLiveness BIGINT,
most_playedon VARCHAR (10)
)

ALTER TABLE spotify_tb
ALTER COLUMN EnergyLiveness TYPE FLOAT USING EnergyLiveness::FLOAT;

ALTER TABLE spotify_tb
ALTER COLUMN Likes TYPE FLOAT USING Likes::FLOAT;

SELECT * FROM spotify_tb;

-- EDA

-- Total no. of rows

SELECT COUNT(*) FROM spotify_tb

-- Total no. of artists

SELECT COUNT(DISTINCT artist) FROM spotify_tb

-- Total no. of albums

SELECT COUNT(DISTINCT album) FROM spotify_tb

-- Different types of album

SELECT DISTINCT album_type FROM spotify_tb

-- Maximum duration of a song

SELECT MAX(duration_min) FROM spotify_tb

-- Minimum duration of a song

SELECT MIN(duration_min) FROM spotify_tb

SELECT * FROM spotify_tb
WHERE duration_min = 0;

DELETE FROM spotify_tb
WHERE duration_min = 0;

SELECT * FROM spotify_tb
WHERE duration_min = 0;

-- Different types of channel

SELECT DISTINCT channel
FROM spotify_tb;

-------------------------------------------------------------------------------------------------------------------------------------------


-- 1.Retrieve the names of all tracks that have more than 1 billion streams.

SELECT * FROM spotify_tb
WHERE stream > 1000000000;

-- 2.List all albums along with their respective artists.

SELECT DISTINCT album, artist 
FROM spotify_tb;

--3. Get the total number of comments for tracks where licensed = TRUE

SELECT SUM(comments) AS total_comments FROM spotify_tb
WHERE licensed = 'true'

-- 4.Find all tracks that belong to the album type single.

SELECT * FROM spotify_tb
WHERE album_type = 'single'


-- 5.Count the total number of tracks by each artist.

SELECT artist, COUNT(track) AS total_tracks FROM spotify_tb
GROUP BY 1
ORDER BY 2 DESC;

------------------------------------------------------------------------------------------------------------------------------------------

-- 6.Calculate the average danceability of tracks in each album.

SELECT album, AVG(danceability) AS avg_danceability FROM spotify_tb
GROUP BY 1
ORDER BY 2 DESC;

-- 7.Find the top 5 tracks with the highest energy values.

SELECT track, AVG(energy)  FROM spotify_tb
Group by 1
ORDER BY 2
LIMIT 5


-- 8. List all tracks along with their views and likes where official_video = TRUE.

SELECT track, SUM(views) AS total_views, SUM(likes) AS total_likes FROM spotify_tb
WHERE official_video ='true'
GROUP BY 1
ORDER BY 2 DESC;

-- 9.For each album, calculate the total views of all associated tracks.

SELECT * FROM spotify_tb

SELECT album, track,
SUM(views) AS total_views
FROM spotify_tb
GROUP BY 1,2
ORDER BY 3 DESC;

-- 10.Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT * FROM (SELECT track,
COALESCE (SUM(CASE WHEN most_playedon = 'Youtube' THEN stream END), 0) AS streamed_on_youtube,
COALESCE (SUM(CASE WHEN most_playedon = 'Spotify' THEN stream END), 0) AS streamed_on_spotify
FROM spotify_tb
GROUP BY 1) AS t1
WHERE streamed_on_spotify > streamed_on_youtube
AND streamed_on_youtube <> 0


----------------------------------------------------------------------------------------------------------------------------------------
-- 11. Find the top 3 most-viewed tracks for each artist using window functions.

with ranking_artist
AS
(SELECT artist, track, SUM(views) AS total_views,
DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(views) DESC) as rank
FROM spotify_tb
GROUP BY 1, 2
order by 1,3 desc)
SELECT * FROM ranking_artist
WHERE rank <= 3


-- 12. Write a query to find tracks where the liveness score is above the average.

SELECT track, artist, album FROM spotify_tb
WHERE liveness > (SELECT AVG(liveness) FROM spotify_tb)


-- 13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH cte
AS
(SELECT 
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM spotify_tb
GROUP BY 1
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC

--14. Find tracks where the energy-to-liveness ratio is greater than 1.2.

 SELECT track FROM spotify_tb
 WHERE energy/liveness > 1.2

-- 15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT 
    track,
    views, 
    likes, 
    SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify_tb


































