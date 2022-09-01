use db;
drop table news;
drop table reminders;
drop table user;
drop table userprofile;

CREATE TABLE News (
    NewsId int primary key,
    Title nvarchar(50) not null,
    Content nvarchar(1000) not null,
    PublishedAt datetime(6) not null,
    CreatedBy nvarchar(50) not null,
    Url nvarchar(50),
    UrlToImage nvarchar(50),
    foreign key (CreatedBy) references UserProfile(UserId)
);

CREATE TABLE UserProfile (
    UserId nvarchar(50) primary key,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Contact nvarchar(50),
    Email nvarchar(50),
    CreatedAt datetime(6) not null
);

CREATE TABLE User (
UserId nvarchar(50) references UserProfile(UserId),
Password nvarchar(50) not null,
primary key(UserId)
);

create table Reminders(
 ReminderId int primary key not null,
 Schedule datetime(6) not null,
 NewsId int  not null,
 foreign key (NewsId) references News (NewsId)
 );
       
INSERT INTO User (UserId, Password)
 values ('Jack', 'pass@123');
 INSERT INTO User (UserId, Password)
 values ('John', 'something@123');
 INSERT INTO User (UserId, Password)
 values ('Kevin', 'test@123');
 
 select * from user;
       
insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(101, 'IT industry in 2020', 'It industry was facing disruptive changes in 2019. It is expected to have positive growth in 2020', '2019-12-05', 'Jack', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values
(102, '2020 FIFA U-17 Women World Cup', 'The tournament will be held in India between 2 and 21 November 2020. It will mark the first time that India has hosted a FIFA women football tournament.', '2019-12-05', 'Jack', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(103, 'chandrayaan2-spacecraft', 'The Lander of Chandrayaan-2 was named Vikram after Dr Vikram A Sarabhai, the Father of the Indian Space Programme. It was designed to function for one lunar day', '2019-12-05', 'John', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(104, 'NEFT transactions to be available 24x7', 'Bank customers will be able to transfer funds through NEFT around the clock on all days including weekends and holidays from December 16', '2019-12-07', 'John', null, null);

select * from news;

insert into reminders (ReminderId, Schedule, NewsId)
values (1, '2019-12-04', 101);

insert into reminders (ReminderId, Schedule, NewsId)
values (2, '2019-12-10', 102);

insert into reminders (ReminderId, Schedule, NewsId)
values (3, '2019-12-10', 104);

select * from reminders;

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('Jack', 'Jackson', 'James', '8899776655', 'jack@ymail.com', '2019-12-07');

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('John', 'Johnson', 'dsouza', '7869543210', 'john@gmail.com', '2019-12-25');

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('Kevin', 'Kevin', 'Lloyd', '9878685748', 'kevin@gmail.com', '2019-12-01');

select * from userprofile;

/*Cerinta 1 */
select * from userprofile where CreatedAt > '2019-12-10';

/*Cerinta 2 */
select * from userprofile up join news n on up.UserId = n.CreatedBy
where up.UserId = 'Jack';

/*Cerinta 3 */
select * from userprofile up join news n on up.UserId = n.CreatedBy
join user u on up.UserId = u.UserId
where n.NewsId = 103;

/*Cerinta 4*/
select * from userprofile up left join news n on up.UserId = n.CreatedBy
where n.CreatedBy is null; 

/*Cerinta 5*/
select * from news n join reminders r on n.NewsId = r.NewsId
where r.newsId is not null;

/*Cerinta 6*/

select UserId, count(n.NewsId) as numar_stiri from userprofile up join news n 
on up.UserId = n.CreatedBy
group by n.CreatedBy;

/*Cerinta 7*/

update userprofile set contact = '9192939495'
where userId='John';
select * from userprofile;

/*Cerinta 8*/

update news set title = 'IT industry growth can be seen in 2020'
where newsId = 101;

select * from news;

/*Cerinta 9*/

DELETE r
  FROM reminders r 
  JOIN news n ON r.NewsId = n.NewsId
 WHERE n.CreatedBy = 'Jack';
 
select * from reminders;

/*Cerinta 10*/

INSERT INTO  reminders 
SELECT ReminderId, Schedule, NewsId 
FROM reminders r 
RIGHT JOIN news n
ON r.NewsId = n.NewsId
where n.NewsId = 103;

insert into reminders (ReminderId, Schedule, NewsId)
values (1, '2019-12-30', 103);


select * from reminders;
use db;
drop table news;
drop table reminders;
drop table user;
drop table userprofile;

CREATE TABLE News (
    NewsId int primary key,
    Title nvarchar(50) not null,
    Content nvarchar(1000) not null,
    PublishedAt datetime(6) not null,
    CreatedBy nvarchar(50) not null,
    Url nvarchar(50),
    UrlToImage nvarchar(50),
    foreign key (CreatedBy) references UserProfile(UserId)
);

CREATE TABLE UserProfile (
    UserId nvarchar(50) primary key,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Contact nvarchar(50),
    Email nvarchar(50),
    CreatedAt datetime(6) not null
);

CREATE TABLE User (
UserId nvarchar(50) references UserProfile(UserId),
Password nvarchar(50) not null,
primary key(UserId)
);

create table Reminders(
 ReminderId int primary key not null,
 Schedule datetime(6) not null,
 NewsId int  not null,
 foreign key (NewsId) references News (NewsId)
 );
       
INSERT INTO User (UserId, Password)
 values ('Jack', 'pass@123');
 INSERT INTO User (UserId, Password)
 values ('John', 'something@123');
 INSERT INTO User (UserId, Password)
 values ('Kevin', 'test@123');
 
 select * from user;
       
insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(101, 'IT industry in 2020', 'It industry was facing disruptive changes in 2019. It is expected to have positive growth in 2020', '2019-12-05', 'Jack', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values
(102, '2020 FIFA U-17 Women World Cup', 'The tournament will be held in India between 2 and 21 November 2020. It will mark the first time that India has hosted a FIFA women football tournament.', '2019-12-05', 'Jack', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(103, 'chandrayaan2-spacecraft', 'The Lander of Chandrayaan-2 was named Vikram after Dr Vikram A Sarabhai, the Father of the Indian Space Programme. It was designed to function for one lunar day', '2019-12-05', 'John', null, null);

insert into news(NewsId, Title, Content, PublishedAt, CreatedBy, Url, UrlToImage)
values 
(104, 'NEFT transactions to be available 24x7', 'Bank customers will be able to transfer funds through NEFT around the clock on all days including weekends and holidays from December 16', '2019-12-07', 'John', null, null);

select * from news;

insert into reminders (ReminderId, Schedule, NewsId)
values (1, '2019-12-04', 101);

insert into reminders (ReminderId, Schedule, NewsId)
values (2, '2019-12-10', 102);

insert into reminders (ReminderId, Schedule, NewsId)
values (3, '2019-12-10', 104);

select * from reminders;

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('Jack', 'Jackson', 'James', '8899776655', 'jack@ymail.com', '2019-12-07');

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('John', 'Johnson', 'dsouza', '7869543210', 'john@gmail.com', '2019-12-25');

insert into userprofile(UserId, FirstName, LastName, Contact, Email, CreatedAt)
values
('Kevin', 'Kevin', 'Lloyd', '9878685748', 'kevin@gmail.com', '2019-12-01');

select * from userprofile;

/*Cerinta 1 */
select * from userprofile where CreatedAt > '2019-12-10';

/*Cerinta 2 */
select * from userprofile up join news n on up.UserId = n.CreatedBy
where up.UserId = 'Jack';

/*Cerinta 3 */
select * from userprofile up join news n on up.UserId = n.CreatedBy
join user u on up.UserId = u.UserId
where n.NewsId = 103;

/*Cerinta 4*/
select * from userprofile up left join news n on up.UserId = n.CreatedBy
where n.CreatedBy is null; 

/*Cerinta 5*/
select * from news n join reminders r on n.NewsId = r.NewsId
where r.newsId is not null;

/*Cerinta 6*/

select UserId, count(n.NewsId) as numar_stiri from userprofile up join news n 
on up.UserId = n.CreatedBy
group by n.CreatedBy;

/*Cerinta 7*/

update userprofile set contact = '9192939495'
where userId='John';
select * from userprofile;

/*Cerinta 8*/

update news set title = 'IT industry growth can be seen in 2020'
where newsId = 101;

select * from news;

/*Cerinta 9*/

DELETE r
  FROM reminders r 
  JOIN news n ON r.NewsId = n.NewsId
 WHERE n.CreatedBy = 'Jack';
 
select * from reminders;

/*Cerinta 10*/

INSERT INTO  reminders 
SELECT ReminderId, Schedule, NewsId 
FROM reminders r 
RIGHT JOIN news n
ON r.NewsId = n.NewsId
where n.NewsId = 103;

insert into reminders (ReminderId, Schedule, NewsId)
values (1, '2019-12-30', 103);
