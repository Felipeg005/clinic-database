CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  name VARCHAR,
  date_of_birth DATE,
  CONSTRAINT kf_patients FOREIGN KEY(id) REFERENCES medical_histories(patient_id) ON DELETE CASCADE
);

CONSTRAINT kf_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE, 

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  CONSTRAINT kf_treatments FOREIGN KEY(id) REFERENCES treatments(treatment_id) ON DELETE CASCADE
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT kf_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
  CONSTRAINT kf_invoice_items FOREIGN KEY(id) REFERENCES invoice_items(invoice_id) ON DELETE CASCADE
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  type VARCHAR,
  name VARCHAR
  CONSTRAINT kf_invoice_items FOREIGN KEY(id) REFERENCES invoice_items(treatment_id) ON DELETE CASCADE
);

