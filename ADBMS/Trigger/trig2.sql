use company;
create table product(pid varchar(10) primary key,name varchar(20),price int,qtyinstock int);
create table sale(saleid varchar(10) primary key,deladdress varchar(30));
create table saleitem(saleid varchar(10),pid varchar(10),qty int,primary key(saleid,pid),foreign key(pid) references product(pid));
desc saleitem;
insert into product values(1,'Soap',30,100);
insert into sale values(101,'23 Cherokee');
insert into saleitem values(101,1,34);
select * from saleitem;
select * from product;
