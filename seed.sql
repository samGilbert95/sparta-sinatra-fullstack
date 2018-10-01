DROP TABLE IF EXISTS art;
DROP TABLE IF EXISTS artist;



CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	dob INT,
	image VARCHAR(30)
);

CREATE TABLE art (
	id SERIAL PRIMARY KEY,
	pic_name VARCHAR(50),
	pic_date INT,
	image VARCHAR(30),
	artist_id int REFERENCES artist(id)
);
--

INSERT INTO artist (id, first_name, last_name, dob, image) VALUES (1, 'Pablo','Picasso', 1881,'images/picasso.jpg');
INSERT INTO artist (id, first_name, last_name, dob, image) VALUES (2, 'Leonardo', 'Da Vinci', 1452,'images/daVinci.jpeg');
INSERT INTO artist (id, first_name, last_name, dob, image) VALUES (3, 'Vincent', 'Van Gough', 1853,'images/vanGough.jpeg');
INSERT INTO artist (id, first_name, last_name, dob, image) VALUES (4, 'Jackson','Pollock', 1912,'images/pollock.jpeg');
INSERT INTO artist (id, first_name, last_name, dob, image) VALUES (5, 'Salvador','Dali', 1904,'images/dali.jpeg');

INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (1, 'Guernica', 1937, 1,'images/guernica.jpg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (2, 'The Old Guitarist', 1903, 1,'images/oldGuitarist.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (3, 'Three Musicians', 1921, 1,'images/musicians.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (4, 'Portrait of Ambroise Vollard',1910, 1,'images/ambroise.jpg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (5, 'Mona Lisa', 1517, 2,'images/mona.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (6, 'The girl with the Ermine?', 1490, 2,'images/ermine.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (7, 'The Sower with Setting Sun', 1888, 3,'images/sower.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (8, 'Bedroom in Arles',1888, 3,'images/bed.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (9, 'Convergence', 1952, 4,'images/converge.jpeg');
INSERT INTO art (id, pic_name, pic_date, artist_id,image) VALUES (10, 'The Swallows Tail', 1982, 5,'images/tail.jpeg');
