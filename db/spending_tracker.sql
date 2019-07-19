DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS spendingtags;

CREATE TABLE spendingtags(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  date DATE,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id),
  spendingtag_id INT8 REFERENCES spendingtags(id)
);

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget INT8,
  transactions_id INT8 REFERENCES transactions(id)
);
