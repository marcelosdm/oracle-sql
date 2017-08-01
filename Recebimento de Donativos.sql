SELECT
  Obter_Pessoa_Titulo_Receber(a.NR_TITULO) nome,
  null as fantasia,
  a.nr_titulo,
  Sus_Obter_Desc_TipoLog(d.cd_tipo_logradouro) || ' ' ||
  (obter_compl_pf(c.cd_pessoa_fisica,1,'EC')) endereco,
  c.NR_CPF doc,
  (to_char(a.vl_titulo,'FM999G999G999D00') || ' (' || obter_extenso(a.vl_titulo)||')') as valor,
  a.DS_OBSERVACAO_TITULO,
  Obter_Desc_Tipo_Recebimento(b.CD_TIPO_RECEBIMENTO) recebimento
FROM
  titulo_receber a,
  TITULO_RECEBER_LIQ b,
  PESSOA_FISICA c,
  COMPL_PESSOA_FISICA d
WHERE
  a.NR_TITULO = b.NR_TITULO
  AND a.CD_PESSOA_FISICA = c.CD_PESSOA_FISICA
  AND c.CD_PESSOA_FISICA = d.CD_PESSOA_FISICA
  AND d.NR_SEQUENCIA = 1
  AND a.nr_titulo =:nr_titulo
  AND a.CD_PESSOA_FISICA is not null
  
UNION

SELECT
  Obter_Pessoa_Titulo_Receber(a.NR_TITULO) nome,
  c.DS_RAZAO_SOCIAL as fantasia,
  a.nr_titulo,
  ('Rua ' || c.ds_endereco ||', ' || c.nr_endereco || ' - ' || c.ds_bairro || ' - ' || c.ds_municipio|| ' - ' || c.sg_estado || ' - ' || c.cd_cep)endereco,
  c.CD_CGC doc,
  (to_char(a.vl_titulo,'FM999G999G999D00') || ' (' || obter_extenso(a.vl_titulo)||')') as valor,
  a.DS_OBSERVACAO_TITULO,
  Obter_Desc_Tipo_Recebimento(b.CD_TIPO_RECEBIMENTO) recebimento
FROM
  titulo_receber a,
  TITULO_RECEBER_LIQ b,
  PESSOA_JURIDICA c
WHERE
  a.NR_TITULO = b.NR_TITULO
  AND a.CD_CGC = c.CD_CGC
  AND a.nr_titulo =:nr_titulo
  AND a.CD_CGC is not null