use master 
go
create database empleados
go
use empleados
go
create table positions(
id int not null primary key identity,
job_position varchar(250));

create table employees(
id int not null primary key identity(1, 1),
fname varchar(250) not null,
lname varchar(250), 
email varchar(250),
job_position int not null references positions(id),
gender char(1) not null default 'N',
dui varchar(10) not null
);



insert into positions values ('Jefe');
insert into positions values ('Jefe de desarrollo');
insert into positions values ('CEO');
insert into positions values ('Contador');
insert into employees values ('Eduardo', 'Henríquez', 'eduard_alfons@hotmail.com', 1, 'M', '05253520-5');