DROP DATABASE IF EXISTS spotify;

CREATE DATABASE spotify;

USE spotify;

CREATE TABLE IF NOT EXISTS artists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  explicit BOOLEAN NOT NULL,
  cloud_link VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT fk_artist
    FOREIGN KEY (artist_id)
    REFERENCES artists(id)
);

CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS favorites (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  CONSTRAINT pk_favorites
    PRIMARY KEY (user_id, song_id),
  CONSTRAINT fk_user
    FOREIGN KEY (user_id)
    REFERENCES users(id),
  CONSTRAINT fk_song
    FOREIGN KEY (song_id)
    REFERENCES songs(id)
);

CREATE TABLE IF NOT EXISTS playlists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT fk_user_playlist
    FOREIGN KEY (user_id)
    REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS playlist_songs (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  `rank` INT NOT NULL,
  CONSTRAINT pk_playlist_songs
    PRIMARY KEY (playlist_id, song_id),
  CONSTRAINT fk_playlist
    FOREIGN KEY (playlist_id)
    REFERENCES playlists(id),
  CONSTRAINT fk_song_playlist
    FOREIGN KEY (song_id)
    REFERENCES songs(id)
);