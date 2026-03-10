-- =========================================
-- 1. VISÃO GERAL DO NEGÓCIO
-- =========================================

-- Qual o valor total movimentado?
SELECT
    SUM(tp.vlProduto) AS valor_total_movimentado
FROM transacao_produto tp;

-- Quantas transações aconteceram por mês?
SELECT
    STRFTIME('%Y-%m', t.DtCriacao) AS mes,
    COUNT(DISTINCT t.IdTransacao) AS total_transacoes
FROM transacoes t
GROUP BY mes
ORDER BY mes;

-- Qual o ticket médio das transações?
SELECT
    ROUND(AVG(valor_transacao), 2) AS ticket_medio
FROM (
    SELECT
        tp.IdTransacao,
        SUM(tp.vlProduto) AS valor_transacao
    FROM transacao_produto tp
    GROUP BY tp.IdTransacao
) AS sub;


-- =========================================
-- 2. ANÁLISE DE PRODUTOS
-- =========================================

-- Quais são os produtos mais vendidos?
SELECT
    p.DescNomeProduto,
    SUM(tp.QtdeProduto) AS total_vendido
FROM transacao_produto tp
JOIN produtos p
    ON tp.IdProduto = p.IdProduto
GROUP BY p.DescNomeProduto
ORDER BY total_vendido DESC;

-- Quais categorias geram mais receita?
SELECT
    p.DescCategoriaProduto,
    SUM(tp.vlProduto) AS receita_total
FROM transacao_produto tp
JOIN produtos p
    ON tp.IdProduto = p.IdProduto
GROUP BY p.DescCategoriaProduto
ORDER BY receita_total DESC;

-- Quais categorias tiveram menos movimento?
SELECT
    p.DescCategoriaProduto,
    SUM(tp.QtdeProduto) AS total_movimentado
FROM transacao_produto tp
JOIN produtos p
    ON tp.IdProduto = p.IdProduto
GROUP BY p.DescCategoriaProduto
ORDER BY total_movimentado ASC;


-- =========================================
-- 3. ANÁLISE DE CLIENTES
-- =========================================

-- Quais clientes mais transacionam?
SELECT
    t.IdCliente,
    COUNT(DISTINCT t.IdTransacao) AS total_transacoes
FROM transacoes t
GROUP BY t.IdCliente
ORDER BY total_transacoes DESC;

-- Existe concentração de compras em poucos clientes?
SELECT
    t.IdCliente,
    SUM(tp.vlProduto) AS valor_gasto_total
FROM transacoes t
JOIN transacao_produto tp
    ON t.IdTransacao = tp.IdTransacao
GROUP BY t.IdCliente
ORDER BY valor_gasto_total DESC
LIMIT 10;