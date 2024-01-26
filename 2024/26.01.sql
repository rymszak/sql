26.01.2024
create DATABASE kursantki

    
 ------   tabela kursantki-------------------

    
create table `kursantki`(
    `kursantki_id` int AUTO_INCREMENT PRIMARY KEY,
    `imie` varchar(15) not null,
    `nazwisko` varchar(120) not null DEFAULT 'uczen'
) engine=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci

INSERT into kursantki(kursantki_id, imie) values(1,'Ola'); 
INSERT into kursantki(kursantki_id, imie) values(2,'Iza');
INSERT into kursantki(kursantki_id, imie) values(3,'Kasia');
INSERT into kursantki(kursantki_id, imie) values(4,'Ania');
INSERT into kursantki(kursantki_id, imie) values(5,'Monika'); 
INSERT into kursantki(kursantki_id, imie) values(6,'Basia'); 


-------tabela kurs---------------------


CREATE table `kurs`(
    `kurs_id` int AUTO_INCREMENT PRIMARY key,
    `nazwa` varchar(15) not null)
    engine=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci

insert into kurs (nazwa) values('PHP');
insert into kurs (nazwa) values('Java');
insert into kurs (nazwa) values('C++');
insert into kurs (nazwa) values('C');
insert into kurs (nazwa) values('C#');
insert into kurs (nazwa) values('Python');
insert into kurs (nazwa) values('Go');
insert into kurs (nazwa) values('Rust');
insert into kurs (nazwa) values('Kotlin');
insert into kurs (nazwa) values('Javascript');


-----------tabela nauka--------------------------


create table `nauka`(
`nauka_id` int AUTO_INCREMENT primary key,
`kursantki_id` int,
`kurs_id` int,
FOREIGN key(kursantki_id) REFERENCES kursantki(kursantki_id),
    FOREIGN key(kurs_id) REFERENCES kurs(kurs_id)
    )engine=INNODB AUTO_INCREMENT=7 default charset=utf8 COLLATE=utf8_polish_ci

insert into nauka(kursantki_id, kurs_id) values(1,7);
insert into nauka(kursantki_id, kurs_id) values(1,8);
insert into nauka(kursantki_id, kurs_id) values(2,10);
insert into nauka(kursantki_id, kurs_id) values(3,9);
insert into nauka(kursantki_id, kurs_id) values(4,9);
insert into nauka(kursantki_id, kurs_id) values(5,7);
insert into nauka(kursantki_id, kurs_id) values(6,9);
insert into nauka(kursantki_id, kurs_id) values(6,8);


zad25 
stworzyć tabele powiązaną z innymi z:
    kiedy dostała kurs 
    tabela z:
    cena kursu

alter table `kurs` add column `cena` int;
update `kurs` set cena=200 where kurs_id=16;

alter table nauka add `data_rozpoczecia_kursu` date;
update nauka set data_rozpoczecia_kursu='2023-01-11' where kurs_id=7;
update nauka set data_rozpoczecia_kursu='2023-02-20' where kurs_id=8;
update nauka set data_rozpoczecia_kursu='2023-03-04' where kurs_id=9;
update nauka set data_rozpoczecia_kursu='2023-04-22' where kurs_id=10;
update nauka set data_rozpoczecia_kursu='2023-05-10' where kurs_id=11;
update nauka set data_rozpoczecia_kursu='2023-06-14' where kurs_id=12;
update nauka set data_rozpoczecia_kursu='2023-07-15' where kurs_id=13;
update nauka set data_rozpoczecia_kursu='2023-08-02' where kurs_id=14;
update nauka set data_rozpoczecia_kursu='2001-09-11' where kurs_id=15;
update nauka set data_rozpoczecia_kursu='2022-12-12' where kurs_id=16;


create table `instruktor`(
    `instruktor_id` int,
    `kurs_id` int,
    `nazisko` varchar(120) not null,
    FOREIGN key(kurs_id) REFERENCES kurs(kurs_id)
    )engine=INNODB AUTO_INCREMENT=7 default charset=utf8 COLLATE=utf8_polish_ci

INSERT into instruktor(kurs_id,nazisko) values(7,'Trzaskowski');
INSERT into instruktor(kurs_id,nazisko) values(7,'Dudek');
INSERT into instruktor(kurs_id,nazisko) values(8,'Duda');
INSERT into instruktor(kurs_id,nazisko) values(8,'Durszlak');
INSERT into instruktor(kurs_id,nazisko) values(8,'Budzik');
INSERT into instruktor(kurs_id,nazisko) values(9,'Trzaskowski');
INSERT into instruktor(kurs_id,nazisko) values(10,'Brown');
INSERT into instruktor(kurs_id,nazisko) values(10,'Kerr');
INSERT into instruktor(kurs_id,nazisko) values(11,'Wright');
INSERT into instruktor(kurs_id,nazisko) values(12,'Stewart');
INSERT into instruktor(kurs_id,nazisko) values(13,'Stewart');
INSERT into instruktor(kurs_id,nazisko) values(14,'Budzik');
INSERT into instruktor(kurs_id,nazisko) values(15,'Nierodka');
INSERT into instruktor(kurs_id,nazisko) values(14,'Nierodka');
INSERT into instruktor(kurs_id,nazisko) values(14,'Dudek');
INSERT into instruktor(kurs_id,nazisko) values(16,'Nierodka');

update instruktor set instruktor_id=7 where nazisko like 'Trzaskowski';
update instruktor set instruktor_id=8 where nazisko like 'Dudek';
update instruktor set instruktor_id=9 where nazisko like 'Duda';
update instruktor set instruktor_id=10 where nazisko like 'Durszlak';
update instruktor set instruktor_id=11 where nazisko like 'Budzik';
update instruktor set instruktor_id=12 where nazisko like 'Brown';
update instruktor set instruktor_id=13 where nazisko like 'Kerr';
update instruktor set instruktor_id=14 where nazisko like 'Wright';
update instruktor set instruktor_id=15 where nazisko like 'Stewart';
update instruktor set instruktor_id=16 where nazisko like 'Nierodka';

SELECT SUM(cena) as "cena kursów Nierodki" FROM `kurs` join instruktor on instruktor.kurs_id=kurs.kurs_id where instruktor.instruktor_id=16;
SELECT round(avg(cena),2) as "średnia cena kursów" FROM `kurs`;
SELECT min(kurs.cena) as "cena najtańszego kursu Basi", kurs.nazwa as "najtańszy kurs Basi" FROM `kurs`
    join nauka on nauka.kurs_id=kurs.kurs_id join kursantki on kursantki.kursantki_id=nauka.kursantki_id where kursantki.imie like "Basia";
SELECT max(kurs.cena) as "cena najdroższego kursu Basi", instruktor.nazisko as "nazwisko instruktora" FROM `kurs` 
    join nauka on nauka.kurs_id=kurs.kurs_id join kursantki on kursantki.kursantki_id=nauka.kursantki_id 
    join instruktor on instruktor.kurs_id=kurs.kurs_id where kursantki.imie like "Basia";
SELECT kursantki.imie as "imie kursantki", instruktor.nazisko as "nazwisko instruktora" FROM `kursantki` 
    join nauka on kursantki.kursantki_id=nauka.kursantki_id JOIN kurs on kurs.kurs_id=nauka.kurs_id join instruktor on instruktor.kurs_id=kurs.kurs_id 
    where kurs.kurs_id=8;



 zd26 a)
6 tabel w sql i graficznie
----------1--------------
create table `woda`(
`woda_id` int AUTO_INCREMENT primary key,
`nazwa` varchar(50) NOT null,
`cena` decimal(10,2)
)engine=INNODB AUTO_INCREMENT=1 default charset=utf8 COLLATE=utf8_polish_ci

insert into woda(nazwa,cena) values('czisowianka',14);
insert into woda(nazwa,cena) values('primavera',10);
insert into woda(nazwa,cena) values('żywiec',20);
insert into woda(nazwa,cena) values('evian',14);
insert into woda(nazwa,cena) values('java',7);
insert into woda(nazwa,cena) values('nałęczowianka',12);

-------------------2---------------------------
CREATE table `napoje_gazowane`( `id_napoju` int AUTO_INCREMENT 
    primary key, `nazwa` varchar(50) not null,
    `cena` decimal(10,2) not null
    )engine=INNODB AUTO_INCREMENT=1 charset=utf8 COLLATE=utf8_polish_ci;

insert into napoje_gazowane(nazwa,cena) values('coca-cola',70);
insert into napoje_gazowane(nazwa,cena) values('sprite',15);
insert into napoje_gazowane(nazwa,cena) values('pepsi',22);
insert into napoje_gazowane(nazwa,cena) values('dr.peper',7);

-----------------3------------------------------
create table `sprzedawca`(
`id_sprzedawcy` int AUTO_INCREMENT primary KEY,
    `imie` varchar(50) not null,
    `nazwisko` varchar(50) not null
)engine=INNODB AUTO_INCREMENT=1 charset=utf8 COLLATE=utf8_polish_ci

insert into sprzedawca(imie,nazwisko) values('Franek','Rozkosz');
insert into sprzedawca(imie,nazwisko) values('Michał','Zywer');
insert into sprzedawca(imie,nazwisko) values('Kamil','Rymsza');

--------------------4----------------------
create table `zmiana`(
    `data` datetime,
    `id_sprzedawcy` int,
    FOREIGN key(id_sprzedawcy) REFERENCES sprzedawca(id_sprzedawcy)
    )engine=INNODB charset=utf8 COLLATE=utf8_polish_ci

insert into zmiana(`data`,id_sprzedawcy) values('2024-01-04 07:00:20',2);
insert into zmiana(`data`,id_sprzedawcy) values('2024-01-04 08:15:00',1);
insert into zmiana(`data`,id_sprzedawcy) values('2024-01-05 12:00:00',3);
insert into zmiana(`data`,id_sprzedawcy) values('2024-01-06 07:00:00',1);
insert into zmiana(`data`,id_sprzedawcy) values('2024-01-01 06:30:50',2);
insert into zmiana(`data`,id_sprzedawcy) values('2024-01-13 22:10:42',3);

----------------5-----------------------------

create table `polki`(
`id_napoju` int,
`id_wody` int,
`id_sprzedawcy` int
)engine=INNODB charset=utf8 COLLATE=utf8_polish_ci
