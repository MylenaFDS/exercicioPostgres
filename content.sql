-- Inserindo clientes
INSERT INTO store.customer (name, email, phone, address, city, state, postal_code, birth_date) 
VALUES 
('John Doe', 'john.doe@example.com', '123456789', '123 Main St', 'New York', 'NY', '10001', '1980-01-01'),
('Jane Smith', 'jane.smith@example.com', '987654321', '456 Elm St', 'Los Angeles', 'CA', '90001', '1990-02-02');

-- Inserindo produtos
INSERT INTO store.product (name, description, price, stock_quantity, sku, category) 
VALUES 
('Laptop', 'High-end gaming laptop', 1500.00, 10, 'LPT-001', 'Electronics'),
('Mouse', 'Wireless mouse', 25.00, 50, 'MSE-002', 'Accessories'),
('Keyboard', 'Mechanical keyboard', 75.00, 30, 'KBD-003', 'Accessories'),
('Monitor', '4K Monitor', 300.00, 20, 'MON-004', 'Electronics'),
('Printer', 'Laser printer', 200.00, 15, 'PRT-005', 'Office Equipment');

-- Inserindo fornecedores
INSERT INTO store.suppliers (name, contact_phone, document_number, email, address, city, state, postal_code, country) 
VALUES 
('Tech Supplies Co.', '555-1234', '12345678900', 'supplier1@example.com', '789 Tech St', 'Seattle', 'WA', '98101', 'USA'),
('Office Depot', '555-5678', '98765432100', 'supplier2@example.com', '321 Office Ave', 'Chicago', 'IL', '60601', 'USA');

-- Inserindo estoque de produtos com ligação aos fornecedores
INSERT INTO store.product_stock (product_id, quantity, location, supplier_id, stock_threshold) 
VALUES 
(1, 10, 'Warehouse A', 1, 5),
(2, 50, 'Warehouse B', 2, 10),
(3, 30, 'Warehouse A', 1, 5),
(4, 20, 'Warehouse C', NULL, 10),
(5, 15, 'Warehouse C', NULL, 8);
