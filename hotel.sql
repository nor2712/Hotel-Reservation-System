create database HotelReservation ;
use HotelReservation ;

create table Hotel( hotel_id int primary key auto_increment ,
hotel_name varchar (50) ,
hotel_city varchar (50) ,
hotel_phone_no varchar (20)
);

create table Staff( staff_id int primary key auto_increment ,
staff_first_name varchar (50) ,
staff_last_name varchar (50) ,
staff_city varchar (50) ,
staff_phone_no varchar (50) ,
hotel_id int ,
foreign key (hotel_id) references Hotel(hotel_id)
 );
 
 create table RoomType( room_type_id int primary key auto_increment ,
room_type_name  varchar(50),
maxPerson varchar(50),
prisePerNight float(50)
);

create table Room(room_id int primary key auto_increment ,
room_name varchar(50),
room_description varchar(50),
room_type_id int,
hotel_id int,
foreign key (hotel_id) references Hotel(hotel_id),
foreign key (room_type_id) references RoomType(room_type_id)
);

create table Guest(guest_id int primary key auto_increment ,
guest_firstName varchar(50),
guest_lastName varchar(50),
guest_email varchar(50),
guest_city varchar(50),
guest_phneNo varchar(50)
);

create table Reservation(reservation_id int primary key auto_increment ,
reservation_date date,
checkIn date,
checkOut date,
adult int,
children int,
room_id int,
guest_id int,
foreign key (room_id) references Room(room_id),
foreign key (guest_id) references Guest(guest_id)
);

create table Payment(payment_id  int auto_increment ,
guest_id int ,
payment_date date,
payment_type  varchar(50),
payment_totalPrice float(50),
reservation_id int,
primary key (payment_id, guest_id),
foreign key (reservation_id) references Reservation(reservation_id)
);

insert into Hotel (hotel_id, hotel_name,hotel_city,hotel_phone_no) values( 1719300,'Noormans','Cairo','+2001762561631'); 
insert into Hotel (hotel_name,hotel_city,hotel_phone_no) values( 'Noormans','Giza','+2001926416102');
insert into Hotel (hotel_name,hotel_city,hotel_phone_no) values( 'Noormans','Alexandria','+2001349452695');
insert into Hotel (hotel_name,hotel_city,hotel_phone_no) values( 'Noormans','Tanta','+2001254859147');
insert into Hotel (hotel_name,hotel_city,hotel_phone_no) values( 'Noormans','Aswan ','+2001828455523');

insert into Staff (staff_id, staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 2517450, 'Nada', 'Ahmed', 'Cairo', '+2001314561631', 1719300);
insert into Staff (staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 'Manar', 'Ayman', 'Giza', '+2001971456102', 1719301);
insert into Staff (staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 'Ziad', 'Ahmed', 'Alexandria', '+2001483752695', 1719302);
insert into Staff (staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 'Malak', 'Ashraf', 'Tanta', '+2001670259147', 1719303);
insert into Staff (staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 'Ali', 'Karim', 'Aswan ', '+2001809455523', 1719304);

insert into RoomType (room_type_id, room_type_name, maxPerson, prisePerNight) values( 10,'Single', 1, 50.0);
insert into RoomType (room_type_name, maxPerson, prisePerNight) values( 'Double', 2, 70.0);
insert into RoomType (room_type_name, maxPerson, prisePerNight) values( 'Group Booking', 3, 110.50);
insert into RoomType (room_type_name, maxPerson, prisePerNight) values( 'Travel Agency', 4, 150.0);
 
insert into Room (room_id, room_name, room_description, room_type_id, hotel_id) values( 100, 'First', 'First Floor', 10, 1719300);
insert into Room (room_name, room_description, room_type_id,hotel_id) values( 'Second', 'first Floor', 11, 1719300);
insert into Room (room_name, room_description, room_type_id,hotel_id) values( 'Third', 'Second Floor', 12, 1719300);
insert into Room (room_name, room_description, room_type_id,hotel_id) values( 'Fourth', 'Second Floor', 13, 1719300);

insert into Guest (guest_id, guest_firstName, guest_lastName, guest_email, guest_city, guest_phneNo) values(200, 'Mohamed', 'Sleem', 'mohamed@gamil.com', 'Alex', '+2001747946367');
insert into Guest (guest_firstName, guest_lastName, guest_email, guest_city, guest_phneNo) values( 'Aya', 'Mustafa', 'aya@gamil.com', 'Cairo', '+2001348246367');
insert into Guest (guest_firstName, guest_lastName, guest_email, guest_city, guest_phneNo) values( 'Adam', 'Ebrahim', 'adam@gamil.com', 'Tanta', '+2001670259147');
insert into Guest (guest_firstName, guest_lastName, guest_email, guest_city, guest_phneNo) values( 'Esraa', 'Ahmed', 'esraa@gamil.com', 'Cairo', '+2001750916367');

 insert into Reservation (reservation_id, reservation_date, checkIn, checkOut, adult, children, room_id, guest_id) values( 500, '2020/04/27', '2020/04/27', '2020/05/01', 2, 1, 100, 200);
 insert into Reservation (reservation_date, checkIn, checkOut, adult, children, room_id, guest_id) values( '2020/04/27', '2020/04/27', '2020/05/07', 2, 3, 101, 201);
 insert into Reservation (reservation_date, checkIn, checkOut, adult, children, room_id, guest_id) values( '2020/04/28', '2020/04/28', '2020/05/02', 3, 0, 102, 202);
 insert into Reservation (reservation_date, checkIn, checkOut, adult, children, room_id, guest_id) values( '2020/04/28', '2020/04/28', '2020/05/05', 3, 2, 103, 203);

insert into Payment (payment_id, guest_id, payment_date, payment_type, payment_totalPrice, reservation_id) values(300, 200, '2020/05/01', 'Credit', 500.0, 500);
insert into Payment (guest_id, payment_date, payment_type, payment_totalPrice,reservation_id) values(201, '2020/05/07', 'Cash', 700.0, 501);
insert into Payment (guest_id, payment_date, payment_type, payment_totalPrice, reservation_id) values(201, '2020/05/02', 'Credit', 400.0, 502);
insert into Payment (guest_id, payment_date, payment_type, payment_totalPrice, reservation_id) values(203, '2020/05/05', 'Cash', 800.0, 503);

-- Select Statements 
select * from Hotel ;
select * from Hotel where hotel_name='Noormans';
select hotel_city, hotel_phone_no from Hotel where hotel_city NOT IN ('Cairo', 'Aswan ');
SELECT staff_id, staff_first_name, staff_last_name FROM Staff ORDER BY staff_first_name;
SELECT * FROM Staff WHERE staff_first_name LIKE '%m%';
select * from Staff LIMIT 3;
select count(room_type_id) from RoomType ;
select max(maxPerson) from RoomType;
select * from Room where room_name IN ('First', 'Third');
select * from Room where room_description = 'Second Floor';
SELECT DATEDIFF('2020/05/07', '2020/05/01');
select * from Reservation where checkOut > '2020/05/02' ;
select max(adult) from Reservation
select * from Guest ;
SELECT * FROM Guest WHERE guest_firstName LIKE '%d%';
select count(guest_id) from Guest ;
select max(payment_totalPrice) AS LargestPayment from Payment;
select min(payment_totalPrice) AS SmallestPayment from Payment;
select avg(payment_totalPrice) from Payment;
select sum(payment_totalPrice) AS TotalPayment from Payment where payment_type='Credit';

-- Select using Sub Query
SELECT * FROM Hotel, Room WHERE hotel.hotel_id = Room.hotel_id ;
SELECT * FROM guest, payment WHERE reservation_id = reservation_id ;
SELECT * FROM Reservation, payment WHERE Reservation.guest_id = payment.guest_id ;

-- Select using Count and Group 
 SELECT staff_city, count(staff_id) FROM Staff GROUP BY staff_city ORDER BY staff_city ;
 SELECT count(guest_id), guest_firstName FROM Guest GROUP BY guest_firstName ORDER BY guest_firstName;
 SELECT count(payment_id), payment_date FROM Payment GROUP BY payment_date ORDER BY payment_date;
 
-- Select using Different Joins 
SELECT Room.room_name, Hotel.hotel_city FROM Room INNER JOIN Hotel ON Room.hotel_id = Hotel.hotel_id ;
SELECT Reservation.checkIn, payment.payment_date FROM Reservation INNER JOIN payment ON Reservation.checkOut = payment.payment_date ;
SELECT Reservation.reservation_id, payment.payment_type, payment.payment_totalPrice FROM Reservation left JOIN payment ON Reservation.guest_id = payment.guest_id ;
SELECT Staff.staff_first_name, Guest.guest_firstName FROM Staff left JOIN Guest ON Staff.staff_city = Guest.guest_city ;
SELECT Reservation.reservation_date, Payment.payment_totalPrice FROM Reservation right JOIN Payment ON Reservation.reservation_id = Payment.reservation_id ORDER BY Payment.payment_totalPrice ;

-- Insert Statement 
insert into Hotel (hotel_id, hotel_name,hotel_city,hotel_phone_no) values( 1719300,'Noormans','Cairo','+2001762561631');
insert into Staff (staff_id, staff_first_name, staff_last_name, staff_city, staff_phone_no, hotel_id) values( 2517450, 'Nada', 'Ahmed', 'Cairo', '+2001314561631', 1719300);
insert into RoomType (room_type_id, room_type_name, maxPerson, prisePerNight) values( 10,'Single', 1, 50.0);
insert into Room (room_id, room_name, room_description, room_type_id, hotel_id) values( 100, 'First', 'First Floor', 10, 1719300);
insert into Reservation (reservation_id, reservation_date, checkIn, checkOut, adult, children, room_id, guest_id) values( 500, '2020/04/27', '2020/04/27', '2020/05/01', 2, 1, 100, 200);
insert into Guest (guest_id, guest_firstName, guest_lastName, guest_email, guest_city, guest_phneNo) values(200, 'Mohamed', 'Sleem', 'mohamed@gamil.com', 'Alex', '+2001747946367');
insert into Payment (payment_id, guest_id, payment_date, payment_type, payment_totalPrice, reservation_id) values(300, 200, '2020/05/01', 'Credit', 500.0, 500);

-- Update Statement 
UPDATE Hotel SET hotel_name = 'Noormans', hotel_city= 'Luxor' WHERE hotel_id = 1719302 ;
UPDATE Staff SET staff_first_name = 'Mona', staff_city= 'Luxor' WHERE staff_id = 2517452;
UPDATE RoomType SET room_type_name = 'Private', prisePerNight= '55.50' WHERE room_type_id = 10;
UPDATE Room SET room_name = 'Fifth', room_description= 'First Floor' WHERE room_id = 102;
UPDATE Guest SET guest_firstName = 'Khaled', guest_city= 'Giza' WHERE guest_id = 203;

-- Delete Statement 
DELETE FROM Staff WHERE staff_city='Tanta';
DELETE FROM RoomType WHERE room_type_name='Double';
DELETE FROM Room WHERE room_name='First';
DELETE FROM Reservation WHERE checkOut='2020/05/02';
DELETE FROM Guest WHERE guest_firstName='Aya';