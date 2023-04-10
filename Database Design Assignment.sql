DROP DATABASE IF EXISTS business;

CREATE DATABASE IF NOT EXISTS business;

USE business;

CREATE TABLE IF NOT EXISTS songs (
    title VARCHAR(40) NOT NULL,
    artist VARCHAR(40) NOT NULL,
    artist_id INT AUTO_INCREMENT NOT NULL,
    genre VARCHAR(40),
    explicit BOOL NULL DEFAULT 0,
    link VARCHAR(255),
    song_id VARCHAR(20),
    PRIMARY KEY (title),
    FOREIGN KEY (artist_id) REFERENCES songs(artist_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS artist (
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    birthDate DATE,
    artist_id INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (artist_id),
    FOREIGN KEY (artist_id) REFERENCES songs(artist_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS genre (
    genreName VARCHAR(20),
    PRIMARY KEY (genreName)
);

CREATE TABLE IF NOT EXISTS users (
	user_id INT,
    email VARCHAR(40),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    userPassword VARCHAR(20),
    favoriteSong VARCHAR(20),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS playlists (
	user_id INT,
	playlist_id INT AUTO_INCREMENT NOT NULL,
    songRank INT,
    song_id VARCHAR(20),
    PRIMARY KEY (playlist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (song_id) REFERENCES songs(song_id) ON UPDATE CASCADE ON DELETE SET NULL
);
