-- This query will give the total number of reservation in all the month.
select extract(month from DATE_OF_BOOKING), count(CONF_NO) from FALL22_S001_8_BOOKING group by extract(month from DATE_OF_BOOKING);


-- This query will tell that in which month motel generated the highest revenue so that owner can increase the price for that month in upcoming year to maximize the revenue.
select extract(month from DATE_OF_BOOKING), sum(AMOUNT) from FALL22_S001_8_BOOKING group by extract(month from DATE_OF_BOOKING) order by sum(AMOUNT) desc;


-- This query will give the total number of reservation received from third party which will help the owner to renew the contract with third party website.
select BOOKING_SOURCE, count(CONF_NO) from FALL22_S001_8_BOOKING group by BOOKING_SOURCE order by count(CONF_NO) desc;


-- This query will give the customer details with the reason and amount of refund.
select fName,lName,CUST_ID,CONF_NO,REF.AMOUNT,REASON from Fall22_S001_8_CUSTOMER C,Fall22_S001_8_BOOKING B, Fall22_S001_8_REFUND REF where B.CONF_NO=REF.refund_CONF_NO AND C.CUST_ID=B.booking_CUST_ID;


-- This query will give the information about which room is occupied on any given day.
select fName,lName,B.booking_ROOM_ID as Room_No,ROOM.BED,ROOM.SMOKING,checkin,CHECKOUT from Fall22_S001_8_CUSTOMER C,Fall22_S001_8_BOOKING B, Fall22_S001_8_ROOM ROOM where C.CUST_ID=B.booking_CUST_ID AND extract(day from B.checkin) < 22 AND extract(day from B.CHECKOUT) > 22 AND extract(month from checkin)=6 AND B.booking_ROOM_ID=ROOM.ROOM_ID;

-- This query will give that via which booking source motel generated the most revenue.
select BOOKING_SOURCE, PAYMENT_TYPE, sum(AMOUNT) from FALL22_S001_8_BOOKING group by rollup (BOOKING_SOURCE, PAYMENT_TYPE);

-- This query will give he list of total distinct reservation received from different third parties in any given month.
select count(DISTINCT BOOKING_CUST_ID) as No_of_booking, BOOKING_SOURCE, DATE_OF_BOOKING as Booking_Date from FALL22_S001_8_BOOKING where extract(day from DATE_OF_BOOKING) < 31 AND extract(day from DATE_OF_BOOKING) > 01 AND extract(month from DATE_OF_BOOKING)=3 group by cube (BOOKING_SOURCE, DATE_OF_BOOKING);


--This query will provide that how many times customer took refund for the issues.
select DISTINCT REASON, COUNT(REASON) OVER (Partition by REASON) as REASON from Fall22_S001_8_REFUND;


--This query will give the information about the customer who has booked room more than once.
select fName,lName from Fall22_S001_8_CUSTOMER where CUST_ID in (select booking_CUST_ID from FALL22_S001_8_BOOKING group by booking_CUST_ID having COUNT(CONF_NO) >1 );