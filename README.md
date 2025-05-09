# book-hub-mysql-db
A real-world MySQL case study simulating a full-fledged online bookstore system. This project demonstrates relational database design, normalization, and query operations such as joins, filtering, aggregation, and transactions. Ideal for beginners to intermediate SQL learners who want hands-on practice building and querying structured data systems.

# 📚 MySQL Bookstore Management System

Welcome to the **Bookstore Management System**, a fully relational database designed using MySQL. This project demonstrates a real-world bookstore scenario—managing books, customers, orders, payments, shipping, and reviews. Whether you're new to SQL or exploring deeper database design principles, this case study provides a comprehensive, hands-on example of applying SQL to business logic.

---

## 🧠 Project Overview

This case study simulates the backend operations of an online bookstore. From the moment a customer browses a book to the final delivery and post-purchase review, each action is modeled in a set of interrelated MySQL tables. You’ll see how normalization, foreign key relationships, and well-structured queries build a maintainable and scalable database.

---

## 🗂️ Database Design

The project includes the following core tables:

- **Categories** – Classifies books into genres like Fiction, Programming, Romance, etc.
- **Books** – Stores detailed book information including stock and price.
- **Customers** – Contains user registration data.
- **Discounts** – Applies promo codes to eligible orders.
- **Orders** – Tracks individual purchases made by customers.
- **Order Items** – Represents books in each order.
- **Payments** – Captures payment method and amount per order.
- **Shipping** – Tracks shipment details and delivery status.
- **Reviews** – Captures customer feedback for books.

---

## 📦 Sample Data Highlights

- Over **13 popular books** across **11 categories**
- Realistic **customer and order flow**
- Embedded **discount logic** and **payment gateway simulation**
- Customer feedback via the **review system**

This dataset mimics a real-time transactional system, with relationships maintained through primary and foreign keys.

---

## 🔍 Use Cases Demonstrated

- Data normalization with multiple table joins
- Querying relational data using JOIN, WHERE, GROUP BY
- Managing inventory with stock control
- Handling promotional discounts
- Simulating order lifecycle from cart to shipment
- Collecting and analyzing customer reviews

---

## 🧪 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/bookstore-mysql-case-study.git
   ```

2. Open the SQL script:
   ```
   mysql_bookstore_full_script.sql
   ```

3. Import into MySQL:
   ```sql
   SOURCE path/to/mysql_bookstore_full_script.sql;
   ```

4. Run queries, explore data, and try custom transactions.

---

## 💡 Learning Goals

- ✅ Master MySQL basics with real-world modeling
- ✅ Understand database normalization and foreign key constraints
- ✅ Practice writing complex SELECT queries
- ✅ Gain insight into e-commerce-like backend structure

---

## ✍️ Author

**Bhukya Dayanand**  
Final-year CSE Undergraduate | Data & AI Enthusiast | 📍 NIT Patna  
📫 Connect on [LinkedIn](https://www.linkedin.com/) | ✨ Star this project if you like it!

---

## 📜 License

This project is open-source and free to use for educational purposes.
