
-- 1. CATEGORIES
CREATE TABLE CATEGORIES (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL
);

-- 2. MEMBERS
CREATE TABLE MEMBERS (
    member_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150),
    phone VARCHAR2(20),
    city VARCHAR2(100),
    joined_on DATE DEFAULT SYSDATE,
    points NUMBER DEFAULT 0
);

-- 3. BOOKS
CREATE TABLE BOOKS (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    author VARCHAR2(150),
    category_id NUMBER,
    price NUMBER(8,2),
    copies_available NUMBER,
    published_year NUMBER,

    CONSTRAINT fk_books_categories
        FOREIGN KEY (category_id)
        REFERENCES CATEGORIES(category_id)
);

-- 4. LOANS
CREATE TABLE LOANS (
    loan_id NUMBER PRIMARY KEY,
    member_id NUMBER,
    book_id NUMBER,
    loaned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) DEFAULT 'ACTIVE',

    CONSTRAINT fk_loans_members
        FOREIGN KEY (member_id)
        REFERENCES MEMBERS(member_id),

    CONSTRAINT fk_loans_books
        FOREIGN KEY (book_id)
        REFERENCES BOOKS(book_id)
);




INSERT INTO categories VALUES (1, 'Technology');
INSERT INTO categories VALUES (2, 'Fiction');
INSERT INTO categories VALUES (3, 'History');

INSERT INTO members VALUES (1, 'Ahmed Hassan', 'ahmed.hassan@mail.com', '01012345678', 'Cairo', ADD_MONTHS(SYSDATE, -14), 250);
INSERT INTO members VALUES (2, 'Mona Ali', 'mona.ali@mail.com', '01123456789', 'Cairo', ADD_MONTHS(SYSDATE, -9), 120);
INSERT INTO members VALUES (3, 'Youssef Samir', 'youssef@gmail.com', '01234567890', 'Giza', ADD_MONTHS(SYSDATE, -3), 0);
INSERT INTO members VALUES (4, 'Amira Tarek', 'amira@mail.com', '01098765432', 'Alexandria', ADD_MONTHS(SYSDATE, -20), 80);
INSERT INTO members VALUES (5, 'Karim Nabil', 'karim@gmail.com', NULL, 'Cairo', ADD_MONTHS(SYSDATE, -7), 150);
INSERT INTO members VALUES (6, 'Sara Mahmoud', 'sara@mail.com', '01155551234', 'Giza', ADD_MONTHS(SYSDATE, -2), 400);
INSERT INTO members VALUES (7, 'Omar Fathy', 'omar@yahoo.com', '01277778888', 'Cairo', ADD_MONTHS(SYSDATE, -12), 95);
INSERT INTO members VALUES (8, 'Laila Adel', 'laila@mail.com', '01066669999', 'Mansoura', ADD_MONTHS(SYSDATE, -1), 30);

INSERT INTO books VALUES (1, 'Algorithms Made Simple', 'Omar Salem', 1, 450.00, 5, 2020);
INSERT INTO books VALUES (2, 'Ancient Egypt', 'Hana Mostafa', 3, 320.00, 3, 2018);
INSERT INTO books VALUES (3, 'Pocket SQL Guide', 'Nadia Fouad', 1, 85.00, 12, 2022);
INSERT INTO books VALUES (4, 'Spring Boot in Action', 'Tarek Hegazy', 1, 500.00, 4, 2023);
INSERT INTO books VALUES (5, 'Complete Oracle Reference', 'Mina Gerges', 1, 1250.00, 2, 2021);
INSERT INTO books VALUES (6, 'The Desert Night', 'Laila Hamdy', 2, 150.00, 0, 2015);
INSERT INTO books VALUES (7, 'Egyptian History', 'Hana Mostafa', 3, 280.00, 6, 2019);
INSERT INTO books VALUES (8, 'City of Lights', NULL, 2, 199.99, 7, 2017);
INSERT INTO books VALUES (9, 'Clean Code Basics', 'Youssef Anwar', 1, 600.00, 8, 2020);
INSERT INTO books VALUES (10, 'The Last Pharaoh', 'Amr Zaki', 3, 100.00, 1, 2016);

INSERT INTO loans (loan_id, member_id, book_id) VALUES (1, 1, 1);
INSERT INTO loans (loan_id, member_id, book_id) VALUES (2, 2, 3);
INSERT INTO loans (loan_id, member_id, book_id) VALUES (3, 3, 2);
INSERT INTO loans (loan_id, member_id, book_id) VALUES (4, 1, 4);
INSERT INTO loans (loan_id, member_id, book_id) VALUES (5, 6, 5);
INSERT INTO loans (loan_id, member_id, book_id) VALUES (6, 7, 9);

COMMIT;

ALTER TABLE BOOKS 
add  isbn VARCHAR2(20);

ALTER TABLE LOANS
ADD returned_at TIMESTAMP;

UPDATE LOANS
SET status = 'RETURNED',
    returned_at = CURRENT_TIMESTAMP
WHERE loan_id = 1;

UPDATE BOOKS
SET price = price * 1.10
WHERE category_id IN (
    SELECT category_id
    FROM CATEGORIES
    WHERE category_name = 'Fiction'
);

SELECT round(price * 1.14,2) AS VAT_price from books ;

COMMIT;

DELETE FROM books;
ROLLBACK;
COMMIT;

TRUNCATE TABLE BOOKS;


DELETE from MEMBERS
WHERE member_id  not in (
    SELECT member_id
    FROM loans
    WHERE status = 'ACTIVE'
);
COMMIT;


SELECT * FROM MEMBERS;

SELECT
    title AS "Book Title",
    author AS "Author",
    price AS "Price"
FROM BOOKS;

SELECT * FROM MEMBERS WHERE city is not NULL;

-- The result change because string comparisons in Oracle
-- are usually case-sensitive, so 'Cairo' differs from 'cairo'.
SELECT * FROM members WHERE city='Cairo';

SELECT title as Campaign_books FROM books WHERE price>300 and COPIES_AVAILABLE>0;

SELECT title , price  FROM books WHERE price BETWEEN 100 and 500;

-- the Best way 
SELECT FULL_NAME , city from members WHERE city in('Cairo','Giza','Alexandria');

SELECT FULL_NAME , city from members WHERE city='Cairo'or city= 'Giza' or  city='Alexandria';
 
 SELECT *FROM BOOKS WHERE title LIKE 'A%' OR title LIKE '%y';

-- phone = NULL does not work because NULL represents a missing
-- or unknown value, and it cannot be compared using =.
-- Use IS NULL to check for missing values.

SELECT full_name, phone
FROM members
WHERE phone IS NULL;



