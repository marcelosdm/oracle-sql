SELECT nr_seq_exame FROM prescr_procedimento WHERE cd_procedimento = 40316378 AND nr_sequencia = 4;


UPDATE prescr_procedimento SET nr_seq_exame = 6189 WHERE nr_prescricao = 6356485 AND nr_sequencia = 2;


UPDATE prescr_procedimento SET cd_procedimento = 202010554 WHERE nr_prescricao = 5313894 AND nr_sequencia = 1;


UPDATE prescr_procedimento SET ie_amostra = 'S' WHERE nr_prescricao = 5313894 AND nr_sequencia = 1;


SELECT * FROM prescr_procedimento WHERE nr_prescricao = 5313894;


commit;