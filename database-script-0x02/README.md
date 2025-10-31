# 🌱 Airbnb Clone – Database Seed Script

## 🎯 Objective
This directory contains SQL scripts to populate the Airbnb database with realistic sample data for testing relationships and queries.

---

## 📄 Files
- **seed.sql** → Inserts sample data into all database tables.

---

## 🧩 Sample Data Overview

| Table        | Description                                | Example Records |
|---------------|--------------------------------------------|----------------|
| UserAccount   | Guests, hosts, and admin users             | 4 users         |
| Property      | Sample listings by hosts                   | 2 properties    |
| Booking       | Guest bookings for properties              | 2 bookings      |
| Payment       | Payments linked to confirmed bookings      | 1 payment       |
| Review        | Guest reviews for properties               | 2 reviews       |
| Message       | User-to-user messages                      | 2 messages      |

---

## ⚙️ How to Run

Run the script in PostgreSQL after creating the schema:

```bash
psql -U <username> -d <database_name> -f seed.sql
