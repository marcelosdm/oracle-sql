/*
CRIA FUN��O QUE OBT�M O HIST�RICO DO T�TULO
Esta fun��o tem o objetivo de buscar os hist�ricos dos t�tulos a receber, 
� partir a posi��o 135, j� que da posi��o 0 � 135 s�o caracteres de formata��o
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