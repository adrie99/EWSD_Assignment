CREATE DATABASE eTutoringDB;

USE eTutoringDB;

CREATE TABLE Position (
	positionId tinyint(255) NOT NULL UNIQUE AUTO_INCREMENT,
	positionName varchar (255) NOT NULL,
	PRIMARY KEY (positionId)
);

CREATE TABLE UserAccount (
	userID tinyint(255) NOT NULL  AUTO_INCREMENT, 
	position tinyint(255) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	gender varchar(10) NOT NULL, 
	email varchar(255) NOT NULL UNIQUE,
	dateOfBirth date NOT NULL,
	address varchar(255) NOT NULL,
	phoneNumber varchar(255) NOT NULL,
	PRIMARY KEY (userID),
	FOREIGN KEY (position) REFERENCES Position (positionId)
);	

CREATE TABLE Tutor ( 
	userID tinyint(255) NOT NULL UNIQUE,
	userName varchar(50) NOT NULL UNIQUE,
	password varchar(50) NOT NULL,
	PRIMARY KEY (userName),
	FOREIGN KEY (userID)REFERENCES UserAccount(userID)
);

CREATE TABLE Student ( 
	userID tinyint(255)NOT NULL UNIQUE,
	userName varchar(50) NOT NULL UNIQUE,
	password varchar(50) NOT NULL,
	PRIMARY KEY (userName),
	FOREIGN KEY (userID)REFERENCES UserAccount(userID)
);

CREATE TABLE Administrator ( 
	userID tinyint(255)NOT NULL UNIQUE,
	userName varchar(50) NOT NULL UNIQUE,
	password varchar(50) NOT NULL,
	PRIMARY KEY (userName),
	FOREIGN KEY (userID)REFERENCES UserAccount(userID)
);



CREATE TABLE Courses(
	courseID tinyint(255) NOT NULL AUTO_INCREMENT,
	courseName tinyint(255) NOT NULL,
	taughtBy tinyint(255) NOT NULL,
	PRIMARY KEY (courseID),
	FOREIGN KEY (taughtBy) REFERENCES Tutor(userID)
);

CREATE TABLE Assign(
	assignID tinyint(255) NOT NULL  AUTO_INCREMENT, 
	tutorID tinyint(255) NOT NULL,
	studentID tinyint(255) NOT NULL,
	adminID  tinyint(255) NOT NULL,
	assignmentDate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	
	PRIMARY KEY (assignID),
	FOREIGN KEY (tutorID) REFERENCES UserAccount (userID),
	FOREIGN KEY (studentID) REFERENCES UserAccount(userID),
	FOREIGN KEY (adminID) REFERENCES UserAccount (userID)
);

CREATE TABLE Message(
	messageID tinyint(255) NOT NULL UNIQUE AUTO_INCREMENT, 
	parentID tinyint(255) NOT NULL,
	sender tinyint(255) NOT NULL,
	recipient tinyint(255) NOT NULL,
	contentDetails varchar(255) NOT NULL,
	dateOfMessages timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (messageID),
	FOREIGN KEY (sender) REFERENCES UserAccount(userID),
	FOREIGN KEY (recipient) REFERENCES UserAccount(userID)

);

CREATE TABLE Meeting(
	meetingID tinyint(255) NOT NULL UNIQUE AUTO_INCREMENT, 
	meetingHost tinyint(255) NOT NULL,	
	meetingAttendee tinyint(255) NOT NULL,
	startTime time NOT NULL,
	endTime time NOT NULL, 
	PRIMARY KEY (meetingID),
	FOREIGN KEY (meetingHost) REFERENCES Tutor(userID),
	FOREIGN KEY (meetingAttendee) REFERENCES Student(userID)
);

CREATE TABLE Documents(
	documentID tinyint(255) NOT NULL UNIQUE AUTO_INCREMENT, 
	documentName varchar(255) NOT NULL,	 
	documentDescription varchar(255) NOT NULL,	 
	documentType varchar(255) NOT NULL,	 
	uploadedBy tinyint(255) NOT NULL,	 
	PRIMARY KEY (documentID),
	FOREIGN KEY (uploadedBy) REFERENCES UserAccount(userID)
);

CREATE TABLE Comments(
	commentID tinyint(255) NOT NULL UNIQUE AUTO_INCREMENT, 
	document tinyint(255) NOT NULL,	 
	commentDetails varchar(255) NOT NULL,	 
	madeBy tinyint(255) NOT NULL,
	commentDate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (commentID),
	FOREIGN KEY (madeBy) REFERENCES UserAccount(userID),
	FOREIGN KEY (document) REFERENCES Documents(documentID)
);