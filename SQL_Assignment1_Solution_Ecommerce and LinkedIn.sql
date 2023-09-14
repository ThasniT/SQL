/* Question 1- Ecommerce - Query to return ids of product that have zero likes */

create database ecommerce;
use ecommerce;

create table product_info
(
id int PRIMARY KEY,
name varchar(30));

create table prod_info_likes(
id int,
usid int,
likeddate date,
FOREIGN KEY(usid) REFERENCES product_info(id)
);

insert into product_info values(1001,"ab"),(1002,"bc"),(1003,"we");
select * from product_info;
insert into prod_info_likes values(1,1001,"1989-07-19"),(2,1003,"2023-08-13");

select * from product_info;
select * from prod_info_likes;
select * from product_info where id not  in (select usid from prod_info_likes );


/* Question 2-  LinkedIn - To list the candidates who possess all the required skills */

create database course;
use course;

create table coursetab3(
id int ,
name1 varchar(30),
course varchar(40));

insert into coursetab3 values(1,"abc","DS"),(2,"zxc","Python"),(3,"ert","qwe");
insert into coursetab3 values(1,"abc","Python"),(1,"zxc","SQL"),(3,"qwe","vgd");

select id from coursetab3 where course="DS" and id in 
(select id from coursetab3 where course="Python" and id in 
(select id from coursetab3 where course="SQL"));
