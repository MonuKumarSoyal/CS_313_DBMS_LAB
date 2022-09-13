-- Q.1 Command  ----------------------------

create user lab3@localhost identified by 'Password*123';
grant all privileges on lab3.* to lab3@localhost;
mysql -u lab3 -p
Password*123
create database lab3;
use lab3;

-- Q.2 Command ------------------------------

-- creating the part table 
create table part (
    part_no  int,
    part_name varchar(30),
    color varchar(50),
    weight float,
    primary key(part_no)
    );

-- creating the supplier table

create table supplier(
    supplier_no int,
    sup_name    varchar(30),
    city varchar(50),
    bank varchar(20),
    primary key(supplier_no)
);

-- creating the shipment table 

create table shipment(
    shipment_no int,
    part_no int,
    supplier_no int,
    date varchar(20),
    quantity  int,
    price float,
    primary key(shipment_no),
    foreign key(part_no) references part(part_no),
    foreign key(supplier_no) references supplier(supplier_no)
);


-- Q.3 Command ---------------------------------

-- For part table
insert into part
values(1, "partname1", "red", 100);

-- For supplier table

insert into supplier
values(01, "supplier_1", "Mumbai", "BOB");

-- For shipment table

insert into shipment
values(1, 1, 1, "2/9/2022", 10, 100000.0);

-- Q.5 Command  -----------------------------------

-- (a).
select * from part natural join supplier natural join shipment where color = "red";

-- (b).
select sum(shipment.price), supplier.supplier_no from part, supplier, shipment where shipment.supplier_no = supplier.supplier_no and part.part_no = shipment.part_no group by supplier.supplier_no;

-- (c).
select supplier.supplier_no, sup_name from part, supplier, shipment where shipment.supplier_no = supplier.supplier_no and part.part_no = shipment.part_no group by supplier.supplier_no having count(distinct part.part_no) = (select count(distinct part_no) from part);