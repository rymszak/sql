zapytania sql dokonujące agregacji - zapytania agregującego - posługują się 3 ważnymi elementami
składowymi:
-klauzula group by ( podział rekordu na grupy)
-funkcje grupowe sql (wyliczenie sum, średnich, odchyleń, min i max dla kazdej grupy)
-klauzula having(odrzucenie grup nie spełniających warunku logicznego)

zapytania agregującego
sum()-suma wartości 
avg()-srednia wartość
min()-najmniejcza wartość
max()-najwieksza wartość
count(*)- liczba wszystkich rekordów grupy

definicja 
select funkcja_grupująca(kolumna) from tabela group by kolumna_grupująca
select miasto, avg(pensja) from pracownicy group by miasto - podział na miasta i średnia pensja pracowników

select avg(pensja) from pracownicy - agiegująca
select round(pensja) from pracownicy - zwykła

  zd 1
wyznacz średnią pensją wszystkich pracówników poza londynem
select miasto, avg(pensja) from pracownicy GROUP by miasto having miasto!="London";
select miasto, avg(pensja) from pracownicy where miasto != "London" GROUP by miasto;
select miasto, avg(pensja) from pracownicy where miasto not like("London")  GROUP by miasto;
select miasto, avg(pensja) from pracownicy where miasto <> "London" GROUP by miasto; - nie w zakresie 

  zd2
wyznacz srednie pensje pracowników z podziałem na miasta a następnie wybierz te grupy (miasta) które średnia pensja przekroczyła 100
select avg(pensja), miasto from pracownicy group by miasto having avg(pensja) > 100;




--------------------------------------------

1) select rok_produkcji, avg(cena) from filmy group by rok_produkcji ORDER by rok_produkcji DESC;
2) select max(cena) as max from filmy;
3) select count(tytul) from filmy where rok_produkcji=1984 GROUP by rok_produkcji;
4) select count(wyporzyczenia.id_kopii) from kopie join wyporzyczenia on kopie.id_filmu=wyporzyczenia.id_filmu where wyporzyczenia.id_filmu=4;
5) select round(avg(data_zwrotu-data_wypozyczenia),1) as round from wypozyczenia JOIN kopie on kopie.id_kopii=wypozyczenia.id_kopii join filmy on filmy.id_filmu=kopie.id_filmu where filmy.tytul='Ronin';

---------------------------------------------------------------------------------------------------------------

6) SELECT filmy.tytul, round(min(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as min,
  round(max(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as max, round(avg(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as sre,
  round(count(kopie.id_kopii),1) as razy FROM `filmy`
join kopie on kopie.id_filmu=filmy.id_filmu
join wypozyczenia on wypozyczenia.id_kopii=kopie.id_kopii
group by filmy.id_filmu;

albo natural join 
  
select filmy.tytul, round(min(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as min, round(max(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as max, 
  round(avg(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as sre, round(count(kopie.id_kopii),1) as razy from filmy
  NATURAL join kopie natural join wypozyczenia group by filmy.id_filmu;

7)SELECT klienci.imie, klienci.nazwisko, count(wypozyczenia.id_klienta) as "count" FROM `klienci` 
  join wypozyczenia on wypozyczenia.id_klienta=klienci.id_klienta group by klienci.id_klienta order by count(wypozyczenia.id_klienta) asc;

albo natural 
SELECT klienci.imie, klienci.nazwisko, count(wypozyczenia.id_klienta) as "count" FROM `klienci` natural join wypozyczenia 
  group by klienci.id_klienta order by count(wypozyczenia.id_klienta) asc;

8) 
