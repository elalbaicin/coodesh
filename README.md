# DBA Challenge 20240802


## Introdução

Nesse desafio trabalharemos utilizando a base de dados da empresa Bike Stores Inc com o objetivo de obter métricas relevantes para equipe de Marketing e Comercial.

Com isso, teremos que trabalhar com várioas consultas utilizando conceitos como `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `GROUP BY` e `COUNT`.

### Antes de começar
 
- O projeto deve utilizar a Linguagem específica na avaliação. Por exempo: SQL, T-SQL, PL/SQL e PSQL;
- Considere como deadline da avaliação a partir do início do teste. Caso tenha sido convidado a realizar o teste e não seja possível concluir dentro deste período, avise a pessoa que o convidou para receber instruções sobre o que fazer.
- Documentar todo o processo de investigação para o desenvolvimento da atividade (README.md no seu repositório); os resultados destas tarefas são tão importantes do que o seu processo de pensamento e decisões à medida que as completa, por isso tente documentar e apresentar os seus hipóteses e decisões na medida do possível.

## O projeto

- Criar as consultas utilizando a linguagem escolhida;
- Entregar o código gerado do Teste.

### Modelo de Dados:

Para entender o modelo, revisar o diagrama a seguir:

![<img src="samples/model.png" height="500" alt="Modelo" title="Modelo"/>](samples/model.png)


## Selects

Construir as seguintes consultas:

- Listar todos Clientes que não tenham realizado uma compra;
- Listar os Produtos que não tenham sido comprados
- Listar os Produtos sem Estoque;
- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
- Listar os Funcionarios que não estejam relacionados a um Pedido.


## Readme do Repositório

- Deve conter o título do projeto
- Uma descrição sobre o projeto em frase
- Deve conter uma lista com linguagem, framework e/ou tecnologias usadas
- Como instalar e usar o projeto (instruções)
- Não esqueça o [.gitignore](https://www.toptal.com/developers/gitignore)
- Se está usando github pessoal, referencie que é um challenge by coodesh:  

>  This is a challenge by [Coodesh](https://coodesh.com/)

## Finalização e Instruções para a Apresentação

1. Adicione o link do repositório com a sua solução no teste
2. Verifique se o Readme está bom e faça o commit final em seu repositório;
3. Envie e aguarde as instruções para seguir. Sucesso e boa sorte. =)

## Projeto Bike Store Inc

Este projeto contém as consultas solicitadas no enunciado. Encontram-se no arquivo **queries.sql** e foram redigidas com **SQL**.

>  This is a challenge by [Coodesh](https://coodesh.com/)

### Raciocínio

1) Listar todos Clientes que não tenham realizado uma compra;

Basta arrolar os clientes em _customers_ que não tenham correspondência em _orders_ com uma _subquery_ dentro da cláusula **WHERE**.

2) Listar os Produtos que não tenham sido comprados;

À semelhança do exercício anterior, o objetivo é reter os registros em _products_ que não constem de _order_items_.

3) Listar os Produtos sem Estoque;

A ideia aqui consiste em identificar quais produtos têm quantidade zero na tabela _stocks_ e usar a lista de IDs para filtrar a tabela _products_.

4) Agrupar a quantidade de vendas que uma determinada Marca por Loja;

Por "quantidade de vendas", entende-se "quantidade de pedidos".

É preciso juntar _brands_ a _stores_, mas não se pode fazê-lo diretamente.

O caminho é juntar _brands_ a _products_ para encontrar a relação de marcas (_brand_name_) e produtos (_product_id_);
em seguida, pode-se juntar o resultado a _order_items_, de modo que se encontra a relação entre marca e pedido (_order_id_);
o próximo passo é unir os resultados anteriores a _orders_ de modo a identificar a relação entre marca e loja (_store_id_);
a etapa seguinte consiste em juntar o resultado à tabela _stores_ para relacionar _store_name_ a _brand_name_;
por fim, contam-se as transações únicas em cada par loja-marca.

5) Listar os Funcionarios que não estejam relacionados a um Pedido.

Este exercício se assemelha ao primeiro; assim, devem-se identificar _staff_id_ que aparecem em _orders_ e removê-los com um filtro de _staffs_.
