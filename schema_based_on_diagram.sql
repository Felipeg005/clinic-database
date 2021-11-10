CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  name VARCHAR,
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  type VARCHAR,
  name VARCHAR
);

