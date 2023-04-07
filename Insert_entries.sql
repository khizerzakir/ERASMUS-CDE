---Insert data --- 

INSERT INTO performer (id, name, genre, contact_phone, contact_email )
VALUES
   (1, 'Martin', 'Rock','+236 197 229 3254', 'martin@email.com'),
   (2, 'Dirk', 'Pop','+234 194 229 3254', 'dirk@email.com'),
   (3, 'Khizer', 'Hip Hop', '+236 197 333 3254', 'khizer@email.com'),
   (4, 'Bilal', 'Funk', '+246 197 229 3354', 'bilal@email.com'),
   (5, 'Madina', 'Cultural','+246 111 229 3354', 'madina@email.com'),
   (6, 'Khujasta', 'Cultural','+236 111 222 3254', 'khujasta@email.com'),
   (7, 'Arjit', 'Bollywood', '+236 111 222 3333', 'arjit@email.com'),
   (8, 'Dreamers crew', 'Hip Hop', '+234 666 777 8987', 'dreamers@email.com'),
   (9, 'Mado group', 'Free Style','+234 555 777 8987', 'mado@email.com');
   
INSERT INTO performances (id, name, start_time, end_time, performer_id, events_id, stage_id)
VALUES
   (1,'Dance', '09:00:00', '09:15:00', 3,2,1),
   (2,'Traditional Dance', '12:00:00', '13:00:00',8,4,1),
   (3,'Traditional Play', '20:00:00', '22:30:00', 6,6,1),
   (4,'Traditional Music', '16:30:00', '18:00:00', 5,7,1),
   (5,'Break Dance', '14:00:00', '15:00:00',7,2,1),
   (6,'Music', '17:00:00', '18:30:00',1,5,1),
   (7,'Music', '19:00:00', '23:00:00',2,3,1),
   (8,'Dance', '11:00:00', '12:00:00',4,1,1),
   (9,'Drama', '13:00:00', '14:30:00',9,9,1);
   
INSERT INTO events (id, name, type, capacity, start_time, end_time, stage_id)
VALUES
   (1,'Opening Ceremony', 'Ceremony', 500, '08:00:00', '08:30:00',1),
   (2,'Speeches', 'Speeches', 500, '08:30:00', '09:00:00',1),
   (3,'Opening Dance', 'Dance', 500, '09:00:00', '09:15:00',1),
   (4,'Traditional performances', 'Performance', 500, '10:00:00', '11:00:00',1),
   (5,'Lunch break','Break', NULL, '11:00:00', '13:00:00', NULL),
   (6,'Singing performance', 'Performance', 500, '13:05:00', '14:00:00',1),
   (7,'Dance performances', 'Performance', 500, '14:05:00', '14:30:00',1),
   (8,'Sporting events', 'Sport', 500, '15:00:00', '18:00:00', NULL),
   (9,'Break', 'Break', NULL, '18:00:00', '19:30:00',NULL),
   (10,'Concert', 'Concert', 700, '20:00:00', '23:00:00',1),
   (11,'Closing Ceremony', 'Ceremony', 500, '23:05:00', '23:30:00',1);

INSERT INTO food_vendors (id, name, email, contact_number, type)
VALUES
(1, 'Jerrie', 'jtante0@spotify.com', '+236 197 229 3254', 'snacks'),
(2, 'Genna', 'gnaptin1@friendfeed.com', '+86 128 916 2792', 'snacks'),
(3, 'Elijah', 'eandrichuk2@nytimes.com', '+52 867 232 9326', 'traditional'),
(4, 'Belva', 'bkensington3@wiley.com', '+86 200 827 2676', 'drinks');
   

   
