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

select FirstName, LastName, COUNT(State) from address_book_table group by FirstName, LastName order by LastName;
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
select * from address_book_table order by FirstName desc;

-- UC 9
alter table address_book_table add AddressBookName varchar(20) NOT NULL default '';
alter table address_book_table add AddressBookType varchar(20) NOT NULL default '';

update address_book_table set AddressBookType='Family' where FirstName='John' or FirstName='Sam';
update address_book_table set AddressBookType='Friends' where FirstName='Joan';
update address_book_table set AddressBookType='Profession' where FirstName='Jack';

update address_book_table set AddressBookName='Uncles' where FirstName='John' or FirstName='Sam';
update address_book_table set AddressBookType='CollegeFriends' where FirstName='Joan';
update address_book_table set AddressBookType='Capgemini' where FirstName='Jack';

-- UC 10
select COUNT(FirstName) as CountByType from address_book_table where AddressBookType='Family';

-- UC 12
create table address_book_details(
Book_ID int  NOT NULL identity(1,1) PRIMARY KEY,
Book_Name varchar(50) NOT NULL,
Book_Type varchar(50) NOT NULL
);

create table person_details(
Person_ID int  NOT NULL identity(1,1) PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Address varchar(30) NOT NULL,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
Zip int NOT NULL,
PhoneNumber varchar(10) NOT NULL,
Email varchar(30) NOT NULL
);

create table person_book(
Book_ID int FOREIGN KEY REFERENCES address_book_details(Book_ID),
Person_ID int FOREIGN KEY REFERENCES person_details(Person_ID),
PRIMARY KEY (Book_ID,Person_ID)
);

select * from person_details;
select * from address_book_details;
select * from person_book;

insert into address_book_details values ('Relatives', 'Family');
insert into address_book_details values ('Batchmates', 'Friends');
insert into address_book_details values ('Project_Team', 'Profession,');

insert into person_details values('Stephen', 'Tyler', '7452 Terrace', 'Riverside', 'SD', 912340, '8569541589', 'ste@abc.com');
insert into person_details values('Joan', 'Anne', '201 jefferson', 'Desert City', 'NJ', 70750, '8522541589', 'joan@abc.com');
insert into person_details values('Sam', 'Huge', '20th Street', 'SomeTown', 'PA', 95750, '4852541589', 'sam@abc.com');

insert into person_book values (1,1);
insert into person_book values (2,1);
insert into person_book values (2,2);
insert into person_book values (3,3);

update person_details set City='Riverside' where FirstName='Sam';

-- UC 13
select FirstName, LastName, Address, City, State, PhoneNumber, Email, Book_Name, Book_Type
from person_book
inner join person_details on person_details.Person_ID = person_book.Person_ID
inner join address_book_details on person_book.Book_ID = address_book_details.Book_ID;

select FirstName, LastName, Address, State, PhoneNumber, Email, Book_Name, Book_Type
from person_book
inner join person_details on person_details.Person_ID = person_book.Person_ID
inner join address_book_details on person_book.Book_ID = address_book_details.Book_ID
where person_details.City='Riverside' order by FirstName;

select COUNT(FirstName) as Total_Contacts 
from person_book
inner join person_details on person_details.Person_ID = person_book.Person_ID
inner join address_book_details on person_book.Book_ID = address_book_details.Book_ID
where address_book_details.Book_Type='Friends';

