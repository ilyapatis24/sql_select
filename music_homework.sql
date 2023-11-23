CREATE TABLE IF NOT EXISTS Music_Ganre(
music_ganre_id SERIAL PRIMARY KEY,
ganre_name VARCHAR(30) NOT NULL
);
CREATE TABLE IF NOT EXISTS Musicians(
musician_id SERIAL PRIMARY KEY,
nickname VARCHAR(30)
);
CREATE TABLE IF NOT EXISTS GanreMusicians(
music_ganre_id INTEGER REFERENCES Music_Ganre(music_ganre_id),
musician_id INTEGER REFERENCES Musicians(musician_id),
CONSTRAINT pk PRIMARY KEY (music_ganre_id, musician_id )
);
CREATE TABLE IF NOT EXISTS Albums(
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(40) NOT NULL,
release_year INTEGER
);
CREATE TABLE IF NOT EXISTS AlbumsMusicians(
musician_id INTEGER REFERENCES Musicians(musician_id),
album_id INTEGER REFERENCES Albums(album_id),
CONSTRAINT pk1 PRIMARY KEY (musician_id, album_id )
);
CREATE TABLE IF NOT EXISTS Collection(
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(30) NOT NULL,
release_year INTEGER
);
CREATE TABLE IF NOT EXISTS Collection(
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(30) NOT NULL,
release_year INTEGER
);
CREATE TABLE IF NOT EXISTS Songs(
song_id SERIAL PRIMARY KEY,
song_name  VARCHAR(30) NOT NULL,
duration INTEGER,
album_id INTEGER REFERENCES Albums(album_id)
);
CREATE TABLE IF NOT EXISTS SongsCollection(
collection_id INTEGER REFERENCES Collection(collection_id),
song_id INTEGER REFERENCES Songs(song_id),
CONSTRAINT pk2 PRIMARY KEY (collection_id, song_id)
);



