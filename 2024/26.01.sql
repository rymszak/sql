26.01.2024
create DATABASE kursantki

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

