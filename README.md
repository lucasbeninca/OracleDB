# OracleDB



**Tipos de Dados Suportados Pelo OracleDB**

Ao ler uma origem de dados, o Oracle Analytics tenta mapear os tipos de dados de entrada para os tipos de dados suportados.

Por exemplo, uma coluna de banco de dados que contém somente valores de data é formatada como DATE; uma coluna de planilha que contém uma combinação de valores numéricos e de string é formatada como VARCHAR; e uma coluna de dados que contém dados numéricos com valores fracionários usa DOUBLE ou FLOAT.

Em alguns casos, o Oracle Analytics não pode converter um tipo de dados de origem. Para contornar esse problema de tipo de dados, você pode converter manualmente uma coluna de dados para um tipo suportado, inserindo comandos SQL. Em outros casos, o Oracle Analytics não pode representar tipos de dados binários e complexos, como BLOB, JSON e XML.

Observe que não há suporte para alguns tipos de dados. Você verá uma mensagem de erro se a origem de dados contiver tipos de dados não suportados.

O Oracle Analytics suporta os seguintes tipos de dados base:

Tipos Numéricos — **SMALLINT, SMALLUNIT, TINYINT, TINYUINT, UINT, BIT, FLOAT, INT, NUMERIC, DOUBLE**

Tipos de Data — **DATE, DATETIME, TIMESTAMP, TIME**

Tipos de String — **LONGVARCHAR, CHAR, VARCHAR**

          BINARY DOUBLE, BINARY FLOAT

          CHAR, NCHAR

          CLOB, NCLOB

          DATE

          FLOAT

          NUMBER, NUMBER (p,s),
          
          NVARCHAR2, VARCHAR2

          ROWID

          TIMESTAMP, TIMESTAMP WITH LOCAL TIMEZONE, TIMESTAMP WITH TIMEZONE
          
- FONTE: https://docs.oracle.com/cloud/help/pt_BR/analytics-cloud/ACSDS/GUID-33F45B17-782F-4A56-9FA9-7163A3BD79B1.htm#ACSDS-GUID-97B7A932-E1CC-4557-97E8-62142847450A


**CREATE**

          CREATE TABLE tabela_de_vendedores;

**INSERT**

          INSERT INTO tabela_de_vendedores
          (matricula,nome,percentual_comissao)
          VALUES('00233','José Geraldo da Fonseca',0.10);
          
          
- Inserindo campo do tipo DATA:

          INSERT INTO tabela_de_vendedores
          (matricula,nome,percentual_comissao, data_nascimento)
          VALUES('00233','José Geraldo da Fonseca',0.10, to_date('01/01/1993','DD/MM/YYYY'));
          OBS: O TO_DATE permite nos formatar como a data sera salva;

**UPDATE**

           update tabela_de_vendedores set
           percentual_comissao = 0.11
           where matricula = '00236';
           
**DELETE**
           
            DELETE from tb_produtos where produto = '1078680';
            
**ALTER TABLE**
               
            ALTER TABLE TB_PRODUTOS ADD CONSTRAINT PK_TB_PRODUTOS 
            PRIMARY KEY (PRODUTO); (OBS: Adiciona uma chave primária).
            
            ALTER TABLE TB_PRODUTOS ADD nome_coluna date; (OBS: adiciona uma coluna).
            
**CRIANDO UM ALIAS NO SELECT**
- Quando realizamos um SELECT, podemos dizer para o OracleDB com qual nome queremos que a coluna seja listada, isto é feito colocando o AS depois do nome do campo e após o AS dizendo como está coluna sera representada, exemplo:

          SELECT CPF AS CPF_DO_CLIENTE, NOME AS NOME_DO_CLIENTE,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,
          SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA FROM TB_CLIENTES;
           
 Neste exemplo a coluna CPF sera representada como CPF_DO_CLIENTE, assim como a coluna NOME sera representada como NOME_DO_CLIENTE.
 
 **UTILIZANDO SELECT E OPERADORES LÓGICOS :** >, <, >=, <=, <> e BETWEEN.

          SELECT * FROM tb_clientes WHERE preco_lista > 10; // operador > MAIOR QUE trás tudo que for maior que 10.
          SELECT * FROM tb_clientes WHERE preco_lista < 10; // operador < MENOR QUE trás tudo que for Menor que 10.
          SELECT * FROM tb_clientes WHERE preco_lista >= 10; // operador >= MAIOR IGUAL QUE trás tudo que for MAIOR E IGUAL a 10.
          SELECT * FROM tb_clientes WHERE preco_lista <= 10; // operador <= MENOR IGUAL QUE trás tudo que for MENOR E IGUAL que 10.
          SELECT * FROM tb_clientes WHERE preco_lista <> 10; // operador <> DIFERENTE QUE 10 trás tudo que for diferente que 10.
                
O OracleDB não consegue usar os operadores como = <> ou >=, <= para campos do tipo FLOAT, necessário utilizar o BETWEEN: select * from nome_tablea where preco_lista BETWEEN 10 AND 12; retorna os valores entre 10 e 12, assim podemos listar campos de ponto flutuante.

- Podemos utilizar os operadores lógicos vistos acima com campos do tipo data lembrando de utilizar o TO_DATE e quando necessário o TO_CHAR, para consultar datas especificas, exemplo

          SELECT * FROM tb_clientes WHERE data_nascimento = TO_DATE('01/01/1995','DD/MM/YYYY');

          SELECT * FROM tb_clientes WHERE TO_CHAR(DATA_NASCIMENTO,'MM') = 10; 
          
 Essa consulta me retornara todos os clientes que nasceram no mês 10.

            

