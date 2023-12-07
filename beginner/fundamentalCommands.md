# Comandos Fundamentais:

Esses exemplos demonstram o uso básico de cada um dos comandos e cláusulas em **SQL**.

## Manipulação básica de dados

### CREATE TABLE (criação de tabela):

```SQL
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    email VARCHAR(100)
);
```

Neste exemplo:

    * id é uma coluna do tipo INT que serve como identificador único para cada usuário. O AUTO_INCREMENT indica que o valor será gerado automaticamente e a PRIMARY KEY define essa coluna como a chave primária da tabela;

    * nome é uma coluna do tipo VARCHAR que armazenará os nomes dos usuários com no máximo 50 caracteres;

    * idade é uma coluna do tipo INT para armazenar a idade dos usuários;

    * email é uma coluna do tipo VARCHAR que guardará os endereços de email dos usuários com no máximo 100 caracteres.

### SELECT (seleção de dados):

```SQL
-- Retorna todos os dados da tabela "usuarios"
SELECT * FROM usuarios;
```

### INSERT (inserção de dados):

```SQL
-- Insere um novo usuário na tabela "usuarios"
INSERT INTO usuarios (nome, idade, email) VALUES ('João', 30, 'joao@email.com');
```

### UPDATE (atualização de dados):

```SQL
-- Atualiza o email do usuário com ID 1 na tabela "usuarios"
UPDATE usuarios SET email = 'novo@email.com' WHERE id = 1;
```

### DELETE (exclusão de dados):

```SQL
-- Remove o usuário com ID 2 da tabela "usuarios"
DELETE FROM usuarios WHERE id = 2;
```

## Cláusulas de Filtragem, Ordenação e Agregação:

### WHERE (filtro de dados):

```SQL
-- Retorna usuários com idade maior que 25
SELECT * FROM usuarios WHERE idade > 25;
```

### ORDER BY (ordenação de resultados):

```SQL
-- Retorna os usuários ordenados por idade crescente
SELECT * FROM usuarios ORDER BY idade ASC;
```

### GROUP BY (agrupamento de dados):

```SQL
-- Retorna a contagem de usuários por idade
SELECT idade, COUNT(*) as qtd_usuarios FROM usuarios GROUP BY idade;
```

### HAVING (filtro para resultados de agregação):

```SQL
-- Retorna idades com mais de 2 usuários
SELECT idade, COUNT(*) as qtd_usuarios FROM usuarios GROUP BY idade HAVING COUNT(*) > 2;
```

## Funções Básicas:

### COUNT (contagem de registros):

```SQL
-- Retorna o número de usuários na tabela "usuarios"
SELECT COUNT(*) as total_usuarios FROM usuarios;
```

### SUM (soma de valores):

```SQL
-- Retorna a soma das idades dos usuários
SELECT SUM(idade) as soma_idades FROM usuarios;
```

### AVG (média de valores):

```SQL
-- Retorna a média das idades dos usuários
SELECT AVG(idade) as media_idades FROM usuarios;
```

### MAX (valor máximo):

```SQL
-- Retorna a maior idade entre os usuários
SELECT MAX(idade) as idade_maxima FROM usuarios;
```

### MIN (valor mínimo):

```SQL
-- Retorna a menor idade entre os usuários
SELECT MIN(idade) as idade_minima FROM usuarios;
```
