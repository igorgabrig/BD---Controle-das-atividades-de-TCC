select t.tcc_etapa as 'Etapa', tcc_titulo as 'Titulo', lin_descricao as 'Linha de Pesquisa', alu_nome as 'Aluno', pro_nome as 'Professor', tcc_inicio as 'Inicio', tcc_conclusao as 'Conclusao'
from tcc t, linha l, aluno a, professor p
where a.alu_ra = t.alu_ra and t.lin_codigo = l.lin_codigo and t.pro_siape_orientador = p.pro_siape and pro_siape = 1 and tcc_etapa = 'TCC1' and tcc_inicio between '2017-00-00' and '2017-12-30'
order by tcc_inicio desc;