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
  date timestamp,
  amount float,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  spendingtag_id INT8 REFERENCES spendingtags(id) ON DELETE CASCADE
);

ALTER TABLE transactions
DROP FOREIGN KEY FK_merchant_id REFERENCES merchants(id);



CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget float,
  transactions_id INT8 REFERENCES transactions(id)
);
