select 
  CASE WHEN a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
        THEN '1' 
        WHEN a.CD_TUMOR_PRIMARIO = 'T2a'
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
        THEN '1'
        WHEN a.CD_TUMOR_PRIMARIO = 'T1'
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
            -- AND PSA < 20
        THEN '2'        
        WHEN a.CD_TUMOR_PRIMARIO = 'T1'
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
            -- AND PSA between '10' and  '20'
        THEN '1'
        WHEN a.CD_TUMOR_PRIMARIO in ('T2a', 'T2b')
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
            -- AND PSA < '20'
        THEN '2'
        WHEN a.CD_TUMOR_PRIMARIO in ('T1', 'T2')
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM like '%C61%'
        THEN '3'
  END GLEASON
from	CAN_FICHA_ADMISSAO a
where a.NR_PRONTUARIO = '747468';

select NR_ATENDIMENTO, DS_ESTADIO_UICC,
OBTER_ESTADIO()
from SUS_LAUDO_PACIENTE
where CD_CID_TOPOGRAFIA like '%C61%'
and nr_atendimento = 7017687