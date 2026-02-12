/*
    Class: CSCI-601
    Author: Bradley Eudy
    Assignment: SQL-1, Script - 2
*/

INSERT INTO library.publisher (name, address, phone)
VALUES ('Evening Post Books', '90 Alexander St, Charleston, SC 29403', '843-958-7367'),
       ('Arcadia Publishing', '210 Wingo Way, Suite 200, Mount Pleasant, SC 29464', '843-853-2070'),
       ('Forbes Books', '18 Broad Street, Suite 400, Charleston, SC 29401', '843-414-5600');

INSERT INTO library.library_branch (branch_name, address)
VALUES ('Downtown Charleston', '68 Calhoun Street, Charleston, SC 29401'),
       ('Daniel Island', '2301 Daniel Island Drive, Daniel Island, SC 29492'),
       ('West Ashley', '45 Windermere Boulevard, Charleston, SC 29407');

INSERT INTO library.borrower(name, address, phone)
VALUES ('Elias Rivers', '1492 Meeting Street, Charleston, SC 29405', '843-555-1212'),
       ('Mark Smith', '72 Tradd Street, Charleston, SC 29401', '843-234-2133'),
       ('Joe Riley', '2450 Savannah Hwy, Charleston, SC 29414', '843-987-0922');

INSERT INTO library.book (title, publisher_name)
VALUES ('Best Oyster Roasts', 'Forbes Books'),
       ('The Life of The Blue Crab', 'Arcadia Publishing'),
       ('Stingrays', 'Evening Post Books');

INSERT INTO library.book_authors (book_id, author_name)
SELECT book_id, 'Joe Smith'
FROM library.book
WHERE title = 'Best Oyster Roasts';

INSERT INTO library.book_authors (book_id, author_name)
SELECT book_id, 'Bob Reynolds'
FROM library.book
WHERE title = 'The Life of The Blue Crab';

INSERT INTO library.book_authors (book_id, author_name)
SELECT book_id, 'Mark Jones'
FROM library.book
WHERE title = 'Stingrays';

INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
SELECT b.book_id, l.branch_id, 5
FROM library.book b
         JOIN library.library_branch l
              ON b.title = 'Best Oyster Roasts' AND l.branch_name = 'Downtown Charleston';

INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
SELECT b.book_id, l.branch_id, 3
FROM library.book b
         JOIN library.library_branch l
              ON b.title = 'The Life of The Blue Crab' AND l.branch_name = 'Daniel Island';

INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
SELECT b.book_id, l.branch_id, 2
FROM library.book b
         JOIN library.library_branch l
              ON b.title = 'Stingrays' AND l.branch_name = 'West Ashley';

INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
SELECT b.book_id, l.branch_id, br.card_no, '2026-03-01', '2026-03-15'
FROM library.book b
         JOIN library.library_branch l ON l.branch_name = 'Downtown Charleston'
         JOIN library.borrower br ON br.name = 'Elias Rivers'
WHERE b.title = 'Best Oyster Roasts';

INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
SELECT b.book_id, l.branch_id, br.card_no, '2026-03-05', '2026-03-19'
FROM library.book b
         JOIN library.library_branch l ON l.branch_name = 'Daniel Island'
         JOIN library.borrower br ON br.name = 'Mark Smith'
WHERE b.title = 'The Life of The Blue Crab';

INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
SELECT b.book_id, l.branch_id, br.card_no, '2026-03-10', '2026-03-24'
FROM library.book b
         JOIN library.library_branch l ON l.branch_name = 'West Ashley'
         JOIN library.borrower br ON br.name = 'Joe Riley'
WHERE b.title = 'Stingrays';