# Pivot

O pivot é uma consulta complexa que visa realizar uma operação conhecida como "pivotamento" ou "transposição" de dados, transformando linhas em colunas.

### Tabela usada como exemplo

```SQL
CREATE TABLE
    `occupation` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(90) NOT NULL,
        `occupation` VARCHAR(90) NOT NULL,
        PRIMARY KEY (`id`)
    );
```

### 1. Subconsulta Interna para Atribuir Números de Linha por Ocupação:

```SQL
SELECT
    Occupation,
    Name,
    ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS NameOrder
FROM Occupations
```

Esta parte da consulta original gera uma lista de ocupações (Occupation) e nomes (Name) da tabela Occupations, atribuindo um número de linha (NameOrder) para cada nome dentro de uma ocupação, ordenado alfabeticamente pelo nome.

### 2. Subconsulta para Pivotar os Dados:

```SQL
SELECT
    NameOrder,
    MAX(CASE Occupation WHEN 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE Occupation WHEN 'Professor' THEN Name END) AS Professor,
    MAX(CASE Occupation WHEN 'Singer' THEN Name END) AS Singer,
    MAX(CASE Occupation WHEN 'Actor' THEN Name END) AS Actor
FROM (
    -- Subconsulta Interna de Atribuição de Números de Linha
    SELECT
        Occupation,
        Name,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS NameOrder
    FROM Occupations
) AS NameLists
GROUP BY NameOrder
```

Aqui, a subconsulta interna (a mesma usada anteriormente) é aninhada dentro de outra subconsulta. Essa camada adicional visa realizar o pivoteamento dos dados.

```SQL
MAX(CASE Occupation WHEN 'Doctor' THEN Name END) AS Doctor
```

Esta linha usa a função MAX em conjunto com CASE para criar colunas separadas (Doctor, Professor, Singer, Actor) onde os nomes são agrupados de acordo com a ocupação.

O MAX é usado apenas para selecionar o nome correspondente à ocupação específica, enquanto os outros nomes serão NULL.

```SQL
GROUP BY NameOrder:
```

Isso agrupa os resultados pelo número de linha (NameOrder), o que significa que cada número de linha gerará uma linha no resultado final.

### 3. Seleção das Colunas Pivoteadas:

```SQL
SELECT
    Doctor,
    Professor,
    Singer,
    Actor
FROM (
    -- Subconsulta para Pivotar os Dados
    SELECT
        NameOrder,
        MAX(CASE Occupation WHEN 'Doctor' THEN Name END) AS Doctor,
        MAX(CASE Occupation WHEN 'Professor' THEN Name END) AS Professor,
        MAX(CASE Occupation WHEN 'Singer' THEN Name END) AS Singer,
        MAX(CASE Occupation WHEN 'Actor' THEN Name END) AS Actor
    FROM (
        -- Subconsulta Interna de Atribuição de Números de Linha
        SELECT
            Occupation,
            Name,
            ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS NameOrder
        FROM Occupations
    ) AS NameLists
    GROUP BY NameOrder
) AS Names
```

Nesta última parte do código, a seleção final é feita. Ela extrai os resultados da subconsulta que pivoteou os dados para transformar as linhas em colunas.

Aqui, você obtém as colunas Doctor, Professor, Singer e Actor, cada uma contendo o nome correspondente à ocupação específica.

Este tipo de consulta é útil para reorganizar os dados de uma forma que facilite a leitura ou a análise, transformando informações de várias linhas em uma visualização mais condensada com os dados agrupados em colunas por critérios específicos.
