update EXAME_LAB_CONVENIO
set IE_SITUACAO = 'I'
where IE_ORIGEM_PROCED = 7
and NR_SEQ_EXAME in (select x.nr_seq_exame
from MED_EXAME_PADRAO x
where x.NR_SEQ_GRUPO = 10
and x.IE_SITUACAO = 'A'
and x.NR_SEQ_EXAME is not null);