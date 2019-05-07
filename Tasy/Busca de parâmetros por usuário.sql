SELECT DISTINCT f.DS_FUNCAO,
  a.nr_sequencia,
 
  u.DS_USUARIO
FROM FUNCAO_PARAMETRO a,
 
  funcao f,
  FUNCAO_PARAM_USUARIO d,
  usuario u
WHERE a.CD_FUNCAO        = f.CD_FUNCAO
and a.nr_sequencia = d.nr_sequencia
AND d.CD_FUNCAO        = a.CD_FUNCAO
AND d.NM_USUARIO_PARAM = u.NM_USUARIO
AND a.cd_funcao       IN (915, 913, 917)
  
AND d.NM_USUARIO_PARAM IN ('Acyr','Gilson','BMU', 'Taila')
 
ORDER BY ds_usuario, DS_FUNCAO,
  nr_sequencia