select lin_descricao as Linha, tcc_etapa as Etapa, count(tcc_etapa) as QuantidadePorEtapas

from linha, tcc

where linha.lin_codigo in (select lin_codigo
								from tcc

			where tcc.tcc_conclusao <= now())
			and linha.lin_codigo = tcc.lin_codigo

group by linha.lin_codigo, tcc.tcc_etapa

having QuantidadePorEtapas > 1;