use dz5;
CREATE TABLE Analysis
(
    an_id   INT  PRIMARY KEY,
    an_name VARCHAR(30) NOT NULL,
    an_cost  INT NOT NULL,
    an_price INT NOT NULL,
    an_group VARCHAR(30) NOT NULL
    
);
CREATE TABLE Groups_an
(
    gr_id   INT AUTO_INCREMENT PRIMARY KEY,
    gr_name VARCHAR(30) NOT NULL,
    gr_temp  VARCHAR(30) NOT NULL
  
    );

CREATE TABLE Orders
(
    ord_id   INT AUTO_INCREMENT PRIMARY KEY,
    ord_datetime datetime NOT NULL,
    ord_an  int NOT NULL,
   FOREIGN KEY (ord_an) REFERENCES Analysis(an_id) ON DELETE CASCADE);
    
INSERT INTO Analysis values
(1, 'analys1' , 10, 12, 1),
(2, 'analys2' , 15, 18, 3),
(3, 'analys3' , 20, 25, 2);

INSERT INTO groups_an values
(1, 'gr1' , 'a1'),
(2, 'gr2' , 'a2'),
(3, 'gr3' , 'a2');

INSERT INTO orders values
(1, '2020-02-02' , '1'),
(2, '2020-02-07' , '2'),
(3, '2020-02-09' , '1'),
(4, '2020-02-10' , '3'),
(5, '2020-02-01' , '2');


SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';

--- задание 3 

CREATE TABLE Trains
(
    train_id   INT ,
    station character varying(20) NOT NULL,
    station_time time  NOT NULL
    );
INSERT INTO trains values
(110, 'San Francisco' , '10:00:00'),
(110, 'Redwood City' , '10:54:00'),
(110, 'Palo Alto' , '11:02:00'),
(110, 'San Jose' , '12:35:00'),
(120, 'San Francisco' , '11:00:00'),
(120, 'Palo Alto' , '12:49:00'),  
(120, 'San Jose' , '13:30:00');

SELECT train_id, station, station_time,
subtime(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM trains;

    
    
