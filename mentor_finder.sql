DROP DATABASE IF EXISTS mentorfinder;
CREATE DATABASE IF NOT EXISTS mentorfinder;
USE mentorfinder;


DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS country (
country_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(80) NOT NULL
);

DROP TABLE IF EXISTS organization;
CREATE TABLE IF NOT EXISTS organization (
current_organization_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(300) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS ethnicity;
CREATE TABLE IF NOT EXISTS ethnicity (
ethnicity_id INT PRIMARY KEY AUTO_INCREMENT,
ethnicity_type VARCHAR(80) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS degree;
CREATE TABLE IF NOT EXISTS degree (
degree_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(80) NOT NULL,
level VARCHAR(80) NOT NULL 
);


DROP TABLE IF EXISTS stem_field;
CREATE TABLE IF NOT EXISTS stem_field (
field_id INT PRIMARY KEY AUTO_INCREMENT,
field_name VARCHAR(80) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS mentee;
CREATE TABLE IF NOT EXISTS mentee (
user_id VARCHAR(80) PRIMARY KEY,
first_name VARCHAR(80) NOT NULL,
last_name VARCHAR(80) NOT NULL,
age INT NOT NULL,
country_id INT NOT NULL,
email VARCHAR(80) NOT NULL,
linkedIn VARCHAR(80) NOT NULL,
field_id INT NOT NULL,
CONSTRAINT mentee_fk_country FOREIGN KEY (country_id)
REFERENCES country (country_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentee_fk_stem_field FOREIGN KEY (field_id)
REFERENCES stem_field (field_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS mentors;

CREATE TABLE IF NOT EXISTS mentors (
mentor_id VARCHAR(80) PRIMARY KEY ,
first_name VARCHAR(80) NOT NULL,
last_name VARCHAR(80) NOT NULL,
country_id INT NOT NULL,
ethnicity_id INT NOT NULL,
gender_identity VARCHAR(20),
degree_id INT NOT NULL,
field_id INT NOT NULL,
current_organization_id INT NOT NULL,
linkedIn VARCHAR(80) NOT NULL,
CONSTRAINT mentors_fk_country FOREIGN KEY (country_id)
REFERENCES country (country_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentors_fk_ethnicity FOREIGN KEY (ethnicity_id)
REFERENCES ethnicity (ethnicity_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentors_fk_degree FOREIGN KEY (degree_id)
REFERENCES degree (degree_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentors_fk_stem_field FOREIGN KEY (field_id)
REFERENCES stem_field (field_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentors_fk_organization FOREIGN KEY (current_organization_id)
REFERENCES organization (current_organization_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS mentorship;

CREATE TABLE IF NOT EXISTS mentorship (
mentor_id VARCHAR(80) NOT NULL,
mentee_id VARCHAR(80) NOT NULL,
durationOfMentorship INT NOT NULL,
startDate DATE,
endDate DATE,
CONSTRAINT mentorship_fk_mentors FOREIGN KEY (mentor_id)
REFERENCES mentors (mentor_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT mentorship_fk_mentee FOREIGN KEY (mentee_id)
REFERENCES mentee (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS request_status;

CREATE TABLE IF NOT EXISTS request_status (
request_id INT PRIMARY KEY AUTO_INCREMENT,
mentor_id VARCHAR(80) NOT NULL,
mentee_id VARCHAR(80) NOT NULL,
status VARCHAR(80) NOT NULL DEFAULT("PENDING"),
CONSTRAINT request_status_fk_mentors FOREIGN KEY (mentor_id)
REFERENCES mentors (mentor_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT request_status_fk_mentee FOREIGN KEY (mentee_id)
REFERENCES mentee (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS pending_requests;

CREATE TABLE IF NOT EXISTS pending_requests (
request_id INT,
mentor_id VARCHAR(80) NOT NULL,
mentee_id VARCHAR(80) NOT NULL,
message_to_mentor VARCHAR(80) NOT NULL,
CONSTRAINT pending_reqs_fk_request_status FOREIGN KEY (request_id)
REFERENCES request_status (request_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pending_reqs_fk_mentors FOREIGN KEY (mentor_id)
REFERENCES mentors (mentor_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pending_reqs_fk_mentee FOREIGN KEY (mentee_id)
REFERENCES mentee (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- INSERT STATEMENTS 
USE mentorfinder;

INSERT INTO country (name) 
VALUES ("Afghanistan"), ("Albania"), ("Algeria") , ("Andorra"), ("Angola"), ("Antigua and Barbuda"), ("Argentina"), ("Armenia") , ("Austria") , ("Azerbaijan") , 
("Bahrain"), ("Bangladesh"), ("Barbados") , ("Belarus"), ("Belgium"), ("Belize"), ("Benin"), ("Bhutan") , ("Bolivia") , ("Bosnia and Herzegovina") , 
("Botswana"), ("Brazil"), ("Brunei") , ("Bulgaria"), ("Burkina Faso"), ("Burundi"), ("Cabo Verde"), ("Cambodia") , ("Cameroon") , ("Canada") ,
("Central African Republic"), ("Chad"), ("Channel Islands") , ("Chile"), ("China"), ("Colombia"), ("Comoros"), ("Congo") , ("Costa Rica") , ("Côte d'Ivoire") ,
("Croatia"), ("Cuba"), ("Cyprus") , ("Czech Republic"), ("Denmark"), ("Dominica"), ("Djibouti"), ("Dominican Republic") , ("DR Congo") , ("Ecuador") , 
("Egypt"), ("El Salvador"), ("Equatorial Guinea") , ("Eritrea"), ("Estonia"), ("Eswatini"), ("Ethiopia"), ("Faeroe Islands") , ("Finland") , ("France") , 
("French Guiana"), ("Gabon"), ("Gambia") , ("Georgia"), ("Germany"), ("Ghana"), ("Greece"), ("Gibraltar") , ("Grenada") , ("Guatemala") , 
("Guinea"), ("Guinea-Bissau"), ("Guyana") , ("Honduras"), ("Holy See"), ("Hong Kong"), ("Hungary"), ("Iceland") , ("India") , ("Indonesia") , 
("Iran"), ("Iraq"), ("Ireland") , ("Isle of Man"), ("Israel"), ("Italy"), ("Japan"), ("Jamaica") , ("Jordan") , ("Kazakhstan") , 
("Kenya"), ("Kuwait"), ("Kyrgyzstan") , ("Latvia"), ("Laos"), ("Lebanon"), ("Lesotho"), ("Liberia") , ("Libya") , ("Liechtenstein") , 
("Lithuania"), ("Luxembourg"), ("Macao") , ("Madagascar"), ("Malawi"), ("Malaysia"), ("Maldives"), ("Mali") , ("Malta") , ("Mauritania") , 
("Mauritius"), ("Mayotte"), ("Mexico") , ("Moldova"), ("Monaco"), ("Mongolia"), ("Montenegro"), ("Morocco") , ("Mozambique") , ("Myanmar") , 
("Namibia"), ("Nepal"), ("Netherlands") , ("Nicaragua"), ("Niger"), ("Nigeria"), ("North Korea"), ("Norway") , ("North Macedonia") , ("Oman") , 
("Pakistan"), ("Panama"), ("Paraguay") , ("Peru"), ("Philippines"), ("Poland"), ("Portugal"), ("Qatar") , ("Réunion") , ("Romania") , 
("Russia"), ("Rwanda"), ("Saint Helena") , ("Saint Lucia"), ("Saint Kitts and Nevis"), ("Saint Vincent and the Grenadines"), ("San Marino"), ("Senegal") , ("Serbia") ,
("Sao Tome & Principe"), ("Saudi Arabia"), ("Seychelles") , ("Singapore"), ("Slovakia"), ("Somalia"), ("Slovenia"), ("Spain") , ("Sierra Leone") , ("South Africa") , 
("South Korea"), ("South Sudan"), ("Sri Lanka") , ("Sudan"), ("Suriname"), ("Sweden"), ("Switzerland"), ("Syria") , ("Taiwan") , ("Tajikistan") , 
("State of Palestine"), ("Tanzania"), ("Thailand") , ("The Bahamas"), ("Timor-Leste"), ("Togo"), ("Trinidad and Tobago"), ("Tunisia") , ("Turkey") , ("Turkmenistan") , 
("Uganda"), ("Ukraine"), ("Uruguay") , ("United Arab Emirates"), ("United Kingdom"), ("United States"), ("Uzbekistan"), ("Venezuela") , ("Vietnam") , ("Yemen") , 
("Western Sahara"), ("Zambia"), ("Zimbabwe");

INSERT INTO stem_field (field_name)
VALUES ("Science"), ("Technology"), ("Engineering"), ("Mathematics") ;

INSERT INTO organization (name)
VALUES
  ('American Indian Science and Engineering Society (AISES)'), 
  ('Black Data Processing Associates (BDPA)'), 
  ('Black & Brown Founders'),
  ('Black Girls Code'),
  ('Blacks in Technology (BIT)'), 
  ('CODE2040'),
  ('DigitalUndivided (DID)'), 
  ('Information Technology Senior Management Forum (ITSMF)'),
  ('Lesbians Who Tech'),
  ('LGBTQ Tech'), 
  ('National Action Council for Minorities in Engineering (NACME)'),
  ('National Society of Black Engineers (NSBE)'),
  ('The Nonprofit Technology Enterprise Network (NTEN)'),
  ('Opportunity Hub (OHUB)'),
  ('Out in Tech'), 
  ('Society for Advancement of Chicanos/Hispanics and Native Americans in Science (SACNAS)'),
  ('Society of Hispanic Professional Engineers (SHPE)'),
  ('Trans*H4ck'),
  ('Wonder Women Tech'),
  ('2Gether-International'),
  ('Blind Institute of Technology'),
  ('Ada Developers Academy '), 
  ('The Last Mile '),
  ('Coders of Colour '),
  ('Coding Black Females '),
  ('Code Your Future'),
  ('Ada’s List '), 
  ('Natives in Tech'),
  ('Society of Asian Scientists and Engineers '), 
  ('Tech Disability Project'),
  ('Operation Code '),
  ('CodeNation'),
  ('Massachusetts Institute of Technology'),
  ('Stanford University'),
  ('Harvard University'),
  ('University of California, Berkeley'),
  ('Princeton University'), 
  ('Columbia University'),
  ('Yale University'),
  ('Duke University'),
  ('University of Pennsylvania'),
  ('Northwestern University'),
  ('Rice University'),
  ('Vanderbilt University'), 
  ('Northeastern University'),
('Apple'),
  ('Samsung Electronics'),
  ('Alphabet'),
  ('Microsoft'),
  ('Foxconn'),
  ('Huawei'),
  ('Meta'), 
  ('Sony'),
  ('Hitcahi'),
  ('Tencent'),
  ('Intel'),
  ('IBM'),
  ('Panasonic'),
  ('Lenovo'),
  ('Hewlett Packard'), 
  ('LG Electronics'),
  ('Cisco'),
  ('Xiaomi'),
  ('Tesla'),
  ('PlayStation'),
  ('NVIDIA'),
  ('Amazon'),
  ('Oracle'), 
  ('Adobe'),
   ('Uber'),
  ('Airbnb'),
  ('TikTok'),
  ('PayPal'),
  ('Intuit'),
  ('SAP'),
  ('Netflix'), 
  ('Salesforce')
  ;
  
INSERT INTO degree (name, level)
VALUES
  ('Animal Sciences','bachelors'), 
  ('Animal Sciences','masters'), 
  ('Animal Sciences','doctorate'), 
  ('Astronomy','bachelors'), 
  ('Astronomy','masters'), 
  ('Astronomy','doctorate'), 
  ('Biochemistry','bachelors'), 
  ('Biochemistry','masters'), 
  ('Biochemistry','doctorate'), 
  ('Biology','bachelors'), 
  ('Biology','masters'), 
  ('Biology','doctorate'), 
  ('Chemistry','bachelors'), 
  ('Chemistry','masters'), 
  ('Chemistry','doctorate'), 
  ('Ecology','bachelors'), 
  ('Ecology','masters'), 
  ('Ecology','doctorate'), 
  ('Environmental Science','bachelors'), 
  ('Environmental Science','masters'), 
  ('Environmental Science','doctorate'), 
  ('Physics','bachelors'), 
  ('Physics','masters'), 
  ('Physics','doctorate'), 
  ('Zoology','bachelors'), 
  ('Zoology','masters'), 
  ('Zoology','doctorate'), 
  ('Mathematics','bachelors'), 
  ('Mathematics','masters'), 
  ('Mathematics','doctorate'), 
  ('Computer Science','bachelors'), 
  ('Computer Science','masters'), 
  ('Computer Science','doctorate'), 
  ('Dentistry','bachelors'), 
  ('Dentistry','masters'), 
  ('Dentistry','doctorate'), 
  ('Nursing','bachelors'), 
  ('Nursing','masters'), 
  ('Nursing','doctorate'), 
  ('Aerospace Engineering','bachelors'), 
  ('Aerospace Engineering','masters'), 
  ('Aerospace Engineering','doctorate'), 
  ('Bioengineering','bachelors'), 
  ('Bioengineering','masters'), 
  ('Bioengineering','doctorate'), 
  ('Architecture','bachelors'), 
  ('Architecture','masters'), 
  ('Architecture','doctorate'), 
  ('Biomedical Engineering','bachelors'), 
  ('Biomedical Engineering','masters'), 
  ('Biomedical Engineering','doctorate'), 
  ('Chemical Engineering','bachelors'), 
  ('Chemical Engineering','masters'), 
  ('Chemical Engineering','doctorate'), 
  ('Civil Engineering','bachelors'), 
  ('Civil Engineering','masters'), 
  ('Civil Engineering','doctorate'), 
  ('Aerospace Engineering','bachelors'), 
  ('Aerospace Engineering','masters'), 
  ('Aerospace Engineering','doctorate'), 
  ('Bioengineering','bachelors'), 
  ('Bioengineering','masters'), 
  ('Bioengineering','doctorate'), 
  ('Computer Engineering','bachelors'), 
  ('Computer Engineering','masters'), 
  ('Computer Engineering','doctorate'), 
  ('Electrical Engineering','bachelors'), 
  ('Electrical Engineering','masters'), 
  ('Electrical Engineering','doctorate'), 
  ('Environmental Engineering','bachelors'), 
  ('Environmental Engineering','masters'), 
  ('Environmental Engineering','doctorate'), 
  ('Industrial Engineering','bachelors'), 
  ('Industrial Engineering','masters'), 
  ('Industrial Engineering','doctorate'), 
  ('Mechanical Engineering','bachelors'), 
  ('Mechanical Engineering','masters'), 
  ('Mechanical Engineering','doctorate'),
  ('Geology','bachelors'), 
  ('Geology','masters'), 
  ('Geology','doctorate'),
  ('Health','bachelors'), 
  ('Health','masters'), 
  ('Health','doctorate'),
  ('Pharmacy','bachelors'), 
  ('Pharmacy','masters'), 
  ('Pharmacy','doctorate'),
  ('Health','bachelors'), 
  ('Health','masters'), 
  ('Health','doctorate')
  ;

INSERT INTO ethnicity (ethnicity_type)
VALUES
  ('Hispanic'), 
  ('White'), 
  ('Black or African American'), 
  ('American Indian and Alaska Native'),
  ('Asian'),
  ('Native Hawaiian and Other Pacific Islander'), 
  ('Multiracial');


INSERT INTO mentors (mentor_id, first_name, last_name, country_id, ethnicity_id, gender_identity, degree_id, field_id, current_organization_id,
linkedIn) VALUES ( "alexa03", "Alexa", "Doe", 1, 1, "FEMALE", 1, 1 , 1,
"https://www.linkedin.com/in/hgn"),

("HanaGab21", "Hana", "Gabriella", 185, 1, "FEMALE", 86, 1, 29, 
 "https://www.linkedin.com/in/hgn") ,
 
("Nicolas11", "Nicolas", "Lip", 185, 7, "MALE", 78, 3, 49,
 "https://www.linkedin.com/in/hgn" ) ,
 
("lauren333", "Lauren", "Simson", 185, 3, "FEMALE", 64, 1, 69,
 "https://www.linkedin.com/in/hgn") ,
 
("tanShan09", "Tanshanika", "Smith", 185, 4, "FEMALE", 33, 1, 77,
"https://www.linkedin.com/in/hgn") ,

("arshi20!", "Salma", "Arsh", 185, 5, "FEMALE", 88, 1, 14,
"https://www.linkedin.com/in/hgn") ,


("sabu8796!!", "Rossa", "Sabu", 130, 5, "FEMALE", 72, 3, 29,
"https://www.linkedin.com/in/hgn") ,

("saeed90!", "Ariij", "Saaed", 138, 5, "FEMALE", 82, 1, 11,

"https://www.linkedin.com/in/hgn") ,

("nidhi@11", "Nidhi", "Kapur", 79, 5, "FEMALE", 59, 1, 9,
"https://www.linkedin.com/in/hgn") ,

("Qin990!", "Xio", "Qin", 76, 5, "FEMALE", 62, 2, 20,
"https://www.linkedin.com/in/hgn") ,

("arshi2!", "Salma", "Arsh", 1, 5, "FEMALE", 53, 2, 24,

"https://www.linkedin.com/in/hgn") ,

("saimy79=!", "Saimy", "Kaur", 12, 5, "FEMALE", 38, 1, 18,
"https://www.linkedin.com/in/hgn") ;

INSERT INTO mentee (user_id, first_name, last_name, age, country_id, email, linkedIn, field_id) 
VALUES ( "Mariah03", "Mariah", "Maynard", 23, 185, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) , 
( "shriyadh03", "Shriya", "Dhaundiyal", 25, 79, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3),
( "mitchie06", "Mitch", "Neides", 26, 82, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "tedHe99", "Teddy", "Hayeon", 18, 160, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "kenken", "Kennise", "Ng", 19, 190, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "nicoDeri3", "Nicolar", "Deri", 22, 65, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "thyuChe21", "Thyutien", "Che", 22, 188, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "mibu87", "Sush", "Mita", 25, 179, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "jbOnhigh!", "Joy", "Smith", 27, 70, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "mattPaffen890!", "Matt", "Paffenroth", 33, 11, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ,
( "sophiaR69!", "Sophie", "Rose", 25, 130, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ,
( "marcie46%", "Marcela", "Janero", 31, 132, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "brownAp90/!", "Apie", "Brown", 25, 185, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "parkHi87", "Parker", "Hill", 22, 185, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "harshie23", "Harsh", "Raghu", 21, 79, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "Smlaur2", "Lauren", "Smith", 17, 122, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "yiLaur90", "Lauryn", "Yi", 18, 111, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "grace431!", "Raqucel", "Gracia", 19, 65, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "escoIntoShri3!", "Pedro", "Escobar", 19, 29, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ,
( "hillBur76!", "Christain", "Hillbury", 25, 33, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ,
( "joJo89", "Joseph", "Rodriquez", 23, 66, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "Jojograce", "Joanna", "Jacob", 26, 44, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "AnnAl!", "Aleena", "Ann", 27, 25, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 2) ,
( "jpAzr!", "JP", "Azra", 27, 7, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 3) ,
( "panSar900", "Sarthak", "Pan", 28, 9, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "doedoe33", "John", "Doe", 29, 88, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 4) ,
( "tiguBru", "Bruce", "Tiger", 29, 95, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ,
( "ceceMo001", "Mo", "Cece", 18, 101, "abc@gmail.com", "https://www.linkedin.com/in/hgn", 1) ;

INSERT INTO request_status(request_id, mentor_id, mentee_id,status ) 
VALUES(1, "alexa03", "Mariah03", "PENDING"),
(2, "sabu8796!!", "Mariah03", "PENDING"),
(3, "alexa03", "doedoe33", "PENDING"),
(4, "arshi20!", "Smlaur2", "PENDING"),
(5, "arshi20!", "panSar900", "PENDING"),
(6, "saeed90!", "panSar900", "PENDING"),
(7, "lauren333", "panSar900", "PENDING"),
(8, "saeed90!", "Smlaur2", "PENDING"),
(9, "Nicolas11", "tiguBru", "PENDING"),
(10, "lauren333", "tiguBru", "PENDING");

INSERT INTO pending_requests(request_id, mentor_id, mentee_id, message_to_mentor) 
VALUES (1, "alexa03", "Mariah03", "Hello World!"),
(2, "sabu8796!!", "Mariah03", "Hello World!"),
(3, "alexa03", "doedoe33", "Hello World!"), 
(4, "arshi20!", "Smlaur2", "Hello World!"),
(5, "arshi20!", "panSar900", "Hello World!"),
(6, "saeed90!", "panSar900", "Hello World!"),
(7, "lauren333", "panSar900", "Hello World!"),
(8, "saeed90!", "Smlaur2", "Hello World!"),
(9, "Nicolas11", "tiguBru", "Hello World!"),
(10, "lauren333", "tiguBru", "Hello World!");

INSERT INTO mentorship( mentor_id, mentee_id, durationOfMentorship, startDate, endDate) 
VALUES ("alexa03", "Mariah03", 3, "1997-03-01", "1997-05-01");



/* 
Procedure to show present mentees under a mentor in the database.
*/ 
DROP PROCEDURE IF EXISTS show_current_mentees;

DELIMITER //
CREATE PROCEDURE show_current_mentees(mentor_id VARCHAR(100)) 
BEGIN 

	SELECT * FROM mentorship WHERE mentor_id = mentor_id;

END // 
DELIMITER ;


/* 
Update the status of mentorship request to declined when a mentor declines request.
*/
DROP PROCEDURE IF EXISTS change_status_declined;

DELIMITER //
CREATE PROCEDURE change_status_declined(request_id INT, mentor VARCHAR(100)) 
BEGIN 

UPDATE request_status
SET status = "DECLINED" WHERE request_id = request_id 
 AND mentor_id =  mentor ;
 
END // 
DELIMITER ;


/* 
Update the status of mentorship request to approved when a mentor accepts a request.
*/
DROP PROCEDURE IF EXISTS change_status_approved;

DELIMITER //
CREATE PROCEDURE change_status_approved(request_id INT, mentor VARCHAR(100)) 
BEGIN 

UPDATE request_status
SET status = "APPROVED" WHERE request_id = request_id 
 AND mentor_id =  mentor ;
 
END // 
DELIMITER ;



/* 
Trigger to delete the message request from pending requests table when a request is accepted or declined.
*/
DROP TRIGGER IF EXISTS message_request_trigger;
DELIMITER //
CREATE TRIGGER 
message_request_trigger
AFTER UPDATE ON 
request_status
FOR EACH ROW 
BEGIN 

DELETE 
FROM pending_requests
WHERE request_id = OLD.request_id;

END//
DELIMITER ;

/*
TRIGGER to add new relation to the mentorship table once request is approved
*/
DELIMITER //
CREATE TRIGGER 
add_mentorship
AFTER UPDATE ON 
request_status
FOR EACH ROW 
BEGIN 

-- DECLARE current_date DATE;
DECLARE date_add DATE;

-- SELECT curdate() into current_date;
SELECT date_add(current_date, INTERVAL 3 MONTH) into date_add;

IF (NEW.status = 'APPROVED') THEN
	INSERT INTO mentorship(mentor_id, mentee_id, durationOfMentorship, startDate, endDate) 
	VALUES (OLD.mentor_id,OLD.mentee_id, 3, current_date, date_add);
END IF;
END//
DELIMITER ;

END//
DELIMITER ;
/*
Proedure to show pending requests for the mentor.
*/
DROP PROCEDURE IF EXISTS show_requests;

DELIMITER //
CREATE PROCEDURE show_requests( mentor VARCHAR(100)) 
BEGIN 

SELECT * FROM pending_requests WHERE mentor_id = mentor ;
 
END // 
DELIMITER ;


/*
Procedure to check if the entered mentor ID is already in the database.
*/

DROP PROCEDURE IF EXISTS mentor_is_registered;

DELIMITER //
CREATE PROCEDURE mentor_is_registered( mentor VARCHAR(100)) 
BEGIN 

Select * FROM mentors where mentor_id = mentor;
 
END // 
DELIMITER ;

/*
Procedure to display all mentor's country names.
*/
DROP PROCEDURE IF EXISTS printCountries;

DELIMITER //
CREATE PROCEDURE printCountries() 
BEGIN 

SELECT DISTINCT country.* FROM country 
INNER JOIN mentors ON country.country_id = mentors.country_id ;

END // 
DELIMITER ;

/*
Procedure to display all mentor's organization names.
*/
DROP PROCEDURE IF EXISTS printOrganizations;

DELIMITER //
CREATE PROCEDURE printOrganizations() 
BEGIN 

Select DISTINCT organization.* FROM organization 
INNER JOIN mentors ON 
organization.current_organization_id = mentors.current_organization_id;

END // 
DELIMITER ;

/*
Procedure to display all mentor's ethnicities.
*/
DROP PROCEDURE IF EXISTS printEthnicities;

DELIMITER //
CREATE PROCEDURE printEthnicities() 
BEGIN 

Select DISTINCT ethnicity.* FROM ethnicity 
INNER JOIN mentors 
ON ethnicity.ethnicity_id = mentors.ethnicity_id;

END // 
DELIMITER ;

/*
Procedure to display all mentor's STEM fields.
*/
DROP PROCEDURE IF EXISTS printFields;

DELIMITER //
CREATE PROCEDURE printFields() 
BEGIN 

Select DISTINCT stem_field.* FROM stem_field 
INNER JOIN mentors 
ON stem_field.field_id = mentors.field_id;

END // 
DELIMITER ;

/*
Procedure to display all mentor's degree types.
*/

DROP PROCEDURE IF EXISTS printDegrees;

DELIMITER //
CREATE PROCEDURE printDegrees() 
BEGIN 

Select DISTINCT degree.* FROM degree 
INNER JOIN mentors 
ON degree.degree_id = mentors.degree_id;

END // 
DELIMITER ;

/*
Procedure to display mentor information for a particular country.
*/
DROP PROCEDURE IF EXISTS country_mentors;

DELIMITER //
CREATE PROCEDURE country_mentors(country_id INT) 
BEGIN 

Select * FROM mentors where country_id = country_id;

END // 
DELIMITER ;

/*
Procedure to display mentor information for a particular organization.
*/
DROP PROCEDURE IF EXISTS organization_mentors;

DELIMITER //
CREATE PROCEDURE organization_mentors(currentOrganizationID INT) 
BEGIN 

Select * FROM mentors 
where current_organization_id = currentOrganizationID;

END // 
DELIMITER ;

/*
Procedure to display mentor information for a particular ethnicity.
*/
DROP PROCEDURE IF EXISTS ethnicity_mentors;

DELIMITER //
CREATE PROCEDURE ethnicity_mentors(ethnicityID INT) 
BEGIN 

Select * FROM mentors WHERE ethnicity_id = ethnicityID;

END // 
DELIMITER ;

/*
Procedure to display mentor information for a particular field.
*/
DROP PROCEDURE IF EXISTS field_mentors;

DELIMITER //
CREATE PROCEDURE field_mentors(fieldID INT) 
BEGIN 

Select * FROM mentors WHERE fieldID = fieldID;

END // 
DELIMITER ;

/*
Procedure to display mentor information for a particular degree.
*/
DROP PROCEDURE IF EXISTS degree_mentors;

DELIMITER //
CREATE PROCEDURE degree_mentors(degreeID INT) 
BEGIN 

Select * FROM mentors WHERE degreeID = degreeID;

END // 
DELIMITER ;

/*
Procedure to check if mentee exists in our database.
*/
DROP PROCEDURE IF EXISTS is_registered;

DELIMITER //
CREATE PROCEDURE is_registered(userID VARCHAR(100)) 
BEGIN 

Select * FROM mentee where user_id = userID;

END // 
DELIMITER ;

DROP PROCEDURE IF EXISTS find_country_id;

DELIMITER //
CREATE PROCEDURE find_country_id(country VARCHAR(100)) 
BEGIN 

Select country_id FROM country 
where name = country ;

END // 
DELIMITER ;


/*
Procedure to find the field is of a particular field.
*/
DROP PROCEDURE IF EXISTS find_field_id;

DELIMITER //
CREATE PROCEDURE find_field_id(field VARCHAR(100)) 
BEGIN 

Select field_id FROM stem_field
where field_name = field;
 
END // 
DELIMITER ;


/*
Procedure to find the request id of a particular request.
*/
DROP PROCEDURE IF EXISTS find_request_id;

DELIMITER //
CREATE PROCEDURE find_request_id(mentor VARCHAR(100), mentee VARCHAR(100)) 
BEGIN 

Select request_id FROM request_status 
WHERE mentor_id = mentor AND mentee_id =  mentee ;
 
END // 
DELIMITER ;

DROP PROCEDURE IF EXISTS check_requests;

DELIMITER //
CREATE PROCEDURE check_requests(mentee VARCHAR(100)) 
BEGIN 

Select * FROM request_status
WHERE mentee_id = mentee;

END // 
DELIMITER ;

