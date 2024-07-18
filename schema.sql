CREATE DATABASE frigatto_books;

USE frigatto_books;

SET autocommit = 0;

CREATE TABLE book_kinds
(
    id   INT AUTO_INCREMENT,
    kind VARCHAR(30) NOT NULL,
    CONSTRAINT pk_book_kind PRIMARY KEY (id)
);

ALTER TABLE book_kinds
    ADD CONSTRAINT un_book_kinds_kind
        UNIQUE (kind);

CREATE TABLE book_genres
(
    id    INT AUTO_INCREMENT,
    genre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_book_genre PRIMARY KEY (id)
);

ALTER TABLE book_genres
    ADD CONSTRAINT un_book_genres_genre
        UNIQUE (genre);

CREATE TABLE books
(
    id           INT AUTO_INCREMENT,
    name         VARCHAR(80)   NOT NULL,
    price        DECIMAL(6, 2) NOT NULL,
    author       VARCHAR(40)   NOT NULL,
    release_year YEAR          NOT NULL,
    id_kind      INT           NOT NULL,
    id_genre     INT           NOT NULL,
    CONSTRAINT pk_book PRIMARY KEY (id)
);

ALTER TABLE books
    ADD CONSTRAINT un_books_name
        UNIQUE (name);

CREATE TABLE book_keywords
(
    id      INT AUTO_INCREMENT,
    keyword VARCHAR(20) NOT NULL,
    id_book INT         NOT NULL,
    CONSTRAINT pk_book_keyword PRIMARY KEY (id)
);

CREATE TABLE book_imgs
(
    id      INT AUTO_INCREMENT,
    img_url VARCHAR(255) NOT NULL,
    id_book INT          NOT NULL,
    CONSTRAINT pk_book_img PRIMARY KEY (id)
);

ALTER TABLE book_imgs
    ADD CONSTRAINT un_book_img_path
        UNIQUE (img_url);

CREATE TABLE users
(
    id       INT AUTO_INCREMENT,
    username VARCHAR(50)  NOT NULL,
    password VARCHAR(255) NOT NULL,
    img_url  VARCHAR(255) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

ALTER TABLE users
    ADD CONSTRAINT un_user_username
        UNIQUE (username);

ALTER TABLE users
    ADD CONSTRAINT un_user_img_url
        UNIQUE (img_url);

CREATE TABLE saved_books
(
    id      INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_book INT NOT NULL,
    CONSTRAINT pk_saved_book PRIMARY KEY (id)
);

ALTER TABLE books
    ADD CONSTRAINT fk_book_kinds_books
        FOREIGN KEY (id_kind) REFERENCES book_kinds (id)
            ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE books
    ADD CONSTRAINT fk_book_genres_books
        FOREIGN KEY (id_genre) REFERENCES book_genres (id)
            ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE book_keywords
    ADD CONSTRAINT fk_books_book_keywords
        FOREIGN KEY (id_book) REFERENCES books (id)
            ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE book_imgs
    ADD CONSTRAINT fk_books_book_imgs
        FOREIGN KEY (id_book) REFERENCES books (id)
            ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE saved_books
    ADD CONSTRAINT fk_books_saved_books
        FOREIGN KEY (id_book) REFERENCES books (id)
            ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE saved_books
    ADD CONSTRAINT fk_users_saved_books
        FOREIGN KEY (id_user) REFERENCES users (id)
            ON DELETE CASCADE ON UPDATE RESTRICT;

COMMIT;
