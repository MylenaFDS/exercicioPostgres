
-- Tabela de clientes
CREATE TABLE store.customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    document_number VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    birth_date DATE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active'
);

-- Tabela de produtos
CREATE TABLE store.product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL,
    sku VARCHAR(50) UNIQUE,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'available'
);

-- Tabela de fornecedores
CREATE TABLE store.suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(100),
    document_number VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active'
);

-- Tabela de estoque
CREATE TABLE store.product_stock (
    stock_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity >= 0),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR(100),
    supplier_id INTEGER,
    stock_threshold INTEGER DEFAULT 10,
    FOREIGN KEY (product_id) REFERENCES store.product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES store.suppliers(supplier_id) ON DELETE SET NULL
);

