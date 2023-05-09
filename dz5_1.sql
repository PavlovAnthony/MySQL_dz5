use dz5;
CREATE TABLE Cars_price
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost  INT NULL
);

INSERT INTO Cars_price (name, cost) VALUES ('Audi', 52642);
INSERT INTO Cars_price (name, cost) VALUES ('Mercedes', 57127);
INSERT INTO Cars_price (name, cost) VALUES ('Skoda', 9000);
INSERT INTO Cars_price (name, cost) VALUES ('Volvo', 29000);
INSERT INTO Cars_price (name, cost) VALUES ('Bentley', 350000);
INSERT INTO Cars_price (name, cost) VALUES ('Citroen', 21000);
INSERT INTO Cars_price (name, cost) VALUES ('Hummer', 41400);
INSERT INTO Cars_price (name, cost) VALUES ('Volkswagen', 21600);

-- автомобили стоимостью до 25000
CREATE VIEW cars AS
SELECT * FROM Cars_price
WHERE cost < 25000;
-- изменение представления
ALTER VIEW cars AS
SELECT * FROM Cars_price
WHERE cost < 30000;

-- представление, в котором будут только "Шкода" и "Ауди"

CREATE VIEW cars_2 AS
SELECT * FROM Cars_price
WHERE name = "Audi" OR name = "Skoda";