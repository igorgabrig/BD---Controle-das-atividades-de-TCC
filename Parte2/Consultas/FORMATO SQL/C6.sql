select lin_descricao as 'Linha de Pesquisa', pro_nome as 'Professor'
from ((linha left outer join pesquisa on linha.lin_codigo = pesquisa.lin_codigo) left outer join professor on pesquisa.pro_siape = professor.pro_siape)
order by lin_descricao asc;