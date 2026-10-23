
-- Periodic table database schema
DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table;
\c periodic_table

CREATE TABLE elements (
    atomic_number INTEGER PRIMARY KEY,
    symbol VARCHAR(2) NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE types (
    type_id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO types (type) VALUES
    ('metal'),
    ('metalloid'),
    ('nonmetal');

CREATE TABLE properties (
    atomic_number INTEGER PRIMARY KEY REFERENCES elements(atomic_number),
    type_id INTEGER NOT NULL REFERENCES types(type_id),
    atomic_mass NUMERIC NOT NULL,
    melting_point_celsius NUMERIC NOT NULL,
    boiling_point_celsius NUMERIC NOT NULL
);

INSERT INTO elements (atomic_number, symbol, name) VALUES
    (1, 'H', 'Hydrogen'),
    (2, 'He', 'Helium'),
    (3, 'Li', 'Lithium'),
    (4, 'Be', 'Beryllium'),
    (5, 'B', 'Boron'),
    (6, 'C', 'Carbon'),
    (7, 'N', 'Nitrogen'),
    (8, 'O', 'Oxygen'),
    (9, 'F', 'Fluorine'),
    (10, 'Ne', 'Neon');

INSERT INTO properties (atomic_number, type_id, atomic_mass, melting_point_celsius, boiling_point_celsius) VALUES
    (1, 3, 1.008, -259.1, -252.9),
    (2, 3, 4.0026, -272.2, -269),
    (3, 1, 6.94, 180.54, 1342),
    (4, 1, 9.0122, 1287, 2470),
    (5, 2, 10.81, 2075, 4000),
    (6, 3, 12.011, 3550, 4027),
    (7, 3, 14.007, -210.1, -195.8),
    (8, 3, 15.999, -218, -183),
    (9, 3, 18.998, -220, -188.1),
    (10, 3, 20.18, -248.6, -246.1);
