# Cinema Database System

A relational database for a cinema booking system, designed and implemented in MySQL.

## Overview
The database models movies, customers, theaters (halls), and tickets, and supports common reporting queries such as revenue, bookings by date, and customer tickets.

## Tables
- **Movie**: title, genre, duration, age rating
- **Customer**: name, phone, email (unique)
- **Theater**: hall name and screen type (Standard, 2D, 3D, IMAX, 4DX)
- **Ticket**: seat, price, booking date; foreign keys to Theater, Customer, and Movie

## Concepts demonstrated
- Entity-relationship modeling and relational schema design
- Primary keys, foreign keys, `NOT NULL`, `UNIQUE`, and `CHECK` constraints
- `SELECT` queries with filtering, aggregate functions (`SUM`, `AVG`), `JOIN`, and subqueries
- Views (`Customer_Tickets_View`)

## Run it
1. Open MySQL Workbench (or any MySQL client).
2. Run `cinema_system.sql`.

*All customer data is sample data.*

**Tools:** MySQL, SQL
