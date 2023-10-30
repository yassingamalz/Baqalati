-- Generate random user data
INSERT INTO users (username, role, email, password, enabled)
VALUES
    ('user1', 'ADMIN', 'user1@example.com', 'password', 1),
    ('admin1', 'CUSTOMER', 'admin1@example.com', 'password', 1),
    ('user2', 'CUSTOMER', 'user2@example.com', 'password', 0);

-- Generate random address data
INSERT INTO addresses (street, city, state, postal_code, country, user_id)
VALUES
    ('123 Main St', 'City A', 'State A', '12345', 'Country A', 1),
    ('456 Elm St', 'City B', 'State B', '67890', 'Country B', 2),
    ('789 Oak St', 'City C', 'State C', '54321', 'Country C', 3);

-- Generate random user profile data
INSERT INTO user_profiles (full_name, date_of_birth, phone_number, user_id)
VALUES
    ('John Doe', '1990-01-01', '123456789', 1),
    ('Jane Smith', '1995-03-15', '987654321', 2),
    ('Michael Johnson', '1988-06-30', '555555555', 3);
