-- Buat schema SALAM dan tabel mahasiswas
CREATE SCHEMA SALAM;

CREATE TABLE SALAM.mahasiswas (
    nim SERIAL PRIMARY KEY,
    nama VARCHAR(100) UNIQUE,
    umur INT CHECK (umur > 16)
);

-- Buat user baru dan beri role sesuai ketentuan
CREATE USER backend_dev WITH PASSWORD 'backend123';
CREATE USER bi_dev WITH PASSWORD 'bi123';
CREATE USER data_engineer WITH PASSWORD 'data123';

-- Role untuk backend_dev (CRUD)
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- Role untuk bi_dev (read only)
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- Role untuk data_engineer (create, modify, drop)
GRANT ALL PRIVILEGES ON SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
