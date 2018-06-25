SELECT
	x.NR_COT_COMPRA,
	x.NR_SOLIC_COMPRA,
	SUM( y.VL_UNIT_PREVISTO * x.QT_MATERIAL ) valor_previsto,
	z.valor_cotado,
	( SUM( y.VL_UNIT_PREVISTO * x.QT_MATERIAL ) - z.valor_cotado ) diferença,
	( 100 - ( ROUND( 100 * ( z.valor_cotado ) / SUM( y.VL_UNIT_PREVISTO * x.QT_MATERIAL ), 2 ))) percentual
FROM
	COT_COMPRA_ITEM x,
	SOLIC_COMPRA_ITEM y,
	( SELECT
		SUM( A.VL_PRECO_LIQUIDO ) valor_cotado, a.NR_COT_COMPRA, a.DT_COT_COMPRA, a.CD_ESTABELECIMENTO
	FROM
		COT_COMPRA_FORN_ITEM_TR_V a
	WHERE
		a.nr_seq_item_fornec = obter_venc_fornec_item_regra( a.nr_cot_compra, a.nr_item_cot_compra )
	GROUP BY
		a.NR_COT_COMPRA, a.DT_COT_COMPRA, a.CD_ESTABELECIMENTO ) z
WHERE
	x.NR_COT_COMPRA = y.NR_COT_COMPRA
	AND x.NR_ITEM_COT_COMPRA = y.NR_ITEM_COT_COMPRA
	AND x.NR_COT_COMPRA = z.nr_cot_compra
	AND z.CD_ESTABELECIMENTO = 1
	AND z.valor_cotado > 0
	AND z.DT_COT_COMPRA BETWEEN '20/06/2018' AND '22/06/2018'
GROUP BY
	z.valor_cotado,
	x.NR_COT_COMPRA,
	x.NR_SOLIC_COMPRA
ORDER BY x.NR_SOLIC_COMPRA