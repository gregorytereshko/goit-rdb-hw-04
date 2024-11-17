-- Використання схеми
USE LibraryManagement;

-- Заповнення таблиці "authors"
INSERT INTO authors (author_name) VALUES 
('J.K. Rowling'),
('George Orwell');

-- Заповнення таблиці "genres"
INSERT INTO genres (genre_name) VALUES 
('Fantasy'),
('Dystopian');

-- Заповнення таблиці "books"
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES 
('Harry Potter and the Philosopher\'s Stone', 1997, 1, 1),
('1984', 1949, 2, 2);

-- Заповнення таблиці "users"
INSERT INTO users (username, email) VALUES 
('john_doe', 'john.doe@example.com'),
('jane_smith', 'jane.smith@example.com');

-- Заповнення таблиці "borrowed_books"
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES 
(1, 1, '2024-11-01', '2024-11-15'),
(2, 2, '2024-11-10', NULL);
