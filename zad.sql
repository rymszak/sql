zd1
SELECT tytul from filmy where rok_produkcji BETWEEN 1998 and 1999;
SELECT tytul from filmy where rok_produkcji in (1998,1999)
SELECT tytul from filmy where rok_produkcji=1998 or rok_produkcji=1999

zd2
SELECT tytul,cena from filmy where cena > 9 ORDER by cena ASC; 

zd3
SELECT nazwisko from klienci where imie="Jan"; 
SELECT nazwisko from klienci where imie like "Jan"; 
SELECT nazwisko from klienci where imie in ("Jan");
 
zd4
SELECT imie,nazwisko from klienci where LENGTH(imie)>LENGTH(nazwisko); 

zd5
SELECT nazwisko from aktorzy where imie in ("Arnold","Tom","Jodie") ORDER by nazwisko DESC; 

zad6
SELECT DISTINCT id_filmu from kopie where czy_dostepna="T" order by id_filmu; 

zd7
SELECT DISTINCT id_kopii from wypozyczenia where data_wypozyczenia between '2005-07-15' and '2005-07-22' ORDER by id_kopii; 

zd8
wyswietl czas wyporzyczenia i id kopii z wyporzyczenia gdfziene wyporzyczne jest większe od 1
SELECT id_kopii, data_zwrotu - data_wypozyczenia as czas from wypozyczenia where data_zwrotu - data_wypozyczenia > 1; 

zd9 
wyświetl napis 1 litera imienia . nazwisko aktorów
SELECT Concat(LEFT(imie,1),+'. ',+nazwisko) as aktorzy FROM aktorzy; 

zd10
wypisz filmy z liczbą rosnącą SELECT tytul FROM filmy order by LENGTH(tytul); 
SELECT tytul FROM filmy order by LENGTH(tytul); 

zd11
tytul i cena 3 najnowszych filmów
SELECT tytul, cena FROM filmy ORDER by rok_produkcji DESC LIMIT 3; 

zd12
wyświetl imie 1 litere imienia i ostatnia w kolimnach imie pierwsza ostatnia
SELECT imie, LEFT(imie,1) as 'pierwsza', RIGHT(imie,1) as 'ostatnia' FROM klienci; 

zd13
imie piersza i ostatnia litera jest taka sama nie odróznia małej od dużej
SELECT imie FROM klienci where LEFT(imie,1) = RIGHT(imie,1); 
SELECT DISTINCT imie FROM klienci where substring(lower(imie),1,1) = substring(lower(imie),length(imie),1); 

zd14
tytul gdzie przed ostatnia litera to 'o' 
SELECT tytul FROM filmy where substring(tytul,-2,1)="o"; 

zd 15
wypisz imie.nazwisko@zsti.pl
SELECT concat(lower(imie),'.',+lower(nazwisko),'@zsti.pl') as email FROM klienci; 

zd 16 
id kopii i tytul dla tych samych id filmu z orderem koppii
select kopie.id_kopii, filmy.tytul from filmy join kopie on kopie.id_filmu=filmy.id_filmu order by kopie.id_kopii asc; 

zd 17 
tytuły dostępnych kopii
select DISTINCT filmy.tytul from kopie inner join filmy on kopie.id_filmu=filmy.id_filmu WHERE kopie.czy_dostepna='T' order by tytul; 

zd 18 
id kopii filmów wyprodukowanych w 1984
select kopie.id_kopii from kopie inner join filmy on kopie.id_filmu=filmy.id_filmu WHERE filmy.rok_produkcji=1984; 

zd 19
data wyporzyczenia zwrotu i nazwisko
select wypozyczenia.data_wypozyczenia, wypozyczenia.data_zwrotu, klienci.nazwisko from wypozyczenia inner join klienci on klienci.id_klienta=wypozyczenia.id_klienta; 

zd 20 
tytul i nazwisko osoby która wyporzyczyła
select klienci.nazwisko, filmy.tytul from wypozyczenia join klienci on klienci.id_klienta=wypozyczenia.id_klienta join kopie on kopie.id_kopii=wypozyczenia.id_kopii join filmy on filmy.id_filmu=kopie.id_filmu; 

zd 21
tytul i rok produkcji dla Kowalski + zamiana tytul na t i rok produkcji na r.p z aliasów
SELECT f.tytul as "t", f.rok_produkcji as "r.p" from filmy f join kopie k on f.id_filmu=k.id_filmu join wypozyczenia w on w.id_kopii=k.id_kopii join klienci kl on kl.id_klienta=w.id_klienta where kl.nazwisko like "Kowalski"; 

zd 22
pierwsze wyporzyczenie
SELECT klienci.nazwisko from klienci join wypozyczenia on klienci.id_klienta=wypozyczenia.id_klienta order by wypozyczenia.data_wypozyczenia asc limit 1; 

zd23
nazwiska grających w terminator
SELECT aktorzy.nazwisko from aktorzy join obsada on aktorzy.id_aktora=obsada.id_aktora join filmy on filmy.id_filmu=obsada.id_filmu where filmy.tytul like "Terminator"; 

zd24
filmy z de niro
SELECT filmy.tytul from filmy join obsada on filmy.id_filmu=obsada.id_filmu join aktorzy on aktorzy.id_aktora=obsada.id_aktora where aktorzy.nazwisko like "De Niro"; 

zd25
najdłużej wyporzyczony tytuł
SELECT filmy.tytul from filmy join kopie on kopie.id_filmu=filmy.id_filmu JOIN wypozyczenia on kopie.id_kopii=wypozyczenia.id_kopii order by wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia desc limit 1; 

zd26
nazwiska klientów co wyporzyczyli między daną datą
SELECT DISTINCT klienci.nazwisko from klienci join wypozyczenia on wypozyczenia.id_klienta=klienci.id_klienta where wypozyczenia.data_wypozyczenia BETWEEN "2005-07-15" and "2005-07-20"; 

zd22
CREATE table sklep(
    id serial,
    nazwa varchar(100),
    dział set('ram','procesor','grafika'));
insert into magazyn(nazwa, dział) VALUES('3600','1');
insert into magazyn(nazwa, dział) VALUES('4600','4');
insert into magazyn(nazwa, dział) VALUES('2600','2');
insert into magazyn(nazwa, dział) VALUES('5600','5');
insert into magazyn(nazwa, dział) VALUES('6600','6');
insert into magazyn(nazwa, dział) VALUES('7600','7');

zd 6 sort  podaj definicje zależności pierwszeństwa wyników sortowania
SELECT title, release_year, rental_rate from film order by release_year desc, title, rental_rate desc;        pierwszeństwo te co zaczyna się po order by wydanie malejące > tytuł > wynajem malejąco

zd 7 wieolokrotne warónki złożone  (or and) wiele warunkówo jednym zapytaniu z nawiasami co ma pierwszeństow or and 
SELECT title, replacement_cost, rental_rate from film where rental_rate > 0 or rental_rate<1 order by replacement_cost desc, rental_rate asc,title asc;
SELECT title, replacement_cost, rental_rate from film where rental_rate > 0 and rental_rate<1 order by replacement_cost desc, rental_rate asc,title asc;
SELECT title, release_year, rental_rate from film where release_year <2000 and rental_rate >2 or length(title)%2=1 order by release_year desc, title, rental_rate desc;

zd 8 or and warunki w jednym zapytaniu z like in
SELECT title,release_year,rating,description from film where release_year<2000 and title like 'ACADEMY DINOSAUR' or rating in ('G') ORDER BY `film`.`release_year` ASC

zd 9 z beetween i Right i kilka wbudowanych
SELECT title ,release_year from film where right(title,1) BETWEEN 'C'and'H' and release_year>2000 order by film.length desc;

10 polecenie regu (__%) znak > jeśli liczby lub funkcji dlugość jeśli litery
SELECT title from film where title like '__a%' and length(title)>10;

zd11 regex z inną opcją
SELECT title,rental_duration as 'dni od wyporzyczenia' from film where title REGEXP'^..[d-h]' and rental_duration>4;

zd12 urzyj  '$w' 'a.c' i join
SELECT film.title as 'tytuł z a i 2 dalej c', actor.first_name as 'imie aktora kończące się na i', actor.last_name as 'nazwisko aktora kończące się na d' from film join film_actor on film_actor.film_id=film.film_id join actor on actor.actor_id=film_actor.actor_id where title REGEXP 'a.c' or actor.first_name REGEXP 'i$' and actor.last_name REGEXP 'd$';

zd 13 rlike '^[^ ]' join 
SELECT film.title, category.name from film join film_category on film.film_id=film_category.film_id join category on film_category.category_id=category.category_id where title Rlike '^[^a.x]';

zd 14 pytanie z pytań
SELECT film.title,film.release_year,film.rating,actor.first_name from film
join film_actor on film.film_id=film_actor.film_id 
join actor on actor.actor_id=film_actor.actor_id 
where ((film.release_year BETWEEN 2000 and 2012) or film.rating in ('G'))
or (actor.first_name REGEXP'[a-c]' and actor.last_name like '_a%') 
ORDER BY `film`.`release_year` ASC;

1.16
select customer.first_name,customer.last_name, customer.active from customer join store on store.store_id=customer.store_id where store.store_id=2 and customer.active=0;
2.17
select film.title from film where film.replacement_cost BETWEEN 25 and 30 order by film.rental_rate limit 100;

3.18
select * from country where country_id=76;
update country set country = "Polska" where country_id=76;

4.19
insert into city values('','Gliwice',76,'')

zad 27:
27.1 : to samo ale do sakili
  
SELECT first_name,
	CASE first_name WHEN 'NICK' THEN 'Nick is here' END
FROM actor

27.2 : 4 case
  
SELECT first_name,
	CASE first_name WHEN 'NICK' THEN 'Nick is here' END AS Nick,
    CASE first_name WHEN 'ED' THEN 'Ed Edd and Eddie' END AS Ed,
    CASE first_name WHEN 'GRACE' THEN 'Holy Grace' END AS Grace,
    CASE first_name WHEN 'JOE' THEN 'You like ice cream?' END AS Joe
FROM actor

27.3: zliczanie
  SELECT 
	COUNT(CASE first_name WHEN 'ED' then 1 ELSE NULL END) as 'ED',
    COUNT(CASE first_name WHEN 'JOHNNY' then 1 ELSE NULL END) as 'JOHNNY',
    count(CASE first_name WHEN 'BOB' THEN 'Bob budowniczy' END) AS BOB,
    count(CASE first_name WHEN 'JOE' THEN 'Joe mama' END) AS JOE
FROM actor;

27.4: if

SELECT first_name, 
  if(first_name='ED',if(last_name='CHASE','JEST CHASE','NOT CHASE'),'NOT ED') 
  FROM actor;

27.5
SELECT first_name, 
  if(first_name='ED',
    if(last_name='CHASE',
      'JEST CHASE',
      'NOT CHASE'),
    'NOT ED') 
FROM actor;

28 3 tranzakcje w sakili

	start TRANSACTION;
INSERT into actor(first_name,last_name) values('Al', 'Pacino');
insert into `language`(name,language_id) values('Polish',7);
insert into film (title,original_language_id, release_year, language_id) values('Jocker',1, '2019',7); 
COMMIT;

 zd26 a)
6 tabel w sql i graficznie
----------1--------------
create table `woda`(
`id_wody` int AUTO_INCREMENT primary key,
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
`nr_polki` int
)engine=INNODB charset=utf8 COLLATE=utf8_polish_ci

insert into polki(id_napoju,id_wody,nr_polki) values(4,6,2);
insert into polki(id_napoju,id_wody,nr_polki) values(2,3,5);
insert into polki(id_napoju,id_wody,nr_polki) values(1,1,3);

------------------6--------------------------------

create table `kasa`(
`id_napoju` int,
`id_wody` int,
`nr_polki` int
`id_sprzedawcy` int
)engine=INNODB charset=utf8 COLLATE=utf8_polish_ci

insert into kasa(id_napoju,id_wody,nr_polki,id_sprzedawcy) values(4,6,2,1);
insert into kasa(id_napoju,nr_polki,id_sprzedawcy) values(1,5,2);
insert into kasa(id_wody,nr_polki,id_sprzedawcy) values(2,3,3);

--------------------------zapytania---------------
1)kto pracował 04-01-2024
SELECT DISTINCT s.imie, s.nazwisko FROM sprzedawca s JOIN zmiana z ON s.id_sprzedawcy = z.id_sprzedawcy WHERE DATE(z.data) = '2024-01-04';
2)ilość zmian
SELECT s.imie, s.nazwisko, COUNT(z.id_sprzedawcy) AS total_shifts FROM sprzedawca s LEFT JOIN zmiana z ON s.id_sprzedawcy = z.id_sprzedawcy GROUP BY s.id_sprzedawcy;
3)woda i napoj na półce 2
SELECT n.nazwa AS napoj, w.nazwa AS woda FROM polki p LEFT JOIN napoje_gazowane n ON p.id_napoju = n.id_napoju LEFT JOIN woda w ON p.id_wody = w.id_wody WHERE p.nr_polki = 2
4)najwięcej zmian
SELECT s.imie, s.nazwisko, COUNT(z.id_sprzedawcy) AS total_shifts FROM sprzedawca s LEFT JOIN zmiana z ON s.id_sprzedawcy = z.id_sprzedawcy GROUP BY s.id_sprzedawcy ORDER BY total_shifts DESC LIMIT 1;
5)ilość zarobku w danym dniu
SELECT s.imie, s.nazwisko, SUM(k.cena) AS total_revenue FROM sprzedawca s JOIN zmiana z ON s.id_sprzedawcy = z.id_sprzedawcy JOIN kasa k ON z.id_sprzedawcy = k.id_sprzedawcy WHERE DATE(z.data) = '2024-01-04' GROUP BY s.id_sprzedawcy;
6)napoje których cena jest poniżej średniej
SELECT 'napoje_gazowane' AS typ, nazwa, cena FROM napoje_gazowane WHERE cena < (SELECT AVG(cena) FROM (SELECT cena FROM napoje_gazowane UNION SELECT cena FROM woda) AS all_products) UNION SELECT 'woda' AS typ, nazwa, cena FROM woda WHERE cena < (SELECT AVG(cena) FROM (SELECT cena FROM napoje_gazowane UNION SELECT cena FROM woda) AS all_products);

zd 1
wyznacz średnią pensją wszystkich pracówników poza londynem
select miasto, avg(pensja) from pracownicy GROUP by miasto having miasto!="London";
select miasto, avg(pensja) from pracownicy where miasto != "London" GROUP by miasto;
select miasto, avg(pensja) from pracownicy where miasto not like("London")  GROUP by miasto;
select miasto, avg(pensja) from pracownicy where miasto <> "London" GROUP by miasto; - nie w zakresie 

  zd2
wyznacz srednie pensje pracowników z podziałem na miasta a następnie wybierz te grupy (miasta) które średnia pensja przekroczyła 100
select avg(pensja), miasto from pracownicy group by miasto having avg(pensja) > 100;

