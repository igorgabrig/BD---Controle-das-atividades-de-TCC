
------------------------------------------------Nº 10 ------------------------------------------------
select t.tcc_etapa as 'Etapa do TCC', YEAR(tcc_conclusao) as 'Ano de conclusão', count(t.tcc_etapa) as 'QTD TCC2 concluido', dep_sigla as 'Departamento', pro_nome as 'Professor'
from tcc t natural join departamento natural join professor p
where t.pro_siape_orientador = p.pro_siape and tcc_etapa = 'TCC2' and t.tcc_conclusao <= now()
group by dep_codigo, pro_siape, tcc_conclusao;

------------------------------------------------Nº 10 ------------------------------------------------

