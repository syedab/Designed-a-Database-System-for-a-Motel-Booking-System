update Fall22_S001_8_CUSTOMER set lname='Smith' where CUST_ID=9;
update Fall22_S001_8_CUSTOMER set Email='chery@uta.edu' where CUST_ID=15;



update Fall22_S001_8_ROOM set BED='Double' where ROOM_ID=105;
update Fall22_S001_8_ROOM set SMOKING='No' where ROOM_ID=117;
update Fall22_S001_8_ROOM set BED='Double' where ROOM_ID=213;
update Fall22_S001_8_ROOM set BED='Double' where ROOM_ID=204;



update Fall22_S001_8_BOOKING set AMOUNT=1000 where CONF_NO='34C233';
update Fall22_S001_8_BOOKING set CHECKIN=to_date('2022-5-20','YYYY-MM-DD'), CHECKOUT=to_date('2022-5-23','YYYY-MM-DD') where CONF_NO='94A233';
update Fall22_S001_8_BOOKING set CHECKIN=to_date('2022-5-23','YYYY-MM-DD'), CHECKOUT=to_date('2022-5-26','YYYY-MM-DD') where CONF_NO='54B213';
delete from FALL22_S001_8_BOOKING where CONF_NO='36A346';
delete from FALL22_S001_8_BOOKING where CONF_NO='85K525';
delete from FALL22_S001_8_BOOKING where CONF_NO='75D346';
update Fall22_S001_8_BOOKING set PAYMENT_TYPE='Card' where CONF_NO='64C233';
update Fall22_S001_8_BOOKING set PAYMENT_TYPE='Card' where CONF_NO='84A233';
update Fall22_S001_8_BOOKING set PAYMENT_TYPE='Card' where CONF_NO='98B233';



update Fall22_S001_8_REFUND set REASON='NO NO NO NO NO' where REFUND_ID='H453';
