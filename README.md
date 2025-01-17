# Spotify Data Analysis Project

## Overview
This project focuses on analyzing Spotify data using PostgreSQL to gain insights into tracks, albums, and artists. The dataset includes information on tracks, streams, albums, artists, views, likes, and various audio features. Below is an outline of the key queries and insights derived during the analysis.

## Project Objectives and Queries

### 1. Retrieve Tracks with Over 1 Billion Streams
- Extract the names of tracks that have exceeded 1 billion streams, highlighting their popularity.

### 2. List Albums Along with Their Respective Artists
- Provide a comprehensive list of all albums paired with their associated artists.

### 3. Identify Tracks Belonging to Album Type 'Single'
- Filter tracks to identify those that are part of single-type albums.

### 4. Count Total Tracks by Each Artist
- Count and display the total number of tracks produced by each artist to assess productivity.

### 5. Calculate Average Danceability for Each Album
- Determine the average danceability score of tracks within each album, providing insights into album characteristics.

### 6. Top 5 Tracks with Highest Energy Values
- Rank and display the top 5 tracks with the highest energy values to identify high-energy music.

### 7. Tracks with Official Videos: Views and Likes
- List all tracks along with their views and likes where the `official_video` attribute is set to TRUE.

### 8. Total Views for Each Album
- Calculate the total views of all tracks associated with each album to measure album performance.

### 9. Tracks Streamed More on Spotify than YouTube
- Retrieve track names where Spotify streams exceed YouTube streams.

### 10. Top 3 Most-Viewed Tracks for Each Artist
- Use window functions to rank and display the top 3 most-viewed tracks for each artist.

### 11. Tracks with Above-Average Liveness Score
- Identify tracks where the liveness score is above the average, showcasing live-like qualities.

### 12. Difference Between Highest and Lowest Energy Values in Each Album
- Utilize a WITH clause to compute the difference between the highest and lowest energy scores for tracks in each album.

### 13. Tracks with Energy-to-Liveness Ratio Greater than 1.2
- Find tracks where the ratio of energy to liveness exceeds 1.2, indicating energetic tracks with moderate liveness.

### 14. Cumulative Sum of Likes Ordered by Views
- Calculate the cumulative sum of likes for tracks, ordered by the number of views, using window functions to analyze trends.

## Tools and Technologies
- **Database Management System**: PostgreSQL
- **Dataset**: Spotify data including attributes like track names, streams, albums, artists, views, likes, and audio features.

## Key Features
- Advanced SQL queries to handle complex data analysis.
- Use of window functions for ranking and cumulative calculations.
- Insights derived from audio features such as danceability, energy, and liveness.

## Conclusion
This project demonstrates the power of SQL in analyzing large datasets and extracting actionable insights. By exploring various aspects of Spotify data, including track popularity, artist productivity, and audio characteristics, the project provides valuable perspectives for data-driven decision-making.

