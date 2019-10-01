SELECT pro_nome as 'NOME', COUNT(pro_siape_orientador) as 'QNT ORIENT'
	FROM tcc, professor
	WHERE tcc.pro_siape_orientador = professor.pro_siape
	GROUP BY professor.pro_nome;
