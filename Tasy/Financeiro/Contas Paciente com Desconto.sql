SELECT a.nr_atendimento,
  a.NR_INTERNO_CONTA,
  a.DT_MESANO_REFERENCIA,
  OBTER_NOME_PACIENTE(a.NR_ATENDIMENTO) nm_paciente,
  SUM(obter_valor_conta(nr_interno_conta, 0)) vl_total,
  SUM(a.VL_DESCONTO) vl_desconto,
  (SUM(obter_valor_conta(nr_interno_conta, 0)) - SUM(a.VL_DESCONTO)) vl_liquido
FROM CONTA_PACIENTE a
WHERE a.CD_ESTABELECIMENTO  = 1
AND a.CD_CONVENIO_PARAMETRO = 1
AND a.IE_STATUS_ACERTO      = 2
AND TO_CHAR(a.DT_MESANO_REFERENCIA, 'mm/yyyy') BETWEEN :d1 AND :d2
AND a.vl_desconto > 0
GROUP BY a.nr_atendimento,
  a.NR_INTERNO_CONTA,
  a.DT_MESANO_REFERENCIA
order by 1