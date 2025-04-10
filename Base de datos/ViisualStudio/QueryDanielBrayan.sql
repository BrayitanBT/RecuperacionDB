CREATE DATABASE DanielBrayan
    DEFAULT CHARACTER SET = 'utf8mb4';
    use DanielBrayan;

    /Tablas/

    CREATE TABLE Estado(
    Id_Estado INT(4) AUTO_INCREMENT PRIMARY KEY,
    Estado VARCHAR (20)
    );
    CREATE TABLE Rango_Edad(
       Id_Rango INT(4) AUTO_INCREMENT PRIMARY KEY,
        Rango_Edad VARCHAR (15)   
    );
    CREATE TABLE Encuesta(
        Id_Encuesta INT(4) AUTO_INCREMENT PRIMARY KEY,
        Tipo_Encuesta VARCHAR (25)   
    );
    CREATE TABLE EnEsRa(
        Id_EnEsRa INT(4) AUTO_INCREMENT PRIMARY KEY,
        Año INT (4),
        Cantidad INT (10),
        Fuente VARCHAR(255),
        Id_Estado INT(4),
        Id_Encuesta INT(4),
        Id_Rango INT(4)
    );

    /* Relaciones */
    /* EnEsRa-Encuesta */
    ALTER TABLE EnEsRa ADD CONSTRAINT FK_ID1 FOREIGN KEY (Id_Encuesta) REFERENCES Encuesta (Id_Encuesta);

      /* EnEsRa-Estado */
    ALTER TABLE EnEsRa ADD CONSTRAINT FK_ID2 FOREIGN KEY (Id_Estado) REFERENCES Estado (Id_Estado);

     /* EnEsRa-Rango_Edad */
    ALTER TABLE EnEsRa ADD CONSTRAINT FK_ID3 FOREIGN KEY (Id_Rango) REFERENCES Rango_Edad (Id_Rango);

    /* Consultas */

    /* Vista */
    CREATE VIEW OnlyStates AS
    SELECT Estado.Id_Estado, Estado.Estado
    FROM EnEsRa
    INNER JOIN Estado 
    ON EnEsRa.Id_Estado = Estado.Id_Estado
    INNER JOIN Encuesta
    ON EnEsRa.Id_Encuesta = Encuesta.Id_Encuesta
    INNER JOIN Rango_Edad
    ON EnEsRa.Id_Rango = Rango_Edad.Id_Rango
    GROUP BY Estado

    
    

    /* Procedimiento */
    CREATE PROCEDURE FiltrarEstado(in Estado VARCHAR(20))

    SELECT Estado.Estado, Encuesta.Tipo_Encuesta, Rango_Edad.Rango_Edad, EnEsRA.Año, EnEsRa.Cantidad, EnEsRa.Fuente
    FROM EnEsRa
    INNER JOIN Estado 
    ON EnEsRa.Id_Estado = Estado.Id_Estado
    INNER JOIN Encuesta
    ON EnEsRa.Id_Encuesta = Encuesta.Id_Encuesta
    INNER JOIN Rango_Edad
    ON EnEsRa.Id_Rango = Rango_Edad.Id_Rango
    WHERE Estado.Estado = Estado;

    Call FiltrarEstado("California")
 
    
    