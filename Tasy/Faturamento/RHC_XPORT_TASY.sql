select	
  'A' TIPO,
  '020907' INSTITU,
  '1' ADM,
  a.NR_PRONTUARIO PRONTUAR,
  substr(obter_nome_pf(b.cd_pessoa_fisica), 0, 60) NOME,
  OBTER_NOME_MAE(b.cd_pessoa_fisica) NOMEMAE,
  case b.IE_GRAU_INSTRUCAO 
  WHEN 1 then 1
  WHEN 7 then 2
  WHEN 2 then 3
  WHEN 3 then 4
  WHEN 8 then 4
  WHEN 9 then 4
  WHEN 4 then 5
  ELSE 9
  end ESCOLARI,
  '4' TIPODOC,
  b.nr_cpf NUMDOC,
  to_char(b.dt_nascimento, 'dd/mm/yyyy') DTNASC,
  decode(b.ie_sexo,'M','1','F','2') SEXO,
  obter_compl_pf(b.cd_pessoa_fisica, 1, 'UF') UFNASC,
  c.DS_ENDERECO ENDERECO,
  c.NR_ENDERECO NUMERO,
  NVL(c.DS_COMPLEMENTO, '-') COMPL,
  c.CD_CEP CEP,
  c.CD_MUNICIPIO_IBGE IBGE,
  c.NR_DDD_TELEFONE || c.NR_TELEFONE TELEFONE,
  CASE a.NR_SEQ_ORIGEM_ENC 
  WHEN 1 THEN 2
  WHEN 4 THEN 1
  WHEN 2 THEN 3
  END  CATEATEND,
  to_char(a.DT_CONSULTA, 'dd/mm/yyyy') DTCONSULT,
  a.CD_CLINICA_ATENDIMENTO CLINICA,
  CASE a.IE_DIAG_TRAT_PREVIO 
  WHEN 1 THEN 1
  WHEN 2 THEN 2
  WHEN 3 THEN 3
  ELSE 4
  END DIAGPREV,
  a.DT_DIAGNOSTICO DTDIAG,
  a.CD_BASE_DIAG BASEDIAG,
  a.CD_TOPOG_TU_PRIM TOPO,
  a.CD_MORFOLOGIA_TU_PRIM MORFO,
  a.CD_ESTADIO EC,
  a.CD_TUMOR_PRIMARIO T,
  a.CD_LINFONODO_REGIONAL N,
  a.CD_METASTASE_DISTANCIA M,
  NVL(a.CD_TUMOR_PRIM_PAT, ' ') PT,
  NVL(a.CD_LINFONODO_REG_PAT, ' ') PN,
  NVL(a.CD_METASTASE_DIST_PAT, ' ') PM,
  NVL(a.CD_MARC_SERICO, '8') S,
  NVL(a.CD_GRAU_HISTO, '8') G,
  CASE (select obter_desc_sub_localizacao_tnm(b.NR_SEQ_SUB_LOC)
        from CAN_TNM_LOC_TOPOGRAFIA b
        where b.CD_TOPOGRAFIA = a.CD_TOPOG_TU_PRIM)
  WHEN 'NÃO SE APLICA' THEN 8
  END LOCALTNM,
  '' IDMITOTIC,
  '' PSA,
  '' GLEASON,
  '' OUTRACLA,
  a.CD_TOPOG_MD_PRIM META01,
  a.CD_TOPOG_MD_SEG META02,
  a.CD_TOPOG_MD_TER META03,
  a.CD_TOPOG_MD_QUA META04,
  to_char(a.DT_INICIO_TRAT, 'dd/mm/yyyy') DTTRAT,
  a.CD_RAZAO_NAO_TRAT NAOTRAT,
  a.IE_TRAT_INSTITUICAO NENHUM,
  a.IE_TRAT_INST_CIR CIRURGIA,
  a.IE_TRAT_INST_RADIO RADIO,
  a.IE_TRAT_INST_QUIMIO QUIMIO,
  a.IE_TRAT_INST_HORM HORMONIO,
  a.IE_TRAT_INST_TMO TMO,
  a.IE_TRAT_INST_IMUNO IMUNO,
  a.IE_TRAT_INST_OUTRO OUTROS,
  a.IE_NENHUM_ANT NENHUMANT,
  a.IE_CIRURGI_ANT CIRURANT,
  a.IE_RADIO_ANT RADIOANT,
  a.IE_QUIMIO_ANT QUIMIOANT,
  a.IE_HORMO_ANT HORMOANT,
  a.IE_TMO_ANT TMOANT,
  a.IE_IMUNO_ANT IMUNOANT,
  a.IE_OUTROS_ANT OUTROANT,
  a.IE_NENHUM_AP NENHUMAPOS,
  a.IE_CIRURGI_AP CIRURAPOS,
  a.IE_RADIO_AP RADIOAPOS,
  a.IE_QUIMIO_AP QUIMIOAPOS,
  a.IE_HORMO_AP HORMOAPOS,
  a.IE_TMO_AP TMOAPOS,
  a.IE_IMUNO_AP IMUNOAPOS,
  a.IE_OUTROS_AP OUTROAPOS,
  a.DT_PREENCH_FICHA DTULTINFO,
  a.IE_ESTADO_PAC_FIM_TRAT  ULTINFO,
  a.CD_LATERALIDADE LATERALI,
  a.DS_INSTITUICAO_ORIGEM INSTORIG,
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 3 THEN 1 WHEN 9 THEN 1 ELSE 0 END RECNENHUM,
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 1 THEN 1 ELSE 0 END RECLOCAL,
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 2 THEN 1 ELSE 0 END RECREGIONAL,
  CASE A.CD_TOPOGRAFIA_RECIDIVA WHEN 4 THEN 1 ELSE 0 END RECDISTANCIA,
  '' DTRECIDIVA,
  NVL(a.CD_TOPOG_MD_PRIM, ' ') REC01,
  NVL(a.CD_TOPOG_MD_SEG, ' ') REC02,
  NVL(a.CD_TOPOG_MD_TER, ' ') REC03,
  NVL(a.CD_TOPOG_MD_QUA, ' ') REC04,
  '' OBS
  
  /*
  decode(a.IE_CASO_ANALITICO,'S','1','2'), 
  
	a.CD_TIPO_TUMOR,
	a.NR_REGISTRO,
	obter_idade(sysdate, b.dt_nascimento, 'A'),
	b.dt_nascimento,
	
	b.nr_seq_cor_pele,
	b.ie_grau_instrucao,
	obter_conversao_externa('78633088000176', 'PROFISSAO', 'CD_PROFISSAO', c.cd_profissao),
	c.cd_municipio_ibge||CALCULA_DIGITO('MODULO10', c.cd_municipio_ibge),
	a.cd_clinica_entrada,
	a.cd_clinica_atendimento,
	'1',
	
	a.dt_consulta,
	a.dt_diagnostico,
	a.IE_DIAG_TRAT_PREVIO,
	a.CD_BASE_DIAG,
	d.CD_CATEGORIA,
	a.CD_MORFOLOGIA_TU_PRIM,
	a.IE_MAIS_UM_TU_PRIM,
	decode(upper(a.CD_ESTADIO),'I',1,'II',2,'III',3,'IV',4,'V',5),   
	decode(upper(a.CD_ESTADIO_OUTRO),'I',1,'II',2,'III',3,'IV',4,'V',5),
	obter_somente_numero(a.CD_TUMOR_PRIMARIO||a.CD_LINFONODO_REGIONAL||a.CD_METASTASE_DISTANCIA),   
	obter_somente_numero(a.CD_LINFONODO_REG_PAT||a.CD_LINFONODO_REG_PAT||a.CD_METASTASE_DIST_PAT),
	obter_somente_numero(a.CD_TOPOG_MD_PRIM||' '||CD_TOPOG_MD_SEG||' '||CD_TOPOG_MD_TER||' '||CD_TOPOG_MD_QUA), 
	a.DT_INICIO_TRAT,
	a.CD_RAZAO_NAO_TRAT,
	decode(IE_TRAT_INSTITUICAO,'S','1')||decode(IE_TRAT_INST_CIR,'S','2')||decode(IE_TRAT_INST_OUTRO,'S','8')||decode(IE_TRAT_INST_QUIMIO,'S','4')||decode(IE_TRAT_INST_RADIO,'S','3')||decode(IE_TRAT_INST_SEM_INF,'S','9')||decode(IE_TRAT_INST_HORM,'S','5')||decode(IE_TRAT_INST_IMUNO,'S','7')||decode(IE_TRAT_INST_TMO,'S','6'),
	a.IE_ESTADO_PAC_FIM_TRAT,
	a.DT_OBITO,
	a.CD_CID_MORTE_IMEDIATA,
	a.CD_CID_MORTE_BASICA,
	decode(a.IE_SEGUIMENTO,'S',1,2),
	02,
	a.DT_PREENCH_FICHA,
	b.ie_estado_civil,
	a.dt_triagem,
	decode(a.IE_HIST_CANCER,'S',1,'N',2,'NA',8,9),
	decode(a.IE_ALCOOLISMO,'S',1,'N',2,'NA',8,9),
	decode(a.IE_TABAGISMO,'S',1,'N',2,'NA',8,9),
	(select	e.cd_convenio
	from	atend_categoria_convenio e
	where	e.nr_seq_interno = (	select	min(f.nr_seq_interno)
				 	from	atendimento_paciente f1,
						atend_categoria_convenio f
					where	f1.nr_atendimento = f.nr_atendimento
					and	f1.cd_pessoa_fisica = a.cd_pessoa_fisica)),
	decode(a.IE_ERD_EXAME_CLINICO,'N','0 ','1 ')||decode(a.IE_ERD_EXAME_IMAGEM,'N','0 ','1 ')||decode(a.IE_ERD_ANATOMIA_PAT,'N','0 ','1 ')||decode(a.IE_ERD_ENDOSCOPIA,'N','0 ','1 ')||decode(a.IE_ERD_SEM_INFORMACAO,'N','0 ','1 ')||decode(a.IE_ERD_NAO_SE_APLICA,'N','0 ','1 '),
	a.CD_TOPOG_LOC_PROV,
	a.CD_LATERALIDADE,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null ds_texto*/
from	CAN_FICHA_ADMISSAO a,
	pessoa_fisica b,
	compl_pessoa_fisica c,
	cido_topografia d
where	a.cd_pessoa_fisica = b.cd_pessoa_fisica
and	c.cd_pessoa_fisica = b.cd_pessoa_fisica
and	c.ie_tipo_complemento = 1
and	a.CD_TOPOG_TU_PRIM = d.cd_topografia(+)