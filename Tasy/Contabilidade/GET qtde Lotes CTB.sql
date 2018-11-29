select count(a.NR_LOTE_CONTABIL) qtde_lotes,
case (a.cd_estabelecimento)
when 1 then 'Santa Casa'
when 111 then 'AME Franca'
when 112 then 'AME Taquaritinga'
when 71 then 'Associação'
end estabelecimento,
to_char(a.DT_REFERENCIA, 'mm/yyyy') mes_referencia

from LOTE_CONTABIL a
where a.DT_REFERENCIA between '01/09/2017' and '30/11/2017'
and a.CD_ESTABELECIMENTO is not null
group by a.cd_estabelecimento, to_char(a.DT_REFERENCIA, 'mm/yyyy')
order by mes_referencia, a.cd_estabelecimento