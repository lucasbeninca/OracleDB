select * from tabela_de_vendedores;

ALTER TABLE tabela_de_vendedores ADD DATA_ADMISSAO DATE;

INSERT INTO tabela_de_vendedores (matricula, nome, percentual_comissao , data_admissao , de_ferias) 
VALUES('00235', 'Márcio Almeida Silva', 0.08, to_date('15/08/2014','DD/MM/YYYY') ,'S');

INSERT INTO tabela_de_vendedores (matricula, nome, percentual_comissao , data_admissao , de_ferias) 
VALUES('00236','Cláudia Morais', 0.08, to_date('17/09/2013','DD/MM/YYYY') ,'S');

INSERT INTO tabela_de_vendedores (matricula, nome, percentual_comissao , data_admissao , de_ferias) 
VALUES('00237','Roberta Martins', 0.11, to_date('18/03/2017','DD/MM/YYYY') ,'S');

INSERT INTO tabela_de_vendedores (matricula, nome, percentual_comissao , data_admissao , de_ferias) 
VALUES('00238','Péricles Alves', 0.11, to_date('21/08/2016','DD/MM/YYYY') ,'N');


