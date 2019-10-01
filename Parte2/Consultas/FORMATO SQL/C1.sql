SELECT tcc_etapa as ETAPA, alu_nome as ALUNO, tcc_inicio as INICIO, tcc_conclusao as CONCLUSAO, cur_nome as CURSO, dep_nome as DEPARTAMENTO
	FROM aluno, curso, tcc, departamento
	WHERE aluno.cur_codigo = curso.cur_codigo and curso.dep_codigo = departamento.dep_codigo AND curso.dep_codigo = 1 AND tcc.alu_ra = aluno.alu_ra
	GROUP BY alu_nome
	ORDER BY alu_nome ASC;