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
