CREATE DATABASE EstateSphere;

CREATE TABLE Property (
    property_id INT PRIMARY KEY,
    property_type VARCHAR(50),
    location VARCHAR(100),
    size_sqft INT,
    price DECIMAL(10,2),
    features TEXT,
    status VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_type VARCHAR(20), -- Buyer, Seller Agent
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    preferences TEXT
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    property_id INT,
    client_id INT,
    transaction_type,
    transaction_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    property_id INT,
    client_id INT,
    appointment_date DATETIME,
    appointment_start DATETIME,
    appointment_end DATETIME,
    notes TEXT,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    usrname VARCHAR(50) UNIQUE,
    password_hash VARCHAR(100), -- Hashed and salted password
    role VARCHAR(20) -- Admin, Agent, etc.
);

CREATE TABLE Document (
    document_id INT PRIMARY KEY,
    property_id INT,
    transactions_id INT,
    document_type VARCHAR(50), -- Contract, Agreement, etc.
    document_path VARCHAR(255),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (transactions_id) REFERENCES Transactions(transaction_id) 
);
