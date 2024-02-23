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
			 tranzakcje-automatyczne zmienianie

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
