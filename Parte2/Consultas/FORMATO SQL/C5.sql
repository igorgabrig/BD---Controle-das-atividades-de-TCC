select distinct pro_siape as SIAPE, pro_nome as Nome, dep_sigla as Departamento

from professor p, departamento d

where p.dep_codigo = d.dep_codigo and p.pro_siape not in 	(select banca.pro_siape_membro2 
						from professor, banca 
								where professor.pro_siape != banca.pro_siape_membro2)

order by dep_sigla asc;