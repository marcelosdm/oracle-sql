SELECT cd_material, ds_material, dt_mesano_referencia, qt_estoque, vl_total FROM
(
SELECT 
    a.cd_material, 
    a.DS_MATERIAL,
    b.dt_mesano_referencia,
    SUM(NVL(b.qt_consumo,0)) qt_estoque,
    SUM(NVL(b.vl_consumo,0)) vl_total
FROM
    material a, movto_estoque_operacao_v b, classe_material c, SUBGRUPO_MATERIAL d
WHERE
    a.CD_MATERIAL = b.CD_MATERIAL
AND
    a.CD_CLASSE_MATERIAL = c.CD_CLASSE_MATERIAL
AND
    c.CD_SUBGRUPO_MATERIAL = d.CD_SUBGRUPO_MATERIAL

AND 
    a.IE_CONSIGNADO in (1,2)  
AND
    b.CD_ESTABELECIMENTO = 1
AND
    b.dt_mesano_referencia BETWEEN :d1 and :d2
AND 
    (a.CD_CLASSE_MATERIAL =:CLASSE or NVL(:CLASSE, 0)= 0)
AND
    (d.CD_SUBGRUPO_MATERIAL =:SUBGRUPO or NVL(:SUBGRUPO, 0) =0)
AND
    (d.CD_GRUPO_MATERIAL =:GRUPO or NVL(:GRUPO, 0) =0)
AND NOT EXISTS
    (SELECT 1
      FROM operacao_nota x
      WHERE x.cd_operacao_estoque            = b.cd_operacao_estoque
      AND NVL(x.ie_transferencia_estab, 'N') = 'S'
    )
GROUP BY
    a.cd_material, a.ds_material, b.dt_mesano_referencia
    
ORDER BY 
    a.cd_material, dt_mesano_referencia DESC
) z

WHERE z.qt_estoque > 0