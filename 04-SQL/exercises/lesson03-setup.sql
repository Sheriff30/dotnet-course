-- =============================================
-- الدرس 3: تجهيز جداول المكتبة
-- شغّل الملف ده كله مرة واحدة بـ F5
-- (لو شغّلته تاني، هيمسح الجداول ويعملها من الأول)
-- =============================================

USE Practice;
GO

DROP TABLE IF EXISTS Borrowings;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Books;
GO

CREATE TABLE Books (
    Id              INT IDENTITY(1,1) PRIMARY KEY,
    Title           NVARCHAR(200)  NOT NULL,
    Author          NVARCHAR(100)  NOT NULL,
    Genre           NVARCHAR(50)   NOT NULL,
    PublishYear     INT            NOT NULL,
    Pages           INT            NOT NULL,
    Price           DECIMAL(10,2)  NOT NULL,
    AvailableCopies INT            NOT NULL
);

CREATE TABLE Members (
    Id       INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email    NVARCHAR(100) NULL,
    City     NVARCHAR(50)  NOT NULL,
    JoinDate DATE          NOT NULL
);

CREATE TABLE Borrowings (
    Id         INT IDENTITY(1,1) PRIMARY KEY,
    BookId     INT  NOT NULL FOREIGN KEY REFERENCES Books(Id),
    MemberId   INT  NOT NULL FOREIGN KEY REFERENCES Members(Id),
    BorrowDate DATE NOT NULL,
    ReturnDate DATE NULL          -- NULL = لسه مرجعش الكتاب
);
GO

INSERT INTO Books (Title, Author, Genre, PublishYear, Pages, Price, AvailableCopies) VALUES
('Clean Code',               'Robert C. Martin',          'Programming', 2008, 464,  850.00, 3),
('The Pragmatic Programmer', 'Andrew Hunt',               'Programming', 1999, 352,  780.00, 2),
('C# in Depth',              'Jon Skeet',                 'Programming', 2019, 528,  950.00, 0),
('Atomic Habits',            'James Clear',               'Self-Help',   2018, 320,  350.00, 5),
('Rich Dad Poor Dad',        'Robert Kiyosaki',           'Finance',     1997, 336,  300.00, 4),
('The Alchemist',            'Paulo Coelho',              'Novel',       1988, 208,  250.00, 6),
('1984',                     'George Orwell',             'Novel',       1949, 328,  280.00, 2),
('Sapiens',                  'Yuval Noah Harari',         'History',     2011, 464,  420.00, 1),
('Deep Work',                'Cal Newport',               'Self-Help',   2016, 304,  330.00, 0),
('Design Patterns',          'Erich Gamma',               'Programming', 1994, 395, 1100.00, 1),
('The Psychology of Money',  'Morgan Housel',             'Finance',     2020, 256,  320.00, 3),
('Animal Farm',              'George Orwell',             'Novel',       1945, 112,  150.00, 7),
('Refactoring',              'Martin Fowler',             'Programming', 2018, 448,  900.00, 2),
('Thinking, Fast and Slow',  'Daniel Kahneman',           'Psychology',  2011, 499,  450.00, 0),
('The Little Prince',        'Antoine de Saint-Exupery',  'Novel',       1943,  96,  120.00, 10);

INSERT INTO Members (FullName, Email, City, JoinDate) VALUES
('Sherif Fouad',  'sherif@mail.com',  'Cairo',      '2025-01-15'),
('Ahmed Hassan',  'ahmed@mail.com',   'Alexandria', '2025-03-02'),
('Mona Ali',      'mona@mail.com',    'Cairo',      '2025-06-20'),
('Omar Khaled',   NULL,               'Giza',       '2025-08-11'),
('Sara Mahmoud',  'sara@mail.com',    'Mansoura',   '2026-01-05'),
('Youssef Adel',  'youssef@mail.com', 'Cairo',      '2026-02-14'),
('Nour Ibrahim',  NULL,               'Alexandria', '2026-05-30'),
('Karim Samir',   'karim@mail.com',   'Giza',       '2026-09-01');

INSERT INTO Borrowings (BookId, MemberId, BorrowDate, ReturnDate) VALUES
(1,  1, '2026-09-01', '2026-09-15'),
(3,  1, '2026-10-20', NULL),
(4,  2, '2026-08-10', '2026-08-25'),
(9,  3, '2026-10-25', NULL),
(6,  4, '2026-07-01', '2026-07-10'),
(14, 5, '2026-10-28', NULL),
(8,  6, '2026-09-12', '2026-10-01'),
(3,  6, '2026-10-30', NULL),
(10, 1, '2026-06-05', '2026-06-30'),
(12, 7, '2026-10-01', '2026-10-05'),
(9,  8, '2026-11-01', NULL),
(14, 3, '2026-11-02', NULL);
GO

SELECT 'Done! Books: 15, Members: 8, Borrowings: 12' AS Result;
