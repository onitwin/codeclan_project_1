--two tables to go here--
--manufacturer and stock items--
DROP TABLE stock_items;
DROP TABLE manufacturers;

CREATE TABLE manufacturers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE stock_items(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  manufacturer_id INT REFERENCES manufacturers(id) ON DELETE CASCADE,
  type VARCHAR (255),
  bsl INT, --basic stock level abbreviation
  quantity INT,
  unit_cost FLOAT,
  sell_price FLOAT,
  description VARCHAR (255),
  url VARCHAR
)
