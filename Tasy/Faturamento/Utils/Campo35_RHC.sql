select case 
        WHEN a.CD_TOPOG_TU_PRIM in ('C15', 'C40', 'C41', 'C381', 'C382', 'C383', 'C47', 'C48', 'C49')
        THEN a.CD_GRAU_HISTO
        ELSE '8'
      END campo_35
from CAN_FICHA_ADMISSAO a
where a.NR_PRONTUARIO = '253210'