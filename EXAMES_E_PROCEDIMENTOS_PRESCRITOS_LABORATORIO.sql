SELECT DISTINCT
  A.DT_PROCEDIMENTO,  
  M.CD_PESSOA_FISICA,
  NVL(M.NM_PESSOA_FISICA,'Não Informado')  || ' - Crm: '   || SUBSTR(obter_crm_medico(m.cd_pessoa_fisica),1,30) NOME_MEDICO_CRM,
  A.NR_ATENDIMENTO,
  B.NM_PESSOA_FISICA NOME_PACIENTE,
 SUBSTR(Obter_Desc_Proc_Convenio(a.nr_sequencia, NULL),1,100) NOME_PROCEDIMENTO,
  A.CD_PROCEDIMENTO COD_PROCEDIMENTO,
  A.QT_PROCEDIMENTO,
  A.VL_CUSTO_OPERACIONAL as vl_procedimento,
  A.DT_PRESCRICAO,
  --OBTER_DESC_CID(A.CD_DOENCA_CID) CID,
         NVL(OBTER_DESC_CID(A.CD_DOENCA_CID),(SELECT MIN(OBTER_DESC_CID(Z.CD_DOENCA_CID)) 
                                  FROM PROCEDIMENTO_PACIENTE Z 
                                 WHERE A.NR_ATENDIMENTO = Z.NR_ATENDIMENTO 
                                   AND Z.CD_DOENCA_CID IS NOT NULL 
                                   )) AS CID_INFORMA,
  NVL(SUBSTR(OBTER_DESC_CID(Obter_Cid_Atendimento(q.nr_atendimento,'P')),1,100),'Não Informado') ds_cid,
  t.ie_tipo_atendimento
  FROM PROCEDIMENTO_PACIENTE A, 
  ATENDIMENTO_PACIENTE T,
  CONTA_PACIENTE Q,
  PROCEDIMENTO P ,
  PESSOA_FISICA M ,
  PRESCR_MEDICA D ,
  CONVENIO C ,
  PESSOA_FISICA B
WHERE (A.NR_ATENDIMENTO   = T.NR_ATENDIMENTO )
AND (A.CD_PROCEDIMENTO    = P.CD_PROCEDIMENTO)
AND (A.IE_ORIGEM_PROCED   = P.IE_ORIGEM_PROCED)
AND (A.NR_INTERNO_CONTA   = Q.NR_INTERNO_CONTA)
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
AND t.ie_tipo_atendimento NOT IN (1,8,3)
ORDER BY 
NOME_MEDICO_CRM,
  NOME_PACIENTE,
  A.NR_ATENDIMENTO