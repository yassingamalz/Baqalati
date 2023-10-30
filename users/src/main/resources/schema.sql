CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  enabled BOOLEAN NOT NULL
);

CREATE TABLE addresses (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  postal_code VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  user_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE user_profiles (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  phone_number VARCHAR(255),
  user_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
