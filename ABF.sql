create database ABF
use ABF
--------Tạo bảng------------
--Bảng Blog
create table Blog(
blogID int identity(1,1) primary key,
userID int not null,
userApproveID int not null,
subjectID int not null,
title nvarchar(50) not null,
content nvarchar(max) not null,
date nvarchar(50) not null,
updateDate nvarchar(50),
image nvarchar(max),
video nvarchar(50),
numberOfVotes int not null,
numberOfComments int,
status nvarchar(10) not null)
--Bảng User
create table [User](
userID int identity(1,1) primary key,
fullName nvarchar(250) not null,
roleID int not null,
email nvarchar(255) not null,
gender nvarchar(50),
dateOfBirth nvarchar(50),
image nvarchar(max),
status nvarchar(10) not null)
--Bảng Role
create table Role(
roleID int identity(1,1) primary key,
roleName nvarchar(50) not null)
--Bảng Comment
create table Comment(
commentID int identity(1,1) primary key,
blogID int not null,
userID int not null,
content nvarchar(max) not null,
date nvarchar(50) not null,
replyID int,
status nvarchar(10) not null)
--Bảng Subject
create table Subject(
subjectID int identity(1,1) primary key,
subjectName nvarchar(250) not null,
majorID int not null,
status nvarchar(10) not null)
--Bảng Major
create table Major(
majorID int identity(1,1) primary key,
majorName nvarchar(50) not null,
status nvarchar(10) not null)
--Bảng Registration
create table RegistrationDetail(
subjectID int not null,
registrationID int not null,
date nvarchar(50) not null)
--Bảng RegistrationDetails
create table Registration(
registrationID int identity(1,1) primary key,
userID int not null,
certificate image not null)
--Bảng Feedback
create table Feedback(
feedbackID int identity(1,1) primary key,
userID int not null,
feedbackTypeID int not null,
description nvarchar(max) not null,
date nvarchar(50) not null)
--Bảng FeedbackType
create table FeedbackType(
feedbackTypeID int identity(1,1) primary key,
feedbackName nvarchar(50) not null
)
--------Thêm khoá ngoại------------
alter table Blog add foreign key (userID) references [User](userID)
alter table Blog add foreign key (subjectID) references Subject(subjectID)
alter table [User] add foreign key (roleID) references Role(roleID)
alter table Comment add foreign key (blogID) references Blog(blogID)
alter table Comment add foreign key (userID) references [User](userID)
alter table Comment add foreign key (replyID) references Comment(commentID)
alter table Subject add foreign key (majorID) references Major(majorID)
alter table RegistrationDetail add foreign key (subjectID) references Subject(subjectID)
alter table RegistrationDetail add foreign key (registrationID) references Registration(registrationID)
alter table Registration add foreign key (userID) references [User](userID)
alter table Feedback add foreign key (userID) references [User](userID)
alter table Feedback add foreign key (feedbackTypeID) references FeedbackType(feedbackTypeID)
--------Thêm ràng buộc------------
alter table Blog add constraint checkTitle check (len(trim(title)) > 15)
alter table Blog add constraint checkContent check (len(trim(content)) > 50)
alter table [User] add constraint checkFullName check (len(trim(fullName)) > 10)

insert into Role(roleName) values('Student')
insert into [User](fullName,roleID,gmail,gender,dateOfBirth,image,status)
values ('Phan Thi To Quyen', 1, 'quyenpttse150351@fpt.edu.vn', null, null, null, 1)
select * from Role
use ABC
drop database ABF
drop table Blog
SELECT userID, fullName, roleID, gmail, gender, dateOfBirth, image, status
            FROM [User] WHERE gmail like 'quyenpttse150351@fpt.edu.vn'
			delete from [User] where gmail like 'quyenpttse150351@fpt.edu.vn'
INSERT INTO [User](fullName, roleID, email, gender, dateOfBirth, image, status)
            VALUES('quyenpttse150351',1,'quyenpttse150351@fpt.edu.vn',null,null,null,1)