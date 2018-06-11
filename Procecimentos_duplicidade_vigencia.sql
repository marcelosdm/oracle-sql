select cd_procedimento,

substr(obter_descricao_procedimento(cd_procedimento, ie_origem_proced),1, 150) ds_procedimento

from PRECO_AMB
where DT_FINAL_VIGENCIA is null
and CD_EDICAO_AMB = 511
group by cd_procedimento, ie_origem_proced
having count(cd_procedimento) > 1


