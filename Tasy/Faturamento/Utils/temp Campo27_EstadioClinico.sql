select --e.NR_ATENDIMENTO, e.DS_ESTADIO_UICC, a.CD_ESTADIO, 
x.ds_valor_dominio
from SUS_LAUDO_PACIENTE e, CAN_FICHA_ADMISSAO a, valor_dominio x
where e.ds_estadio_uicc = x.vl_dominio
and e.CD_PESSOA_FISICA = a.CD_PESSOA_FISICA
and e.CD_CID_TOPOGRAFIA like '%C61%'
and x.cd_dominio = 2502
and e.nr_atendimento = 7017687;

select 
vl_dominio, ds_valor_dominio,
DECODE(vl_dominio, 0, '0',
                  1, 'I',
                  10, 'IIC',
                  11, 'IIIA',
                  12, 'IIIB',
                  13, 'IIIC',
                  14, 'IVA',
                  15, 'IVB',
                  16, 'IVC',
                  17, 'AI',
                  18, 'AII',
                  19, 'BI',
                  2, 'II',
                  20, 'BII',
                  21, 'CI',
                  22, 'CII',
                  23, 'C0',
                  24, 'D1',
                  25, 'D11',
                  26, 'A',
                  27, 'B',
                  28, 'C',
                  29, '99',
                  3, 'III',
                  30, '88',
                  4, 'IV',
                  5, 'IA',
                  6, 'IB',
                  7, 'IC',
                  8, 'IIA',
                  9, 'IIB')
from VALOR_DOMINIO
where cd_dominio = 2502
order by vl_dominio;