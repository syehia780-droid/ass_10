📚 Nile Library Database System

A comprehensive Oracle SQL database schema, DML manipulation scripts, and query collection designed for managing a modern library system. This project demonstrates core database design principles, relational data modeling, and advanced SQL querying techniques using Oracle SQL.

🚀 Features & Schema Structure

The database is built around four primary relational entities:

CATEGORIES: Organizes books into distinct genres (e.g., Technology, Fiction, History).

MEMBERS: Manages library patrons, contact information, registration dates, and loyalty/reward points.

BOOKS: Tracks inventory details including title, author, category mapping, pricing, copies available, and publication year.

LOANS: Handles the borrowing lifecycle, linking members to books with timestamps and active/returned status tracking.

🛠️ Technologies Used

Database Management System: Oracle Database

Query Language: SQL (Structured Query Language)

Environment Compatibility: SQL*Plus, Oracle SQL Developer, or any Oracle-compatible SQL runner.

📂 Project Structure & Script Overview

The included SQL script (Nile Library.sql) is organized sequentially:

Table Creation: DDL statements defining primary keys, foreign key constraints, default values, and data types.

Initial Data Seeding: Sample insertions for categories, members, books, and active loans.

Schema Alterations: Examples of ALTER TABLE operations (adding columns such as isbn and returned_at).

Data Manipulation (DML): Examples of conditional UPDATE statements (e.g., bulk price adjustments by category), safe DELETE patterns, and schema maintenance.

Analytical & Filtering Queries: A robust set of queries demonstrating:

Aliasing and VAT calculations.

Handling NULL values (IS NULL vs = NULL explanation).

Pattern matching using LIKE.

Range filtering using BETWEEN.

Multi-condition filtering (AND, OR, IN).

Case sensitivity awareness in Oracle string comparisons.

💡 Sample Queries Included

Here is a glimpse of some of the operations featured in the script:

Finding Books Available for Campaign

SELECT title AS Campaign_books 
FROM books 
WHERE price > 300 AND copies_available > 0;


Filtering Members by Major Cities

SELECT full_name, city 
FROM members 
WHERE city IN ('Cairo', 'Giza', 'Alexandria');


⚙️ Getting Started

To run or test this project locally:

Open your preferred Oracle SQL client (such as Oracle SQL Developer).

Run the DDL script to create the tables (CATEGORIES, MEMBERS, BOOKS, LOANS).

Execute the insert scripts to populate sample data.

Explore the querying and update blocks to test database behavior.

🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check out the issues page.

📝 License

This project is open source and available under the MIT License.
