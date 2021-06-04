--Test Data

--Obrazovanje podaci

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Fakultetsko obrazovanje', '7', 'IIS');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Gimnazija');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Ekonomska srednja skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Osnovna skola', '3', 'OS Bosa Milicevic');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Osnovna skola', '3', 'OS Zarko Zrenjanin');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Fakultetsko obrazovanje', '7', 'PMF');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Fakultetsko obrazovanje', '7', 'FIL');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Masinska skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Hemijska skola');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Fakultetsko obrazovanje', '7', 'FON');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Politehnicka skola');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (NEXTVAL('obrazovanje_seq'), 'Srednja skola', '4', 'Medicinska skola');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (-100, 'Test SR', '4', 'Test');

--Preduzece podaci

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (NEXTVAL('preduzece_seq'), 'AD Implek', 2121, 'Beograd', 'mlekara');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (NEXTVAL('preduzece_seq'), 'Henkel Srbija', 452123, 'Novi Sad', 'industrija');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (NEXTVAL('preduzece_seq'), 'Fruit DOO', 2127771, 'Subotica', 'industrija');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (NEXTVAL('preduzece_seq'), 'Mladost', 21299991, 'Cacak', 'prehrambena industrija');

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (-100, 'TEST AD', 2121, 'Beograd TEST', 'mlekara');

--Sektor podaci

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (NEXTVAL('sektor_seq'), 'Ljudski resursi', 'HR', 1);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (NEXTVAL('sektor_seq'), 'Menadzment', 'MN', 2);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (NEXTVAL('sektor_seq'), 'Programiranje', 'PR', 3);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (NEXTVAL('sektor_seq'), 'Komecijala', 'KOM', 4);

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (-100, 'Ljudski resursi TEST', 'HR', 1);

--Radnik podaci

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Zoran', 'Zoric', 123555, 1, 1);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Marko', 'Markovic', 216661, 2, 2);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Miljan', 'Babic', 09182, 3, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Milan', 'Milic', 98012, 4, 4);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Jovana', 'Jovanovic', 98012212, 10, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Milica', 'Perovic', 09812, 12, 1);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Sonja', 'Vasic', 09812, 1, 4);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Luka', 'Mandic', 178236, 4, 2);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Dusan', 'Stevanovic', 21461, 6, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (NEXTVAL('radnik_seq'), 'Milan', 'Jovovic', 19283, 9, 1);

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (-100, 'Milan TEST', 'Jovovic TEST', 19283, 9, 1);

