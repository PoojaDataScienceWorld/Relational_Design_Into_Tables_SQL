create database PROJECT_2
use PROJECT_2

--ROLE TABLE
create table ROLE
(

id int,
role_name varchar(100),
constraint role_id_pk primary key(id) --constrain name of Primary key=role_id_pk
)


--USER ACCOUNT TABLE

create table user_account
(
id int,
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50)not null,
password_hash_algorithm varchar(50)
constraint user_account_pk primary key(id)
)


--STATUS TABLE 

create table status
(
id int,
status_name varchar(100),
is_user_working  bit,
constraint status_id_pk primary key(id)

)


--Table Has Role

create table user_has_role
(
id int,
role_start_time datetime,
role_end_time datetime not null,
user_account_id int,
role_id int,
constraint user_has_role_pk primary key(id),
constraint user_has_role_user_account_id_fk foreign key(user_account_id) references user_account(id),
constraint user_has_role_role_id_fk foreign key(role_id) references role(id)
)


--USER_HAS STATUS TABLE

create table user_has_status
(
id int,
status_start_time datetime,
status_end_time datetime not null,
user_account_id int,
status_id int,
constraint user_has_status_id_pk primary key(id),
constraint user_has_status_user_account_id_fk foreign key(user_account_id) references user_account(id),
constraint user_has_status_status_id_fk foreign key(status_id) references status(id)

)


--1. Insert data into each of the above tables. With at least two rows in each of the tables. --Make sure that you have created respective foreign keys.
--INSERT VALUES

--role table
insert into role values
(1,'Biologist'),
(2,'Psychologist')

--status table
insert into status values
(1,'Completed',1),
(2,'Not Completed',0)

--user_account table
insert into user_account values
(1,'Pooja','Pkjha1267@gmail.com','abc','noway','tmp'),
(2,'Anne','anne678@gmail.com','bcd','youtoo','dbn')

--user_has_role table
insert into user_has_role values
(1,'2023-06-08 10:30:41.087','2023-07-01 11:00:41.087',1,2),
(2,'2023-06-10 9:30:41.087','2023-07-07 10:00:41.087',2,1)

-- user_has_status table
insert into user_has_status values
(1,'2023-02-03 1:38:13.660','2023-03-19 10:38:13.660',2,1),
(2,'2023-05-04 1:00:13.660','2023-06-19 11:38:13.660',1,2)

select getdate()
--2. Delete all the data from each of the tables.
--User_has_status TABLE

ALTER table user_has_status drop constraint user_has_status_user_account_id_fk,
user_has_status_status_id_fk,user_has_status_id_pk
				
truncate table user_has_status

--user_has_role

ALTER table user_has_role drop constraint user_has_role_pk,
user_has_role_user_account_id_fk,user_has_role_role_id_fk


truncate table  user_has_role


--role table
alter table role drop constraint role_id_pk

truncate table role

--user_account

alter table user_account drop  constraint user_account_pk

truncate table user_account



--status

alter table status drop constraint status_id_pk

truncate table status

--TO SEE TABLES AFTER TRUNCATION

select * from role
select * from status
select * from user_account
select * from user_has_role
select * from user_has_status