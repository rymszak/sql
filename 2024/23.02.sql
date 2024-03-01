zad 27:
27.1 : 
  
SELECT first_name,
	CASE first_name WHEN 'NICK' THEN 'Jest Nick' END
FROM actor

27.2 : 4 case
  
SELECT 
	CASE first_name WHEN 'ED' THEN 'Jest ED' END AS ED,
    CASE first_name WHEN 'JOE' THEN 'Joe mama' END AS JOE,
    CASE first_name WHEN 'JOHNNY' THEN 'Here is Johny' END AS JOHNNY,
    CASE first_name WHEN 'BOB' THEN 'Bob budowniczy' END AS BOB
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


---------------------------magazyn-----------------------
			 tranzakcje-automatyczne zmienianie wielu na raz

start TRANSACTION;
insert into sprzedaz(id_towaru, sztuk, cena) values(1,3,30);
update towary set stan=stan-3 where id=1;
COMMIT;
rollback zamiast commit usuwa tranzakcje

28 3 tranzakcje w sakili

	start TRANSACTION;
INSERT into actor(first_name,last_name) values('Al', 'Pacino');
insert into `language`(name,language_id) values('Polish',7);
insert into film (title,original_language_id, release_year, language_id) values('Jocker',1, '2019',7); 
COMMIT;



------------------------trigger-------------------------

kursantki
alter table kursantki add ostatni_zakup_id int;

create table sprzedaz(
    id serial,
    id_towaru int,
    sztuk int default 30,
    cena int DEFAULT 30,
    kursantki_id int,
--    blokada int DEFAULT 1
	)

create TRIGGER nowasprzedaz after insert on sprzedaz for 
	EACH row update kursantki set ostatni_zakup_id = new.kursantki_id

insert into sprzedaz (id_towaru, sztuk,cena,kursantki_id) values(1,11,123,1);
SELECT * from kursantki;
SELECT * from sprzedaz
insert into sprzedaz (id_towaru, sztuk,cena,kursantki_id) values(2,22,443,2);

alter table sprzedaz add blokada int default 1

DELIMITER $$
create TRIGGER aktualizacjasprzedazy before update on sprzedaz 
for each row 
	begin 
		if(SELECT blokada from sprzedaz where id=NEW.id)>0 then 
        signal sqlstate '45000' set MESSAGE_TEXT = 'Blad: nie mozna zaktualizowac rekordu';
        end if;
    end $$
DELIMITER ;

-- delimiter - separator zaczyna się od deli..$$
-- sqlstate- wyświetla błąd

start TRANSACTION;
update sprzedaz set cena = 300 where id=2;
commit;

INSERT into sprzedaz (id_towaru,sztuk,cena,kursantki_id,blokada) values (1,10,100,2,0);

start TRANSACTION;
update sprzedaz set cena = 300 where id=4;
commit;
--teraz sie zmieniło

-------------
create table zdarzenia(
    id_zdarzenia serial,
	czas timestamp,
    wydarzenia varchar(255),
    uzytkownik varchar(255),
    tablica varchar(255),
    recor_id bigint
)

DELIMITER $$ 
 CREATE TRIGGER logSprzedazy after insert on sprzedaz 
 for EACH row
 BEGIN
 	insert into zdarzenia(wydarzenia,uzytkownik,tablica,recor_id) values ('insert','trigger','sprzedaz',new.id);
    end$$
    DELIMITER ;
-- triger który po dodaniu inserta w polu wydarzenia da insert, uzytkownik wypisze trigger, tablica sprzedaz a id będzie stworzone nowe 

DELIMITER $$
    create trigger nowaSprzedaz after insert on sprzedaz 
    for each row 
    begin
        update kursantki set ostatni_zakup_id =new.id where kursantki_id=new.kursantki_id;
        insert into zdarzenia(wydarzenia,uzytkownik,tablica,recor_id)
        	VALUES('insert','trigger','sprzedaz',NEW.id);
    end $$
DELIMITER ;

insert into sprzedaz (id_towaru, sztuk, cena, kursantki_id, blokada) VALUES(1,555,1010,5,0);

create table memo( 
	memo_id serial,
	tytul varchar(255),
	wpis varchar(255),
	termin date,
	dodanie time);
insert into memo (memo_id,tytul,wpis,termin,dodanie) values(1,'urodziny babci','kupic kwiaty oraz torcik wedlowski','2023-03-09',"13:57:00")
insert into memo (memo_id,tytul,wpis,termin,dodanie) values(3,'rozmowa z szefem','przygotowac plan sprzedaży','2023-03-09',"13:47:00");
alter table memo add COLUMN zdarzenie int default 0
create table sukcesy(
	sukcesy_id serial,
    wydarzenie varchar(255),
    czas timestamp
)


DELIMITER $$
    create trigger addsuccess after update on memo
    for each row 
    begin
        if new.zdarzenie>0 THEN
        INSERT INTO sukcesy (wydarzenie, czas)
        VALUES (NEW.tytul, NOW());
end IF;
    end $$
DELIMITER ;

