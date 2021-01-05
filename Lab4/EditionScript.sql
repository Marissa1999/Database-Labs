-- Author: Mohand Chebbine, Vanier College
-- September 17, 2018
-- Edition Script


DROP TABLE publisher CASCADE CONSTRAINTS;
DROP TABLE book CASCADE CONSTRAINTS;
DROP TABLE chapter CASCADE CONSTRAINTS;


CREATE TABLE publisher
(p_id NUMBER(5), 
p_name VARCHAR2(30),
p_address VARCHAR2(40),
CONSTRAINT publisher_p_id_pk PRIMARY KEY (p_id));

CREATE TABLE book
(b_id NUMBER(5), 
b_author VARCHAR2(30),
b_title VARCHAR2(30),
b_isbn VARCHAR2(13),
b_type VARCHAR2(2),  --- Only three values, To be considered BG (beginner), MD (Median), or EX (for Expert)
b_price NUMBER(6,2),
p_id NUMBER(5),
CONSTRAINT book_b_id_pk PRIMARY KEY (b_id),
CONSTRAINT book_b_id_fk FOREIGN KEY (p_id) REFERENCES publisher(p_id));

CREATE TABLE chapter
(b_id NUMBER(5),
c_no NUMBER(5),
c_title VARCHAR2(30),
c_type VARCHAR2(2), --- Only two values, To be sold separatly or not: TS or NS
c_price NUMBER(6,2),
CONSTRAINT chapter_pk PRIMARY KEY (b_id, c_no),
CONSTRAINT chapter_bid_fk FOREIGN KEY (b_id) REFERENCES book(b_id));


--- inserting records into publisher 
INSERT INTO publisher VALUES
(1, 'Course Technology', '13 Ontario Street Canada');

INSERT INTO publisher VALUES
(2, 'Campus Press', '21 Durocher Avenue Quebec Canada');

INSERT INTO publisher VALUES
(3, 'Pearson Education', '45 New York USA');

INSERT INTO publisher VALUES
(4, 'Harvard Publishing', 'New Hamphshir, Boston');

INSERT INTO publisher VALUES
(5, 'MIT Publishing', '32 Square Paule Boston, USA');




--- inserting records into book 
INSERT INTO book VALUES
(1, 'Stev Jeff', 'Java Programming','1234987','BG', 42.4, 4);

INSERT INTO book VALUES
(2, 'Amine Khan', 'Oracle Database','345675','EX', 252.4, 1);

INSERT INTO book VALUES
(3, 'Eduard Becker', 'History of Art','098766','EX', 202.3, 5);

INSERT INTO book  VALUES
(4, 'James Peter', 'PHP Programming','765432','MD', 66.7, 2);

INSERT INTO book  VALUES
(5, 'Paul Tremblay', 'Economy and Wealth','1209845','BG', 43.3, 3);

INSERT INTO book  VALUES
(6, 'Paul Henry', 'Business principles','654321','BG', 12.6, 4);



--- inserting records into chapter
INSERT INTO chapter VALUES
(1, 1, 'Java 1', 'TS', 12);

INSERT INTO chapter VALUES
(1, 2, 'Java 2', 'NS', 0);

INSERT INTO chapter VALUES
(2, 1, 'Oracle 1', 'TS', 22);

INSERT INTO chapter VALUES
(2, 2, 'Oracle 2', 'TS', 32);

INSERT INTO chapter VALUES
(2, 3, 'Oracle 3', 'TS', 42);

INSERT INTO chapter VALUES
(3, 1, 'History 1', 'NS', 0);

INSERT INTO chapter VALUES
(3, 2, 'History 2', 'NS', 0);

INSERT INTO chapter VALUES
(3, 3, 'History 3', 'TS', 65);

INSERT INTO chapter VALUES
(4, 1, 'PHP 1', 'TS', 12);

INSERT INTO chapter VALUES
(4, 2, 'PHP 2', 'TS', 65);

INSERT INTO chapter VALUES
(5, 1, 'Economy 1', 'TS', 52);

INSERT INTO chapter VALUES
(5, 2, 'Economy 2', 'TS', 76);

INSERT INTO chapter VALUES
(6, 1, 'Business 1', 'NS', 0);


COMMIT;
