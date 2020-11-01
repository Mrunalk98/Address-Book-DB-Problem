-- UC 2
create table address_book_table(
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Address varchar(30) NOT NULL,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
Zip int NOT NULL,
PhoneNumber varchar(10) NOT NULL,
Email varchar(30) NOT NULL
);

select * from address_book_table;

-- UC 3
insert into address_book_table values('John', 'Doe', '120 jefferson', 'Riverside', 'NJ', 80750, '5896541589', 'john@abc.com');
insert into address_book_table values('Jack', 'McGinnis', '220 hobo Av.', 'Phila', 'PA', 91190, '7596541589', 'jack@abc.com');
insert into address_book_table values('Stephen', 'Tyler', '7452 Terrace', 'Riverside', 'SD', 912340, '8569541589', 'ste@abc.com');
insert into address_book_table values('Joan', 'Anne', '201 jefferson', 'Desert City', 'NJ', 70750, '8522541589', 'joan@abc.com');
insert into address_book_table values('Sam', 'Huge', '20th Street', 'SomeTown', 'PA', 95750, '4852541589', 'sam@abc.com');

-- UC 4
update address_book_table set PhoneNumber='9985637415' where FirstName='Joan';

-- UC 5
delete from address_book_table where FirstName='Stephen';

-- UC 6
select FirstName, LastName from address_book_table where City='Phila' or State='PA';

-- UC 7
select COUNT(City) as SizeOfAddressBook from address_book_table;
select COUNT(State) as SizeOfAddressBook from address_book_table;

-- UC 8


