SELECT 
    a.NR_SOLIC_COMPRA, 
    a.NR_COT_COMPRA, 
    SUM(a.VL_PRECO_LIQUIDO)vl_cotado, 
    b.soma_previsto, 
    (b.soma_previsto - SUM(a.VL_PRECO_LIQUIDO)) diferença,
    (100 - (round(100*(SUM(a.VL_PRECO_LIQUIDO)) /  b.soma_previsto,2 ))) perc
FROM 
    COT_COMPRA_FORN_ITEM_TR_V a,
    (SELECT x.nr_cot_compra, SUM(y.VL_UNIT_PREVISTO * x.qt_material) soma_previsto
        FROM cot_compra_item x, SOLIC_COMPRA_ITEM y
        WHERE x.NR_SOLIC_COMPRA = y.NR_SOLIC_COMPRA
        GROUP BY x.nr_cot_compra) b
WHERE 
    a.nr_cot_compra = b.nr_cot_compra
    AND a.nr_seq_item_fornec = obter_venc_fornec_item_regra(a.nr_cot_compra, a.nr_item_cot_compra)
--AND a.DT_COT_COMPRA between :d1 and :d2
    AND a.nr_solic_compra = 227933
GROUP BY 
    a.NR_SOLIC_COMPRA, 
    a.NR_COT_COMPRA,
    b.soma_previsto
ORDER BY 1;

select sum(b.vl_unit_previsto * b.QT_MATERIAL) soma_previsto from cot_compra_item b
where b.nr_cot_compra = '134664';

/*
    NOVO CÓDIGO 18/06/18
*/

select 
    a.nr_solic_compra,
    a.nr_cot_compra,
    sum(a.vl_unit_previsto * a.qt_material) total_previsto,
    sum(a.vl_preco_liquido) vl_cotado
FROM
    COT_COMPRA_FORN_ITEM_TR_V a
where 
    a.nr_solic_compra = 227933
    AND a.nr_seq_item_fornec = obter_venc_fornec_item_regra(a.nr_cot_compra, a.nr_item_cot_compra)
group by 
    a.nr_solic_compra,
    a.nr_cot_compra