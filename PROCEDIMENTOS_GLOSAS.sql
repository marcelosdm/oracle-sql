/*RELATÓRIO CFAT 02397*/

SELECT b.CD_AUTORIZACAO num_guia,
obter_pessoa_conta(b.nr_interno_conta,'D') paciente,
obter_dados_conta_paciente(b.nr_interno_conta,'DPI') dt_guia,
a.cd_procedimento,
obter_desc_prescr_proc_exam(a.cd_procedimento,a.ie_origem_proced,a.nr_seq_proc_interno,a.nr_seq_exame) as ds_proc,
a.VL_PROCEDIMENTO,
b.NR_SEQ_RETORNO
FROM PROCEDIMENTO_PACIENTE a, LOTE_AUDIT_HIST_GUIA b
WHERE a.NR_INTERNO_CONTA = b.NR_INTERNO_CONTA
AND a.CD_PROCEDIMENTO in (28041194, 28050030, 40304906, 40302776, 99887045)
--AND a.NR_INTERNO_CONTA = 22322656
AND a.CD_CONVENIO =:cd_convenio_p
AND a.DT_CONTA between :d1 and :d2
order by b.nr_sequencia;

select * from CONVENIO