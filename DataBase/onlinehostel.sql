drop user hostel cascade
/
create user hostel identified by hostel
/
grant dba to hostel
/
conn hostel/hostel
create table Employee
(
	Staff_id nvarchar2(50) constraint Staffi_d_pk1 primary key,constraint Staff_id_pk2 check(staff_id like 'E___'),
	Email_id nvarchar2(50),
	First_name nvarchar2(100),
	Last_name nvarchar2(100),
	Fathers_name nvarchar2(100),  
	Gender nvarchar2(10),
	Age number(3),
	Dob nvarchar2(20),
	Phone nvarchar2(20),
	Address nvarchar2(200),
	State nvarchar2(30), 
	City nvarchar2(30),
	pincode number(6),
	Description nvarchar2(200),
	status nvarchar2(100),
	Start_date nvarchar2(10),
	End_date nvarchar2(10),
	Job_title nvarchar2(100)
)
/
create table hostel
(
	Hostel_id nvarchar2(10) constraint hostel_id_pk1 primary key,constraint hostel_id_pk2 check(hostel_id like 'H___'),
	Hostel_Name nvarchar2(100),
	Address nvarchar2(200),
	City nvarchar2(200),
	State nvarchar2(30),
	Pincode number(8),
	Phone nvarchar2(20),
	Manager_id nvarchar2(50),
	number_employee number(10)
)
/
create table room_type
(
	Room_number nvarchar2(50) constraint Room_Number_Invalid primary key,
	Room_type nvarchar2(30),
	Room_price number(8)
)
/
create table Room
(
	Room_number nvarchar2(5),
	Room_image nvarchar2(200),
	Room_description nvarchar2(200),
	Hostel_id nvarchar2(10)
)
/
create table customer_details
(
	Customer_id nvarchar2(50) constraint Customer_Id_Invalid1 primary key,
	Email_id nvarchar2(50),
	First_name nvarchar2(100),
	Last_name nvarchar2(100),
	Gender nvarchar2(10),
	Age number(3),
	Address nvarchar2(200),
	City nvarchar2(30),
	State nvarchar2(30),
	Pincode number(5),
	Phone nvarchar2(20)
)
/
create table Booking
(
	Booking_id nvarchar2(50) constraint Booking_Id_Invalid1 primary key,
	Customer_id nvarchar2(50),
	Room_number nvarchar2(5),
	Hostel_id nvarchar2(10),
	Booking_date nvarchar2(10),
	Check_in_date nvarchar2(10),
	Check_out_date nvarchar2(10),
	Number_of_night nvarchar2(5)
)
/
create table Payment_Receipt
(
	Payment_id nvarchar2(50) constraint Payment_id_pk1 primary key,
	Customer_id nvarchar2(50),
	Booking_id nvarchar2(50),
	First_name nvarchar2(100),
	Last_name nvarchar2(100),
	payment_mode nvarchar2(20),
	Payment_details nvarchar2(100),
	amount number(10),
	dues number(10)
)
/
create table login
(
	login_id nvarchar2(40),
	login_password nvarchar2(100),
	Counter number(4)
)
/
insert into login values('get','project',5)
/
create table adminlogin
(
	adminid nvarchar2(30),
	adminpassword nvarchar2(40)
)
/
insert into adminlogin values('admin','admin')
/
--update login set counter=? where login_id=? and login_password=?;
--/
---update login set counter=3 where login_id='get' and login_password='project'
--/
--update login set counter="+counter+" where login_id="+id+ "and login_password="+pwd
--/
alter table hostel modify Manager_id constraint Manager_Id_Not_Found references employee(staff_id) on delete cascade
/
alter table room modify hostel_id constraint Hostel_Id_Invalid2 references hostel(hostel_id) on delete cascade
/
alter table booking modify customer_id constraint Customer_Id_Invalid3 references customer_details(customer_id) on delete cascade
/
alter table booking modify room_number constraint Room_Number_Invalid3 references room_type(room_number) on delete cascade
/
alter table booking modify hostel_id constraint Hostel_id_Invalid3 references hostel(hostel_id) on delete cascade
/
alter table payment_receipt modify customer_id constraint Customer_Id_Invalid4 references customer_details(customer_id) on delete cascade
/
alter table payment_receipt modify booking_id constraint Booking_Id_Invalid3 references booking(booking_id) on delete cascade
/