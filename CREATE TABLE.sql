CREATE TABLE IF NOT EXISTS Title (
	title_id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer (
	performer_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Con_Titles_Per (
	title_id INTEGER NOT NULL REFERENCES Title(title_id),
	performer_id INTEGER NOT NULL REFERENCES Performer(performer_id),
	constraint tit_per primary key (title_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Con_Per_Albums (
	performer_id INTEGER NOT NULL REFERENCES Performer(performer_id),
	album_id INTEGER NOT NULL REFERENCES Album(album_id),
	constraint per_alb primary key (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	album_id INTEGER REFERENCES Album(album_id),
	duration numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	year_of_release INTEGER not null
);

CREATE TABLE IF NOT EXISTS Con_Tracks_Col (
	track_id INTEGER NOT NULL REFERENCES Track(track_id),
	collection_id INTEGER NOT NULL REFERENCES Collection(collection_id),
	constraint tra_col primary key (track_id, collection_id)
);