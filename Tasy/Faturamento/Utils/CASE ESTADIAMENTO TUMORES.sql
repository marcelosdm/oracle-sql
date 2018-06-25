SELECT --nr_prontuario
    CASE 
        WHEN a.CD_ESTADIO = 'IA' 
            AND a.CD_TUMOR_PRIMARIO in ('T1','T2') 
            AND a.CD_LINFONODO_REGIONAL = 'N0' 
            AND a.CD_METASTASE_DISTANCIA = 'M0' 
            AND a.CD_TOPOG_TU_PRIM = 'C15' 
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20', 'C481')
        THEN '2' 
        WHEN a.CD_ESTADIO = 'IB'
            AND a.CD_LINFONODO_REGIONAL = 'T3'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C16', 'C1701', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20', 'C481')
        THEN '2'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_LINFONODO_REGIONAL in ('T1', 'T2')
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_LINFONODO_REGIONAL = 'T4'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_LINFONODO_REGIONAL = 'T3'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IIIB'
            AND a.CD_LINFONODO_REGIONAL = 'T4'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IV'
            AND a.CD_METASTASE_DISTANCIA in ('M0', 'M1')
            AND a.CD_TOPOG_TU_PRIM in ('C15', 'C481')
        THEN '9'
        WHEN a.CD_ESTADIO = 'I'
            AND a.CD_LINFONODO_REGIONAL in ('T1', 'T2')
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'II'
            AND a.CD_LINFONODO_REGIONAL = 'T3'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_LINFONODO_REGIONAL = 'T1'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IIIA'
            AND a.CD_LINFONODO_REGIONAL = 'T4'
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '2'
        WHEN a.CD_ESTADIO = 'IIIB'
            AND a.CD_LINFONODO_REGIONAL in ('T2', 'T3', 'T4')
            AND a.CD_METASTASE_DISTANCIA = 'N0'
            AND a.CD_METASTASE_DISTANCIA = 'M0'
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '1'
        WHEN a.CD_ESTADIO = 'IV'
            AND a.CD_METASTASE_DISTANCIA in ('M0', 'M1')
            AND a.CD_TOPOG_TU_PRIM in ('C16', 'C170', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20')
        THEN '9'
    ELSE '8' end
FROM
CAN_FICHA_ADMISSAO a
WHERE a.CD_TOPOG_TU_PRIM in ('C15', 'C16', 'C1701', 'C171', 'C172', 'C178', 'C179', 'C18', 'C20', 'C481')