-- Create products table
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  amount INTEGER NOT NULL,
  price FLOAT NOT NULL
);
