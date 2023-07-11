/*
ЗАДАНИЕ 1:
1. Создать базу данных «Перевозки», используя соответствующий скрипт.
2. Заполнить таблицу «Клиент» данными.
3. При заполнении таблицы «Клиент» для всех строк, содержащих тип «Торговая
компания» использовать не конкретное значение, а значение по умолчанию.
4. Заполнить оставшиеся 3 таблицы базы данных, используя соответствующий
скрипт.
*/

-- Create tables
CREATE TABLE Car(
CarID integer NOT NULL,
DriverFullName character varying(50) NOT NULL
);
CREATE TABLE City(
CityName character varying(50) NOT NULL,
Population bigint NOT NULL
);
CREATE TABLE Client(
ClientID integer NOT NULL,
Name character varying(50) NOT NULL,
YearlyIncome bigint NOT NULL,
Type character varying(30) NOT NULL
);
CREATE TABLE Transportation(
TransportationID integer NOT NULL,
ClientID integer NOT NULL,
Weight numeric(6, 2) NOT NULL,
CarID integer NOT NULL,
City character varying(50) NOT NULL,
TransportationDate date NULL,
Cost money NULL
);

-- Add primary keys
ALTER TABLE Car ADD CONSTRAINT PK_Car PRIMARY KEY (CarID);
ALTER TABLE City ADD CONSTRAINT PK_City PRIMARY KEY (CityName);
ALTER TABLE Client ADD CONSTRAINT PK_Client PRIMARY KEY (ClientID);
ALTER TABLE Transportation ADD CONSTRAINT PK_Transportation PRIMARY KEY
(TransportationID);

-- Add Foreign Keys

ALTER TABLE Transportation ADD CONSTRAINT FK_Transportation_City FOREIGN KEY(City)
REFERENCES City (CityName);
ALTER TABLE Transportation ADD CONSTRAINT FK_Transportation_Car FOREIGN KEY(CarID)
REFERENCES Car (CarID);
ALTER TABLE Transportation ADD CONSTRAINT FK_Transportation_Client FOREIGN
KEY(ClientID) REFERENCES Client (ClientID);

-- Add default
ALTER TABLE Client ALTER COLUMN Type SET DEFAULT 'Торговая компания';

-- Fill data
INSERT INTO Car (CarID, DriverFullName) VALUES (10, 'Джейк Стинсон');
INSERT INTO Car (CarID, DriverFullName) VALUES (36, 'Джон Доу');
INSERT INTO Car (CarID, DriverFullName) VALUES (59, 'Карл Шелленг');
INSERT INTO Car (CarID, DriverFullName) VALUES (82, 'Курт Дженсен');
INSERT INTO Car (CarID, DriverFullName) VALUES (126, 'Патрик Джонсон');
INSERT INTO Car (CarID, DriverFullName) VALUES (328, 'Роберт Маккинли');
INSERT INTO Car (CarID, DriverFullName) VALUES (493, 'Стюарт Макнили');
INSERT INTO Car (CarID, DriverFullName) VALUES (564, 'Джейк Стинсон');
INSERT INTO Car (CarID, DriverFullName) VALUES (821, 'Брэд Вингейт');
INSERT INTO Car (CarID, DriverFullName) VALUES (957, 'Джон Стинсон');
INSERT INTO City (CityName, Population) VALUES ('Атланта', 1200000);
INSERT INTO City (CityName, Population) VALUES ('Балтимор', 1200000);
INSERT INTO City (CityName, Population) VALUES ('Денвер', 1700000);
INSERT INTO City (CityName, Population) VALUES ('Джексонвиль', 7800);
INSERT INTO City (CityName, Population) VALUES ('Лос-Анжелес', 5000000);
INSERT INTO City (CityName, Population) VALUES ('Оклахома-Сити', 1100000);
INSERT INTO City (CityName, Population) VALUES ('Сент-Луис', 800000);
INSERT INTO City (CityName, Population) VALUES ('Солт-Лейк-Сити', 2100000);
INSERT INTO City (CityName, Population) VALUES ('Су-Сити', 3000);
INSERT INTO City (CityName, Population) VALUES ('Эль-Пасо', 9500);

INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (100,'АКМЕ, инк',150000000,'Производитель');
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (235, 'Стар-трейд',17500000, 'Оптовый продавец');
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (311, 'Ист-трейд', 25000000, 'Оптовый продавец');
INSERT INTO Client VALUES (433, 'Братья Уилсон', 47000);
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (523, 'ДВМ, лтд', 750000, 'Оптовый продавец');
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (680, 'Грант, лтд',500000, 'Производитель');
INSERT INTO Client VALUES (736, 'Глория', 36000);
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (798, 'Джон Смит и Ко', 50000, 'Производитель');
INSERT INTO Client VALUES (831, 'Вест-рок', 25000);
INSERT INTO Client (ClientID, Name, YearLyincome, Type) VALUES (999, 'Дагобар', 100000, 'Производитель');

INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (1111, 100, 1000.00, 957, 'Атланта', '2017-01-20',
10241.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (1367, 831, 0.50, 10, 'Су-Сити', '2017-01-20', 210.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (1679, 100, 9000.00, 82, 'Атланта', '2017-01-25',
80654.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (2500, 311, 30.00, 126, 'Атланта', '2017-01-25', 515.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (2647, 999, 300.00, 564, 'Денвер', '2017-02-10', 3543.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (2894, 433, 95.00, 821, 'Солт-Лейк-Сити', '2017-02-10',
1024.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (3012, 311, 500.00, 328, 'Балтимор', '2017-02-10',
5621.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (3158, 736, 15.00, 10, 'Джексонвиль', '2017-02-13',
255.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (3244, 235, 400.00, 82, 'Сент-Луис', '2017-02-13',
4698.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (3450, 433, 100.00, 328, 'Атланта', '2017-02-15', 2541.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (3654, 311, 100.80, 59, 'Оклахома-Сити', '2017-02-20',
3698.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (4567, 523, 210.00, 493, 'Атланта', '2017-02-20', 4500.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (4897, 680, 200.00, 126, 'Денвер', '2017-02-23', 5298.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (5324, 680, 145.00, 564, 'Атланта', '2017-02-28', 3471.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (5674, 680, 500.00, 493, 'Солт-Лейк-Сити', '2017-02-28',
7524.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (5985, 235, 2000.00, 36, 'Атланта', '2017-02-28',
25412.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (6321, 798, 30.00, 10, 'Эль-Пасо', '2017-03-04', 420.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (6548, 523, 400.00, 957, 'Балтимор', '2017-03-04',
6450.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (6982, 736, 360.00, 821, 'Атланта', '2017-03-05', 5369.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (7321, 798, 480.00, 10, 'Атланта', '2017-03-05', 8452.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (7645, 831, 15.30, 59, 'Эль-Пасо', '2017-03-12', 156.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (8254, 433, 280.00, 126, 'Оклахома-Сити', '2017-03-13',
3920.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (8347, 235, 3000.00, 82, 'Балтимор', '2017-03-14',
30587.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (8631, 831, 200.00, 59, 'Атланта', '2017-03-19', 3870.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (8864, 523, 900.00, 493, 'Лос-Анжелес', '2017-03-20',
9635.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (9452, 999, 80.00, 82, 'Атланта', '2017-03-20', 986.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (9654, 831, 30.75, 10, 'Су-Сити', '2017-04-01', 400.0000);
INSERT INTO Transportation (TransportationID, ClientID, Weight, CarID, City,
TransportationDate, Cost) VALUES (9999, 235, 310.00, 36, 'Сент-Луис', '2017-04-15',
4632.0000);

/*
ЗАДАНИЕ 2:
1. Вывести название клиента с кодом 680.
2. Какой пункт назначения у груза № 3244?
3. Перечислить уникальные номера грузовиков, перевозивших грузы весом более
100 кг
4. Выдать все данные о грузах весом не менее 20 кг
5. Отобразить только строки с 3 по 5 результирующего набора данных, полученных
в задании 4.
6. Создать алфавитный список клиентов с годовым доходом более 100000
долларов.
7. Выдать названия и средний месячный доход клиентов, имеющих годовой доход
свыше 10 миллионов долларов, но менее 50 миллионов долларов.
*/

SELECT ClientID, Name
FROM Client
WHERE ClientID = 680;

SELECT TransportationID, City
FROM Transportation
WHERE TransportationID = 3244;

SELECT DISTINCT CarID
FROM Transportation
Where Weight >100;

SELECT *
FROM Transportation
WHERE Weight >=20;

SELECT *
FROM Transportation
WHERE Weight >=20
LIMIT 3
OFFSET 2;

SELECT Name, YearLyincome
FROM Client
WHERE YearLyincome between 10000000 and 50000000;

/*
ЗАДАНИЕ 2:
8. Выдать идентификаторы клиентов, отправлявших грузы в Атланту, Сент-Луис или
Балтимор.
*/

SELECT ClientID, City 
FROM Transportation
Where City='Атланта'
OR City ='Сент-Луис'
OR City ='Балтимор';

/*
ЗАДАНИЕ 2:
9. Выдать идентификаторы клиентов, отправлявших грузы в города, названия
которых не начинаются с буквы «С».
*/

SELECT ClientID, City
FROM Transportation
Where City not like 'С%';

/*
ЗАДАНИЕ 2:
10. Выдать идентификаторы клиентов, отправлявших грузы в города, названия
которых заканчиваются «-Сити».
*/

SELECT ClientID, City
FROM Transportation
Where City like '%-Сити';

/*
ЗАДАНИЕ 2:
11. Выдать названия клиентов, в названии которых третья буква — заглавная «М».
*/

SELECT Name
FROM Client
Where name like 'М%';

/*
ЗАДАНИЕ 2:
12. Для каждой записи в таблице “Перевозка” с использованием выражения Case
вывести значение “Лёгкий” для всех грузов не более 1000 кг , для остальных -
“Тяжёлый”
*/

SELECT Weight,
    CASE 
       When weight < 1000 then 'Лёгкий'
       Else 'Тяжёлый'
    END
FROM Transportation;


/*
ЗАДАНИЕ 3:
1. Для каждой записи в таблице “Грузовик” найти позицию, на которой в столбце
с ФИО водителя находится пробел.
2. Для каждой записи в таблице “Грузовик” вывести имя и фамилию каждого
водителя в отдельных столбцах.
3. Для каждой записи в таблице “Грузовик” вывести фамилию и инициалы
(первую букву имени) водителя.
*/


Select DriverFullName
from car
Where  DriverFullName like '% %';


Select *,
substring (driverfullname from 1 for position (' ' in driverfullname)) as name,
substring (driverfullname from position (' ' in driverfullname)) as surname
from car;

select carid,
substring (driverfullname from position (' ' in driverfullname)) || ' '||left(substring (driverfullname from 1 for position (' ' in driverfullname)),1) || '.'
from car;

/*ЗАДАНИЕ 4
1. Для каждой записи в таблице “Перевозка” выдать вес каждого груза,
округлённый до ближайшего целого в большую сторону.
2. Для каждой записи в таблице “Перевозка” показать разницу в днях, месяцах и
годах между датой её выполнения и текущей датой.
3. Для каждой записи в таблице “Перевозка” показать в отдельном столбце
сводную информацию о перевозке вида “01.01.2020 г. осуществлена перевозка в
г. Атланта весом 500 кг на сумму 5000 USD”.
4. Для каждой записи в таблице “Перевозка” показать в отдельных столбцах день,
месяц и дату перевозки.
5. Используя функцию CASE, на основе результатов задания 4 отобразить месяц
перевозки в текстовом виде (на русском языке).
6. Используя функцию CASE, на основе результатов задания 4 определить сезон
перевозки (зима, весна, лето, осень).*/

/*4.1. Для каждой записи в таблице “Перевозка” выдать вес каждого груза,
округлённый до ближайшего целого в большую сторону.*/
SELECT ceiling (weight)
From Transportation
/*4.2. Для каждой записи в таблице “Перевозка” показать разницу в днях, месяцах и
годах между датой её выполнения и текущей датой.*/
SELECT Transportationid,
clientid,
weight,
carid,
city,
Current_date - transportationdate as dni,
(Current_date - transportationdate)/30 as mesyats,
(Current_date - transportationdate)/365 as goda,
"cost"
From Transportation
/*4.3. Для каждой записи в таблице “Перевозка” показать в отдельном столбце
сводную информацию о перевозке вида “01.01.2020 г. осуществлена перевозка в
г. Атланта весом 500 кг на сумму 5000 USD”.*/
SELECT concat (transportationdate,'Осуществляется перевозка в город',city,'Весом', ceiling(weight),'На сумму',cast("cost" as numeric), 'USD') as inforormatsiya
From Transportation
/*4.4. Для каждой записи в таблице “Перевозка” показать в отдельных столбцах день,
месяц и дату перевозки.*/
SELECT
Transportationid,
clientid,
weight,
carid,
city,
transportationdate,
Extract (day from transportationdate ) as dni,
Extract (month from transportationdate ) as mesyats,
Extract (year from transportationdate ) as goda,
"cost"
From Transportation