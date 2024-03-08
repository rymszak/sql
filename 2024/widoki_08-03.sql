
--widok to zapytanie do bazy danych zapisane pod jakąś nazwą

SELECT GNP as PKB,
  Name as kraj,
  continent as kontynent,
  population as populacja,
  SurfaceArea as powierzchnia,
  LifeExpectancy as DlugoscZycia 
  FROM `country`;

SELECT 
	GNP as PKB,
	Name as kraj, 
	continent as kontynent, 
	population as populacja, 
	SurfaceArea as powierzchnia, 
	LifeExpectancy as DlugoscZycia 
FROM 
	`country`
order by PKB DESC;
======================================================================================================================================
CREATE VIEW pozycjaPKB as							
  SELECT 
	  GNP as PKB,
	  Name as kraj, 
	  continent as kontynent, 
	  population as populacja, 
	  SurfaceArea as powierzchnia, 
	  LifeExpectancy as DlugoscZycia 
  FROM 
  	`country`
  order by PKB DESC;

SELECT PKB,kraj FROM `pozycjapkb`

CREATE view miasta AS
	SELECT 	
    	Name as nazwa,
        CountryCode as kodKraju,
        District as dystrykt,
        population as populacja
	from city
    order by name

CREATE view jezyk AS
	SELECT 	
        CountryCode as kodKraju,
        `Language` as jezyk, 
        IsOfficial as oficjalny,
        Percentage as procent
	from countrylanguage
    order by `language`;


=============================================
@nazwa:=nl+1 ---------- zmianna     
set @nr :=0;
SELECT @nr := @nr+1,PKB,kraj,DlugoscZycia from pozycjapkb
select * from jezyk where oficjalny = "F";

==============================================
sakila

SELECT CONCAT(C.first_name,' ',C.last_name) as klient,
sum(P.amount) as zaplata,
avg(P.amount) as srednia
from payment as P,customer as C 
where 
C.customer_id=P.customer_id
group by C.customer_id
order by zaplata desc

create view platnosci as
SELECT CONCAT(C.first_name,' ',C.last_name) as klient,
sum(P.amount) as zaplata,
avg(P.amount) as srednia
from payment as P,customer as C 
where 
C.customer_id=P.customer_id
group by C.customer_id
order by zaplata desc;
================================
zrób widok z 2 tabelek na world
create view jezyk_miasta AS
select nazwa,
dystrykt,
procent,
jezyk,
populacja
from miasta
join jezyk on jezyk.kodKraju=miasta.kodKraju
=============================================
widoki w sekila i stwórz 3

	CREATE view info_klienta AS
	SELECT
	concat(customer.first_name,' ',customer.last_name) as imie_i_nazwisko,
    address.address as adres,
    city.city as miasto,
    country as kraj
from customer 
join address on address.address_id=customer.address_id
join city on city.city_id=address.city_id 
join country on country.country_id=city.country_id

create view aktor_info AS
select 
concat(actor.first_name,' ',actor.last_name) as imie_i_nazwisko,
film.title as tytuł,
language.name as język
from actor join film_actor on film_actor.actor_id=actor.actor_id
join film on film.film_id=film_actor.film_id
join language on language.language_id = film.language_id
	
połączyć world kraj z jezykiem
