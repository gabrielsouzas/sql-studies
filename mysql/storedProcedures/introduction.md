# Stored Procedures

Uma stored procedure é uma sequência de instruções SQL que podem ser armazenadas no banco de dados e executadas quando necessário. Elas são úteis para automatizar tarefas, encapsular lógica de negócios e melhorar a modularidade do código SQL. As stored procedures podem aceitar parâmetros de entrada e retornar resultados, tornando-as flexíveis e poderosas.

Aqui está um exemplo de uma stored procedure que insere um novo registro na tabela station:

```SQL
DELIMITER //
CREATE PROCEDURE InsertStation(IN cityName VARCHAR(21), IN stateName VARCHAR(2), IN latitude DECIMAL(10,0), IN longitude DECIMAL(10,0))
BEGIN
  INSERT INTO station (city, state, lat_n, long_w) VALUES (cityName, stateName, latitude, longitude);
END;
//
DELIMITER ;
```

Neste exemplo, a stored procedure InsertStation aceita quatro parâmetros de entrada: cityName, stateName, latitude e longitude. Quando a procedure é chamada com esses parâmetros, ela executa uma instrução INSERT para adicionar um novo registro à tabela station.

Aqui está como chamar essa stored procedure:

```SQL
CALL InsertStation('New City', 'NY', 40, -74);

```

Esta chamada insere um novo registro com os valores especificados na tabela station.

É necessário definir o delimitador como // antes de criar a stored procedure e restaurá-lo para ; padrão após a criação, para que o MySQL entenda corretamente a definição da procedure.
