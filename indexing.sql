-- 1. Criar tabela
CREATE TABLE test_indexing (
    id INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY simula o SERIAL do PostgreSQL
    name NVARCHAR(50) -- NVARCHAR para compatibilidade com MSSQL
);

-- 2. Inserir dados na tabela
-- Inserir 250.000 registros com o nome 'bob'
INSERT INTO test_indexing(name)
SELECT 'bob'
FROM master.dbo.spt_values -- Usado para gerar registros
WHERE number <= 250000 AND type = 'P';

-- Inserir 250.000 registros com o nome 'alice'
INSERT INTO test_indexing(name)
SELECT 'alice'
FROM master.dbo.spt_values
WHERE number <= 250000 AND type = 'P';

-- 3. Consultar desempenho antes de criar o índice
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM test_indexing
WHERE id = 2;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- 4. Criar índice na coluna "id" (se não for PRIMARY KEY)
CREATE NONCLUSTERED INDEX test_idx_ebac 
ON test_indexing(id);

-- 5. Consultar desempenho após criar o índice
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM test_indexing
WHERE id = 2;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

