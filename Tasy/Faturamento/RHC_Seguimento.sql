select	
  case NVL(x.nr_prontuario, a.nr_prontuario)
  WHEN x.nr_prontuario then 'S'
  WHEN a.nr_prontuario then 'A' end ||';'||
  '020907'||';'||
  '2' ||';'||
  NVL(x.NR_PRONTUARIO, a.NR_PRONTUARIO) ||';'||
  regexp_replace(substr(obter_nome_pf(b.cd_pessoa_fisica), 0, 60), '[\. ,]+',' ') ||';'||
  regexp_replace(OBTER_NOME_MAE(b.cd_pessoa_fisica), '[\. ,]+',' ') ||';'||
  case b.IE_GRAU_INSTRUCAO 
  WHEN 1 then 1
  WHEN 7 then 2
  WHEN 2 then 3
  WHEN 3 then 4
  WHEN 8 then 4
  WHEN 9 then 4
  WHEN 4 then 5
  ELSE 9
  end ||';'||
  '4' ||';' ||
  b.nr_cpf ||';' ||
  to_char(b.dt_nascimento, 'dd/mm/yyyy') ||';'|| /*---------- Campo 10 ----------*/
  decode(b.ie_sexo,'M','1','F','2') ||';'||
  obter_compl_pf(b.cd_pessoa_fisica, 1, 'UF') ||';'||
  regexp_replace(c.DS_ENDERECO, '[\. ,]+',' ') ||';'||
  regexp_replace(c.NR_ENDERECO, '[\. ,]+',' ') ||';'||
  regexp_replace(c.DS_COMPLEMENTO, '[\. ,]+',' ') ||';'||
  c.CD_CEP ||';'||
  c.CD_MUNICIPIO_IBGE ||';'||
  c.NR_DDD_TELEFONE ||c.NR_TELEFONE ||';'||
  CASE a.NR_SEQ_ORIGEM_ENC 
  WHEN 1 THEN 2
  WHEN 4 THEN 1
  WHEN 2 THEN 3
  ELSE 2
  END  ||';'||
  to_char(a.DT_CONSULTA, 'dd/mm/yyyy') ||';'|| /*---------- Campo 20 ----------*/
  case NVL(x.nr_prontuario, a.nr_prontuario)
  WHEN x.nr_prontuario then a.CD_CLINICA_ATENDIMENTO
  WHEN a.nr_prontuario then a.CD_CLINICA_ATENDIMENTO end ||';'||
  --a.CD_CLINICA_ATENDIMENTO ||';'||
  --'15' ||';'||
  CASE a.IE_DIAG_TRAT_PREVIO 
  WHEN 1 THEN 1
  WHEN 2 THEN 2
  WHEN 3 THEN 3
  ELSE 4
  END ||';'|| 
  to_char(a.DT_DIAGNOSTICO, 'dd/mm/yyyy') ||';'||
  a.CD_BASE_DIAG ||';'||
  regexp_replace(NVL(x.CD_TOPOGRAFIA, a.CD_TOPOG_TU_PRIM), '[\. ,]+','') ||';'||
  NVL(LTRIM(x.CD_MORFOLOGIA, 'M'), LTRIM(a.CD_MORFOLOGIA_TU_PRIM, 'M')) ||';'||
  a.CD_ESTADIO ||';'||
  LTRIM(a.CD_TUMOR_PRIMARIO, 'T') ||';'||
  LTRIM(a.CD_LINFONODO_REGIONAL, 'N') ||';'||
  LTRIM(a.CD_METASTASE_DISTANCIA, 'M') ||';'|| /*---------- Campo 30 ----------*/
  NVL(a.CD_TUMOR_PRIM_PAT, ' ') ||';'||
  NVL(a.CD_LINFONODO_REG_PAT, ' ') ||';'||
  NVL(a.CD_METASTASE_DIST_PAT, ' ') ||';'||
  NVL(a.CD_MARC_SERICO, '8') ||';'||
  NVL(a.CD_GRAU_HISTO, '8') ||';'||
  '8' ||';'||
  '8' ||';'||
  '8' ||';'||
  '8' ||';'||
  '' ||';'|| /*---------- Campo 40 ----------*/
  a.CD_TOPOG_MD_PRIM ||';'||
  a.CD_TOPOG_MD_SEG ||';'||
  a.CD_TOPOG_MD_TER ||';'||
  a.CD_TOPOG_MD_QUA ||';'||
  to_char(a.DT_INICIO_TRAT, 'dd/mm/yyyy') ||';'||
  a.CD_RAZAO_NAO_TRAT ||';'||
  CASE a.IE_TRAT_INST_SEM_INF WHEN 'N' THEN CASE NVL(x.IE_PROCED_TERAP_NENHUM,a.IE_TRAT_INSTITUICAO) WHEN 'S' THEN 1 ELSE 0 END ELSE 1 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_CIR, a.IE_TRAT_INST_CIR) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_RADIO, a.IE_TRAT_INST_RADIO) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_QUIMIO, a.IE_TRAT_INST_QUIMIO) WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*---------- Campo 50 ----------*/
  CASE NVL(x.IE_PROCED_TERAP_HORMO, a.IE_TRAT_INST_HORM) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_TMO, a.IE_TRAT_INST_TMO) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_IMUNO, a.IE_TRAT_INST_IMUNO) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_PROCED_TERAP_OUTRO, a.IE_TRAT_INST_OUTRO) WHEN 'S' THEN 1 ELSE 0 END ||';'||

  CASE NVL(x.IE_SEMINFO_ANT, a.IE_SEMINFO_ANT) WHEN 'N' THEN CASE NVL(x.IE_NENHUM_ANT, a.IE_NENHUM_ANT) WHEN 'S' THEN 1 ELSE 0 END ELSE 1 END ||';'||
  CASE NVL(x.IE_TMO_AP, a.IE_CIRURGI_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_RADIO_ANT, a.IE_RADIO_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_QUIMIO_ANT, a.IE_QUIMIO_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_HORMO_ANT, a.IE_HORMO_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_TMO_ANT, a.IE_TMO_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*---------- Campo 60 ----------*/
  CASE NVL(x.IE_IMUNO_ANT, a.IE_IMUNO_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_OUTROS_ANT, a.IE_OUTROS_ANT) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  
  CASE NVL(x.IE_SEMINFO_AP, a.IE_SEMINFO_AP) WHEN 'N' THEN CASE NVL(x.IE_NENHUM_AP, a.IE_NENHUM_AP) WHEN 'S' THEN 1 ELSE 0 END ELSE 1 END ||';'||
  CASE NVL(x.IE_CIRURGI_AP, a.IE_CIRURGI_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_RADIO_AP, a.IE_RADIO_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_QUIMIO_AP, a.IE_QUIMIO_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_HORMO_AP, a.IE_HORMO_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_TMO_AP, a.IE_TMO_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_IMUNO_AP, a.IE_IMUNO_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.IE_OUTROS_AP, a.IE_OUTROS_AP) WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*---------- Campo 70 ----------*/
  NVL(NVL(to_char(x.DT_OBITO, 'dd/mm/yyyy'), to_char(x.DT_ULTIMA_NOTICIA, 'dd/mm/yyyy')), NVL(to_char(a.DT_OBITO, 'dd/mm/yyyy'), to_char(a.DT_PREENCH_FICHA, 'dd/mm/yyyy')) ) ||';'||
  NVL(x.IE_SITUACAO_CLINICA, a.IE_ESTADO_PAC_FIM_TRAT)  ||';'||
  NVL(a.CD_LATERALIDADE, '3') ||';'||
  --'8' ||';'||
  regexp_replace(a.DS_INSTITUICAO_ORIGEM, '[\. ,]+',' ') ||';'||
  --'TESTE' ||';'||
  CASE NVL(x.CD_TOPOGRAFIA_RECIDIVA, a.CD_TOPOGRAFIA_RECIDIVA) WHEN '3' THEN 1 WHEN '9' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.CD_TOPOGRAFIA_RECIDIVA, a.CD_TOPOGRAFIA_RECIDIVA) WHEN '1' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.CD_TOPOGRAFIA_RECIDIVA, a.CD_TOPOGRAFIA_RECIDIVA) WHEN '2' THEN 1 ELSE 0 END ||';'||
  CASE NVL(x.CD_TOPOGRAFIA_RECIDIVA, A.CD_TOPOGRAFIA_RECIDIVA) WHEN '4' THEN 1 ELSE 0 END ||';'||
  CASE x.CD_TOPOGRAFIA_RECIDIVA WHEN '3' THEN '' WHEN '9' THEN '' ELSE to_char(x.DT_RECIDIVA, 'dd/mm/yyyy') END || ';' ||
  NVL(a.CD_TOPOG_MD_PRIM, ' ') ||';'||
  NVL(a.CD_TOPOG_MD_SEG, ' ') ||';'||
  NVL(a.CD_TOPOG_MD_TER, ' ') ||';'||
  NVL(a.CD_TOPOG_MD_QUA, ' ') ||';'||
  ''
from	CAN_FICHA_ADMISSAO a,
    CAN_FICHA_SEGUIMENTO x,
	pessoa_fisica b,
	compl_pessoa_fisica c,
	cido_topografia d
where	a.cd_pessoa_fisica = b.cd_pessoa_fisica
and a.nr_sequencia = x.NR_SEQ_FICHA_ADMISSAO(+)
and	c.cd_pessoa_fisica = b.cd_pessoa_fisica
and	c.ie_tipo_complemento = 1
and	a.CD_TOPOG_TU_PRIM = d.cd_topografia(+)
--AND a.NR_PRONTUARIO in (491518)--527680, 340818, 494624, 721386, 667937, 491518)
and NVL(x.DT_ULTIMA_NOTICIA, a.DT_PREENCH_FICHA) between '01/09/2018' and '06/03/2019'