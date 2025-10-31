-- Airbnb Clone Database Seed Script
-- Author: Oluwadamilola Tedunjaye
-- Description: Sample data for Users, Properties, Bookings, Payments, Reviews, and Messages

-- ==========================================================
-- CLEAR EXISTING DATA (OPTIONAL FOR TESTING)
-- ==========================================================
TRUNCATE TABLE Message, Review, Payment, Booking, Property, UserAccount RESTART IDENTITY CASCADE;

-- ==========================================================
-- USERS
-- ==========================================================
INSERT INTO UserAccount (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'John', 'Doe', 'john@example.com', 'hashed_pass_1', '+2348012345678', 'guest'),
    (gen_random_uuid(), 'Mary', 'Smith', 'mary@example.com', 'hashed_pass_2', '+2348098765432', 'host'),
    (gen_random_uuid(), 'Alice', 'Brown', 'alice@example.com', 'hashed_pass_3', '+2347012345678', 'host'),
    (gen_random_uuid(), 'Admin', 'User', 'admin@airbnb.com', 'hashed_admin', NULL, 'admin');

-- ==========================================================
-- PROPERTIES
-- ==========================================================
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
SELECT
    gen_random_uuid(),
    user_id,
    name,
    description,
    location,
    price
FROM (
    VALUES
        ('mary@example.com', 'Seaside Villa', 'Beautiful ocean-view villa with pool', 'Lagos', 45000.00),
        ('alice@example.com', 'Mountain Cabin', 'Cozy cabin with fireplace and balcony', 'Jos', 30000.00)
) AS temp(email, name, description, location, price)
JOIN UserAccount u ON u.email = temp.email AND u.role = 'host';

-- ==========================================================
-- BOOKINGS
-- ==========================================================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    start_date,
    end_date,
    total_price,
    status
FROM (
    VALUES
        ('john@example.com', 'Seaside Villa', '2025-12-01', '2025-12-05', 180000.00, 'confirmed'),
        ('john@example.com', 'Mountain Cabin', '2026-01-10', '2026-01-15', 150000.00, 'pending')
) AS temp(email, property_name, start_date, end_date, total_price, status)
JOIN UserAccount u ON u.email = temp.email
JOIN Property p ON p.name = temp.property_name;

-- ==========================================================
-- PAYMENTS
-- ==========================================================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT
    gen_random_uuid(),
    b.booking_id,
    b.total_price,
    'credit_card'
FROM Booking b
WHERE b.status = 'confirmed';

-- ==========================================================
-- REVIEWS
-- ==========================================================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    rating,
    comment
FROM (
    VALUES
        ('john@example.com', 'Seaside Villa', 5, 'Amazing place! Very clean and beautiful view.'),
        ('john@example.com', 'Mountain Cabin', 4, 'Nice stay, but the road to the cabin was rough.')
) AS temp(email, property_name, rating, comment)
JOIN UserAccount u ON u.email = temp.email
JOIN Property p ON p.name = temp.property_name;

-- ==========================================================
-- MESSAGES
-- ==========================================================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT
    gen_random_uuid(),
    sender.user_id,
    recipient.user_id,
    message
FROM (
    VALUES
        ('john@example.com', 'mary@example.com', 'Hi Mary, is your Seaside Villa available for Christmas?'),
        ('mary@example.com', 'john@example.com', 'Hi John, yes, it’s available! Would you like to confirm your booking?')
) AS temp(sender_email, recipient_email, message)
JOIN UserAccount sender ON sender.email = temp.sender_email
JOIN UserAccount recipient ON recipient.email = temp.recipient_email;

-- ==========================================================
-- END OF SEED SCRIPT
-- ==========================================================

-- Verify data counts
SELECT 
    (SELECT COUNT(*) FROM UserAccount) AS users,
    (SELECT COUNT(*) FROM Property) AS properties,
    (SELECT COUNT(*) FROM Booking) AS bookings,
    (SELECT COUNT(*) FROM Payment) AS payments,
    (SELECT COUNT(*) FROM Review) AS reviews,
    (SELECT COUNT(*) FROM Message) AS messages;
