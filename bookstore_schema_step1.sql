
-- Step 1: Database Schema and Sample Data for Online Bookstore

show databases;
use bookstore_db;
-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- Books
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    author VARCHAR(100),
    category_id INT,
    price DECIMAL(8,2),
    stock INT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Discounts
CREATE TABLE discounts (
    discount_code VARCHAR(20) PRIMARY KEY,
    description TEXT,
    percentage DECIMAL(5,2),
    valid_until DATE
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    discount_code VARCHAR(20),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (discount_code) REFERENCES discounts(discount_code)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_method ENUM('Credit Card', 'Debit Card', 'UPI', 'Cash', 'Wallet'),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    book_id INT,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Shipping
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    courier_service VARCHAR(100),
    tracking_number VARCHAR(100),
    shipped_date DATE,
    delivery_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO categories (category_name) VALUES
('Fantasy'),
('Business'),
('History'),
('Romance'),
('Health');
-- Insert missing categories (7 to 11)
INSERT INTO categories (category_name) VALUES
('Fantasy'),       -- id 7
('Business'),      -- id 8
('History'),       -- id 9
('Romance'),       -- id 10
('Health');        -- id 11


INSERT INTO books (title, author, category_id, price, stock, description) VALUES
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 7, 550.00, 30, 'Magical adventures at Hogwarts'),
('Rich Dad Poor Dad', 'Robert T. Kiyosaki', 8, 400.00, 20, 'Personal finance insights'),
('Sapiens', 'Yuval Noah Harari', 9, 620.00, 25, 'History of humankind'),
('The Notebook', 'Nicholas Sparks', 10, 380.00, 18, 'Heartfelt love story'),
('Ikigai', 'Héctor García', 11, 300.00, 22, 'Japanese secret to a long and happy life');

INSERT INTO customers (name, email, password_hash, phone, address) VALUES
('Lakshmi Menon', 'lakshmi@gmail.com', 'hashed_pass5', '9876000001', 'Chennai, India'),
('Faizan Ali', 'faizan@gmail.com', 'hashed_pass6', '9867000002', 'Lucknow, India'),
('Neha Verma', 'neha@gmail.com', 'hashed_pass7', '9858000003', 'Jaipur, India');

INSERT INTO discounts (discount_code, description, percentage, valid_until) VALUES
('WELCOME15', '15% Off for New Users', 15, '2025-08-01'),
('BOOKLOVE', 'Flat 5% Off on all books', 5, '2025-09-30');

INSERT INTO orders (customer_id, discount_code, status) VALUES
(5, 'WELCOME15', 'Shipped'),
(6, 'BOOKLOVE', 'Pending'),
(7, NULL, 'Delivered');

INSERT INTO order_items (order_id, book_id, quantity) VALUES
(5, 11, 1),
(5, 12, 1),
(6, 13, 2),
(7, 14, 1),
(7, 15, 2);

INSERT INTO payments (order_id, amount, payment_method) VALUES
(5, 807.50, 'UPI'),        -- After 15% discount
(6, 1178.00, 'Net Banking'), -- After 5% discount on 620*2
(7, 980.00, 'Credit Card');  -- No discount

INSERT INTO shipping (order_id, courier_service, tracking_number, shipped_date, delivery_date) VALUES
(5, 'Ecom Express', 'EC9876541230', '2025-05-05', '2025-05-10'),
(6, 'DTDC', 'DT1122334455', '2025-05-06', NULL), -- In transit
(7, 'India Post', 'IP9988776655', '2025-04-25', '2025-04-29');

INSERT INTO reviews (customer_id, book_id, rating, comment) VALUES
(5, 11, 5, 'A magical start to an epic series!'),
(6, 13, 5, 'A must-read history book.'),
(7, 15, 4, 'Simple and effective life lessons');







describe books;

#1. Show all best-rated books
SELECT b.title, AVG(r.rating) AS avg_rating
FROM books b
JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id
ORDER BY avg_rating DESC;

#2. Orders with customer name and total amount
SELECT o.order_id, c.name, SUM(b.price * oi.quantity) AS total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY o.order_id;

