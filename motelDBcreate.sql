CREATE TABLE Fall22_S001_8_CUSTOMER(
	CUST_ID	 char(9) 	not null,
	fName	 varchar(25) 	not null,
	lName	 varchar(25) 	not null,
    Email    varchar(30)    not null,
	primary key(CUST_ID),
	unique(Email)
);

CREATE TABLE Fall22_S001_8_CUSTOMER_CONTACT(
	contact_CUST_ID	 char(9) 	not null,
	CONTACT	 varchar(20),
	primary key(contact_CUST_ID, CONTACT),
    foreign key(contact_CUST_ID) references Fall22_S001_8_CUSTOMER(CUST_ID)
        on delete cascade
);

CREATE TABLE Fall22_S001_8_ROOM(
	ROOM_ID	 int 	not null,
	BED	 varchar(10),
	SMOKING varchar(10),
	primary key(ROOM_ID)
);

CREATE TABLE Fall22_S001_8_BOOKING(
	CONF_NO	 char(9) 	not null,
	CHECKIN	 date	not null,
	CHECKOUT date	not null,
    	CONSTRAINT not_valid CHECK(CHECKOUT > CHECKIN),
	PAYMENT_TYPE varchar(10),
	AMOUNT float (10),
	BOOKING_SOURCE varchar(20),
	DATE_OF_BOOKING date,
	booking_CUST_ID char(9) not null,
	booking_ROOM_ID int not null, 
	primary key(CONF_NO),
    foreign key(booking_CUST_ID) references Fall22_S001_8_CUSTOMER(CUST_ID)
        on delete cascade,
	foreign key(booking_ROOM_ID) references Fall22_S001_8_ROOM(ROOM_ID)
        on delete cascade
);

CREATE TABLE Fall22_S001_8_REFUND(
	REFUND_ID	char(9) 	not null,
	REASON	 varchar(30),
	AMOUNT float (10),
	refund_CUST_ID char(9) not null,
	refund_CONF_NO	 char(9) 	not null,
	primary key(REFUND_ID),
	foreign key(refund_CUST_ID) references Fall22_S001_8_CUSTOMER(CUST_ID)
        on delete cascade,
	foreign key(refund_CONF_NO) references Fall22_S001_8_BOOKING(CONF_NO)
        on delete cascade
);

CREATE TABLE Fall22_S001_8_REVIEWS(
	REVIEW_ID	char(9) not null,
	review_CUST_ID char(9) not null,
	REASON	 varchar(30),
	primary key(REVIEW_ID),
	foreign key(review_CUST_ID) references Fall22_S001_8_CUSTOMER(CUST_ID)
        on delete cascade
);