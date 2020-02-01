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
  manufacturer_id INT REFERENCES manufacturers(id),
  type VARCHAR (255),
  quantity INT,
  unit_cost FLOAT,
  sell_cost FLOAT,
  description VARCHAR (255),
  url VARCHAR
)
