-- 1. Создайте таблицу Author (id, name, date_of_birth, nationality);
-- Добавьте новый столбец email в таблицу Author и удалите столбец nationality .
-- Добавьте ограничение к столбцу email уникальный, а к name not null.
-- Измените data type столбца name (varchar to text или наоборот).
-- Переименуйте название таблицы Author.
-- Создайте таблицу Book (id, name, published_year, author);
-- Добавьте ограничение к name not null and unique;
-- Добавьте 2 записей авторов и 6 записей книг

create table author (
                        id serial primary key,
                        name VARCHAR,
                        data_of_birth DATE,
                        nationality VARCHAR
);

alter table author ADD COLUMN email VARCHAR (100), drop column nationality;
alter table author add constraint email_u unique(email), add constraint name_n_null check ( name is not null);
alter table author alter column name type text;
alter table author rename to writer;

create table book (
                      id serial primary key,
                      name VARCHAR (100),
                      published_year DATE,
                      writer_id INTEGER,
                      constraint book_writer_id_fkey foreign key (writer_id) references writer (id)
);

alter table book alter column name set not null, add constraint name_u unique (name);

insert into writer (name, data_of_birth, email)
values
    ('J.K. Rowling', '1965-07-31', 'jk.rowling@example.com'),
    ('George Orwell', '1903-06-25', 'george.orwell@example.com');

insert into book (name, published_year, writer_id)
values
    ('Harry Potter','1997-01-01',1),
    ('Harry Potter-2','2000-01-01',1),
    ('Animal','2005-01-01',2),
    ('Rock star','2010-01-01',2),
    ('Pearl','2007-01-01', 1),
    ('Love','2020-01-01',2);