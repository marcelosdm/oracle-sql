/*
CRIA FUNÇÃO QUE OBTÉM O HISTÓRICO DO TÍTULO
Esta função tem o objetivo de buscar os históricos dos títulos a receber, 
à partir a posição 135, já que da posição 0 à 135 são caracteres de formatação
do texto no sistema Tasy.
*/

CREATE OR REPLACE FUNCTION SCF_OBTER_HIST_TITULO (P_NR_TITULO NUMBER, P_SEQUENCIA_HIST NUMBER)
RETURN VARCHAR2
IS 
 L_DS_HISTORICO LONG;
 
 BEGIN
    select DS_HISTORICO INTO L_DS_HISTORICO
    from TITULO_RECEBER_HIST
    where nr_titulo = P_NR_TITULO
    AND NR_SEQUENCIA = P_SEQUENCIA_HIST;

 RETURN SUBSTR(L_DS_HISTORICO, 135,4000);
 END SCF_OBTER_HIST_TITULO;