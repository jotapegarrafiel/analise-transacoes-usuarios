-- =========================================
-- 2. JOINS ENTRE AS TABELAS
-- =========================================

-- Join entre transacoes e transacao_produto
SELECT
    t.IdTransacao,
    t.IdCliente,
    t.DtCriacao,
    tp.IdProduto,
    tp.QtdeProduto,
    tp.vlProduto
FROM transacoes t
JOIN transacao_produto tp
    ON t.IdTransacao = tp.IdTransacao;

-- Join entre transacoes, transacao_produto e produtos
SELECT
    t.IdTransacao,
    t.IdCliente,
    t.DtCriacao,
    p.DescNomeProduto,
    p.DescCategoriaProduto,
    tp.QtdeProduto,
    tp.vlProduto
FROM transacoes t
JOIN transacao_produto tp
    ON t.IdTransacao = tp.IdTransacao
JOIN produtos p
    ON tp.IdProduto = p.IdProduto;

-- Exemplo de agregação por categoria com JOIN
SELECT
    p.DescCategoriaProduto,
    COUNT(DISTINCT t.IdTransacao) AS total_transacoes
FROM transacoes t
JOIN transacao_produto tp
    ON t.IdTransacao = tp.IdTransacao
JOIN produtos p
    ON tp.IdProduto = p.IdProduto
GROUP BY p.DescCategoriaProduto
ORDER BY total_transacoes DESC;