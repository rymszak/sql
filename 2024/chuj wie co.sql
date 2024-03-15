drop PROCEDURE if EXISTS Kraj;
DELIMITER $$
CREATE PROCEDURE Kraj(in kod varchar(3), out wyjscie text)
begin 
	SELECT concat(Name, ' ', Continent,' ',Region) from Country where CODE= kod;
end $$
DELIMITER ; 
