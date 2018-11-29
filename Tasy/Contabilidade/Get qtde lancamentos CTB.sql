select count(a.nr_sequencia) qtde_lancamentos, 
case (a.cd_estabelecimento)
when 1 then 'Santa Casa'
when 111 then 'AME Franca'
when 112 then 'AME Taquaritinga'
when 71 then 'Associação'
end estabelecimento,
to_char(a.DT_MOVIMENTO, 'mm/yyyy') mes_referencia
from CTB_MOVIMENTO a
where a.DT_MOVIMENTO between '01/09/2017' and '30/11/2017'
and a.CD_ESTABELECIMENTO is not null

group by a.cd_estabelecimento, to_char(a.DT_MOVIMENTO, 'mm/yyyy')
order by mes_referencia, a.cd_estabelecimento