# Quando usar e quando não usar alguns comandos fundamentais

## GROUP BY

GROUP BY é uma cláusula importante em SQL que é usada principalmente em conjunto com funções de agregação (como COUNT, SUM, AVG, MAX, MIN) para agrupar linhas que compartilham um critério em comum.

### Quando Usar o GROUP BY:

1. Agregação de Dados:

   - Ao realizar operações de agregação (contagem, soma, média, etc.) em conjuntos de dados específicos.

2. Agrupamento por Colunas:

   - Para agrupar dados baseados em valores de uma ou mais colunas. Por exemplo, agrupar dados por categoria, ano, departamento, etc.

3. Resumir Dados Detalhados:

   - Quando você deseja resumir dados detalhados e obter informações agregadas sobre esses dados.

### Quando Não Usar o GROUP BY:

1. Uso Indevido sem Funções de Agregação:

   - Não deve ser utilizado sem funções de agregação, pois isso pode resultar em erros ou comportamentos inesperados. Por exemplo, agrupar sem usar nenhuma função de agregação pode retornar resultados indeterminados ou apenas um resultado para cada grupo.

2. Filtragem Detalhada de Dados:

   - Se você precisa de resultados detalhados e não deseja agregá-los, o GROUP BY pode não ser adequado, já que ele agrega os dados e os resume.

3. Utilização com Colunas Diferentes das Selecionadas:

   - Se você estiver selecionando colunas que não estão presentes na cláusula GROUP BY ou que não estão sendo agregadas, alguns SGBDs podem gerar erros ou retornar resultados imprevisíveis. Algumas bases de dados requerem que todas as colunas selecionadas sejam agregadas ou listadas na cláusula GROUP BY.

### Exemplo de Uso do GROUP BY:

Suponha que você tem uma tabela de vendas e deseja calcular a quantidade de vendas por categoria:

```SQL
SELECT categoria, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY categoria;
```

Neste exemplo, a cláusula GROUP BY categoria agrupa as vendas por categoria e a função SUM calcula a soma da quantidade de vendas para cada categoria.

O GROUP BY é uma ferramenta poderosa para resumir e analisar dados, mas deve ser usado com cuidado para garantir que os resultados sejam precisos e relevantes para a análise que você está realizando.

## HAVING

O comando HAVING é usado em conjunto com a cláusula GROUP BY em SQL para filtrar resultados de grupos, com base em condições de agregação. Enquanto a cláusula WHERE é usada para filtrar linhas antes do agrupamento, o HAVING é aplicado após o agrupamento de dados, permitindo filtrar grupos de resultados com base em condições de agregação.

### Quando Usar o HAVING:

1. Filtragem de Resultados Agregados:

   - É útil quando você quer filtrar grupos de resultados com base em condições de agregação, como contagem, soma, média, etc.

2. Restrição de Resultados Após o GROUP BY:

   - O HAVING é aplicado após o agrupamento (após o GROUP BY), ao contrário do WHERE, que é aplicado antes do agrupamento.

### Quando Não Usar o HAVING:

1. Sem Uso de GROUP BY:

   - O HAVING é específico para filtrar grupos após o GROUP BY, portanto, se não estiver usando o GROUP BY, não será necessário usar o HAVING.

2. Filtragem de Dados Não Agregados:

   - Não é destinado a filtrar linhas individuais, mas sim grupos de resultados. Para filtrar linhas individuais, a cláusula WHERE é mais apropriada.

### Exemplo de Uso do HAVING:

Suponha que você tenha uma tabela de vendas e deseje encontrar apenas as categorias que têm mais de 100 unidades vendidas:

```SQL
SELECT categoria, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY categoria
HAVING SUM(quantidade) > 100;
```

Neste exemplo, o HAVING SUM(quantidade) > 100 filtra os resultados do GROUP BY categoria, mostrando apenas as categorias cuja soma da quantidade de vendas é superior a 100.

O HAVING é valioso ao analisar dados agregados, permitindo que você filtre e selecione grupos específicos com base em condições de agregação após o processo de agrupamento de dados.
