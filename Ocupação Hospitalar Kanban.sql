select distinct
  a.dt_entrada,
  nvl(trunc(sysdate) - trunc(a.dt_entrada), 0)  qt_dia_permanencia,
  obter_qt_dia_internacao_sus(d.cd_procedimento, d.ie_origem_proced)dias_sus,
  case obter_se_maior_limite_sus(a.nr_atendimento, obter_qt_dia_internacao_sus(d.cd_procedimento, d.ie_origem_proced))
  WHEN 'I' then 'AMARELO'
  WHEN 'S' then 'VERMELHO'
  ELSE 'VERDE'
  END as kanban,
  a.cd_unidade,
  Obter_Idade(a.DT_NASCIMENTO,sysdate,'SNOVO')idade,
  a.nm_paciente,
  b.CD_DOENCA,
  substr(obter_desc_cid(b.CD_DOENCA),1,200)diagnostico,
  a.nr_atendimento,
  a.nm_medico,
  InitCap(a.ds_setor_atendimento) ds_setor_atendimento,
  InitCap(a.ds_convenio) ds_convenio,
  obter_desc_tipo_acomod(a.cd_tipo_acomod_unid) ds_tipo_acomodacao
from 
  paciente_internado_atual_v a,
  DIAGNOSTICO_DOENCA b,
  SUS_LAUDO_PACIENTE c,
  SUS_PROCEDIMENTO d
where 
  a.nr_atendimento = b.NR_ATENDIMENTO(+)
  AND a.nr_atendimento = c.nr_atendimento(+)
  AND c.CD_PROCEDIMENTO_SOLIC = d.CD_PROCEDIMENTO(+)
  AND (a.CD_SETOR_ATUAL =:cd_setor_atual or NVL(:cd_setor_atual ,0)= 0)
order by ds_setor_atendimento, cd_unidade, 1,4,
a.nm_paciente
