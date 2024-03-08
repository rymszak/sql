
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



@nazwa:=nl+1 ---------- zmianna     
set @nr :=0;
SELECT @nr := @nr+1,PKB,kraj,DlugoscZycia from pozycjapkb
select * from jezyk where oficjalny = "F";


sakila

SELECT CONCAT(C.first_name,' ',C.last_name) as klient,
sum(P.amount) as zaplata,
avg(P.amount) as srednia
from payment as P,customer as C 
where 
C.customer_id=P.customer_id
group by C.customer_id
order by zaplata desc

