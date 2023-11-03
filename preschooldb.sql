-----LENSA SHASHO 
------DATABASE FOR PRESCHOOL MANAGEMENT


drop database if exists PreschoolDB;

CREATE DATABASE PreschoolDB;
GO

USE PreschoolDB;
GO

Create table Student
(
ChId CHAR (5) PRIMARY KEY   NOT NULL,
ChFName VARCHAR(30) NOT NULL,
ChLName VARCHAR(30) NOT NULL,
gender CHAR(1) NOT NULL,
ChDoB DATE NOT NULL, 
registeredDate DATE NOT NULL,
EnrollmentDate DATE NOT NULL CONSTRAINT DF_DATE DEFAULT GETDATE(),
stAddress VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
state CHAR(2) NOT NULL,
zipCode CHAR(5) NOT NULL,
PhyImpairment CHAR (25),
AllergyType CHAR (15), 
AllergySymptom CHAR (40),
Constraint CK_Student_ChId_Format Check (ChId like ('[A-Z][A-Z][0-9][0-9][0-9]')),
Constraint CK_Student_gender_Format check (gender in ('F', 'M', 'U')),
Constraint CK_Student_state_Format check ([State] like ('[A-Z][A-Z]')),
Constraint CK_Student_zipCode_Fomrat Check (Zipcode like ('[0-9][0-9][0-9][0-9][0-9]') AND (zipcode <> '00000'))
);
GO
Create table Parents
(
ChId CHAR(5) NOT NULL foreign key references Student (ChId),
FatherFullName VARCHAR(50) NOT NULL,
MotherFullName VARCHAR(50) NOT NULL,
SSN CHAR(11) NOT NULL,
strAddress VARCHAR (30) NOT NULL,
city VARCHAR(25) NOT NULL,
[state] CHAR(2) NOT NULL,
zipCode CHAR(5) NOT NULL,
phoneNo1 CHAR(14) NOT NULL,
phoneNo2 CHAR(14) NOT NULL,
email VARCHAR(50) NULL,
CONSTRAINT CK_Parents_SSN_Format check (SSN like ('[0-9][0-9][0-9][-][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT UQ_Parents_SSN_UNIQUE UNIQUE (ssn),
CONSTRAINT CK_Parents_PhoneNo1_Format check (PhoneNo1 like ('[(][0-9][0-9][0-9][)][ ][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_Parents_PhoneNo2_Format check (PhoneNo2 like ('[(][0-9][0-9][0-9][)][ ][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_Parents_Zipcode_FORMAT check (zipcode like ('[0-9][0-9][0-9][0-9][0-9]'))
);
GO


Create table Employee 
(
empId CHAR(5) NOT NULL primary key,
empFName VARCHAR(25) NOT NULL,
empLName VARCHAR(25) NOT NULL,
SSN CHAR(11) NOT NULL,
DoB DATE NOT NULL,
gender CHAR(1) NOT NULL,
salary DECIMAL(8,2) NULL,
employedDate DATE NOT NULL CONSTRAINT EmpDF_DATE DEFAULT GETDATE(),
strAddress VARCHAR (30) NOT NULL,
apt VARCHAR(5) NULL,
city VARCHAR(25) NOT NULL,
[state] CHAR(2) NOT NULL,
zipCode CHAR(5) NOT NULL,
phoneNo CHAR(14) NOT NULL,
email VARCHAR(50) NULL,
empType VARCHAR(20) NOT NULL,
Department char (20) not null,
CONSTRAINT CK_Employee_SSN_Format check (SSN like ('[0-9][0-9][0-9][-][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT UQ_Employee_SSN_UNIQUE UNIQUE (ssn),
CONSTRAINT CK_Employee_GENDER_Value check (gender in ('F', 'M', 'U')),
CONSTRAINT CK_Employee_PhoneNo_Format check (PhoneNO like ('[(][0-9][0-9][0-9][)][ ][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_Employee_ZIPCODE_FORMAT check (zipcode like ('[0-9][0-9][0-9][0-9][0-9]'))
);
GO



create table ClassInfo
(
ClassId char (2) primary key Not null ,
ClassName char (15) Not null,
AgeGroup varchar (5) not null,
RoomNo varchar (4) not null, 
HeadTeacher char (5) foreign key references employee (empid) not null,
AssistantTeacher char (5) foreign key references employee (empid) not null,
CONSTRAINT CK_Classinfo_AgeGroup_FORMAT check (AgeGroup like ('[0-9][-][0-9]'))
);

create table ImmunizationRecord
(
ChId char (5) foreign key references Student (ChId) not null,
Chickenpox char (7)  null,
Diphtheria_Tetanus_WhoopingCough char (7)  null,
Haemophilus_influenza_typeB char (7) null,
Hepatsis_A char (7) null,
Hepatsis_B char (7) null,
Influenza char (7) null,
Measles char (7) null,
Meningococcal char (7)  null,
Pneumococcal char (7)  null,
Polio char (7) null,
Rotavirus char (7) null,
);
GO

Create table AuthorizedPickUp
(
ChId char (5) foreign key references Student (ChId) ,
AuthFName VARCHAR(25) ,
AuthLName VARCHAR(25) ,
gender CHAR(1) ,
SSN CHAR(11) ,
strAddress VARCHAR (30) ,
city VARCHAR(25) ,
[state] CHAR(2) ,
zipCode CHAR(5) ,
phoneNo CHAR(14) ,
CONSTRAINT CK_AuthorizedPickUp_SSN_Format check (SSN like ('[0-9][0-9][0-9][-][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT UQ_AuthorizedPickUp_SSN_UNIQUE UNIQUE (ssn),
CONSTRAINT CK_AuthorizedPickUp_GENDER_Value check (gender in ('F', 'M', 'U')),
CONSTRAINT CK_AuthorizedPickUp_PhoneNo_Format check (PhoneNO like ('[(][0-9][0-9][0-9][)][ ][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_AuthorizedPickUp_ZIPCODE_FORMAT check (zipcode like ('[0-9][0-9][0-9][0-9][0-9]'))
);
GO

Create table BlackList
(
ChId char (5) foreign key references Student (ChId),
UnauthFName VARCHAR(25),
UnauthLName VARCHAR(25) ,
gender CHAR(1) ,
SSN CHAR(11) ,
strAddress VARCHAR (30) ,
city VARCHAR(25) ,
[state] CHAR(2) ,
zipCode CHAR(5) ,
phoneNo CHAR(14),
CONSTRAINT CK_BlockList_SSN_Format check (SSN like ('[0-9][0-9][0-9][-][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_BlockList_GENDER_Value check (gender in ('F', 'M', 'U')),
CONSTRAINT CK_BlockList_PhoneNo_Format check (PhoneNO like ('[(][0-9][0-9][0-9][)][ ][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')),
CONSTRAINT CK_BlockList_ZIPCODE_FORMAT check (zipcode like ('[0-9][0-9][0-9][0-9][0-9]'))

);
GO

Create table AssessmentRecNursery
(
ChId char (5) foreign key references Student (ChId) not null,
ClassId char (2) foreign key references Classinfo (classId) ,
AssessmentDate date not  NULL CONSTRAINT Deflt_DATE DEFAULT GETDATE(),
Reflection_5 int,
Social_development_5 int,
Emotional_development_5 int,
Conflict_resolution_5 int ,
);
GO

create table AssessmentRecPreK
(
ChId char (5) foreign key references Student (ChId) not null,
ClassId char (2) foreign key references Classinfo (classId) ,
AssessmentDate date not  NULL CONSTRAINT Dflt_DATE DEFAULT GETDATE(),
Alphabet_assessment_50 int ,
Math_assessment_50 int,
Team_work_50 int ,
Scissor_skills_50 int ,
patteren_assessment_50 int ,
Name_writing_50 int,
);
GO

create table AssessmentRecKG
(
ChId char (5) foreign key references Student (ChId) not null,
ClassId char (2) foreign key references Classinfo (classId) ,
AssessmentDate date not  NULL CONSTRAINT Dft_DATE DEFAULT GETDATE(),
Know_100 int ,
Math_100 int,
Read_100 int,
Spell_100 int,
Camera_Reading_100 int ,
Camera_spelling_100 int ,
Sentence_reading_100 int ,
Pattern_assessment_100 int ,
Name_writing_100 int ,
);
GO

Create table RegularHealthCheck
(
ChId char (5) foreign key references Student (ChId),
checKupDate date not  NULL CONSTRAINT Def_DATE DEFAULT GETDATE(),
Symptom varchar (100) null,
ActionRequired varchar (100) null, 
);
GO


create table ActivityManagement
(
[Time] varchar (16) not null, 
Task varchar (25) not null,
Led_by CHAR(5) null foreign key references employee (empId)
);
Go

create table Accident_Records
(
AccNo int not null,
ChId char (5) not null foreign key references student (ChId),
AccidentDate datetime default current_timestamp, 
TypeOfAccident varchar (10), 
[Location] varchar (10),
FirstAid varchar (12),
);
GO

create table Revenue
(
ChId char (5) not null foreign key references student (ChId),
RegistrationFee DECIMAL(6,2) null,
Term1 DECIMAL(6,2) Null,
Term2 DECIMAL(6,2) Null,
Term3 DECIMAL(6,2) Null,
Book DECIMAL(6,2) NULL,
InvoiceNo varchar (20) null,
RecieptNo varchar (6) null,
CONSTRAINT CK_Revenue_InvoiceNo_Format check (InvoiceNo like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][-][0-9][0-9][0-9]')),
CONSTRAINT CK_Revenue_RecieptNo_Format check (RecieptNo like ('[A-Z][A-Z][A-Z][0-9][0-9][0-9]')),
);
GO

create table Withdrawal
(
Expense char (100),
Amount decimal (8,2),
DatePaid date not null constraint defl_date default getdate (),
withdrawnBy char (5) foreign key references employee (empId)
);
GO

create table Attendance
(
ChId char (5) foreign key references student (chid), 
SignIn_Time datetime,
SignOut_Time datetime2
);
Go

create table MealPlan
(
[DateName] char (9), 
MealNo varchar (4) primary key,
AM_Snack char (30),
Lunch char (50),
Fruit char (10),
PM_Snack char (50)
);
GO

create table MenuManagement
(
ChId char (5) foreign key references Student (ChId),
Monday varchar (4) foreign key references MealPlan (MealNo),
Tuesday varchar (4) foreign key references MealPlan (MealNo),
Wednesday varchar (4) foreign key references MealPlan (MealNo),
Thursday varchar (4) foreign key references MealPlan (MealNo),
Friday varchar (4) foreign key references MealPlan (MealNo),
);

use preschooldb;

insert into student 
values ('TD001', 'Anna', 'Pablo', 'F', '2/13/2020','10/21/2021','1/20/2022','2578 kk st','Alexandria','VA','22132',NULL,NULL,NULL),			
      ('TD002','Stormi','Walker', 'F','6/10/2019','10/13/2021','1/20/2022','1408 river road','Henrico','VA','27842',NULL,NULL,NULL),			
      ('TD003','Noah','Flynn','M','7/8/2019','11/13/2021','1/20/2022','3601 Lauderdale DR','Richmond','VA','23233',NULL,NULL,NULL),			
      ('TD004','Joel','Mekonnen','M','4/3/2020', '11/15/2021',	'1/20/2022','5930 NC-46', 'Gumberry','NC','27831',NULL,NULL,NULL),			
     ('TD005','Eva', 'William','F','11/26/2019', '11/25/2021', '1/20/2022',	'15 Jackson St', 'Gaston','NC',	'27832',NULL,'milk','vomiting'),
    ('TD006','Linda', 'Micheal', 'F', '6/2/2020','1/15/2022','1/20/2022', '2421 monocacy blvd', 'Frederick', 'MD','21701',NULL,'soy','diarrhaea'),
    ('PK001','Robert','Max','M','1/25/2019','10/11/2021','1/20/2022','14447 Brink Rd','Emphoria','VA','23847',NULL,NULL,NULL),			
    ('PK002','Paul','Andrew','M','7/3/2018','10/13/2021','1/20/2022','810 Schreider St','Fort Detrick','MD','21702',NULL,NULL,NULL),			
   ('PK003','Kevin','Harvey','M','10/20/2018','10/28/2021','1/20/2022','610 Throne St','Gaston','NC','27832',NULL,NULL,NULL),			
('PK004','Brian','Steve','M','2/8/2019','10/28/2021','1/20/2022','314 Northampthon','Henrico','NC','27842','Partially Blind',NULL,NULL),		
('PK005','Amy','Hamilton','F','9/12/2018','10/29/2021','1/20/2022','120 cherry st','Gaston','NC','27832',NULL,NULL,NULL),	
('PK006','Yonas','Mengistu','M','11/26/2018','11/12/2021','1/21/2022','7866 mm ss','silver spring','MD','51763',NULL,NULL,NULL),			
('PK007','Eyob','Abreha','M','12/22/2018','11/13/2021','1/21/2022','1013 lafayette','Fredericks burg','VA','22401',NULL,'Peanut','hives'),
('PK008','Hemen','Mesfin','F','9/10/2018','11/13/2021','1/21/2022','2201 old brick rd','West broad vill','VA','23060',NULL,NULL,NULL),			
('PK009','Kabnat','Seyoum','F',	'10/17/2018','11/21/2021','1/21/2022','320 pleasant hill Rd','Gaston','NC','27832',NULL,NULL,NULL),			
('PK010','Dylan','Jeffery','M','2/5/2019','12/7/2021','1/21/2022','4401 pouncey tract Rd','Glen Allen',	'VA','23060',NULL,NULL,NULL),			
('PK011','Lauren','Marcus','F','8/28/2018','12/7/2021','1/21/2022','361 perimeter Dr','Midlothian','VA','23113',NULL,NULL,NULL),		
('PK012','Laila','Williams','F','4/18/2019','12/17/2021','1/21/2022','5755 cedar Ln','Columbia','MD','20990',NULL,'Egg','Itchy rash'),
('PK013','Kirubel','Philip','M','4/21/2018','1/8/2022','1/21/2022','8306 patterson ave','Tuckahoe','VA','23229',NULL,NULL,NULL),			
('PK014','Rose','Sauel','F','10/16/2018','1/9/2022','1/21/2022','4100 fairfax Dr','Arlington','VA','20321',NULL,NULL,NULL),			
('PK015','Amber','Mattew','F','12/2/2018','1/9/2022','1/21/2022','2300 optz Blvd','Woodbridge','VA','20321',NULL,NULL,NULL),			
('PK016','Isabella','Roger','F','3/10/2019','1/10/2022','1/22/2022','5905 mt eagle Dr','Alexandria','VA','22132',NULL,'peanut','hives'),
('PK017','Liam','Payne','M','7/16/2018','1/16/2022','1/22/2022','51 mannakee st','Rockville','MD','20850',NULL,NULL,NULL),			
('KG001','Sophia','Ahmed','F','7/15/2016','10/14/2021','1/22/2022','319 Boyds Blvd','Ashland','VA','23005',NULL,NULL,NULL),			
('KG002','Amelia','Picasso','F','1/20/2015','10/22/2021','1/22/2022','477 Oilville st','Oilville','VA','23129','Color blind',NULL,NULL),	
('KG003','Benjamin','Franklin','M','12/18/2015','10/30/2021','1/22/2022','729 Warren ave','Hailifax','NC','29160',NULL,NULL,NULL),			
('KG004','Lucas','San Roman','M','12/19/2014','11/14/2021','1/23/2022','563 Vaughan','Vaughan','NC','27832',NULL,NULL,NULL),			
('KG005','Oliver','Wayne','M','9/26/2014','11/20/2021','1/23/2022','407 Mapple ave','Greensvill','VA','22132','partially blind',NULL,NULL),			
('KG006','Emma','Donald','F','12/22/2016','11/22/2021','1/23/2022','2100 Glen Rd','Travilah','MD','28266',NULL,NULL,NULL),			
('KG007','Evelyn','Hart','F','9/13/2016','11/23/2021','1/23/2022','512 frederick ave','Gaithersburg','MD','20878',NULL,NULL,NULL),			
('KG008','Mia','Christoper','F','2/20/2017','11/23/2021','1/23/2022','214 Darnestown rd','Darnestown','MD','23045',NULL,'Egg','Rash'),			
('KG009','Hermen','Abera','F','1/18/2017','11/27/2021','1/24/2022','702Littleton','Littleton','NC','27832',NULL,NULL,NULL),			
('KG010','Nolawit','Mesfin','F','6/19/2015','12/17/2021','1/24/2022','983 Warren St','Warren','NC','27831',NULL,NULL,NULL),			
('KG011','Eggsy','Dave','M','5/26/2017','12/17/2021','1/24/2022','6712 Old Dominion','Mclean', 'VA','23129',NULL,NULL,NULL),			
('KG012','Maverick','Biruk','M','4/22/2016','1/8/2022','1/24/2022','091 Reston','Reston','MD','20990',NULL,NULL,NULL),			
('KG013','Nathaniem','Girum','M','5/7/2016','1/9/2022','1/25/2022','1835 Tysons','Tysons','MD','23229',NULL,NULL,NULL),			
('KG014','Maitte','Levi','F','8/17/2016','1/11/2022','1/25/2022','420 Anderson st','Durham','NC','27708',NULL,NULL,NULL);


INSERT INTO Employee 
	VALUES ('EMP01','Stacy', 'Kathrin', '050-23-1111', '1995-10-07','F',2500,'2018-03-02','1293 Duncan Avenue', '198','Rockville', 'MD','20871', '(707) 890-3212', 'nef@yahoo.com','P','Teacher'),
		   ('EMP02', 'Mena', 'Lewis', '060-23-2222', '1992-09-12','F',3000,'2017-12-02','4080 Marshall Street', '800','Washington', 'DC','20021', '(202) 890-9032', 'mark@gmail.com','P','Teacher'),
		   ('EMP03', 'Khloe', 'Price', '060-21-3333', '1989-10-09','F',2000,'2018-03-02','1331 Edsel Road', 'L21','Woodbridge', 'VA','20321', '(570) 000-2112', 'kathe@gmail.com','C', 'Chef'),
		   ('EMP04', 'Robert', 'Iversen', '070-23-4444', '1987-07-01','M',2000,'2017-09-01','786 Eagle Lane', '234','Columbia', 'MD','20990', '(301) 890-3200', 'rob@yahoo.com','C','Chef'),
		   ('EMP05', 'Rosie', 'Seiler', '080-23-5555', '1985-03-07','F',3500,'2018-03-02','123 Ky St', '698','Bethesda', 'MD','20871', '(332) 890-3212', 'rosie@yahoo.com','P','Director'),
		   ('EMP06', 'Emmanuel', 'Kepa', '908-23-6666', '1990-09-15','M',2500,'2017-12-02','5 Poe Lane', '832','Washington', 'DC','20021', '(204) 890-9032', 'emma@gmail.com','P', 'Teacher'),
		   ('EMP07', 'Alejandra', 'Neftalem', '090-21-7777', '1986-11-03','F',2500,'2018-03-02','1378 Gateway Road', '823','Alexandia', 'VA','20321', '(703) 000-2112', 'dennisned@gmail.com','P', 'Nurse'),
		   ('EMP08', 'Liang', 'Porter', '111-23-8888', '1987-01-01','F',1500,'2017-09-01','825 Victoria Street', '109','Columbia', 'MD','20990', '(249) 890-3200', 'lian@yahoo.com','P', 'Cleaning'),
		   ('EMP09','Neftalem', 'Medhanie' , '222-23-9999', '1988-03-18','M',1500,'2019-03-02','1389 Finwood Road', '007','Germantown', 'MD','20871', '(191) 890-3212', 'rosie@yahoo.fr','P', 'Security'),
		   ('EMP10', 'Christina', 'Rasmussen', '333-23-0000', '1989-03-23','F',1500,'2018-12-02','3520 Nash Street', '002','Washington', 'DC','20021', '(320) 890-9032', 'chris@gmail.com','C', 'Cleaning'),
		   ('EMP11', 'Ruth', 'Kumar', '444-21-1122', '1990-11-24','F',3000,'2019-03-02','4656 Byrd Lane', 'L21','Arlington', 'VA','20321', '(521) 000-2112', 'ruth@gmail.com','P','Teacher'),
		   ('EMP12', 'Daphney', 'Xu', '444-23-2233', '1990-09-01','F',2500,'2019-09-01','3583 Stadium Drive', '100','Beltsville', 'MD','20990', '(260) 890-3200', 'stef@yahoo.com','P', 'Teacher'),
		   ('EMP13', 'Jack', 'Seiler', '555-23-3344', '1982-11-28','M',1500,'2019-03-02','1337 Havanna Street', '498','Clarksburg', 'MD','20871', '(101) 890-3212', 'jes@yahoo.co.uk','C', 'Maintenance'),
		   ('EMP14', 'Andrew', 'Kepa', '666-23-4455', '1990-09-30','M',1500,'2018-12-02','2780 Irish Lane', NULL,'Washington', 'DC','20021', '(511) 890-9032', 'enz@gmail.com','P', 'Security'),
		   ('EMP15', 'Enza', 'Kumar', '777-21-5566', '1983-10-25','F',3000,'2019-03-02','3048 James Avenue', 'L21','Fairfax', 'VA','20321', '(911) 000-2112', 'andkum@gmail.com','P', 'Teacher'),
		   ('EMP17', 'Petra', 'Seiler', '123-23-3456', '1990-09-07','F',2000,'2018-03-02','123 Ky St', '198','Clarksburg', 'MD','20871', '(101) 890-3212', 'ps@yahoo.com','P', 'Casheir');
		  ;
		 GO

	insert into classinfo
	values ('N1','Nursery','2-3','101','EMP11','EMP06'),
           ('P2','PreK','4-5','110','EMP01','EMP12'),
           ('K3','KG','5-7','202','EMP15','EMP02');
GO
insert into parents
values ('TD001','Zachary Pablo','Jessica Drew','561-40-2031','2578 kk st', 'Alexandria','VA','22132','(434) 456-7924','(423) 292-2892',	'ZachP@gmail.com'),
    ('TD002','Joseph walker','Ashley Morgan','901-23-0927','1408 river road','Henrico','VA','27842','(423) 238-2839','(540) 628-7281',	'Ashley@gmail.com'),
     ('TD003','Tyler Flynn','Brittany Sam','793-29-0388','3601 Lauderdale DR','Richmond','VA','23233','(540) 309-7430','(434) 720-2802','Sams@yahoo.com'),
    ('TD004','Seifu Mekonnen','Samantha Stephens','342-45-7845','5930 NC-46','Gumberry','NC','27831','(919) 793-3892','(410) 682-9292','Seifu@hotmail.com'),
    ('TD005','Brandon William','Elizabeth Joshua','514-03-3910','15 Jackson St','Gaston','NC','27832','(910) 720-2873','(910) 691-1883','Brandon41@gmail.com'),
    ('TD006','Dave Micheal','Jennifer Lamar','705-72-5034','2421 monocacy blvd','Frederick','MD','21701','(410) 392-2938','(410) 622-9282','Jenn23@yahoo.com'),
    ('PK001','Verstappen Maison','Megan Malcom','219-73-2102','14447 brink Rd','Emphoria','VA','23847','(703) 289-4901','(240) 628-1814','Ver208@gmail.com'),
   ('PK002','Cameron Andrew','Nicole Marion','093-44-9076','810 Schreider St','Fort Detrick','MD','21702','(240) 629-3940','(919) 891-9293','NicoleMarck@yahoo.com'),
  ('PK003','Sam Harvey','Kayla Justin','874-51-6483','610 Throne St','Gaston','NC','27832','(919) 389-3904','(252) 893-9382','Kaylas@yahoo.com'),
   ('PK004','Jose Steve','Courtney Madison','592-64-8932','314 northampthon','Henrico','NC','27849','(252) 093-9851','(919) 210-8201','JoseSt4@gmail.com'),
  ('PK005','Lewis Hamilton','Melissa Mahir','794-52-4510','120 cherry st','Henrico','NC','27832','(336) 749-3073','(336) 432-8291','Lewis@Mercedes.org'),
  ('PK006','Wolde Mengistu','Adulis Ashenafi','672-21-3905','7866 mm ss','silver spring','MD','51763','(410) 602-4992','(434) 680-2862','Wolde@tti.edu'),
('PK007','Mensur Abreha','Anas Munir','693-27-4038','1013 lafayette','Fredericks burg',	'VA','22401','(725) 627-2923','(725) 729-2791','Mensur26@gmail.com'),
  ('PK008','Sisay Mesfin','Mira Ayaan', '201-78-9201','2201 old brick rd','West broad vill','VA','23060','(757) 728-8047','(804) 739-8201','Miraay@gmail.com'),
  ('PK009','Oliyad Seyoum',	'Asfaw Mulu','682-93-2783',	'320 pleasant hill Rd',	'Gaston','NC','27832','(919) 729-8186','(571) 729-1782','OliSey@tti.edu'),
  ('PK010','Connor Jeffery','Laurel Hasem','563-29-0383','4401 pouncey tract Rd','Glen Allen','VA','23060','(804) 528-8872','(240) 782-9270','Connor@hotmail.com'),
('PK011','Evan Marcus','Andrea Holland','374-73-2921','361 perimeter Dr','Midlothian','VA','23113','(571) 819-1392','(905) 019-2801',	'Andrea@gmail.com'),
 ('PK012','Sean Williams',	'Centhia Anselmo','430-21-3902','5755 cedar Ln','Columbia',	'MD','20990','(240) 291-8833','(803) 022-2838','SeanWill@gmail.com'),
('PK013','Tom Philip','Paula Robert','226-29-2902','8306 patterson ave','Tuckahoe','VA','23229','(705) 281-2973','(725) 782-2921','TomPhil@gmail.com'),
('PK014','Jack Samuel','Iris Ken','684-92-4293','4100 fairfax Dr','Arlington','VA','20321','(803) 749-8281','(252) 682-2829','Jacksam23@yahoo.com'),
('PK015','Luke Mattew','Allison Dustin','239-54-2901','2300 optz Blvd',	'Woodbridge','VA','20321','(725) 728-2822','(771) 829-1892','AllisonD34@gmail.com'),
('PK016','Fredrich Roger','Vanessa Marcus','991-32-3320','5905 mt eagle Dr','Alexandria','VA','22132','(543) 278-4930','(202) 172-8281','FrederickR34@gmail.com'),
('PK017','Jesse Payne','Whittney Luis','102-74-7201','51 mannakee st','Rockville','MD','20850','(301) 728-9921','(457) 782-3461','JessePay@aau.edu'),
('KG001','Mohr Ahmed','Linda Shawn','675-30-2357','319 Boyds Blvd','Ashland','VA','23005','(980) 629-1819','(980) 720-3831','LindaHus93@gmail.com'),
('KG002','Tanner Picasso','Leah Kebede','510-29-4032','477 Oilville st','Oilville','VA','23129','(984) 628-7392','(771) 629-2829','Leahkebede@hotmail.com'),
('KG003','Jake Franklin','Bianca Victor','302-46-5369','729 Warren ave','Hailifax','NC','29160','(828) 781-8292','(749) 870-1193','Biancavictor@gmail.com'),
('KG004','Carlos San Roman','Tara Jobs','542-78-9625','563 Vaughan','Vaughan','NC','27832','(334) 682-9183','(334) 098-6291','JulieEr@yahoo.com'),
('KG005','Travis Wayne','Julie Eric','803-56-9624','407 Mapple ave','Greensville','VA','22132','(252) 629-1812','(516) 299-8391','Traviswayne@asu.org'),
('KG006','Daniel Wattson','Shelby Devin','436-74-9317','2100 Glen Rd','Travilah','MD','28266','(704) 529-8261','(704) 619-8910','Danielwattson@yahoo.com'),
('KG007','Cody Hart','Kathleen Blake','857-50-3843','512 frederick ave','Gaithersburg','MD','20878','(919) 128-3781','(980) 818-7921','KathleenBlake@gmail.com'),
('KG008','Columbus Christoper','Patricia Roman','749-39-2947','214 Darnestown rd','Darnestown','MD','23045','(252) 538-2824','(252) 728-8291','Patriciaroman@hotmail.com'),
('KG009','Mulugeta Abera','Veronica Adane','479-01-3829','702 Littleton','Littleton','NC','27832','(410) 629-1192','(646) 721-2891','Mulugeta@tti.edu'),
('KG010','Befikadu Mesfin','Diana Ronald','367-30-2402','983 Warren St.','Warren','NC',	'27831','(725) 693-2920','(240) 628-8192','mesfin@zayride.org'),
('KG011','Pete Evans','Shelby Gabriel','329-73-2831','6712 Old Dominion',	'Mclean', 'VA',	'23129','(705) 628-1810','(607) 691-1109','Petedave@yahoo.com'),
('KG012','Asfaw Biruk','Ariel Casey','748-29-2932','091 Reston','Reston','MD','20990','(301) 627-1928','(301) 818-0451','Arialcassey@hotmail.com'),
('KG013','Jermiah Girum','Holly Raymond','490-20-4941','1835 Tysons','Tysons','MD','23229','(543) 572-2826','(631) 628-8018','jermigirum@gmail.com'),
('KG014','William Levi','Jenna Phillip','509-84-5049','420 Anderson st','Durham','NC','27708','(803) 692-1928','(315) 628-9991','JennaPhil82@gmail.com');

GO
insert into AuthorizedPickup
values ('TD001','Becky','Menzel','F','455-37-0921','14447 brink Rd','Alexandria','VA','22132','(804) 528-8872'),
('TD002','Joaddan','Denzel','F','309-90-2934','810 Schreider St','Henrico','VA','27842',	'(571) 819-1392'),
('TD003','Zoe','Bill','F','940-21-1687','610 Throne St','Richmond','VA','23233','(240) 291-8833'),
('TD004','Micheal','Sibuh','M','109-33-2346','314 northampthon','Gumberry','NC','27831','(705) 281-2973'),
('TD005','Tom','Peter','M','903-89-8490',	'120 cherry st','Gaston','NC','27832','(803) 749-8281'),
('TD006','Manuel','Jackson','M',	'794-52-4510','120 cherry st','Frederick','MD','21701','(725) 782-2921'),
('PK001','Mel','Lewis',	'F','672-21-3905','7866 mm ss','Emphoria','VA','23847','(252) 682-2829'),
('PK002','Tiffany','Paul','F','787-63-3287','51 mannakee st','Fort Detrick','MD','21702','(202) 172-8281'),
('PK003','Makiba','Alexander','F','565-49-4123','319 Boyds Blvd','Gaston','NC','27832','(240) 782-9270'),
('PK004','Camila','Joe','F', '320-45-3002','1013 lafayette','Henrico','NC','27842','(457) 782-3461'),
('PK005','Lena','Teddy','F','790-08-3038',	'477 Oilville st','Gaston','NC','27832','(905) 019-2801'),
('PK006',	'Joseph','Angel','M','874-51-6483','610 Throne St','Silver Spring',	'MD','51763','(771) 829-1892'),
('PK007','Ralph','Abrico',	'M','592-64-8932','314 Northampthon','Fredericks burg','VA','22401','(705) 281-2973'),
('PK008','Israel','Mola','M','200-92-9019','729 Warren ave','West broad vill','VA','23060','(803) 022-2838'),
('PK009','Laurel','Philip',	'F','115-54-4756','563 Vaughan','Gaston','NC','27832',	'(725) 782-2921'),
('PK010','Eleni','Yemaneh','F',	'219-73-2102','14447 brink Rd',	'Glen Allen','VA','23060','(304) 627-1928'),
('PK011','Violet','Heyman','F',	'873-33-6730','407 Mapple ave','Midlothian','VA','23113','(252) 682-2829'),
('PK012','Kendall','Jared','F','290-65-4100','2100 Glen Rd','Columbia','MD','20990','(749) 870-1193'),
('PK013','Roman','Dolph','F','129-73-9901','512 frederick ave','Tuckahoe','VA','23229','(334) 098-6291'),
('PK014','Beatriz',	'Alonso','F','382-22-1022','214 Darnestown rd','Arlington','VA','20321','(516) 299-8391'),
('PK015','Zandaya','Patricio','F','789-83-6731','702 Littleton','Woodbridge','VA','20321',	'(704) 619-8910'),
('PK016','Jeff','Walker','M','705-72-5034','2421 monocacy blvd','Alexandria','VA','22132','(252) 893-9382'),
('PK017','Oprah','Ford','F','329-63-2928',	'512 frederick ave','Rockville','MD','20850','(919) 128-3781'),
('KG001','Paul','Fernado','M','093-44-9076','214 Darnestown rd','Ashland','VA','23005','(252) 538-2824'),
('KG002','Dawit','Malcum','M','874-01-6483','702 Littleton','Oilville','VA','23129','(410) 629-1192'),
('KG003','Hakeem','Nega','M','209-83-2577','983 Warren St.','Hailifax','NC','29160','(725) 693-2920'),
('KG004','Phoebi','Jay','F','609-52-7811',	'6712 Old Dominion','Vaughan','NC','27832',	'(705) 628-1810'),
('KG005','Kim','Adrian','F','508-34-2720',	'091 Reston','Greensville','VA','22132','(301) 627-1928'),
('KG006','Lopez','Ferdinand','M','992-78-3902','1835 Tysons','Travilah','MD','28266','(543) 572-2826'),
('KG007','Nancy','Sainz','F','565-89-0032','420 Anderson st','Gaithersburg','MD','20878','(803) 692-1928'),
('KG008','Aurora','Dagmawi','F','716-14-6094',	'320 pleasant hill Rd',	'Darnestown','MD','23045','(980) 818-7921'),
('KG009','Scott','Gazli','M','327-77-7099','4401 pouncey tract Rd','Littleton','NC','27832','(252) 728-8291'),
('KG010','Zlatan','Patrianco','M','477-46-5677','361 perimeter Dr','Warren','NC','27831','(646) 721-2891'),
('KG011','Trevor','Carl','M','323-65-8733','3601 Lauderdale DR','McLean', 'VA','23129','(240) 628-8192'),
('KG012','Lisa','Johnson','F','240-74-9853','5930 NC-46','Reston','MD','20990','(607) 691-1109'),
('KG013','Idina','Franklin','F','175-45-8760',	'15 Jackson St','Tysons','MD',	'23229','(543) 572-2826'),
('KG014','Mercy','Aman','F','458-75-2654',	'2421 monocacy blvd',	'Durham',	'NC','27708','(272) 538-2824');

GO

insert into blacklist
values ('TD001','Sherlock ','Barren','M','647-84-4627','477 Oilville st','Gaston','NC','27832','(905) 019-2801'),
('TD002','Berry','Alan','F','927-24-3800',	'610 Throne St','Silver spring','MD','51763','(771) 829-1892'),	
('TD003','Eden','David','F','253-90-7322',	'314 Northampthon',	'Fredericks burg','VA',	'22401','(705) 281-2973'),
('TD004','Gerrard',	'Simon','M','739-00-7201','14447 brink Rd',	'Alexandria','VA',	'22132','(804) 528-8872'),
('TD005','Kimberly','Hassan','F','321-78-3820','810 Schreider St',	'Henrico','VA','27842','(571) 819-1392'),	
('TD006','Ronda','Roussie',	'F','678-71-1823','729 Warren ave','West broad vill','VA','23060','(803) 022-2838'),	
('PK001','Mira','Hansem','F','766-25-2789','314 northampthon',	'Gumberry',	'NC','27831','(705) 281-2973'),	
('PK002','Finn','Waytt','M','113-71-1025',	'1013 lafayette','Henrico',	'NC','27842','(457) 782-3461'),	
('PK003',Null,Null,	Null,Null,Null,Null,Null,Null,Null),
('PK004','Natan','Muluneh',	'M','930-27-3825',	'120 cherry st','Gaston','NC','27832',	'(803) 749-8281'),	
('PK005','Ahmed','Mohr','M','683-37-3528','120 cherry st','Frederick',	'MD','21701','(725) 782-2921'),	
('PK006','Mahmet','Khalid','M',	'046-74-1902',	'7866 mm ss','Emphoria','VA','23847','(252) 682-2829'),	
('PK007',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK008',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK009',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK010','Eggsy','Rollins','M','647-80-2648','51 mannakee st','Fort Detrick','MD','21702','(202) 172-8281'),	
('PK011','Amber','Lloyd','F','890-37-3722','319 Boyds Blvd','Gaston','NC','27832','(240) 782-9270'),	
('PK012',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK013',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK014',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('PK015','Zoe','Amir','F','782-48-4432','2100 Glen Rd','Columbia','MD','20990','(749) 870-1193'),	
('PK016','Jeffry','Filtman','M','238-72-5253','512 frederick ave','Tuckahoe','VA','23229','(334) 098-6291'),	
('PK017','Di','Yuan','M','726-35-0946','214 Darnestown rd','Arlington','VA','20321','(516) 299-8391'),	
('KG001',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG002',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG003',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG004','Bray','Houston',	'M','362-23-3740',	'6712 Old Dominion','Vaughan','NC','27832',	'(705) 628-1810'),	
('KG005',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG006',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG007',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG008',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG009',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG010','Lidya','Wudu','F','649-84-8201','3601 Lauderdale DR','McLean','VA','23129','(240) 628-8192'),	
('KG011','Kanye','Sparrow','M','538-72-3631','5930 NC-46','Reston','MD','20990','(607) 691-1109'),
('KG012',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG013',Null,Null,Null,Null,Null,Null,Null,Null,Null),
('KG014',Null,Null,Null,Null,Null,Null,Null,Null,Null);
GO

insert into Accident_records
values (1,'PK003','2/4/2022 11:27:45','impact','Forehead','Provided'),
(2,'PK005','2/4/2022 11:26:34','impact','Forehead','Provided'),
(3,'TD003','2/5/2022 09:34:26','Fall','arm','Not Provided'),
(4,'TD004','2/8/2022 04:22:44','scald','fingers','Provided'),
(5,'PK017','2/10/2022 11:20:10','cut','fingers','Provided'),
(6,'TD001','2/10/2022 10:22:43','Fall','knees','Provided'),
(7,'KG002','2/13/2022 11:54:42','Scald','fingers','Provided'),
(8,'PK010','2/15/2022 02:39:32','bruise','elbow','Provided'),
(9,'PK012','2/19/2022 04:50:45','Fall','hand',	'Provided'),
(10,'KG003','2/19/2022 10:42:20 ','impact','Forehead','Provided'),
(11,'PK007','2/22/2022 08:15:22','Fall','knees'	,'Provided'),
(12,'KG004','2/23/2022 10:32:44','cut',	'arm','Provided'),
(13,'PK010','2/27/2022 04:12:11','bruise','knees','Provided'),
(14,'TD003','3/2/2022 09:30:18','impact','shoulder','Not Provided'),
(15,'KG003','3/2/2022 12:05:32','chock','throat','Provided'),
(16,'KG005','3/15/2022 09:12:52','Fall','palm','Not Provided'),
(17,'PK001','3/19/2022 11:15:44','Fall','knees','Provided'),
(18,'TD002','3/24/2022 08:55:12','Bruise','arm','Provided'),
(19,'PK011','3/25/2022 03:47:26','cut','calves','Provided'),
(20,'KG008','3/25/2022 12:15:52','Fall','knees','Not Provided'),
(21,'KG002','3/28/2022 02:15:42','cut','leg','Provided'),
(22,'PK008','3/30/2022 10:49:55','chock','throat','Provided'),
(23,'KG001','4/3/2022 08:15:29','Fall','knees','Provided'),
(24,'KG011','4/7/2022 03:47:47','Fall','knees','Provided'),
(25,'PK013','4/11/2022 03:17:20','chock','throat','Provided'),
(26,'PK014','4/20/2022 08:15:26','impact','shoulder','Not Provided'),
(27,'KG013','4/26/2022 11:17:58','Fall','knees','Provided'),
(28,'PK005','4/30/2022 12:35:10','impact','Forehead','Provided'),
(29,'KG006','5/4/2022 04:17:22','Scald','palm','Provided'),
(30,'TD005','5/6/2022 09:25:44','impact','Forehead','Provided');
GO

insert into activitymanagement
values ('8:00AM-9:00AM','Arrival and health check','EMP07'),
('9:00AM-9:25AM','Group Time','EMP03'),
('9:25AM-10:45AM','ClassRoom','EMP05'),
('10:45AM-11:00AM',	'AM_snack',	'EMP03'),
('11:00AM-11:50AM','Outdoor play','EMP01'),
('11:50AM-12:30PM','Lunch','EMP04'),
('12:20PM-2:00PM','Rest','EMP015'),
('2:00PM-3:00PM','ClassRoom','EMP05'),
('3:00PM-3:15PM','Group Time','EMP011'),
('3:15PM-3:30PM','PM_snack','EMP03'),
('3:30PM-4:15PM','ClassRoom','EMP05'),
('4-15PM-5:00PM','Outdoor play and Pick up','EMP07');
Go
insert into [dbo].[AssessmentRecKG]
values ('KG001','K3','4/22/2022','94','77','92','80','93','87','77','92','97'),
('KG002','K3','4/22/2022','88','79','91','82','91','89','72','93','96'),
('KG003','K3','4/22/2022','93','85','94','89','92','90','81','92','94'),
('KG004','K3','4/22/2022','91','80','96','90','94','86','90','94','95'),
('KG005','K3','4/22/2022','93','67','97','84','94','87','79','94','96'),
('KG006','K3','4/22/2022','79','76','95','90','92','92','89','90','93'),
('KG007','K3','4/22/2022','97','83','90','87','95',	'94','84','92','95'),
('KG008','K3','4/22/2022','91','90','91','87','93','85','82','95','96'),
('KG009','K3','4/22/2022','82','90','92','91','95','86','93','96','93'),
('KG010','K3','4/22/2022','95','87','94','92','92','87','86','93','93'),
('KG011','K3','4/22/2022','96','79','95','85','90','90','89','95','93'),
('KG012','K3','4/22/2022','97','69','87','93','92','91','91','98','95'),
('KG013','K3','4/22/2022','89','90','85','90','93','92','87','95','95'),
('KG014','K3','4/22/2022','97','91','90','84','91','87','89','97','96');

insert into [dbo].[AssessmentRecPreK]
values ('PK001','P2','4/20/2022','47','38','46','45','44','45'),
('PK002','P2','4/20/2022','50','46','49','47','43','43'),
('PK003','P2','4/20/2022','50','45','50','43','46','50'),
('PK004','P2','4/20/2022','45','43','50','49','48','47'),
('PK005','P2','4/20/2022','42','40','45','45','43','45'),
('PK006','P2','4/20/2022','49','39','47','50','42','42'),
('PK007','P2','4/20/2022','44','40','44','39','47','49'),
('PK008','P2','4/20/2022','47','43','43','38','48','43'),
('PK009','P2','4/20/2022','48','40','43','41','41','47'),
('PK010','P2','4/20/2022','50','43','47','43','44','41'),
('PK011','P2','4/20/2022','49','39','49','46','46','46'),
('PK012','P2','4/20/2022','50','35','50','45','47','44'),
('PK013','P2','4/20/2022','48','41','42','48','42','47'),
('PK014','P2','4/20/2022','49','44','40','47','40','47'),
('PK015','P2','4/20/2022','48','37','43','42','44','42'),
('PK016','P2','4/20/2022','48','44','46','43','42','44'),
('PK017','P2','4/20/2022','45','48','50','46','41','46');
GO
insert into [dbo].[AssessmentRecNursery]
values ('TD001','N1','4/25/2022','3','5','4','5'),
('TD002','N1','4/25/2022','5','5','2','4'),
('TD003','N1','4/25/2022','4','3','3','5'),
('TD004','N1','4/25/2022','4','4','5','4'),
('TD005','N1','4/25/2022','3','5','5','4'),
('TD006','N1','4/25/2022','5','4','5','3');

insert into [dbo].[Attendance]
values ( 'TD001','5/10/2022 8:38:21',	'5/10/2022 4:25:43'),
('TD002','5/10/2022 8:20:50','5/10/2022 4:18:53'),
('TD003', '5/10/2022 8:15:41'	,'5/10/2022 4:24:03'),
('TD004','5/10/2022 8:46:21',	'5/10/2022 4:50:53'),
('TD005','5/10/2022 8:38:29',	'5/10/2022 4:24:48'),
('TD006','5/10/2022 8:48:41',	'5/10/2022 4:46:53'),
('PK001','5/10/2022 8:34:29',	'5/10/2022 4:35:21'),
('PK002','5/10/2022 8:28:29',	'5/10/2022 4:45:23'),
('PK003','5/10/2022 8:40:56',	'5/10/2022 4:33:16'),
('PK004', '5/10/2022 8:40:41',	'5/10/2022 4:43:54'),
('PK005','5/10/2022 8:33:51',	'5/10/2022 4:34:49'),
('PK006',	'5/10/2022 8:23:55',	'5/10/2022 4:27:45'),
('PK007','5/10/2022 8:30:21',	'5/10/2022 4:51:49'),
('PK008',	'5/10/2022 8:48:29',	'5/10/2022 4:21:33'),
('PK009','5/10/2022 8:13:10',	'5/10/2022 4:23:58'),
('PK010',	'5/10/2022 8:22:52',	'5/10/2022 4:44:39'),
('PK011',	'5/10/2022 8:35:21','5/10/2022 4:21:33'),
('PK012','5/10/2022 8:09:50',	'5/10/2022 4:50:53'),
('PK013','5/10/2022 8:53:27',	'5/10/2022 4:51:46'),
('PK014','5/10/2022 8:43:43',	'5/10/2022 4:41:37'),
('PK015',	'5/10/2022 8:58:29',	'5/10/2022 4:22:39'),
('PK016',	'5/10/2022 8:52:41',	'5/10/2022 4:34:55'),
('PK017',	'5/10/2022 8:18:20',	'5/10/2022 4:49:47'),
('KG001',	'5/10/2022 8:32:20','5/10/2022 4:53:30'),
('KG002',	'5/10/2022 8:28:20',	'5/10/2022 4:31:32'),
('KG003',	'5/10/2022 8:55:40',	'5/10/2022 4:27:54'),
('KG004',	'5/10/2022 8:44:28',	'5/10/2022 4:24:02'),
('KG005',	'5/10/2022 8:48:32',	'5/10/2022 4:46:33'),
('KG006','5/10/2022 8:33:45','5/10/2022 4:26:34'),
('KG007','5/10/2022 8:28:20','5/10/2022 4:25:37'),
('KG008','5/10/2022 8:17:40','5/10/2022 4:48:59'),
('KG009','5/10/2022 8:38:24','5/10/2022 4:19:55'),
('KG010','5/10/2022 8:35:33','5/10/2022 4:44:48'),
('KG011','5/10/2022 8:53:27','5/10/2022 4:38:40'),
('KG012','5/10/2022 8:43:43','5/10/2022 4:29:44'),
('KG013','5/10/2022 8:28:20','5/10/2022 4:17:39'),
('KG014','5/10/2022 8:43:43','5/10/2022 4:26:15');
GO

insert into [dbo].[ImmunizationRecord]
values ('TD001','1 dose','4 doses',	'2 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('TD002','1 dose','4 doses','2 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('TD003','1 dose','4 doses','2 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('TD004','1 dose','4 doses','2 doses','2 doses','4 doses','2 dose','2 doses','3 doses','2 doses','3 doses','2 doses'),
('TD005','1 dose','4 doses','2 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('TD006','1 dose','4 doses',	'2 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK001','1 dose','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK002','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK003','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK004','1 dose','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK005','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK006','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK007','2 doses',	'5 doses',	'3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','4 doses','3 doses','2 doses'),
('PK008','2 doses','5 doses','3 doses',	'2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK009','2 doses','5 doses','3 doses',	'2 doses','4 doses','2 doses',	'2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK010','1 dose','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK011','2 doses','5 doses','3 doses',	'2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK012',	'2 doses','5 doses','3 doses',	'2 doses','4 doses','2 doses',	'2 doses','3 doses','4 doses','3 doses','2 doses'),
('PK013','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK014','1 dose','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK015','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('PK016','2 doses',	'5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','3 doses','2 doses'),
('PK017','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','3 doses','2 doses'),
('KG001','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG002','2 doses','5 doses','3 ','2 doses','4 doses','2 doses','2 doses','3 doses','2 doses','4 doses','2 doses'),
('KG003','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG004','2 doses',	'5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG005','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','4 doses','4 doses','2 doses'),
('KG006','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','4 doses','4 doses','2 doses'),
('KG007','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG008','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses',	'2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG009','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG010','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','2 doses','4 doses','2 doses'),
('KG011','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG012','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','2 doses','4 doses','2 doses'),
('KG013','2 doses','5 doses','3 doses','2 doses','4 doses','2 doses','2 doses','3 doses','3 doses','4 doses','2 doses'),
('KG014','2 doses','5 doses','3 doses','2 doses','4 doses',	'2 doses','2 doses','3 doses','3 doses','4 doses','2 doses');
GO
insert into [dbo].[MealPlan]
values ('Monday','MN01','Kix and oranges','Fried Chicken with WG rice',	'Peaches',	'Apple and berry compote short bread'),
('Tuesday',	'MN02',	'Yogurt and starwberries','Mac and cheese','pineapple',	'Hammus Naan Bread'),
('Wednesday','MN03','Chex and peaches',	'Salisbury steak with WG Biscut','Oranges','strawberry health bar'),
('Thursday','MN04','Blueberry muffin and banana','Chicken nuggets with WW pita','Starwberry',	'chocolate cookie and whipped cream'),
('Friday','MN05','Cheerios and pears','Turkey tacos and mexican rice','Mangoes','Mashed sweet potatoes');
GO
insert into [dbo].[MenuManagement]
values ( 'TD001',	'MN01',	'MN02','MN03',	'MN04',	'MN05'),
('TD002',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('TD003',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('TD004',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('TD005',	'MN05',	'MN02',	'MN03',	'MN04',	'MN05'),
('TD006',	'MN05',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK001',   'MN01', 'MN02',	'MN03',	'MN04',	'MN05'),
('PK002',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK003','MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK004',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK005','MN01','MN02',	'MN03',	'MN04',	'MN05'),
('PK006',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK007',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK008',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK009',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK010',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK011',	'MN01',	'MN02',	'MN01',	'MN04',	'MN05'),
('PK012',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK013',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK014',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK015',	'MN01','MN02',	'MN03',	'MN04',	'MN05'),
('PK016',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('PK017',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG001',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG002',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG003',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG004',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG005',	'MN01',	'MN05',	'MN03',	'MN04',	'MN05'),
('KG006',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG007',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG008',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG009',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG010',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG011',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG012',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG013',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05'),
('KG014',	'MN01',	'MN02',	'MN03',	'MN04',	'MN05');
Go
insert into [dbo].[RegularHealthCheck]
values ('TD001',	'6/10/2022',Null,Null),
('TD002','6/10/2022',	'Cough',	'Isolation'),
('TD003','6/10/2022',Null,Null),
('TD004',	'6/10/2022',	'Rash',Null),
('TD005',	'6/10/2022',Null,Null),
('TD006','6/10/2022',Null,Null),
('PK001','6/10/2022',Null,Null),
('PK002','6/10/2022',Null,Null),
('PK003','6/10/2022','Runny nose','Isolation'),
('PK004',	'6/10/2022','Watery eyes','First aid'),
('PK005','6/10/2022',Null,Null),
('PK006',	'6/10/2022',Null,Null),
('PK007','6/10/2022',Null,Null),
('PK008','6/10/2022',Null,Null),
('PK009','6/10/2022',Null,Null),
('PK010','6/10/2022',Null,Null),
('PK011','6/10/2022',Null,Null),
('PK012','6/10/2022',Null,Null),
('PK013','6/10/2022',	'Swelling on skin',	'First aid'),
('PK014','6/10/2022',Null,Null),
('PK015','6/10/2022',Null,Null),
('PK016','6/10/2022',Null,Null),
('PK017','6/10/2022',Null,Null),
('KG001','6/10/2022','Rash','First aid'),
('KG002','6/10/2022',Null,Null),
('KG003','6/10/2022',	'Fever',	'First aid'),
('KG004','6/10/2022',Null,Null),
('KG005','6/10/2022',Null,Null),
('KG006','6/10/2022',Null,Null),
('KG007','6/10/2022',Null,Null),
('KG008','6/10/2022',Null,Null),
('KG009','6/10/2022',Null,Null),
('KG010','6/10/2022',Null,Null),
('KG011','6/10/2022','Diarrhea','Sign Out'),
('KG012',	'6/10/2022',Null,Null),
('KG013','6/10/2022',Null,Null),
('KG014','6/10/2022',Null,Null);
GO

insert into [dbo].[ActivityManagement]
values ('8:00AM-9:00AM','Arrival and health check',	'EMP07'),
('9:00AM-9:25AM','Group Time','EMP03'),
('9:25AM-10:45AM','ClassRoom','EMP05'),
('10:45AM-11:00AM','AM_snack','EMP03'),
('11:00AM-11:50AM','Outdoor play','EMP01'),
('11:50AM-12:30PM','Lunch','EMP04'),
('12:20PM-2:00PM','Rest','EMP15'),
('2:00PM-3:00PM','ClassRoom','EMP05'),
('3:00PM-3:15PM','Group Time','EMP11'),
('3:15PM-3:30PM','PM_snack','EMP03'),
('3:30PM-4:15PM','ClassRoom','EMP05'),
('4:15PM-5:00PM','Outdoor play and Pick up','EMP07');
Go 

insert into [dbo].[Revenue]
values ('TD001',150,4000,4000,4000,30,'20211021-001-001','AMN782'),
('TD002',150,4000,4000,4000,30,'20211013-002-002','DHE982'),
('TD003',150,4000,4000,4000,30,'20211113-003-003','RTW273'),
('TD004',150,4000,4000,4000,30,'20211115-004-004','HDF283'),
('TD005',150,4000,4000,4000,30,'20211125-005-005','GUR443'),
('TD006',150,4000,4000,4000,30,'20220115-006-006','GKQ435'),
('PK001',150,3500,3500,3500,45,'20211110-001-007','GLG344'),
('PK002',150,3500,3500,3500,45,'20211013-002-008','TEK428'),
('PK003',150,3500,3500,3500,45,'20211028-003-009','ERT234'),
('PK004',150,4000,4000,4000,60,'20211028-004-010','FEG345'),
('PK005',150,3500,3500,3500,45,'20211029-005-011','DFH784'),
('PK006',150,3500,3500,3500,45,'20211211-006-012','GHE234'),
('PK007',150,3500,3500,3500,45,'20211113-007-013','GJD562'),
('PK008',150,3500,3500,3500,45,'20211113-008-013','FGW234'),
('PK009',150,3500,3500,3500,45,'20211121-009-014','NMH497'),
('PK010',150,3500,3500,3500,45,'20211207-010-015','LKW684'),
('PK011',150,3500,3500,3500,45,'20211217-011-016','JHK340'),
('PK012',150,3500,3500,3500,45,'20211217-012-017','MTR985'),
('PK013',150,3500,3500,3500,45,'20220108-013-018','KJL348'),
('PK014',150,3500,3500,3500,45,'20220109-014-019','HJL564'),
('PK015',150,3500,3500,3500,45,'20220109-015-020','LKH974'),
('PK016',150,3500,3500,3500,45,'20220110-016-021','YUR748'),
('PK017',150,3500,3500,3500,45,'20211014-017-022','MNJ384'),
('KG001',150,3000,3000,3000,60,'20211022-001-023','OPR569'),
('KG002',150,3000,3000,3000,60,'20211030-002-024','PPR467'),
('KG003',150,3000,3000,3000,60,'20211114-003-025','ACG553'),
('KG004',150,3500,3500,3500,80,'20211120-004-026','KLO383'),
('KG005',150,3000,3000,3000,60,'20211120-005-027','URL284'),
('KG006',150,3000,3000,3000,60,'20211123-006-028','BOD735'),
('KG007',150,3000,3000,3000,60,'20211123-007-029','ILS450'),
('KG008',150,3000,3000,3000,60,'20211123-008-030','HJE563'),
('KG009',150,3000,3000,3000,60,'20211127-009-031','KOW892'),
('KG010',150,3000,3000,3000,60,'20211217-010-032','JEL873'),
('KG011',150,3000,3000,3000,60,'20211217-011-036','IWO963'),
('KG012',150,3000,3000,3000,60,'20220108-012-034','RVE638'),
('KG013',150,3000,3000,3000,60,'20220109-013-035','UTT356'),
('KG014',150,3000,3000,3000,60,'20220111-014-036','WQT789');
Go
insert into [dbo].[Withdrawal]
values (
'Salary',96000,'4/27/2022','EMP17'),
('Assessment and curriculum',100,	'4/1/2022','EMP17'),
('Food and drinks',1800,'1/15/2022','EMP03'),
('Maintenance',100,	'3/24/2022','EMP13'),
('Insurance',3000,'1/10/2022','EMP05'),
('Office supplies',500,'1/15/2022','EMP17'),
('Medical',2000,'1/15/2022','EMP07'),
('Postage',500,'4/4/2022','EMP17'),
('Printing',600,'4/20/2022','EMP17'),
('Rent/Mortage',15000,'1/7/2022',	'EMP17'),
('Supplies',1700,'1/8/2022','EMP17'),
('Telephone and Internet',1000,'4/30/2022','EMP17'),
('Utilities',3500,	'4/30/2022','EMP17'),
('Sanitary',2000,'3/17/2022','EMP10'),
('Tax',3000,'5/1/2022',	'EMP17');




CREATE FUNCTION udf_GetNumberOfEmployees()
RETURNS INT      
AS 
	BEGIN
		DECLARE @numEmps INT;
		SELECT @numEmps = COUNT(*) FROM Employee

		RETURN @numEmps 
	END
GO

	CREATE FUNCTION udf_GetNumberOfstudents()
RETURNS INT      
AS 
	BEGIN
		DECLARE @numstds INT;
		SELECT @numstds = COUNT(*) FROM student

		RETURN @numstds 
	END
GO

CREATE FUNCTION tvf_GetEmpTypeAndAVGSalary()
RETURNS TABLE
AS
	RETURN 
		(
			SELECT empType, AVG(salary) [AVGSalaryPerEmpType]
			FROM Employee
			GROUP BY empType
		)
GO

CREATE FUNCTION udf_CalculateAge (@dob DATE) 
RETURNS INT
AS 
	BEGIN
		DECLARE @Age INT
		SET @Age=DATEDIFF(YEAR,@dob,GETDATE())
		RETURN @Age
	END
	
select chid, [dbo].[udf_CalculateAge](chDoB) from student
select empid,[dbo].[udf_CalculateAge](dob) from employee
GO

CREATE FUNCTION tvf_GetKG_TeacherandStudent()
RETURNS TABLE
AS
	RETURN 
		(
			SELECT ChId,RoomNo,Classname,HeadTeacher,AssistantTeacher from classinfo C
			join employee E on E.EmpId= C.HeadTeacher
			join AssessmentRecKG K on K.classId=C.classId
 )
GO
CREATE FUNCTION tvf_GetPreK_TeacherandStudent()
RETURNS TABLE
AS
	RETURN 
		(
			SELECT ChId,RoomNo,Classname, HeadTeacher, AssistantTeacher  from classinfo C
			join employee E on E.EmpId= C.HeadTeacher
			join assessmentRecPreK P on P.classId=C.classId
			)
GO
CREATE FUNCTION tvf_GetNursery_TeacherandStudent()
RETURNS TABLE
AS
	RETURN 
		(
			SELECT ChId,RoomNo,Classname, HeadTeacher, AssistantTeacher  from classinfo C
			join employee E on E.EmpId= C.HeadTeacher
	        join assessmentrecNursery N on N.classId=C.classId
          )
		

create function tvf_AssessmentRankKG()
returns table 
as
return (
select  ChId, (avg(know_100+math_100+read_100+spell_100+camera_reading_100+camera_spelling_100+
sentence_reading_100+pattern_assessment_100+name_writing_100)/9)[avg], dense_rank() over (order by avg(know_100+math_100+read_100+spell_100+camera_reading_100+camera_spelling_100+
sentence_reading_100+pattern_assessment_100+name_writing_100)/9 desc)[rank]
from [dbo].[AssessmentRecKG] P
group by ChId
)
GO

create function tvf_AssessmentRankPreK()
returns table 
as
return (
select ChId, (avg(alphabet_assessment_50+math_assessment_50+team_work_50+scissor_skills_50+
pattern_assessment_50+name_writing_50)/6)[avg],dense_rank() over(order by avg(alphabet_assessment_50+math_assessment_50+team_work_50+scissor_skills_50+
pattern_assessment_50+name_writing_50)/6 desc)[rank] from [dbo].[AssessmentRecPreK]
group by chId
)
GO
create function tvf_AssessmentRankNursery()
returns table 
as
return (
select ChId, (avg(reflection_5+social_development_5+emotional_development_5+conflict_resolution_5)/4)[avg], 
dense_rank() over (order by avg(reflection_5+social_development_5+emotional_development_5+conflict_resolution_5)/4 desc)[rank] 
from [dbo].[AssessmentRecNursery]
group by ChId
)
GO

create function tvf_totalincomebystate()
returns table
as
     return (select [state],(sum(term1)+Sum(term2)+sum(term3)+sum(book)+sum(registrationfee))[total] from revenue R
	  join student S
	  on R.ChId= S.ChId
	  group by [state]
	  )
 GO

 create function tvf_incomeperterm()
 returns table 
 as 
 return ( select sum(term1)[Term1total], sum(term2)[Term2total], sum(term3)[Term3total] from revenue
 )
 GO
 
 create function ufn_totalyearlyincome()
returns decimal (10,2)
begin
     return (select (sum (book)+sum(term1)+Sum(term2)+sum(term3)+sum(book)+sum(registrationfee))[total] from revenue R
	  )
	  end
	  GO
	  
 create function ufn_totalexpense()
returns decimal (10,2)
begin
 return (select sum (amount)[totexpense] from withdrawal)
 end
GO




 












 

 