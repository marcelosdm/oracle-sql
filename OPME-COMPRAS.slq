SELECT 
  TRUNC( A.DT_ATUALIZACAO ,'MM') dt_mes_ref,
  m.cd_material ,
  m.ds_material,
  SUM(i.qt_item_nf) qt_item_nf,
  SUM(i.vl_total_item_nf) vl_total_item_nf,
  SUM(i.vl_unitario_item_nf) vl_unitario_soma
FROM OPERACAO_ESTOQUE T,
  OPERACAO_NOTA O,
  MATERIAL M,
  ESTRUTURA_MATERIAL_V E,
  ORDEM_COMPRA P,
  NATUREZA_OPERACAO N,
  NOTA_FISCAL A,
  NOTA_FISCAL_ITEM I
WHERE A.NR_SEQUENCIA       = I.NR_SEQUENCIA
AND A.CD_OPERACAO_NF       = O.CD_OPERACAO_NF
AND O.CD_OPERACAO_ESTOQUE  = T.CD_OPERACAO_ESTOQUE
AND M.CD_MATERIAL          = E.CD_MATERIAL
AND I.CD_MATERIAL          = M.CD_MATERIAL
AND I.NR_ORDEM_COMPRA      = P.NR_ORDEM_COMPRA(+)
AND A.CD_ESTABELECIMENTO   = 1
AND T.IE_TIPO_REQUISICAO   = 6
AND A.NR_INTERNO_CONTA    IS NULL
AND A.NR_SEQ_PROTOCOLO    IS NULL
AND t.ie_consignado       <> 0
AND A.IE_SITUACAO          = '1'
AND A.IE_ACAO_NF           = '1'
AND a.cd_natureza_operacao = n.cd_natureza_operacao
AND n.ie_entrada_saida     = 'E'
AND E.CD_GRUPO_MATERIAL    = 1
AND E.CD_SUBGRUPO_MATERIAL = 190
AND E.CD_CLASSE_MATERIAL   = 1902
AND A.DT_ATUALIZACAO BETWEEN TO_DATE('01/08/2016 00:00:00','dd/mm/yyyy hh24:mi:ss') AND TO_DATE('31/08/2017 23:59:59','dd/mm/yyyy hh24:mi:ss')
AND o.ie_tipo_operacao             = 1
GROUP BY TRUNC( A.DT_ATUALIZACAO ,'MM'),
  m.cd_material,
  m.ds_material
ORDER BY m.cd_material, m.ds_material, dt_mes_ref