-- =========================================
-- 1. EXPLORAÇÃO INICIAL DOS DADOS
-- =========================================

-- Visualizar amostra da tabela clientes
SELECT *
FROM clientes
LIMIT 5;

-- Visualizar amostra da tabela produtos
SELECT *
FROM produtos
LIMIT 5;

-- Visualizar amostra da tabela transacoes
SELECT *
FROM transacoes
LIMIT 5;

-- Visualizar amostra da tabela transacao_produto
SELECT *
FROM transacao_produto
LIMIT 5;

-- Contagem de registros por tabela
SELECT COUNT(*) AS total_clientes
FROM clientes;

SELECT COUNT(*) AS total_produtos
FROM produtos;

SELECT COUNT(*) AS total_transacoes
FROM transacoes;

SELECT COUNT(*) AS total_itens_transacionados
FROM transacao_produto;

-- Verificar período das transações
SELECT
    MIN(DtCriacao) AS primeira_transacao,
    MAX(DtCriacao) AS ultima_transacao
FROM transacoes;