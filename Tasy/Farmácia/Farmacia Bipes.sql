SELECT 
DT_ATENDIMENTO hora_bipe,
substr(obter_desc_material(CD_MATERIAL),1,100) material,
DS_OBSERVACAO
 FROM MATERIAL_ATEND_PACIENTE
WHERE nr_atendimento = 6873001
AND CD_MATERIAL = 417
AND to_char(DT_ATENDIMENTO, 'dd/mm/yyyy') = '10/07/2018'
ORDER BY 1