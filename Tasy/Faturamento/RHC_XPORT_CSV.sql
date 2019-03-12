select	  'A' ||';'||
  '020907'||';'||
  '1' ||';'||
  a.NR_PRONTUARIO ||';'||
  substr(obter_nome_pf(b.cd_pessoa_fisica), 0, 60) ||';'||
  OBTER_NOME_MAE(b.cd_pessoa_fisica) ||';'||
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
  to_char(b.dt_nascimento, 'dd/mm/yyyy') ||';'|| /*---------- CAMPO 10 -----------*/
  decode(b.ie_sexo,'M','1','F','2') ||';'||
  obter_compl_pf(b.cd_pessoa_fisica, 1, 'UF') ||';'||
  c.DS_ENDERECO ||';'||
  c.NR_ENDERECO ||';'||
  c.DS_COMPLEMENTO ||';'||
  c.CD_CEP ||';'||
  c.CD_MUNICIPIO_IBGE ||';'||
  c.NR_DDD_TELEFONE ||c.NR_TELEFONE ||';'||
  CASE a.NR_SEQ_ORIGEM_ENC 
  WHEN 1 THEN 2
  WHEN 4 THEN 1
  WHEN 2 THEN 3
  ELSE 2
  END  ||';'||
  to_char(a.DT_CONSULTA, 'dd/mm/yyyy') ||';'|| /*------------- CAMPO 20 --------------*/
  a.CD_CLINICA_ATENDIMENTO ||';'||
  --'15' ||';'||
  CASE a.IE_DIAG_TRAT_PREVIO 
  WHEN 1 THEN 1
  WHEN 2 THEN 2
  WHEN 3 THEN 3
  ELSE 4
  END ||';'||
  a.DT_DIAGNOSTICO ||';'||
  a.CD_BASE_DIAG ||';'||
  a.CD_TOPOG_TU_PRIM ||';'||
  LTRIM(a.CD_MORFOLOGIA_TU_PRIM, 'M') ||';'||
  a.CD_ESTADIO ||';'||
  LTRIM(a.CD_TUMOR_PRIMARIO, 'T') ||';'||
  LTRIM(a.CD_LINFONODO_REGIONAL, 'N') ||';'||
  LTRIM(a.CD_METASTASE_DISTANCIA, 'M') ||';'|| /*------------ Campo 30 ----------------*/
  NVL(a.CD_TUMOR_PRIM_PAT, ' ') ||';'||
  NVL(a.CD_LINFONODO_REG_PAT, ' ') ||';'||
  NVL(a.CD_METASTASE_DIST_PAT, ' ') ||';'||
  NVL(a.CD_MARC_SERICO, '8') ||';'||
  --NVL(a.CD_GRAU_HISTO, '8') ||';'||
 /*CASE 
    WHEN a.CD_TOPOG_TU_PRIM in ('C15', 'C40', 'C41', 'C381', 'C382', 'C383', 'C47', 'C48', 'C49')
    THEN a.CD_GRAU_HISTO
    ELSE '8'
  END || ';'||*/
  NVL(a.CD_GRAU_HISTO, '8')|| ';'||
  CASE
    WHEN a.CD_TOPOG_TU_PRIM like '%C15%' THEN '1'
    ELSE '8'
  END ||';'||
    /*----------- INÍCIO CAMPO 37 -------------------*/
  CASE 
        WHEN a.CD_ESTADIO = 'IA' 
            AND a.CD_TUMOR_PRIMARIO in ('T1','T2') 
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20', 'C481')
        THEN '2' 
        WHEN a.CD_ESTADIO = 'IB'
            AND a.CD_TUMOR_PRIMARIO = 'T3'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20', 'C481')
        THEN '2'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_TUMOR_PRIMARIO in ('T1', 'T2')
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_TUMOR_PRIMARIO = 'T4'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_TUMOR_PRIMARIO = 'T3'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IIIB'
            AND a.CD_TUMOR_PRIMARIO = 'T4'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IV'
            AND a.CD_METASTASE_DISTANCIA in ('M0', 'M1')
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '9'
        WHEN a.CD_ESTADIO = 'I'
            AND a.CD_TUMOR_PRIMARIO in ('T1', 'T2')
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_TUMOR_PRIMARIO = 'T3'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_TUMOR_PRIMARIO = 'T1'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_TUMOR_PRIMARIO = 'T4'
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIB'
            AND a.CD_TUMOR_PRIMARIO in ('T2', 'T3', 'T4')
            AND a.CD_LINFONODO_REGIONAL = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IV'
            AND a.CD_METASTASE_DISTANCIA in ('M0', 'M1')
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '9'
    ELSE '8' end ||';'||
  /*-------------------- FIM CAMPO 37 -----------------------*/
  '8' ||';'||
  '8' ||';'||
  '' ||';'|| /*-------------------Campo 40 ------------------*/
  a.CD_TOPOG_MD_PRIM ||';'||
  a.CD_TOPOG_MD_SEG ||';'||
  a.CD_TOPOG_MD_TER ||';'||
  a.CD_TOPOG_MD_QUA ||';'||
  to_char(a.DT_INICIO_TRAT, 'dd/mm/yyyy') ||';'||
  NVL(a.CD_RAZAO_NAO_TRAT, '8') ||';'||
  CASE a.IE_TRAT_INSTITUICAO WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_CIR WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_RADIO WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_QUIMIO WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*------------- Campo 50 --------------*/
  CASE a.IE_TRAT_INST_HORM WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_TMO WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_IMUNO WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TRAT_INST_OUTRO WHEN 'S' THEN 1 ELSE 0 END ||';'||
 
  CASE a.IE_NENHUM_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_CIRURGI_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_RADIO_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_QUIMIO_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_HORMO_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TMO_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*---------------- Campo 60 --------------------*/
  CASE a.IE_IMUNO_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_OUTROS_ANT WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE WHEN a.IE_SEMINFO_AP = 'S' THEN 1
      WHEN a.IE_NENHUM_AP = 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_CIRURGI_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_RADIO_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_QUIMIO_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_HORMO_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_TMO_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_IMUNO_AP WHEN 'S' THEN 1 ELSE 0 END ||';'||
  CASE a.IE_OUTROS_AP WHEN 'S' THEN 1 ELSE 0 END ||';'|| /*------------------- Campo 70 -----------------*/
  NVL(to_char(a.DT_OBITO, 'dd/mm/yyyy'), to_char(a.DT_PREENCH_FICHA, 'dd/mm/yyyy')) ||';'||
  --a.DT_PREENCH_FICHA ||';'||
  a.IE_ESTADO_PAC_FIM_TRAT  ||';'||
  NVL(a.CD_LATERALIDADE, '8') ||';'||
  a.DS_INSTITUICAO_ORIGEM ||';'||
  --'TESTE' ||';'||
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 3 THEN 1 WHEN 9 THEN 1 ELSE 0 END ||';'||
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 1 THEN 1 ELSE 0 END ||';'||
  CASE a.CD_TOPOGRAFIA_RECIDIVA WHEN 2 THEN 1 ELSE 0 END ||';'||
  CASE A.CD_TOPOGRAFIA_RECIDIVA WHEN 4 THEN 1 ELSE 0 END ||';'||
  '' ||';'||
  NVL(a.CD_TOPOG_MD_PRIM, ' ') ||';'||
  NVL(a.CD_TOPOG_MD_SEG, ' ') ||';'|| /*---------------------- Campo 80 -------------------*/
  NVL(a.CD_TOPOG_MD_TER, ' ') ||';'||
  NVL(a.CD_TOPOG_MD_QUA, ' ') ||';'||
  ''    
from	CAN_FICHA_ADMISSAO a,
	pessoa_fisica b,
	compl_pessoa_fisica c,
	cido_topografia d
where	a.cd_pessoa_fisica = b.cd_pessoa_fisica
and	c.cd_pessoa_fisica = b.cd_pessoa_fisica
and	c.ie_tipo_complemento = 1
and	a.CD_TOPOG_TU_PRIM = d.cd_topografia(+)
--AND a.NR_PRONTUARIO in (486330)
--and a.nr_registro not in ('00002705982201800831', '00002705982201800841')
and a.DT_PREENCH_FICHA between '01/09/2018' and '06/03/2019'