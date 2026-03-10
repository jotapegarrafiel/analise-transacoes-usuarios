SELECT	t.IdTransacao,
		t.IdCliente,
		t.DtCriacao,
		p.DescNomeProduto ,
		p.DescCategoriaProduto,
		tp.QtdeProduto,
		tp.vlProduto
FROM transacoes t 
JOIN transacao_produto tp 
ON t.IdTransacao = tp.IdTransacao
JOIN produtos p 
ON tp.IdProduto = p.IdProduto 