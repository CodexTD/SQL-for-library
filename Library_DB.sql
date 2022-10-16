CREATE TABLE Member (

member_id	varchar(30)		PRIMARY KEY,
member_name	varchar(45)	NOT NULL,
member_address		varchar(45)	NOT NULL,
contact_number	numeric(11)	NOT NULL,
date_of_birth	date NOT NULL,
email		varchar(45) NOT NULL,
);

CREATE TABLE Loan (
loan_id		varchar(30)		PRIMARY KEY,
issue_date	date	NOT NULL,
return_date	date	NOT NULL,
due_date	date	NOT NULL,
member_id	varchar(30),
);
ALTER TABLE Loan ADD FOREIGN KEY (member_id) REFERENCES Member (member_id);

CREATE TABLE Book (
book_id		varchar(30)		PRIMARY KEY,
book_name	varchar(45)	NOT NULL,
ISBN_no		numeric(20)	NOT NULL,
edition		varchar(45)	NOT NULL,
author_name	varchar(45)	NOT NULL,
price		numeric	NOT NULL,
library_copy_no	varchar(45)	NOT NULL,
);

CREATE TABLE Loan_Has_Book(
loan_id		varchar(30)	NOT NULL,
book_id		varchar(30)	NOT NULL,
PRIMARY KEY (loan_id, book_id),
FOREIGN KEY (loan_id) REFERENCES Loan (loan_id),
FOREIGN KEY (book_id) REFERENCES Book (book_id),
);
CREATE TABLE Payment (
payment_id	varchar(30)		PRIMARY KEY,
total_amount	int	NOT NULL,
cash		char(10)	NOT NULL,
description	varchar(45)	NOT NULL,
date_of_pay		date	NOT NULL,
member_id	varchar(30)	NOT NULL,
loan_id		varchar(30)	NULL,
);
ALTER TABLE Payment ADD FOREIGN KEY (member_id) REFERENCES Member (member_id);
ALTER TABLE Payment ADD FOREIGN KEY (loan_id) REFERENCES Loan (loan_id);

CREATE TABLE Card_Pay (
card_pay_id	varchar(30)		PRIMARY KEY,
card_no		numeric(16)		NOT NULL,
cardholder_name	varchar(45)	NOT NULL,
card_type	varchar(45)	NOT NULL,
expiary_date	date	NOT NULL,
payment_id	varchar(30)	NOT NULL,
member_id	varchar(30)	NOT NULL,
visa_or_master	char(6)	NOT NULL, 
);

ALTER TABLE Card_Pay ADD FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);
ALTER TABLE Card_Pay ADD FOREIGN KEY (member_id) REFERENCES Member (member_id);

ALTER TABLE Member ADD CONSTRAINT chk_number CHECK (contact_number like '[9][4][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
ALTER TABLE Loan ADD CONSTRAINT chk_due_date CHECK (due_date < '2030-01-01');
ALTER TABLE Payment ADD CONSTRAINT chk_desciption CHECK (description IN ('Book Loan' ,'Membership' ,'Delayed Book Fee'));
ALTER TABLE Card_Pay ADD CONSTRAINT chk_card_type CHECK (card_type IN ('credit', 'debit'));
ALTER TABLE Payment ADD CONSTRAINT chk_total_amount CHECK (total_amount>=500 AND total_amount<=50000);
ALTER TABLE Card_Pay ADD CONSTRAINT chk_isa_or_master CHECK (visa_or_master IN ('VISA' , 'MASTER'));
ALTER TABLE Book ADD CONSTRAINT chk_ISBN_no CHECK (ISBN_no like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
ALTER TABLE Payment ADD CONSTRAINT chk_cash CHECK (cash IN ('YES', 'NO'));


INSERT INTO Member VALUES ('TD0198' , 'Tashika Dilshan' , '275/A, Delgahawaththa, Meepawala' , '94777249716' , '1998-10-16', 'tashikadilshan1998@gmail.com');
INSERT INTO Member VALUES ('YA100' , 'Yasith Anjana' , '76/C,Hirimbura,Galle' , '94712463589' , '2000-01-23', 'yashithAnaja@yahoo.com');
INSERT INTO Member VALUES ('KR196' , 'Kusum Renu' , '55/3,Palliya Para,Karapitiya' , '94765452204' , '1996-11-06', 'renu.Kusum96@gmail.com');
INSERT INTO Member VALUES ('HR603' , 'Hansini Rajapaksha' , 'Kithulampitiya Para,Galle' , '94756890872' , '2003-06-30', 'rajapaksha.Hansi003@gmail.com');
INSERT INTO Member VALUES ('KM402' , 'Kalum Munasinghe' , 'Mahawaththa,Kalegana,Galle' , '94781463893' , '2002-04-12', 'munasinghe020@gmail.com');
INSERT INTO Member VALUES ('AD704' , 'Asitha Diwlapitiya' , '443/A,Mahaweediya Road,Galle' , '94712403887' , '2004-07-20', 'asithalucky7@gmail.com');
INSERT INTO Member VALUES ('PW895' , 'Prashani Wikramasinghe' , '77A,Bossa,Galle' , '94770990374' , '1995-08-15', 'pawickckrama95@gmail.com');
INSERT INTO Member VALUES ('IK1198' , 'Inura Kavishka' , '11/6,Beligaha junction,Galle' , '94771380066' , '1998-11-23', 'kavishkawikramanayake@gmail.com');
INSERT INTO Member VALUES ('NYB306' , 'Nadee Yapa Bandara' , 'Cross rd 01,Kalahe' , '94712106630' , '2006-03-23', 'nadeeBanda06@gmail.com');
INSERT INTO Member VALUES ('NT396' , 'Natasha Tamico' , 'Julgaha junction,Galle' , '94756630743' , '1996-03-27', 'tamicoNat96@gmail.com');
INSERT INTO Member VALUES ('CW1292' , 'Chamila Weebaduarachchi' , '118/A,Poddala,Galle' , '94766410186' , '1992-12-13', 'weebaduCH92@gmail.com');

INSERT INTO Loan VALUES ('LN01TD0198', '2022-05-17','2023-01-17', '2023-05-17', 'TD0198');
INSERT INTO Loan VALUES ('LN02YA100', '2022-07-29','2023-03-29', '2023-07-29', 'YA100');
INSERT INTO Loan VALUES ('LN03KR196', '2021-12-18','2022-06-18', '2022-12-18', 'KR196');
INSERT INTO Loan VALUES ('LN04HR603', '2020-03-13','2020-08-13', '2021-03-13', 'HR603');
INSERT INTO Loan VALUES ('LN05KM402', '2021-06-06','2022-01-06', '2022-06-06', 'KM402');
INSERT INTO Loan VALUES ('LN06AD704', '2022-10-16','2023-03-16', '2023-10-16', 'AD704');
INSERT INTO Loan VALUES ('LN07PW895', '2022-01-11','2022-07-11', '2023-01-11', 'PW895');
INSERT INTO Loan VALUES ('LN08IK1198', '2021-09-25','2022-02-25', '2022-09-25', 'IK1198');
INSERT INTO Loan VALUES ('LN09NYB306', '2019-08-18','2020-08-18', '2021-08-18', 'NYB306');
INSERT INTO Loan VALUES ('LN10NT396', '2021-05-30','2021-11-30', '2022-05-30', 'NT396');
INSERT INTO Loan VALUES ('LN11IK1198', '2020-07-17','2021-02-17', '2022-02-17', 'IK1198');
INSERT INTO Loan VALUES ('LN12AD704', '2022-10-02','2023-03-02', '2023-10-02', 'AD704');

INSERT INTO Book VALUES ('IEWU01', 'IT ENDS WITH US', 28719283704839372638, '1st', 'Colleen Hoover', 5500, '2');
INSERT INTO Book VALUES ('VR10', 'VERITY', 62738499870277725619, '2nd', 'Colleen Hoover', 7250, '1');
INSERT INTO Book VALUES ('IGMD22', 'I AM GLAD MY MOM DIED', 27772638903847672129, '1st', 'Jenette McCurdy', 6000, '4');
INSERT INTO Book VALUES ('FT22', 'FAIRY TALE', 89877700363872918273, '1st', 'Stephen King', 10000, '2');
INSERT INTO Book VALUES ('LOR54', 'LORD OF THE RINGS', 11980565444728375649, '1st', 'J R R Tolkien', 8500, '6');
INSERT INTO Book VALUES ('TSP19', 'THE SILENT PATIENT', 99833948571109822175, '2nd', 'Alex Michalides', 7550, '10');
INSERT INTO Book VALUES ('UL14', 'UGLY LOVE', 47787987846473827109, '1st', 'Colleen Hoover', 10250, '4');
INSERT INTO Book VALUES ('TGL20', 'THE GUEST LIST', 67383846409192738477, '2nd', 'Lucy Foley', 11550, '1');
INSERT INTO Book VALUES ('BR20', 'BEACH READ', 66252736455479026643, '2nd', 'Emily Henry', 2500, '2');
INSERT INTO Book VALUES ('TPP21', 'THE PAPER PALACE', 22728399373847565572, '3rd', 'Miranda Cowley Heller', 1750, '3');

INSERT INTO Loan_Has_Book VALUES ('LN01TD0198', 'IGMD22');
INSERT INTO Loan_Has_Book VALUES ('LN02YA100', 'UL14');
INSERT INTO Loan_Has_Book VALUES ('LN03KR196', 'TSP19');
INSERT INTO Loan_Has_Book VALUES ('LN04HR603', 'FT22');
INSERT INTO Loan_Has_Book VALUES ('LN05KM402', 'TPP21');
INSERT INTO Loan_Has_Book VALUES ('LN06AD704', 'IEWU01');
INSERT INTO Loan_Has_Book VALUES ('LN07PW895', 'BR20');
INSERT INTO Loan_Has_Book VALUES ('LN08IK1198', 'VR10');
INSERT INTO Loan_Has_Book VALUES ('LN09NYB306', 'IGMD22');
INSERT INTO Loan_Has_Book VALUES ('LN10NT396', 'LOR54');
INSERT INTO Loan_Has_Book VALUES ('LN11IK1198', 'TGL20');
INSERT INTO Loan_Has_Book VALUES ('LN12AD704', 'TPP21');

INSERT INTO Payment VALUES ('PYLN01', 6000, 'NO', 'Book Loan', '2023-05-17', 'TD0198', 'LN01TD0198');
INSERT INTO Payment VALUES ('PYLN02', 10250, 'YES', 'Book Loan', '2023-07-29', 'YA100', 'LN02YA100');
INSERT INTO Payment VALUES ('PYLN03', 7550, 'YES', 'Book Loan', '2022-12-18', 'KR196', 'LN03KR196');
INSERT INTO Payment VALUES ('PYLN04', 10000, 'NO', 'Book Loan', '2021-03-13', 'HR603', 'LN04HR603');
INSERT INTO Payment VALUES ('PYLN05', 1750, 'YES', 'Book Loan', '2022-06-06', 'KM402', 'LN05KM402');
INSERT INTO Payment VALUES ('PYLN06', 5500, 'NO', 'Book Loan', '2023-10-16', 'AD704', 'LN06AD704');
INSERT INTO Payment VALUES ('PYLN07', 2500, 'NO', 'Book Loan', '2023-01-11', 'PW895', 'LN07PW895');
INSERT INTO Payment VALUES ('PYLN08', 7250, 'YES', 'Book Loan', '2022-09-25', 'IK1198', 'LN08IK1198');
INSERT INTO Payment VALUES ('PYLN09', 6000, 'YES', 'Book Loan', '2021-08-18', 'NYB306', 'LN09NYB306');
INSERT INTO Payment VALUES ('PYLN10', 8500, 'NO', 'Book Loan', '2022-05-30', 'NT396', 'LN10NT396');
INSERT INTO Payment VALUES ('PYLN11', 11550, 'YES', 'Book Loan', '2022-02-17', 'IK1198', 'LN11IK1198');
INSERT INTO Payment VALUES ('PYLN12', 1750, 'NO', 'Book Loan', '2023-10-02', 'AD704', 'LN12AD704');
INSERT INTO Payment VALUES ('PYMBR01', 2500, 'YES', 'Membership', '2022-10-02', 'IK1198', NULL);
INSERT INTO Payment VALUES ('PYMBR02', 5000, 'NO', 'Membership', '2023-04-19', 'PW895', NULL);
INSERT INTO Payment VALUES ('PYMBR03', 2500, 'YES', 'Membership', '2022-12-25', 'HR603', NULL);
INSERT INTO Payment VALUES ('PYLN13', 4000, 'YES', 'Delayed Book Fee', '2021-02-23', 'KM402', NULL);
INSERT INTO Payment VALUES ('PYLN14', 4000, 'NO', 'Delayed Book Fee', '2022-04-12', 'TD0198', NULL);


INSERT INTO Card_Pay VALUES ('PAYCRD01', 2263001988272276, 'TASHIKA DILSHAN', 'CREDIT', '2024-06-01', 'PYLN01', 'TD0198', 'VISA');
INSERT INTO Card_Pay VALUES ('PAYCRD02', 2677736488048576,'HANSINI RAJAPAKSHA', 'CREDIT', '2026-10-01', 'PYLN04', 'HR603', 'VISA');
INSERT INTO Card_Pay VALUES ('PAYCRD03', 5574839288047263,'ASITHA DIWLAPITIYA', 'DEBIT', '2025-03-01', 'PYLN06', 'AD704', 'VISA');
INSERT INTO Card_Pay VALUES ('PAYCRD04', 9983049658559008,'PRASHANI WICKRAMASINGHE', 'CREDIT', '2023-08-01', 'PYLN07', 'PW895', 'MASTER');
INSERT INTO Card_Pay VALUES ('PAYCRD05', 0018275568475678,'NATASHA TAMICO', 'DEBIT', '2022-11-01', 'PYLN10', 'NT396', 'MASTER');
INSERT INTO Card_Pay VALUES ('PAYCRD06', 5574839288047263,'ASITHA DIWLAPITIYA', 'DEBIT', '2025-03-01', 'PYLN12', 'AD704', 'VISA');
INSERT INTO Card_Pay VALUES ('PAYCRD07', 9983049658559008,'PRASHANI WIKRAMASINGHE', 'CREDIT', '2023-08-01', 'PYMBR02', 'PW895', 'MASTER');
INSERT INTO Card_Pay VALUES ('PAYCRD08', 2263001988272276, 'TASHIKA DILSHAN', 'CREDIT', '2024-06-01', 'PYLN14', 'TD0198', 'VISA');

SELECT*FROM Member
SELECT*FROM Loan
SELECT*FROM Book
SELECT*FROM Loan_Has_Book
SELECT*FROM Payment
SELECT*FROM Card_Pay

/* QUESTION 06 (a) */
SELECT*FROM Member;

/* QUESTION 06 (b) */
SELECT*FROM Book WHERE price > 4750;

/* QUESTION 06 (c) */
SELECT*FROM Loan WHERE issue_date BETWEEN '2022-10-01' AND '2023-06-15';

/* QUESTION 06 (d) */
SELECT author_name , COUNT (*) AS 'total_books_by_authors'
FROM Book
GROUP BY author_name;

/* QUESTION 06 (e) */
UPDATE Book
SET book_name = 'A PASSAGE TO INDIA'
WHERE book_id = 'VR10';

/* QUESTION 06 (f) */
SELECT Member.member_name, COUNT(Loan.member_id) AS 'Numbers_Of_Loans'
FROM Loan JOIN Member ON Member.member_id = Loan.member_id
GROUP BY Member.member_name
HAVING COUNT(*)>1;


/* QUESTION 06 (g) */
SELECT Member.member_id, Member.member_name, Payment.payment_id, Payment.description, Payment.date_of_pay, Payment.total_amount
FROM Member, Payment
WHERE Member.member_id = Payment.member_id;

/* QUESTION 06 (h) */
SELECT Payment.description, Member.member_id, Member.member_name, Loan.loan_id, Loan.issue_date, Loan.return_date
FROM Member, Loan, Payment
WHERE Loan.member_id = Member.member_id AND Loan.loan_id = Payment.loan_id;

/* QUESTION 06 (i) */
SELECT Payment.description, Loan.loan_id, Loan.issue_date, Loan.return_date, Member.member_id, Member.member_name, Book.book_id, Book.book_name, Book.library_copy_no
FROM Member, Loan, Payment, Book, Loan_Has_Book
WHERE Loan.member_id = Member.member_id AND Loan.loan_id = Payment.loan_id AND Loan.loan_id = Loan_Has_Book.loan_id AND Loan_Has_Book.book_id = Book.book_id;



/* QUESTION 06 (j) */
SELECT Member.member_id, Member.member_name, Loan.loan_id, Loan.issue_date
FROM Member
LEFT JOIN Loan ON Member.member_id = Loan.member_id
WHERE Loan.loan_id IS NULL;


