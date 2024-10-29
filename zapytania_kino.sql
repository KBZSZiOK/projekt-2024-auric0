CREATE DATABASE 4ti1_kino;

CREATE TABLE filmy (
    ID serial NOT NULL PRIMARY KEY,
    tytul varchar(100),
    rezyser varchar(100),
    czas_trwania time
);

CREATE TABLE sale (
    ID serial NOT NULL PRIMARY KEY,
    ilosc_miejsc int
);

CREATE TABLE seanse (
    ID serial NOT NULL PRIMARY KEY,
    termin datetime,
    liczba_wolnych_miejsc int,
    film_ID bigint UNSIGNED, FOREIGN KEY (film_ID) REFERENCES filmy(ID),
    sala_ID bigint UNSIGNED, FOREIGN KEY (sala_ID) REFERENCES sale(ID)
);

CREATE TABLE rodzaj_filmu (
    ID serial NOT NULL PRIMARY KEY,
    nazwa varchar(100)
);

CREATE TABLE filmy_rodzaj (
    ID serial NOT NULL PRIMARY KEY,
    filmy_ID bigint UNSIGNED, FOREIGN KEY (filmy_ID) REFERENCES filmy(ID),
    rodzaj_ID bigint UNSIGNED, FOREIGN KEY (rodzaj_ID) REFERENCES rodzaj_filmu(ID)
);

CREATE TABLE klienci (
    ID serial NOT NULL PRIMARY KEY,
    imie varchar(100),
    nazwisko varchar(100),
    mail varchar(100)
);

CREATE TABLE sprzedawcy (
    ID serial NOT NULL PRIMARY KEY,
    imie varchar(100),
    nazwisko varchar(100)
);

CREATE TABLE bilety (
    ID serial NOT NULL PRIMARY KEY,
    cena varchar(100),
    seans_ID bigint UNSIGNED, FOREIGN KEY (seans_ID) REFERENCES seanse(ID),
    sprzedawca_ID bigint UNSIGNED, FOREIGN KEY (sprzedawca_ID) REFERENCES sprzedawcy(ID),
    klienci_ID bigint UNSIGNED, FOREIGN KEY (klienci_ID) REFERENCES klienci(ID)
);

INSERT INTO filmy (ID, tytul, rezyser, czas_trwania)
	VALUES
    (null, 'Minionki 2', 'Krzysztof Gosz', '02:20:00'),
    (null, 'Super film', 'Jamal Makumba', '01:30:30'),
    (null, 'Oppenheimer', 'zapomnialem', '03:00:45'),
    (null, 'Pianista', 'Jarek Pasieka', '02:17:47'),
    (null, 'Ojciec chrzestny', 'Tomasz Krawiec', '02:40:10'),
    (null, 'Joker', 'Kacper Kelek', '01:21:50');

INSERT INTO sale (ID, ilosc_miejsc)
	VALUES
	(null, 100),
    (null, 120),
    (null, 90),
    (null, 105);

INSERT INTO seanse (ID, termin, liczba_wolnych_miejsc, film_ID, sala_ID)
	VALUES
	(null, '2020-12-12 12:00:00', 20, 1, 3),
    (null, '2022-05-31 16:30:15', 47, 3, 2),
    (null, '2021-08-22 14:20:20', 33, 2, 4),
    (null, '2024-01-15 19:30:00', 10, 5, 1),
    (null, '2023-03-08 15:00:00', 15, 6, 3);

INSERT INTO rodzaj_filmu (ID, nazwa)
	VALUES
	(null, 'dramat'),
    (null, 'komedia'),
    (null, 'horror'),
    (null, 'przygodowy');

INSERT INTO filmy_rodzaj (ID, filmy_ID, rodzaj_ID)
	VALUES
    (null, 1, 3),
    (null, 2, 1),
    (null, 3, 4),
    (null, 4, 2),
    (null, 5, 1),
    (null, 6, 3);
    
INSERT INTO klienci (ID, imie, nazwisko, mail)
	VALUES
    (null, 'Marek', 'Nowak', 'marek.nowak@gmail.com'),
    (null, 'Krzysztof', 'Krawiec', 'skibidi.sigma@o2.pl'),
    (null, 'Aleksandra', 'Kowalska', 'ola.kowalska15@gmail.com'),
    (null, 'Wojciech', 'Szymański', 'fajny.wojtek@wp.pl'),
    (null, 'Natalia', 'Nowak', 'nowak.nat22@gmail.com');

INSERT INTO sprzedawcy (ID, imie, nazwisko)
	VALUES
    (null, 'Robert', 'Karczewski'),
    (null, 'Maksymilian', 'Skalski'),
    (null, 'Maciek', 'Dąbrowski');

INSERT INTO bilety (ID, cena, seans_ID, sprzedawca_ID, klienci_ID)
    VALUES
    (null, '30zł', 1, 2, 3),
    (null, '25zł', 2, 3, 5),
    (null, '28zł', 3, 1, 2),
    (null, '33zł', 4, 2, 4),
    (null, '22zł', 5, 3, 1),
    (null, '35zł', 2, 1, 3),
    (null, '27zł', 4, 2, 2);