select lin.lin_descricao as 'Pesquisa', prof.pro_nome as 'Professor', dep.dep_nome as 'Departamento'
from pesquisa as pes inner join (select lin_codigo
									from pesquisa
									group by lin_codigo
									having count(distinct pro_siape) > 1) as resul on resul.lin_codigo = pes.lin_codigo
					inner join professor as prof on prof.pro_siape = pes.pro_siape
					inner join linha as lin on lin.lin_codigo = pes.lin_codigo
					inner join departamento as dep on dep.dep_codigo = prof.dep_codigo
order by lin_descricao asc;