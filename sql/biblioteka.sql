CREATE TABLE
    IF NOT EXISTS public.readers(
        reader_id INTEGER PRIMARY KEY NOT NULL,
        reader_nomer INTEGER NOT NULL,
        reader_fullname VARCHAR(100) NOT NULL,
        reader_adress VARCHAR(100) NOT NULL,
        reader_phone VARCHAR(20)
    );

ALTER TABLE public.readers OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.isdat(
        isdat_id INTEGER PRIMARY KEY NOT NULL,
        isdat_name VARCHAR(100) NOT NULL,
        city_isdat VARCHAR(100) NOT NULL
    );

ALTER TABLE public.isdat OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.authors(
        author_id INTEGER PRIMARY KEY NOT NULL,
        first_author VARCHAR(100) NOT NULL,
        second_author VARCHAR(100),
        third_authors VARCHAR(100),
        fourth_author VARCHAR(100),
        fifth_author VARCHAR(100)
    );

ALTER TABLE public.authors OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.book(
        book_id INTEGER PRIMARY KEY NOT NULL,
        book_name VARCHAR(100) NOT NULL,
        author_id INTEGER NOT NULL,
        book_date DATE NOT NULL,
        book_list NUMERIC NOT NULL,
        book_price NUMERIC NOT NULL,
        book_ex NUMERIC NOT NULL,
        isdat_id INTEGER NOT NULL,
        FOREIGN KEY (author_id) REFERENCES authors (author_id),
        FOREIGN KEY (isdat_id) REFERENCES isdat (isdat_id)
    );

ALTER TABLE public.book OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.cardbook(
        cardbook_id INTEGER NOT NULL PRIMARY KEY,
        reader_id INTEGER NOT NULL,
        book_id INTEGER NOT NULL,
        cardbook_togive DATE NOT NULL,
        cardbook_totake DATE,
        FOREIGN KEY (reader_id) REFERENCES readers (reader_id),
        FOREIGN KEY (book_id) REFERENCES book (book_id)
    );

ALTER TABLE public.cardbook OWNER TO postgres;