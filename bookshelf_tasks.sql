-- 1. Найти автора с самым большим числом книг и вывести его имя
SELECT authors.name FROM authors
JOIN authors_books ON authors_books.authors_id = authors.id
GROUP BY authors.name
ORDER BY COUNT(authors_books.authors_id) DESC
LIMIT 1;

-- 2. Вывести пять самых старых книг у которых указан год издания
SELECT * FROM books
WHERE books.year IS NOT NULL
ORDER BY books.year ASC
LIMIT 5;

-- 3. Вывести общее количество книг на полке в кабинете
SELECT COUNT(books.id) as count FROM books
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.title = 'Полка в кабинете'
GROUP BY books.shelves_id;

-- 4. Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне
SELECT books.title, authors.name, books.year FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE shelves.title = 'Полка в спальне';

-- 5. Вывести названия и годы издания книг, написанных автором 'Лев Толстой'
SELECT books.title, books.year FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name = 'Лев Толстой';

-- 6. Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"
SELECT books.title FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name LIKE 'А%';

-- 7. Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»
SELECT books.title, authors.name FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE shelves.title LIKE '%нижняя%' OR shelves.title LIKE '%верхняя%';

-- 8. Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД
