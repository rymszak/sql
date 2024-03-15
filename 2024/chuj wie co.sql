drop PROCEDURE if EXISTS Kraj;
DELIMITER $$
CREATE PROCEDURE Kraj(in kod varchar(3), out wyjscie text)
begin 
	SELECT concat(Name, ' ', Continent,' ',Region) from Country where CODE= kod;
end $$
DELIMITER ; 


DELIMITER $$
create function witaj()
returns text
DETERMINISTIC
begin 
	return 'witaj na zajęciach p nierodki SQL';
END $$
DELIMITER ;
select witaj() as 'Powitanie';


DELIMITER $$
CREATE FUNCTION witajUczniu(imie varchar(20))
returns text
DETERMINISTIC
begin 
return CONCAT('Witaj ' , imie, ' na zajęciach P.Nierodki SQL');
end $$
DELIMITER ;
SELECT witajUczniu('Kamil');
