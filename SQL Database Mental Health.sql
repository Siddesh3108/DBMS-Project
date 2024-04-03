CREATE DATABASE aq;
USE aq;

CREATE TABLE User (
    User_ID INT NOT NULL PRIMARY KEY,
    User_name VARCHAR(50) NOT NULL,
    User_password VARCHAR(50) NOT NULL,
    User_dob DATE NOT NULL,
    User_gender CHAR(1) NOT NULL
);

INSERT INTO User (User_ID, User_name, User_password, User_dob, User_gender) 
VALUES 
(1, 'John Doe', 'password123', '1990-05-15', 'M'),
(2, 'Jane Smith', 'pass@123', '1985-08-25', 'F'),
(3, 'Alice Johnson', 'securepwd', '1995-03-10', 'F'),
(4, 'Bob Williams', 'bob@123', '1988-11-30', 'M'),
(5, 'Emily Brown', 'emilypass', '1992-09-20', 'F'),
(6, 'Michael Clark', 'mike@123', '1987-06-18', 'M'),
(7, 'Sarah Wilson', 'sarahpass', '1998-04-05', 'F'),
(8, 'David Martinez', 'david@123', '1993-12-12', 'M'),
(9, 'Jennifer Anderson', 'jenpass', '1996-10-30', 'F'),
(10, 'William Taylor', 'will@123', '1989-07-22', 'M');

CREATE TABLE User_Group (
    Group_ID INT NOT NULL PRIMARY KEY,
    Group_name VARCHAR(50) NOT NULL
);

INSERT INTO User_Group (Group_ID, Group_name)
VALUES 
(1, 'Admins'),
(2, 'Users'),
(3, 'Managers'),
(4, 'Developers'),
(5, 'Testers'),
(6, 'Support'),
(7, 'Sales'),
(8, 'Marketing'),
(9, 'Finance'),
(10, 'HR');

CREATE TABLE Group_Membership (
    Membership_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Group_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Group_ID) REFERENCES User_Group(Group_ID)
);

INSERT INTO Group_Membership (Membership_ID, User_ID, Group_ID)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

CREATE TABLE Assessment (
    Assessment_id INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Assessment_date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Assessment (Assessment_id, User_ID, Assessment_date)
VALUES 
(1, 1, '2024-01-15'),
(2, 2, '2024-02-20'),
(3, 3, '2024-03-10'),
(4, 4, '2024-04-05'),
(5, 5, '2024-05-12'),
(6, 6, '2024-06-25'),
(7, 7, '2024-07-08'),
(8, 8, '2024-08-14'),
(9, 9, '2024-09-30'),
(10, 10, '2024-10-22');

CREATE TABLE Score (
    Score_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Assessment_ID INT NOT NULL,
    Score_Value INT NOT NULL,
    Date_Score DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Assessment_ID) REFERENCES Assessment(Assessment_id)
);

INSERT INTO Score (Score_ID, User_ID, Assessment_ID, Score_Value, Date_Score)
VALUES 
(1, 1, 1, 80, '2024-01-15'),
(2, 2, 2, 75, '2024-02-20'),
(3, 3, 3, 90, '2024-03-10'),
(4, 4, 4, 85, '2024-04-05'),
(5, 5, 5, 70, '2024-05-12'),
(6, 6, 6, 78, '2024-06-25'),
(7, 7, 7, 82, '2024-07-08'),
(8, 8, 8, 88, '2024-08-14'),
(9, 9, 9, 92, '2024-09-30'),
(10, 10, 10, 95, '2024-10-22');

CREATE TABLE Answers (
    Answer_id INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Question_id INT NOT NULL,
    Answer_text VARCHAR(150) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Answers (Answer_id, User_ID, Question_id, Answer_text)
VALUES 
(1, 1, 1, 'Yes'),
(2, 2, 1, 'No'),
(3, 3, 1, 'Sometimes'),
(4, 4, 1, 'Yes'),
(5, 5, 1, 'No'),
(6, 6, 1, 'No'),
(7, 7, 1, 'Yes'),
(8, 8, 1, 'Sometimes'),
(9, 9, 1, 'No'),
(10, 10, 1, 'Yes');

CREATE TABLE Threshold (
    ID INT NOT NULL PRIMARY KEY,
    Assessment_ID INT NOT NULL,
    Description_text VARCHAR(250) NOT NULL,
    Title_text VARCHAR(150) NOT NULL,
    FOREIGN KEY (Assessment_ID) REFERENCES Assessment(Assessment_id)
);

INSERT INTO Threshold (ID, Assessment_ID, Description_text, Title_text)
VALUES 
(1, 1, 'Mild Concerns', 'Mental Health Score'),
(2, 2, 'Moderate Concerns', 'Mental Health Score'),
(3, 3, 'Severe Concerns', 'Mental Health Score'),
(4, 4, 'Mild Concerns', 'Mental Health Score'),
(5, 5, 'Moderate Concerns', 'Mental Health Score'),
(6, 6, 'Mild Concerns', 'Mental Health Score'),
(7, 7, 'Moderate Concerns', 'Mental Health Score'),
(8, 8, 'Severe Concerns', 'Mental Health Score'),
(9, 9, 'Mild Concerns', 'Mental Health Score'),
(10, 10, 'Moderate Concerns', 'Mental Health Score');

CREATE TABLE Form (
    Form_ID INT NOT NULL PRIMARY KEY,
    Form_title VARCHAR(50) NOT NULL,
    Form_Des VARCHAR(130) NOT NULL
);

INSERT INTO Form (Form_ID, Form_title, Form_Des)
VALUES 
(1, 'Mental Health Assessment Form', 'Assessment form for mental health evaluation'),
(2, 'Feedback Form', 'Form for collecting user feedback'),
(3, 'Employee Satisfaction Survey', 'Survey to gauge employee satisfaction'),
(4, 'Training Feedback Form', 'Form to gather feedback on training programs'),
(5, 'Customer Satisfaction Survey', 'Survey to measure customer satisfaction');

CREATE TABLE Reminder (
    Log_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Reminder_Text VARCHAR(250) NOT NULL,
    Reminder_Date DATE NOT NULL,
    Notes_Text VARCHAR(250) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Reminder (Log_ID, User_ID, Reminder_Text, Reminder_Date, Notes_Text)
VALUES 
(1, 1, 'Appointment with therapist', '2024-04-10', 'Discuss recent stress triggers'),
(2, 2, 'Complete feedback form', '2024-03-25', 'Provide detailed feedback on services'),
(3, 3, 'Follow up on assessment results', '2024-03-15', 'Review suggestions for improvement'),
(4, 4, 'Attend team meeting', '2024-04-01', 'Discuss project progress'),
(5, 5, 'Submit expense report', '2024-05-20', 'Include all receipts and details'),
(6, 6, 'Review performance goals', '2024-06-30', 'Prepare for quarterly review'),
(7, 7, 'Submit sales report', '2024-07-15', 'Include sales figures and analysis'),
(8, 8, 'Marketing campaign brainstorming', '2024-08-05', 'Discuss ideas for upcoming campaign'),
(9, 9, 'Financial audit preparation', '2024-09-25', 'Gather financial documents for audit'),
(10, 10, 'HR policy review', '2024-10-15', 'Review and update HR policies');

CREATE TABLE Contact (
    Contact_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Contact_Name TEXT NOT NULL,
    Phone INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Contact (Contact_ID, User_ID, Contact_Name, Phone)
VALUES 
(1, 1, 'Therapist Office', 0000000001),
(2, 2, 'Customer Support', 0000000002),
(3, 3, 'Manager', 0000000003),
(4, 4, 'Team Lead', 0000000004),
(5, 5, 'Finance Department', 0000000005),
(6, 6, 'Support Desk', 000000006),
(7, 7, 'Sales Manager', 0000000007),
(8, 8, 'Marketing Team', 0000000008),
(9, 9, 'Finance Director', 0000000009),
(10, 10, 'HR Manager', 0000000010);


CREATE TABLE Expense (
    Expense_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Date_text DATE NOT NULL,
    Amount_Int INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO Expense (Expense_ID, User_ID, Date_text, Amount_Int)
VALUES 
(1, 1, '2024-03-10', 100),
(2, 2, '2024-02-15', 75),
(3, 3, '2024-01-20', 150),
(4, 4, '2024-04-05', 200),
(5, 5, '2024-05-12', 50),
(6, 6, '2024-06-18', 120),
(7, 7, '2024-07-30', 180),
(8, 8, '2024-08-10', 90),
(9, 9, '2024-09-05', 250),
(10, 10, '2024-10-01', 150);

CREATE TABLE ActivityLog (
    Log_ID INT NOT NULL PRIMARY KEY,
    User_ID INT NOT NULL,
    Activity_type_text VARCHAR(250) NOT NULL,
    Duration_int INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

INSERT INTO ActivityLog (Log_ID, User_ID, Activity_type_text, Duration_int)
VALUES 
(1, 1, 'Exercise', 60),
(2, 2, 'Reading', 30),
(3, 3, 'Meeting', 120),
(4, 4, 'Coding', 180),
(5, 5, 'Walking', 45),
(6, 6, 'Training', 90),
(7, 7, 'Sales Call', 45),
(8, 8, 'Marketing Campaign', 240),
(9, 9, 'Financial Analysis', 150),
(10, 10, 'HR Training', 120);



SELECT * FROM User WHERE User_name = 'John Doe';

SELECT * FROM User WHERE User_name != 'John Doe';

SELECT * FROM Score WHERE Score_Value > 80;

SELECT * FROM Score WHERE Score_Value < 80;

SELECT * FROM Score WHERE Score_Value >= 80;

SELECT * FROM Score WHERE Score_Value <= 80;

SELECT * FROM User WHERE User_gender IN ('M', 'F');

SELECT * FROM User WHERE User_gender = 'M' AND User_dob < '1990-01-01';

SELECT * FROM User WHERE User_gender = 'F' OR User_dob >= '1990-01-01';

SELECT * FROM User;

INSERT INTO User (User_ID, User_name, User_password, User_dob, User_gender)
VALUES (11, 'Jessica Johnson', 'jess@123', '1991-04-20', 'F');

SELECT * FROM Score ORDER BY Score_Value DESC;

SELECT u.User_name, g.Group_name
FROM User u
JOIN Group_Membership gm ON u.User_ID = gm.User_ID
JOIN User_Group g ON gm.Group_ID = g.Group_ID;

SELECT u.User_name, MIN(s.Score_Value) AS Min_Score, MAX(s.Score_Value) AS Max_Score
FROM User u
JOIN Score s ON u.User_ID = s.User_ID
GROUP BY u.User_name;


SELECT User_name FROM User
UNION
SELECT Contact_Name FROM Contact;

SELECT User_name FROM User
UNION ALL
SELECT Contact_Name FROM Contact;


SELECT u.User_name, c.Contact_Name
FROM User u
INNER JOIN Contact c ON u.User_ID = c.User_ID;

SELECT u.User_name, c.Contact_Name
FROM User u
INNER JOIN Contact c ON u.User_ID = c.User_ID;

SELECT u.User_name, c.Contact_Name
FROM User u
INNER JOIN Contact c ON u.User_ID = c.User_ID;

SELECT u.User_name, c.Contact_Name
FROM User u
INNER JOIN Contact c ON u.User_ID = c.User_ID;