CREATE DATABASE partyprohub;
USE partyprohub;

-- USERS
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100),
  email VARCHAR(120) UNIQUE,
  password_hash VARCHAR(255),
  role ENUM('customer','admin') DEFAULT 'customer',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

-- PRODUCTS
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT,
  name VARCHAR(150),
  description TEXT,
  price DECIMAL(10,2),
  stock_qty INT DEFAULT 0,
  image VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- BULK DISCOUNTS
CREATE TABLE bulk_discounts (
  bulk_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  min_qty INT,
  discount_percent INT,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- CART
CREATE TABLE carts (
  cart_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cart_items (
  cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
  cart_id INT,
  product_id INT,
  qty INT,
  FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ORDERS
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  total_amount DECIMAL(10,2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  qty INT,
  unit_price DECIMAL(10,2),
  line_total DECIMAL(10,2)
);

-- EVENTS (EVENT PLANNER)
CREATE TABLE events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(120),
  guests INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE event_items (
  event_item_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  product_id INT,
  recommended_qty INT,
  chosen_qty INT
);
