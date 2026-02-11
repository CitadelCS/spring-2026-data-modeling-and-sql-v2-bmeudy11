/*
    Class: CSCI-601
    Author: Bradley Eudy
    Assignment: SQL-1, Script - 1
*/

CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.publisher
(
    name    VARCHAR(100) NOT NULL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    phone   VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS library.book
(
    book_id        SERIAL PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    publisher_name VARCHAR(100),
    FOREIGN KEY (publisher_name)
        REFERENCES library.publisher (name)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS library.book_authors
(
    book_id     INT NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (book_id, author_name),
    FOREIGN KEY (book_id)
        REFERENCES library.book (book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS library.borrower
(
    card_no SERIAL PRIMARY KEY,
    name    VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone   VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS library.library_branch
(
    branch_id   SERIAL PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    address     VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS library.book_copies
(
    book_id      INT NOT NULL,
    branch_id    INT NOT NULL,
    no_of_copies INT NOT NULL,
    PRIMARY KEY (book_id, branch_id),
    FOREIGN KEY (book_id)
        REFERENCES library.book(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (branch_id)
        REFERENCES library.library_branch (branch_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS library.book_loans
(
    book_id   INT NOT NULL,
    branch_id INT NOT NULL,
    card_no   INT NOT NULL,
    date_out  TIMESTAMP NOT NULL DEFAULT current_date,
    due_date  TIMESTAMP NOT NULL,
    PRIMARY KEY (book_id, branch_id, card_no),
    FOREIGN KEY (book_id)
        REFERENCES library.book (book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (branch_id)
        REFERENCES library.library_branch (branch_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (card_no)
        REFERENCES library.borrower (card_no)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);