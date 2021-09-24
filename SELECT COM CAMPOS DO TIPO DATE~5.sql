select * from tabela_de_vendedores where nome = 'Cláudia Morais';

select * from tabela_de_vendedores where percentual_comissao > 0.10;

select * from tabela_de_vendedores where TO_CHAR(data_admissao, 'YYYY') > 2016 ;