-- Consultar o estoque total de cada produto na tabela store.product
SELECT 
    name AS ProductName,
    SUM(stock_quantity) AS TotalStock
FROM 
    store.product
GROUP BY 
    name;

-- Consultar os produtos com preço maior que 100.00
SELECT 
    name AS ProductName,
    price
FROM 
    store.product
WHERE 
    price > 100.00;

-- Consultar os clientes com o primeiro nome 'John' ou o último nome 'Doe'
SELECT 
    customer_id AS CustomerID,
    name AS CustomerName,
    email
FROM 
    store.customer
WHERE 
    name LIKE 'John%' OR name LIKE '%Doe';

-- Consultar as ordens feitas em 2023-08-01
SELECT 
    order_id AS OrderID,
    customer_id AS CustomerID,
    order_date AS OrderDate,
    total AS Total
FROM 
    store.orders
WHERE 
    order_date = '2023-08-01';

-- Consultar itens de pedidos com quantidade igual ou maior que 1
SELECT 
    order_id AS OrderID,
    product_id AS ProductID,
    quantity,
    unit_price
FROM 
    store.order_items
WHERE 
    quantity >= 1;

-- Consultar o total vendido de cada produto usando JOIN
SELECT 
    p.name AS ProductName,
    SUM(oi.quantity) AS TotalSold
FROM 
    store.order_items oi
JOIN 
    store.product p ON oi.product_id = p.product_id
GROUP BY 
    p.name;

-- Consultar o total gasto por cada cliente usando JOIN
SELECT 
    c.name AS CustomerName,
    SUM(o.total) AS TotalSpent
FROM 
    store.orders o
JOIN 
    store.customer c ON o.customer_id = c.customer_id
GROUP BY 
    c.name;

-- Consultar os produtos com a palavra 'keyboard' na descrição (usando LOWER para case-insensitive)
SELECT 
    name AS ProductName,
    description
FROM 
    store.product
WHERE 
    LOWER(description) LIKE '%keyboard%';

-- Consultar o número de itens em cada pedido
SELECT 
    o.order_id AS OrderID,
    COUNT(oi.order_item_id) AS NumberOfItems
FROM 
    store.orders o
JOIN 
    store.order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id;

-- Consultar os clientes que não realizaram nenhum pedido usando LEFT JOIN
SELECT 
    c.customer_id AS CustomerID,
    c.name AS CustomerName
FROM 
    store.customer c
LEFT JOIN 
    store.orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_id IS NULL;

-- Consultar os 5 produtos mais vendidos
SELECT 
    p.name AS ProductName,
    SUM(oi.quantity) AS TotalSold
FROM 
    store.order_items oi
JOIN 
    store.product p ON oi.product_id = p.product_id
GROUP BY 
    p.name
ORDER BY 
    TotalSold DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

