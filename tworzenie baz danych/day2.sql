początek w sakilla day 3
CREATE table magazyn(
    id serial,
    nazwa varchar(100),
    alejka set('biala','czerwona','zielona'));
insert into magazyn(nazwa, alejka) VALUES('Mleko','biala');
insert into magazyn(nazwa, alejka) VALUES('Ser','czerwona');
insert into magazyn(nazwa, alejka) VALUES('Jogurt','zielona');
insert into magazyn(nazwa, alejka) VALUES('Jogurt owocowy','zielona,biala');
insert into magazyn(nazwa, alejka) VALUES('Jogurt Jagodowy','zielona,biala,czerwona');
insert into magazyn(nazwa, alejka) VALUES('Jogurt Sernikowy','3');

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

-- dodanie w set działa przez dodawanie 3=1+2 4=dodany jako trzeci 5=1+4 6=2+4 7=1+2+4 8 to kolejny element  itd działa na podstawie 2^x a następny 2^x+2^x+1 itd
-- sakila podzapytanie 
-- select customer_id, SUM(amount), avg(amount) from payment where customer_id in (SELECT customer_id from customer where first_name='MARION');
