# Airbnb Database Design - ER Diagram

## Objective
This document describes the database structure and Entity-Relationship Diagram (ERD) for the Airbnb backend system.

## Entities and Attributes

### User
- user_id (PK)
- first_name
- last_name
- email (unique)
- password_hash
- phone_number
- role (guest, host, admin)
- created_at

### Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### Booking
- booking_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status
- created_at

### Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method

### Review
- review_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating
- comment
- created_at

### Message
- message_id (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

## Relationships
- User (Host) → Property: 1:N
- User (Guest) → Booking: 1:N
- Property → Booking: 1:N
- Booking → Payment: 1:1
- User → Review: 1:N
- Property → Review: 1:N
- User → Message (Sender/Recipient): 1:N

## ER Diagram
The ER diagram file is included as:

