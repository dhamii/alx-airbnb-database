# Airbnb Database Normalization (Up to 3NF)

## Objective
This document explains the normalization process applied to the Airbnb database design to ensure it complies with the Third Normal Form (3NF). The goal is to eliminate redundancy, maintain data integrity, and optimize query performance.

---

## 1️⃣ First Normal Form (1NF)

**Rule:**  
- Each column must hold atomic (indivisible) values.  
- Each record must be unique.  

**Application:**  
✅ All tables have atomic values.  
✅ Each table has a primary key (`user_id`, `property_id`, etc.).  
✅ No repeating groups or arrays exist.

**Example:**  
In the `User` table, the `email` field stores only a single email address per user.  
The `Property` table stores one location per record — not multiple locations.

---

## 2️⃣ Second Normal Form (2NF)

**Rule:**  
- Table must be in 1NF.  
- All non-key attributes must depend on the whole primary key.  

**Application:**  
✅ Each non-key attribute in every table depends entirely on its primary key.  
✅ No partial dependencies exist because all tables use a single-column primary key (UUID).

**Example:**  
In the `Booking` table:  
All attributes (`start_date`, `end_date`, `total_price`, `status`) depend on `booking_id` — not on just part of it.

---

## 3️⃣ Third Normal Form (3NF)

**Rule:**  
- Table must be in 2NF.  
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Application:**  
✅ The schema has no transitive dependencies.  
✅ Each attribute depends **only** on the primary key of its table.

**Example:**  
In the `Property` table, attributes like `name`, `description`, and `pricepernight` depend solely on `property_id` — not on `host_id` or any other field.

---

## 🧱 Optional Adjustments (if any)

After review, the existing schema already meets 3NF.  
However, we can consider **further refinement** for scalability:

1. **Split out Payment Method:**
   - Instead of ENUM in `Payment(payment_method)`, we can create a `PaymentMethod` table:
     ```sql
     PaymentMethod(
       method_id PK,
       method_name VARCHAR
     )
     ```
   - `Payment` would reference it with `method_id` as a foreign key.

2. **Separate Role Management:**
   - Instead of ENUM in `User(role)`, create a `Roles` table:
     ```sql
     Roles(
       role_id PK,
       role_name VARCHAR
     )
     ```
   - This makes role management more flexible and prevents ENUM modification overhead.

---

## ✅ Conclusion

After reviewing and applying normalization steps:

- All tables are in **Third Normal Form (3NF)**.  
- The database design avoids redundancy, update anomalies, and insertion/deletion anomalies.  
- The structure supports scalability, data integrity, and performance optimization.

---

**File location:**  
