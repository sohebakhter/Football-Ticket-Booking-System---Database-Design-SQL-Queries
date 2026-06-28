# Football Ticket Booking Database

## 📖 Project Overview

This project is a PostgreSQL-based relational database for managing a football ticket booking system. It demonstrates database design concepts including entity relationships, primary and foreign keys, constraints, joins, subqueries, and SQL queries.

The system allows users to browse football matches, book tickets, manage payments, and maintain match-related information efficiently.

---

## 📌 Features

* User management
* Football match management
* Tournament categorization
* Ticket booking system
* Payment status tracking
* Match availability management
* Data validation using CHECK constraints
* Primary Key and Foreign Key relationships
* SQL queries using joins, subqueries, aggregate functions, sorting, and filtering

---

## 🗂️ Database Tables

* **users**
* **matches**
* **bookings**

---

## 🔑 Relationships

* One User can have multiple Bookings.
* One Match can have multiple Bookings.
* Each Booking belongs to exactly one User and one Match.

---

## 🛠️ Technologies Used

* PostgreSQL
* SQL

---

## 📋 Constraints Implemented

* Primary Keys
* Foreign Keys
* CHECK Constraints
* NOT NULL Constraints
* UNIQUE Constraints (where applicable)

Examples:

* Restrict user roles
* Restrict match status values
* Prevent negative ticket prices

---

## 📊 Sample SQL Operations

The project includes queries demonstrating:

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* Aggregate Functions
* Subqueries
* COALESCE
* Filtering
* Sorting

---

## 🚀 How to Run

1. Create a PostgreSQL database.
2. Execute the schema SQL file to create all tables.
3. Insert the sample data.
4. Run the provided SQL queries.

---

## 📁 Project Structure

```text
├── QUERY.sql
├── ERD.png
└── README.md
```

---

## 🎯 Learning Objectives

This project demonstrates practical knowledge of:

* Relational Database Design
* Entity Relationship Diagram (ERD)
* SQL Constraints
* Joins
* Aggregate Functions
* Nested Queries
* Data Filtering
* Data Sorting

---

## 👨‍💻 Author

**Soheb Akhter**

---

## 📄 License

This project is created for educational and learning purposes.
