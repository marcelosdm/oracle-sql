SELECT DISTINCT
  
  x.dt_resultado,
  x.nr_atendimento,
  x.NR_PRESCRICAO,
  OBTER_NOME_PACIENTE(x.nr_atendimento)nm_paciente,
  obter_somente_numero(obter_cd_proced_exame_result(z.nr_seq_resultado, z.nr_seq_exame, z.nr_sequencia)) cod_exame,
  obter_desc_exame_lab(z.nr_seq_exame, null, null, null) exame,
  obter_qt_proc_exame_result(z.nr_seq_resultado, z.nr_seq_exame, z.nr_sequencia)qt_procedimento,
 -- y.VL_PROC_AJUSTADO vl_negociado,
  lab_obter_desc_status(z.nr_seq_resultado, z.nr_seq_exame, z.nr_sequencia) result,
  (select round(y.VL_PROC_AJUSTADO,2)
from REGRA_AJUSTE_PROC y
where y.CD_CATEGORIA = 2
and y.ie_situacao = 'A'
and y.cd_procedimento = obter_somente_numero(obter_cd_proced_exame_result(z.nr_seq_resultado, z.nr_seq_exame, z.nr_sequencia))
and y.nr_sequencia = (select max(u.nr_sequencia) from regra_ajuste_proc u where y.cd_categoria = u.cd_categoria and u.ie_situacao = 'A' and u.cd_procedimento = y.cd_procedimento and u.cd_convenio = y.cd_convenio)
and y.cd_convenio = 128
and (y.DT_FINAL_VIGENCIA is null or y.DT_FINAL_VIGENCIA > sysdate)) as valor_negociado
  
FROM 
  EXAME_LAB_RESULT_ITEM z, EXAME_LAB_RESULTADO x--, REGRA_AJUSTE_PROC y, EXAME_LABORATORIO a
WHERE
   x.NR_SEQ_RESULTADO = z.NR_SEQ_RESULTADO

   
   /*AND x.NR_ATENDIMENTO = 7725046
   AND x.NR_PRESCRICAO = 8587285*/
   AND x.DT_RESULTADO between :d1 and :d2
   
   
   AND lab_obter_desc_status(z.nr_seq_resultado, z.nr_seq_exame, z.nr_sequencia) =  'Aprovação do resultado'
   AND z.DT_APROVACAO is not null
   AND OBTER_ESTAB_ATENDIMENTO(x.nr_atendimento) = 116 
  
    
ORDER BY nr_atendimento, nr_prescricao, exame, dt_resultado
