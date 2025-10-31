# 🏠 Airbnb Clone – Database Schema

## 🎯 Objective
This directory contains the SQL scripts that define the Airbnb backend database schema.  
The schema includes entity definitions, constraints, indexes, and relationships as per the database specification.

---

## 📄 Files
- **schema.sql** → Defines all tables, constraints, and indexes.

---

## 🧩 Entities Overview

| Table        | Description                              |
|---------------|------------------------------------------|
| UserAccount   | Stores user details and roles.           |
| Property      | Contains host property information.      |
| Booking       | Manages user bookings for properties.    |
| Payment       | Records payments for bookings.           |
| Review        | Stores guest reviews and ratings.        |
| Message       | Handles communication between users.     |

---

## ⚙️ Features Implemented
- Primary and foreign key constraints  
- ENUM-like checks for roles, statuses, and payment methods  
- Indexes on frequently queried columns (`email`, `property_id`, `booking_id`)  
- Timestamp tracking for auditability  

---

## 🚀 How to Run
To create the schema in PostgreSQL:

```bash
psql -U <username> -d <database_name> -f schema.sql
