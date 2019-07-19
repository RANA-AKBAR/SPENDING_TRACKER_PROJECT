DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS spendingtags;

CREATE TABLE spendingtags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  date DATE NOT NULL,
  amount INT4,
  merchant_id REFERENCES merchants CASCADE on DELETE,
  spendingtag_id REFERENCES spendingtags CASCADE on DELETE
);

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget INT4,
  transactions_id REFERENCES transactions
);
