/*
  Encontra atendimento/prescrição/procedimento incorreto/procedimento correto
*/
SELECT distinct
  a.NR_ATENDIMENTO,
  a.nr_prescricao,
  b.nr_sequencia,
  b.CD_PROCEDIMENTO,
  substr(Obter_Desc_Exame(b.NR_SEQ_EXAME),1,240) exame,
  c.NR_SEQ_EXAME
FROM 
  prescr_medica a, PRESCR_PROCEDIMENTO b, EXAME_LABORATORIO c--, EXAME_LAB_CONVENIO d
WHERE 
  a.nr_prescricao = b.NR_PRESCRICAO
  AND b.cd_procedimento = c.CD_PROCEDIMENTO
  --AND c.NR_SEQ_EXAME = d.NR_SEQ_EXAME
  --AND d.CD_CONVENIO = 69
  AND a.nr_atendimento = 7378058 --IN (7376365, 7378384, 7377965, 7378058, 7378103, 7378316, 7378215, 7378666, 7378182, 7376174, 7376239, 7376049, 7376176, 7375878, 7375698, 7375480, 7375789)
  --AND b.nr_seq_exame is null
  --AND c.IE_SITUACAO = 'A'
ORDER BY
  b.cd_procedimento,
  b.nr_sequencia,
  nr_prescricao;
  
/*
  Faz update na Prescrição da Entrada Única
*/

UPDATE prescr_procedimento SET nr_seq_exame = 6189 WHERE nr_prescricao = 6356485 AND nr_sequencia = 2;

SELECT * FROM prescr_procedimento WHERE nr_prescricao = 5313894;

commit;