--Test Data

--Obrazovanje podaci

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (1, 'Fakultetsko obrazovanje', '7', 'IIS');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (2, 'Srednja skola', '4', 'Gimnazija');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (3, 'Srednja skola', '4', 'Ekonomska srednja skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (4, 'Osnovna skola', '3', 'OS Bosa Milicevic');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (5, 'Osnovna skola', '3', 'OS Zarko Zrenjanin');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (6, 'Fakultetsko obrazovanje', '7', 'PMF');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (7, 'Fakultetsko obrazovanje', '7', 'FIL');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (8, 'Srednja skola', '4', 'Masinska skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (9, 'Srednja skola', '4', 'Hemijska skola');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (10, 'Fakultetsko obrazovanje', '7', 'FON');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (11, 'Srednja skola', '4', 'Politehnicka skola');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (12, 'Srednja skola', '4', 'Medicinska skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (-100, 'Test SR', '4', 'Test');

--Preduzece podaci

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (1, 'AD Implek', 2121, 'Beograd', 'mlekara');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (2, 'Henkel Srbija', 452123, 'Novi Sad', 'industrija');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (3, 'Fruit DOO', 2127771, 'Subotica', 'industrija');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (4, 'Mladost', 21299991, 'Cacak', 'prehrambena industrija');

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (-100, 'TEST AD', 2121, 'Beograd TEST', 'mlekara');

--Sektor podaci

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (1, 'Ljudski resursi', 'HR', 1);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (2, 'Menadzment', 'MN', 2);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (3, 'Programiranje', 'PR', 3);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (4, 'Komecijala', 'KOM', 4);

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (-100, 'Ljudski resursi TEST', 'HR', 1);

--Radnik podaci

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (1, 'Zoran', 'Zoric', 123555, 1, 1);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (2, 'Marko', 'Markovic', 216661, 2, 2);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (3, 'Miljan', 'Babic', 09182, 3, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (4, 'Milan', 'Milic', 98012, 4, 4);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (5, 'Jovana', 'Jovanovic', 98012212, 10, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (6, 'Milica', 'Perovic', 09812, 12, 1);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (7, 'Sonja', 'Vasic', 09812, 1, 4);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (8, 'Luka', 'Mandic', 178236, 4, 2);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (9, 'Dusan', 'Stevanovic', 21461, 6, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (10, 'Milan', 'Jovovic', 19283, 9, 1);

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (-100, 'Milan TEST', 'Jovovic TEST', 19283, 9, 1);

