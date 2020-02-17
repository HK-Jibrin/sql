create database airline;
use airline;
CREATE TABLE passengers (
  Pass_id  INT(10) AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  FirstName VARCHAR(20)  NOT NULL,
  LastName   VARCHAR(20) NOT  NULL,
  Age INT(2) NOT NULL,
  Gender VARCHAR(7)  NOT NULL,
  Email VARCHAR(20) NOT NULL,
  PhoneNumber VARCHAR(11)  NOT NULL,
  Address VARCHAR(35) NOT NULL,
  Next_of_king_num VARCHAR(11) NOT NULL
  );
  
  CREATE TABLE  flight_details (
  flight_id int(10) PRIMARY KEY NOT NULL,
  From_city varchar(20) NOT NULL,
  Destination_city varchar(20) NOT NULL,
  Departure_Date date NOT NULL,
  Arrival_Date  date NOT NULL,
  Departure_Time time NOT  NULL,
  Arrival_Time time NOT NULL,
  Seats_Economy  int(5) NOT NULL,
  pass_fk integer(10) NOT NULL,
  Seats_Business int(5) NOT NULL,
  Price_Economy int(10) NOT NULL,
  Price_Business int(10) NOT NULL,
  Jet_fk  int (4) NOT NULL,
  FOREIGN KEY (pass_fk) references passengers(pass_id),
  FOREIGN KEY (Jet_fk) references jet_details(Jet_id)
  );
  
  CREATE TABLE IF NOT EXISTS jet_details (
  Jet_id INT (4) PRIMARY KEY NOT NULL,
  Jet_Type VARCHAR(15)NOT NULL,
  Total_Capacity INT(3) NOT NULL,
  is_active BOOLEAN NOT NULL
  );
  
 CREATE TABLE IF NOT EXISTS paymentdetails (
  Payment_id INT(9)  PRIMARY KEY NOT NULL,
  Payment_Date DATE DEFAULT NULL,
  Payment_Amount DECIMAL(18,2) NOT NULL,
  Payment_Mode VARCHAR(15) NOT NULL,
  flight_fk int (10) NOT NULL,
  FOREIGN KEY (flight_fk) references flight_details(flight_id)
); 
  
  CREATE TABLE IF NOT EXISTS ticketdetails (
  Ticket_id INT(15) PRIMARY KEY NOT NULL,
  Date_of_Reservation DATE NOT NULL,
  flight_no VARCHAR(10) NOT NULL,
  Departure_Date DATE NOT NULL,
  Class VARCHAR(10) NOT NULL,
  Booking_Status BOOLEAN NOT NULL,
  flight_fk INT (10) NOT NULL,
  Pass_no INT (10) NOT NULL,
  
  payment_fk int(9) NOT NULL,
  FOREIGN KEY (pass_no) REFERENCES passengers(pass_id),
  FOREIGN KEY (Payment_fk) references paymentdetails(Payment_id) 
);


 