PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Programs(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
ProgramName VARCHAR(255) NOT NULL,
ProgramDuration VARCHAR(255) NOT NULL,
Fee INTEGER NOT NULL
);
INSERT INTO Programs VALUES(1,'Financial Analytics','8 Months',32000);
INSERT INTO Programs VALUES(2,'Big Data Analytics','16 Months',38000);
INSERT INTO Programs VALUES(3,'Human Resources','8 Months',24000);
INSERT INTO Programs VALUES(4,'Psychology','8 Months',32000);
INSERT INTO Programs VALUES(5,'Computer Science','4 Years',76000);
INSERT INTO Programs VALUES(6,'Mechanical Engineering','4 Years',76000);
INSERT INTO Programs VALUES(7,'Business Management','2 years',42000);
INSERT INTO Programs VALUES(8,'Information Technology','4 Years',76300);
INSERT INTO Programs VALUES(9,'Music','8 Months',22000);
INSERT INTO Programs VALUES(10,'Art','8 Months',23000);
CREATE TABLE ApplicantsPrograms(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
ApplicantId INTEGER NOT NULL,
ProgramId INTEGER NOT NULL,
CONSTRAINT FK_ApplicantsPrograms_ApplicantId_2_Applicants_Id FOREIGN KEY(ApplicantId)
    REFERENCES Applicants(Id),
CONSTRAINT FK_ApplicantsPrograms_ProgramId_2_Programs_Id FOREIGN KEY(ProgramId)
    REFERENCES Programs(Id),
CONSTRAINT UK_ApplicantId_ProgramId UNIQUE(ApplicantId, ProgramId)
);
INSERT INTO ApplicantsPrograms VALUES(1,1,2);
INSERT INTO ApplicantsPrograms VALUES(2,2,1);
INSERT INTO ApplicantsPrograms VALUES(3,3,4);
INSERT INTO ApplicantsPrograms VALUES(4,4,1);
INSERT INTO ApplicantsPrograms VALUES(5,5,2);
INSERT INTO ApplicantsPrograms VALUES(6,6,3);
INSERT INTO ApplicantsPrograms VALUES(7,7,2);
INSERT INTO ApplicantsPrograms VALUES(8,8,4);
INSERT INTO ApplicantsPrograms VALUES(9,9,5);
INSERT INTO ApplicantsPrograms VALUES(10,10,6);
CREATE TABLE Universities(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Name VARCHAR(255) NOT NULL,
PhoneNo VARCHAR(50) NOT NULL,
StreetName VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
Country VARCHAR(255) NOT NULL,
CONSTRAINT UK_Name UNIQUE(Name)
);
INSERT INTO Universities VALUES(1,'Trent University','705 234 2345','University Heights','Peterborough','Canada');
INSERT INTO Universities VALUES(2,'York University','705 167 8596','4700 Keele St','Toronto','Canada');
INSERT INTO Universities VALUES(3,'Simon Fraser University','705 666 3635','8888 University Dr','Burnaby','Canada');
INSERT INTO Universities VALUES(4,'McGill University','705 777 8900','845 Sherbrooke St W','Montreal','Canada');
INSERT INTO Universities VALUES(5,'McMaster University','705 555 4500','1280 Main St W','Hamilton','Canada');
INSERT INTO Universities VALUES(6,'Western University','705 111 1116','1151 Richmond St','London','Canada');
INSERT INTO Universities VALUES(7,'Saint Mary''s University','705 000 8646','923 Robie St','Halifax','Canada');
INSERT INTO Universities VALUES(8,'University of Waterloo','705 444 1423','200 University Ave W','Waterloo','Canada');
INSERT INTO Universities VALUES(9,'University of Toronto','705 888 0967','27 King''s College Cir','Toronto','Canada');
INSERT INTO Universities VALUES(10,'Ryerson University','705 223 5622','350 Victoria St','Toronto','Canada');
CREATE TABLE UniversitiesPrograms(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
UniversityId INTEGER NOT NULL,
ProgramId INTEGER NOT NULL,
CONSTRAINT FK_UniversitiesPrograms_UniversityId_2_Universities_Id FOREIGN KEY(UniversityId)
    REFERENCES Universities(Id),
CONSTRAINT FK_UniversitiesPrograms_ProgramId_2_Programs_Id FOREIGN KEY(ProgramId)
    REFERENCES Programs(Id),
CONSTRAINT UK_UniversityId_ProgramId UNIQUE(UniversityId, ProgramId)
);
INSERT INTO UniversitiesPrograms VALUES(1,1,1);
INSERT INTO UniversitiesPrograms VALUES(2,1,2);
INSERT INTO UniversitiesPrograms VALUES(3,2,3);
INSERT INTO UniversitiesPrograms VALUES(4,3,2);
INSERT INTO UniversitiesPrograms VALUES(5,3,5);
INSERT INTO UniversitiesPrograms VALUES(6,3,6);
INSERT INTO UniversitiesPrograms VALUES(7,4,2);
INSERT INTO UniversitiesPrograms VALUES(8,4,1);
INSERT INTO UniversitiesPrograms VALUES(9,5,7);
INSERT INTO UniversitiesPrograms VALUES(10,5,8);
INSERT INTO UniversitiesPrograms VALUES(11,6,4);
INSERT INTO UniversitiesPrograms VALUES(12,6,9);
INSERT INTO UniversitiesPrograms VALUES(13,7,10);
INSERT INTO UniversitiesPrograms VALUES(14,8,5);
INSERT INTO UniversitiesPrograms VALUES(15,8,4);
INSERT INTO UniversitiesPrograms VALUES(16,8,1);
INSERT INTO UniversitiesPrograms VALUES(17,9,1);
INSERT INTO UniversitiesPrograms VALUES(18,9,2);
INSERT INTO UniversitiesPrograms VALUES(19,9,5);
INSERT INTO UniversitiesPrograms VALUES(20,9,7);
INSERT INTO UniversitiesPrograms VALUES(21,9,10);
CREATE TABLE OnlinePrograms(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
OnlineId INTEGER NOT NULL,
ProgramId INTEGER NOT NULL,
CONSTRAINT FK_OnlinePrograms_OnlineId_2_OnlinePlatforms_Id FOREIGN KEY(OnlineId)
    REFERENCES OnlinePlatforms(Id),
CONSTRAINT FK_OnlinePrograms_ProgramId_2_Programs_Id FOREIGN KEY(ProgramId)
    REFERENCES Programs(Id),
CONSTRAINT UK_OnlineId_ProgramId UNIQUE(OnlineId, ProgramId)
);
INSERT INTO OnlinePrograms VALUES(1,1,2);
INSERT INTO OnlinePrograms VALUES(2,2,1);
INSERT INTO OnlinePrograms VALUES(3,3,3);
INSERT INTO OnlinePrograms VALUES(4,4,4);
INSERT INTO OnlinePrograms VALUES(5,5,5);
INSERT INTO OnlinePrograms VALUES(6,6,6);
INSERT INTO OnlinePrograms VALUES(7,7,2);
INSERT INTO OnlinePrograms VALUES(8,8,4);
INSERT INTO OnlinePrograms VALUES(9,9,3);
INSERT INTO OnlinePrograms VALUES(10,10,2);
CREATE TABLE Books(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Title VARCHAR(255) NOT NULL,
Author VARCHAR(255) NOT NULL,
Publisher VARCHAR(255) NOT NULL,
Price INTEGER NOT NULL,
CONSTRAINT UK_Title UNIQUE(Title)
);
INSERT INTO Books VALUES(1,'Big Data: A Revolution That Will Transform How We Live, Work, and Think','Kenneth Cukier and Viktor Mayer','Houghton Mifflin Harcourt',30);
INSERT INTO Books VALUES(2,'Financial Analytics with R','Dirk L. Hugen and Mark Joseph Bennett','Cambridge University Press',50);
INSERT INTO Books VALUES(3,'The HR Answer Book: An Indispensable Guide for Managers and Human Resources Professionals','Shawn Smith and Rebecca Mazin','AMACOM',30);
INSERT INTO Books VALUES(4,'Introduction to Algorithms','Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein','MIT Press',40);
INSERT INTO Books VALUES(5,'Shigley''s Mechanical Engineering Design','J. Keith Nisbeth and Richard G. Budynas','McGraw-Hill',37);
INSERT INTO Books VALUES(6,'Thinking, Fast and Slow','Daniel Kahneman','Farrar, Straus and Giroux',45);
INSERT INTO Books VALUES(7,'Database Systems: Design, Implementation, and Management','Peter Rob','Thomson/Course Technology',24);
INSERT INTO Books VALUES(8,'IB Business Management Course Book 2014 edition: For the IB Diploma','Martin Mwenda Muchena, Loykie Lomine, Robert Pierce','OUP Oxford',56);
INSERT INTO Books VALUES(9,'Alfred''s Essentials of Music Theory: A Complete Self-study Course for All Musicians','Andrew Surmani, Karen Farnum Surmani, Morton Manus','Alfred Music Publishing',40);
INSERT INTO Books VALUES(10,'Remarkable Books: The World''s Most Beautiful and Historic Works','DK','DK',31);
CREATE TABLE ProgramsBooks(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
BookId INTEGER NOT NULL,
ProgramId INTEGER NOT NULL,
CONSTRAINT FK_ProgramsBooks_BookId_2_Books_Id FOREIGN KEY(BookId)
    REFERENCES Books(Id),
CONSTRAINT FK_ProgramsBooks_ProgramId_2_Programs_Id FOREIGN KEY(ProgramId)
    REFERENCES Programs(Id),
CONSTRAINT UK_BookId_ProgramId UNIQUE(BookId, ProgramId)
);
INSERT INTO ProgramsBooks VALUES(1,1,2);
INSERT INTO ProgramsBooks VALUES(2,2,1);
INSERT INTO ProgramsBooks VALUES(3,3,3);
INSERT INTO ProgramsBooks VALUES(4,4,8);
INSERT INTO ProgramsBooks VALUES(5,5,6);
INSERT INTO ProgramsBooks VALUES(6,6,4);
INSERT INTO ProgramsBooks VALUES(7,7,2);
INSERT INTO ProgramsBooks VALUES(8,8,7);
INSERT INTO ProgramsBooks VALUES(9,9,9);
INSERT INTO ProgramsBooks VALUES(10,10,10);
CREATE TABLE Courses(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
CourseName VARCHAR(255) NOT NULL,
CONSTRAINT UK_CourseName UNIQUE(CourseName)
);
INSERT INTO Courses VALUES(1,'Big Data');
INSERT INTO Courses VALUES(2,'Foundations of Modelling');
INSERT INTO Courses VALUES(3,'Introduction to Databases');
INSERT INTO Courses VALUES(4,'Introduction to Management');
INSERT INTO Courses VALUES(5,'Introduction to Mechanics');
INSERT INTO Courses VALUES(6,'Introduction to Music');
INSERT INTO Courses VALUES(7,'Introduction to Art');
INSERT INTO Courses VALUES(8,'Computer Science Basics');
INSERT INTO Courses VALUES(9,'Psychology Basics');
INSERT INTO Courses VALUES(10,'Introduction to Human Resources');
INSERT INTO Courses VALUES(11,'Introduction to Finance');
INSERT INTO Courses VALUES(12,'Introduction to R');
CREATE TABLE ProgramsCourses(
Id INTEGER PRIMARY KEY AUTOINCREMENT,
CourseId INTEGER NOT NULL,
ProgramId INTEGER NOT NULL,
CONSTRAINT FK_ProgramsCourses_CourseId_2_Courses_Id FOREIGN KEY(CourseId)
    REFERENCES Courses(Id),
CONSTRAINT FK_ProgramsCourses_ProgramId_2_Programs_Id FOREIGN KEY(ProgramId)
    REFERENCES Programs(Id),
CONSTRAINT UK_CourseId_ProgramId UNIQUE(CourseId, ProgramId)
);
INSERT INTO ProgramsCourses VALUES(1,1,2);
INSERT INTO ProgramsCourses VALUES(2,2,2);
INSERT INTO ProgramsCourses VALUES(3,3,2);
INSERT INTO ProgramsCourses VALUES(4,12,2);
INSERT INTO ProgramsCourses VALUES(5,2,1);
INSERT INTO ProgramsCourses VALUES(6,11,1);
INSERT INTO ProgramsCourses VALUES(7,10,3);
INSERT INTO ProgramsCourses VALUES(8,11,3);
INSERT INTO ProgramsCourses VALUES(9,4,3);
INSERT INTO ProgramsCourses VALUES(10,9,4);
INSERT INTO ProgramsCourses VALUES(11,10,4);
INSERT INTO ProgramsCourses VALUES(12,8,5);
INSERT INTO ProgramsCourses VALUES(13,2,5);
INSERT INTO ProgramsCourses VALUES(14,3,5);
INSERT INTO ProgramsCourses VALUES(15,12,5);
INSERT INTO ProgramsCourses VALUES(16,5,6);
INSERT INTO ProgramsCourses VALUES(17,3,6);
INSERT INTO ProgramsCourses VALUES(18,4,7);
INSERT INTO ProgramsCourses VALUES(19,11,7);
INSERT INTO ProgramsCourses VALUES(20,3,8);
INSERT INTO ProgramsCourses VALUES(21,12,8);
INSERT INTO ProgramsCourses VALUES(22,6,9);
INSERT INTO ProgramsCourses VALUES(23,7,10);
CREATE TABLE UniversitiesScholarships(Id INTEGER PRIMARY KEY AUTOINCREMENT,ScholarshipId INTEGER NOT NULL,UniversityId INTEGER NOT NULL,CONSTRAINT FK_UniversitiesScholarships_ScholarshipId_2_Scholarships_Id FOREIGN KEY(ScholarshipId)    REFERENCES Scholarships(Id),CONSTRAINT FK_UniversitiesScholarships_UniversityId_2_Universities_Id FOREIGN KEY(UniversityId)    REFERENCES Programs(Id),CONSTRAINT UK_ScholarshipId_UniversityId UNIQUE(ScholarshipId, UniversityId));
INSERT INTO UniversitiesScholarships VALUES(1,1,1);
INSERT INTO UniversitiesScholarships VALUES(2,2,1);
INSERT INTO UniversitiesScholarships VALUES(3,3,1);
INSERT INTO UniversitiesScholarships VALUES(4,4,1);
INSERT INTO UniversitiesScholarships VALUES(5,5,1);
INSERT INTO UniversitiesScholarships VALUES(6,6,1);
INSERT INTO UniversitiesScholarships VALUES(7,7,1);
INSERT INTO UniversitiesScholarships VALUES(8,8,1);
INSERT INTO UniversitiesScholarships VALUES(9,9,1);
INSERT INTO UniversitiesScholarships VALUES(10,10,1);
INSERT INTO UniversitiesScholarships VALUES(11,1,2);
INSERT INTO UniversitiesScholarships VALUES(12,2,2);
INSERT INTO UniversitiesScholarships VALUES(13,3,2);
INSERT INTO UniversitiesScholarships VALUES(14,4,2);
INSERT INTO UniversitiesScholarships VALUES(15,5,2);
INSERT INTO UniversitiesScholarships VALUES(16,6,2);
INSERT INTO UniversitiesScholarships VALUES(17,7,2);
INSERT INTO UniversitiesScholarships VALUES(18,8,2);
INSERT INTO UniversitiesScholarships VALUES(19,9,2);
INSERT INTO UniversitiesScholarships VALUES(20,10,2);
INSERT INTO UniversitiesScholarships VALUES(21,1,3);
INSERT INTO UniversitiesScholarships VALUES(22,2,3);
INSERT INTO UniversitiesScholarships VALUES(23,3,3);
INSERT INTO UniversitiesScholarships VALUES(24,4,3);
INSERT INTO UniversitiesScholarships VALUES(25,5,3);
INSERT INTO UniversitiesScholarships VALUES(26,6,3);
INSERT INTO UniversitiesScholarships VALUES(27,7,3);
INSERT INTO UniversitiesScholarships VALUES(28,8,3);
INSERT INTO UniversitiesScholarships VALUES(29,9,3);
INSERT INTO UniversitiesScholarships VALUES(30,10,3);
INSERT INTO UniversitiesScholarships VALUES(31,1,4);
INSERT INTO UniversitiesScholarships VALUES(32,2,4);
INSERT INTO UniversitiesScholarships VALUES(33,3,4);
INSERT INTO UniversitiesScholarships VALUES(34,4,5);
INSERT INTO UniversitiesScholarships VALUES(35,5,5);
INSERT INTO UniversitiesScholarships VALUES(36,6,6);
INSERT INTO UniversitiesScholarships VALUES(37,7,7);
INSERT INTO UniversitiesScholarships VALUES(38,8,8);
INSERT INTO UniversitiesScholarships VALUES(39,9,9);
INSERT INTO UniversitiesScholarships VALUES(40,10,10);
CREATE TABLE Applicants(Id INTEGER PRIMARY KEY AUTOINCREMENT,Name VARCHAR(255) NOT NULL,Email VARCHAR(255) NOT NULL,InterestedProgram VARCHAR(255) NOT NULL,StreetName VARCHAR(255) NOT NULL,City VARCHAR(255) NOT NULL,Country VARCHAR(255) NOT NULL,CONSTRAINT UK_Email UNIQUE(Email));
INSERT INTO Applicants VALUES(1,'Gurleen Kaur','ggurleenkaur@trentu.ca','Big Data Analytics','Water Street','Peterborough','Canada');
INSERT INTO Applicants VALUES(2,'John','john1@gmail.com','Financial Analytics','Aberdeen Street','Oshawa','Canada');
INSERT INTO Applicants VALUES(3,'Alex Parish','alex2@gmail.com','Psychology','29th Ave Station Loop','Vancouver','Canada');
INSERT INTO Applicants VALUES(4,'Phill Dunphy','philldunphy@gmail.com','Financial Analytics','10 Avenue.','Surrey','Canada');
INSERT INTO Applicants VALUES(5,'Hailey Bailey','hailey12@gmail.com','Big Data Analytics','King Street','Toronto','Canada');
INSERT INTO Applicants VALUES(6,'Claire Pritchett','clairepritchett@gmail.com','Human Resources','7th Concession Road','Windsor','Canada');
INSERT INTO Applicants VALUES(7,'Sofia Vergara','sofia123@gmail.com','Big Data Analytics','Autoroute Métropolitain','Montreal','Canada');
INSERT INTO Applicants VALUES(8,'Manny Delgado','mannydelgado@gmail.com','Psychology','7 Avenue S','Calgary','Canada');
INSERT INTO Applicants VALUES(9,'Walter White','walterwhite@gmail.com','Computer Science','100 Avenue North-west','Edmonton','Canada');
INSERT INTO Applicants VALUES(10,'Midge Maisel','mrsmidge@gmail.com','Mechanical Engineering','103 Ramp','Halifax','Canada');
INSERT INTO Applicants VALUES(14,'Zilan','zilan@gmail.com','Big Data Analytics','Murray Street','Peterborough','Canada');
CREATE TABLE OnlinePlatforms(Id INTEGER PRIMARY KEY AUTOINCREMENT,Name VARCHAR(255) NOT NULL,ContactInfo VARCHAR(50) NOT NULL,WebAddress VARCHAR(255) NOT NULL,CONSTRAINT UK_Name UNIQUE(Name));
INSERT INTO OnlinePlatforms VALUES(1,'Lynda.com','https://www.lynda.com/support/contact','https://www.lynda.com/');
INSERT INTO OnlinePlatforms VALUES(2,'Udemy','https://support.udemy.com/hc/en-us','https://www.udemy.com/');
INSERT INTO OnlinePlatforms VALUES(3,'Khan Academy','https://khanacademy.zendesk.com/hc/en-us','https://www.khanacademy.org/');
INSERT INTO OnlinePlatforms VALUES(4,'Udacity','https://www.udacity.com/contact','https://www.udacity.com/');
INSERT INTO OnlinePlatforms VALUES(5,'CodeAcademy','https://www.codecademy.com/catalog/subject/all','https://www.codecademy.com/');
INSERT INTO OnlinePlatforms VALUES(6,'Bloc','415 903 5114','https://www.bloc.io/');
INSERT INTO OnlinePlatforms VALUES(7,'iversity','https://iversity.zendesk.com/hc/en-gb','https://iversity.org/');
INSERT INTO OnlinePlatforms VALUES(8,'Skillshare','https://help.skillshare.com/hc/en-us','https://www.skillshare.com/');
INSERT INTO OnlinePlatforms VALUES(9,'General Assembly','hello@generalassemb.ly','https://generalassemb.ly/');
INSERT INTO OnlinePlatforms VALUES(10,'Coursera','https://www.coursera.org/about/contact','https://www.coursera.org/');
CREATE TABLE Scholarships(Id INTEGER PRIMARY KEY AUTOINCREMENT,Title VARCHAR(255) NOT NULL,EligibilityCriteria VARCHAR(255) NOT NULL,Amount INTEGER NOT NULL,Deadline DATE NOT NULL,CONSTRAINT UK_Title UNIQUE(Title));
INSERT INTO Scholarships VALUES(1,'Ontario Scholarship','All Ontario students,more than 80% in High school',32000,'2020-01-10');
INSERT INTO Scholarships VALUES(2,'Graduate Scholarship','All graduate students,more than 80% in Grad school',42000,'2020-02-19');
INSERT INTO Scholarships VALUES(3,'Undergraduate Scholarship','All Canadian students,more than 80% in High school',35000,'2020-03-26');
INSERT INTO Scholarships VALUES(4,'International Scholarship','All international students,more than 80% in High school',37000,'2020-04-24');
INSERT INTO Scholarships VALUES(5,'Sports Scholarship','All National level sports player students,more than 80% in High school',52000,'2020-05-13');
INSERT INTO Scholarships VALUES(6,'Science Scholarship','All Canadian Science students,more than 80% in High school',72000,'2020-06-05');
INSERT INTO Scholarships VALUES(7,'Medical Science Scholarship','All Medical Science students,more than 80% in High school',22000,'2020-07-06');
INSERT INTO Scholarships VALUES(8,'Engineering Scholarship','All Engineering students,more than 80% in High school',72000,'2020-08-07');
INSERT INTO Scholarships VALUES(9,'Art Scholarship','All Art students,more than 80% in High school',42000,'2020-09-08');
INSERT INTO Scholarships VALUES(10,'Music Scholarship','All Music students,more than 80% in High school',12000,'2020-10-09');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Applicants',14);
INSERT INTO sqlite_sequence VALUES('Programs',10);
INSERT INTO sqlite_sequence VALUES('ApplicantsPrograms',10);
INSERT INTO sqlite_sequence VALUES('Universities',10);
INSERT INTO sqlite_sequence VALUES('UniversitiesPrograms',21);
INSERT INTO sqlite_sequence VALUES('OnlinePlatforms',10);
INSERT INTO sqlite_sequence VALUES('OnlinePrograms',10);
INSERT INTO sqlite_sequence VALUES('Books',10);
INSERT INTO sqlite_sequence VALUES('ProgramsBooks',10);
INSERT INTO sqlite_sequence VALUES('Courses',12);
INSERT INTO sqlite_sequence VALUES('ProgramsCourses',23);
INSERT INTO sqlite_sequence VALUES('Scholarships',10);
INSERT INTO sqlite_sequence VALUES('UniversitiesScholarships',40);
COMMIT;
