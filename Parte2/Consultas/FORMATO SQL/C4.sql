select tcc_etapa as 'ETAPA DO TCC', alu_nome 'NOME DO ALUNO(A)', pro_nome 'NOME DO ORIENTADOR(A)', date_format(ban_data, '%d/%m/%y') as 'DATA DA BANCA',  date_format(ban_data, '%H:%i') 'HORÁRIO DA BANCA', s.sal_codigo 'SALA', pre_nome 'PREDIO'
from banca b natural join aluno a natural join sala s natural join predio pre, professor pro 
where ban_data between '2015-01-01' and '2016-12-12' and
Extract(hour from ban_data) >= '12:00' and Extract(hour from ban_data) <= '18:00' and
b.pro_siape_orientador = pro.pro_siape and pre_codigo = 4
group by ban_data asc;