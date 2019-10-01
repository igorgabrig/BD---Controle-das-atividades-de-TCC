select s.sal_codigo as 'Codigo da Sala', Pre_Nome as 'Nome Do Predio'
from sala s, predio p
where not exists(select * from banca b
				where b.sal_codigo = s.sal_codigo and b.ban_data between '2016-01-01' and '2016-12-30' ) and
s.pre_codigo = p.pre_codigo
group by s.sal_codigo;