CREATE TABLE car_dealership;
CREATE TABLE salesperson;
CREATE TABLE cars;
CREATE TABLE customers;
CREATE TABLE mechanics;
CREATE TABLE invoice;
CREATE TABLE service_title;
CREATE TABLE repair_shop;
ALTER TABLE cars
ADD price NUMERIC(2,9);
ALTER TABLE cars
ADD 'year' int;
ALTER TABLE cars
ADD make varchar(25);
ALTER TABLE cars
ADD model varchar(25);
ALTER TABLE cars
ADD serial_number NUMERIC;
ALTER TABLE cars 
ADD service_number NUMERIC;
ALTER TABLE salesperson
ADD name varchar(25);
ALTER TABLE salesperson 
ADD employee_id NUMERIC;
ALTER TABLE salesperson 
ADD sales int;
ALTER TABLE salesperson
ADD salary NUMERIC;
ALTER TABLE repair_shop 
ADD repair_date date;
ALTER TABLE repair_shop 
ADD serial_number NUMERIC;
ALTER TABLE repair_shop
ADD cars_fixed int;
ALTER TABLE mechanics
ADD name varchar(25);
ALTER TABLE mechanics
ADD shop_id int;
ALTER TABLE mechanics 
ADD repairs int;
ALTER TABLE car_dealership 
ADD name varchar(25);
ALTER TABLE car_dealership 
ADD address varchar(25);
ALTER TABLE car_dealership 
ADD income NUMERIC;
ALTER TABLE customers
ADD name varchar(25);
ALTER TABLE customers
ADD customer_id int;
ALTER TABLE customers
ADD purchases int;
ALTER TABLE customers
ADD main_car NUMERIC;
ALTER TABLE service_title 
ADD repair_date date;
ALTER TABLE service_title
ADD ticket_id int;
ALTER TABLE service_title
ADD serial_number NUMERIC;
ALTER TABLE invoice
ADD invoice_id NUMERIC;
ALTER TABLE invoice 
ADD price NUMERIC;
ALTER TABLE invoice 
ADD serial_number NUMERIC;
INSERT INTO car_dealership (name, address, income)
VALUES ('Johns Cars Supreme', '123 vroom St', 1000000);
INSERT INTO salesperson (name, employee_id, sales, salary)
VALUES
    ('Henry Whitaker', 3001, 32, 40000),
    ('Julie Smith', 3002, 18, 48000),
    ('Mike Johnson', 3003, 35, 55000),
    ('Sarah Wilson', 4004, 45, 45000),
    ('Brad Hopefield', 1005, 22, 52000);
   
INSERT INTO cars (price, "year", make, model, serial_number, service_number)
VALUES
    (25000.00, 2002, 'Ford', 'Explorer', 123456789, 1),
    (28000.00, 2001, 'Honda', 'Pilot', 987654321, 2),
    (22000.00, 2019, 'Ford', 'Escape', 555555555, 3),
    (32000.00, 2020, 'Chevrolet', 'Malibu', 777777777, 4),
    (27000.00, 2021, 'Nissan', 'gtr', 888888888, 5);
   
INSERT INTO customers (name, customer_id, purchases, main_car)
VALUES
    ('Alice Jetter', 10001, 3, 987654321),
    ('Bob Smith', 10002, 2, 555555555),
    ('Ichigo Kurusaki', 10003, 4, 123456789),
    ('Dave Plax', 10004, 1, 777777777),
    ('Eve Davis', 10005, 5, 888888888);
   
INSERT INTO mechanics (name, shop_id, repairs)
VALUES
    ('Mark Zuckerberg', 1, 30),
    ('Joseph Joestar', 2, 28),
    ('David Bowie', 1, 35),
    ('Dwight Yoakam', 3, 22),
    ('James Bond', 2, 27);

 INSERT INTO invoice (invoice_id, price, serial_number)
VALUES
    (1, 500.00, 123456789),
    (2, 600.00, 987654321),
    (3, 450.00, 555555555),
    (4, 700.00, 777777777),
    (5, 550.00, 888888888);
   
 INSERT INTO repair_shop (repair_date, serial_number, cars_fixed)
VALUES
    ('2023-09-20', 123456789, 3),
    ('2023-09-21', 987654321, 2),
    ('2023-09-22', 555555555, 4),
    ('2023-09-23', 777777777, 1),
    ('2023-09-24', 888888888, 5);


INSERT INTO service_title (repair_date, ticket_id, serial_number)
VALUES
    ('2023-09-20', 101, 123456789),
    ('2023-09-21', 102, 987654321),
    ('2023-09-22', 103, 555555555),
    ('2023-09-23', 104, 777777777),
    ('2023-09-24', 105, 888888888);
   
CREATE OR REPLACE FUNCTION add_car(
    IN p_price NUMERIC(2,9),
    IN p_year INT,
    IN p_make VARCHAR(25),
    IN p_model VARCHAR(25),
    IN p_serial_number NUMERIC,
    IN p_service_number NUMERIC
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO cars (price, "year", make, model, serial_number, service_number)
    VALUES (p_price, p_year, p_make, p_model, p_serial_number, p_service_number);
END;
$$ LANGUAGE plpgsql;

SELECT add_car(300000.00, 2022, 'Lamborghini', 'Aventador', 999999999, 6);

SELECT add_car(30000.00, 2022, 'Toyota', 'Corolla', 777777777, 7);

