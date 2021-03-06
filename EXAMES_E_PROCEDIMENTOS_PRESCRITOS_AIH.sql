SELECT
  A.DT_PROCEDIMENTO,  
  NVL(M.NM_PESSOA_FISICA,'N�o Informado')  || ' - Crm: '   || SUBSTR(obter_crm_medico(m.cd_pessoa_fisica),1,30) NOME_MEDICO_CRM,
  A.NR_ATENDIMENTO,
  B.NM_PESSOA_FISICA NOME_PACIENTE,
 SUBSTR(Obter_Desc_Proc_Convenio(a.nr_sequencia, NULL),1,100) NOME_PROCEDIMENTO,
  A.CD_PROCEDIMENTO COD_PROCEDIMENTO,
  A.QT_PROCEDIMENTO,
  A.VL_CUSTO_OPERACIONAL as vl_procedimento,
  A.DT_PRESCRICAO,
  sus_obter_desc_cid(sus.cd_cid_principal) as cid_principal
  FROM PROCEDIMENTO_PACIENTE A, 
  ATENDIMENTO_PACIENTE T,
  CONTA_PACIENTE Q,
  PROCEDIMENTO P ,
  PESSOA_FISICA M ,
  PRESCR_MEDICA D ,
  CONVENIO C ,
  PESSOA_FISICA B,
  SUS_AIH_UNIF sus
WHERE (A.NR_ATENDIMENTO   = T.NR_ATENDIMENTO )
AND (A.CD_PROCEDIMENTO    = P.CD_PROCEDIMENTO)
AND (A.IE_ORIGEM_PROCED   = P.IE_ORIGEM_PROCED)
AND (A.NR_INTERNO_CONTA   = Q.NR_INTERNO_CONTA)
AND (A.NR_ATENDIMENTO = sus.NR_ATENDIMENTO)
AND (q.cd_estabelecimento = 1)
AND A.DT_PROCEDIMENTO BETWEEN TO_DATE('01/08/2016 00:00:00','dd/mm/yyyy hh24:mi:ss') AND TO_DATE('31/08/2016 23:59:59','dd/mm/yyyy hh24:mi:ss')
AND A.CD_MOTIVO_EXC_CONTA IS NULL
AND a.nr_sequencia        <> NVL(a.nr_seq_proc_pacote,0)
AND (A.NR_PRESCRICAO       = D.NR_PRESCRICAO)
AND (M.CD_PESSOA_FISICA    = D.CD_MEDICO)
AND (A.CD_CONVENIO         = C.CD_CONVENIO)
AND EXISTS
  (SELECT 1 FROM convenio_estabelecimento w WHERE w.cd_convenio = c.cd_convenio)
AND A.VL_PROCEDIMENTO     <> 0
AND (B.CD_PESSOA_FISICA    = T.CD_PESSOA_FISICA)
AND c.cd_convenio         IN (3)
--AND m.cd_pessoa_fisica    IN ('240')
AND (m.cd_pessoa_fisica =:cd_medico OR NVL(:cd_medico,0) =0)
--AND t.ie_tipo_atendimento IN (1)
ORDER BY 
NOME_MEDICO_CRM,
  b.NM_PESSOA_FISICA,
  DT_ENTRADA