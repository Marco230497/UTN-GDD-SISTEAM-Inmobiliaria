USE [GD2C2023]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------
-----------------------------------DROP DE TABLES------------------------------------------------
-------------------------------------------------------------------------------------------------
IF OBJECT_ID('BI_SYSTEAM.BI_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.BI_TIPO_OPERACION', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIPO_OPERACION
GO

IF OBJECT_ID('BI_SYSTEAM.BI_RANGO_M2', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_RANGO_M2
GO

IF OBJECT_ID('BI_SYSTEAM.BI_TIPO_INMUEBLE', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIPO_INMUEBLE
GO

IF OBJECT_ID('BI_SYSTEAM.BI_UBICACION', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_UBICACION
GO

IF OBJECT_ID('BI_SYSTEAM.BI_FACT_ANUNCIO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
GO

IF OBJECT_ID('BI_SYSTEAM.BI_RANGO_ETARIO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_RANGO_ETARIO
GO

IF OBJECT_ID('BI_SYSTEAM.BI_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.BI_TIPO_MONEDA', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIPO_MONEDA
GO

IF OBJECT_ID('BI_SYSTEAM.BI_FACT_ANUNCIO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
GO

IF OBJECT_ID('BI_SYSTEAM.BI_SUCURSAL', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_SUCURSAL
GO

IF OBJECT_ID('BI_SYSTEAM.BI_FACT_VENTA', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_FACT_VENTA
GO

IF OBJECT_ID('BI_SYSTEAM.BI_FACT_ALQUILER', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_FACT_ALQUILER
GO


IF OBJECT_ID('BI_SYSTEAM.BI_AMBIENTES', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_AMBIENTES
GO

-------------------------------------------------------------------------------------------------
-----------------------------------DROP DE PROCEDURES--------------------------------------------
-------------------------------------------------------------------------------------------------

IF OBJECT_ID('BI_SYSTEAM.CARGAR_BI_TIEMPO') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_BI_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.CARGAR_DIM_TIPO_OPERACION') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_TIPO_OPERACION
GO

IF OBJECT_ID('BI_SYSTEAM.CARGAR_DIM_RANGO_M2') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_RANGO_M2
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_INMUEBLE') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_INMUEBLE
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_UBICACION') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_UBICACION
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_AMBIENTES') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_AMBIENTES
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_RANGO_ETARIO') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_RANGO_ETARIO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_TIEMPO') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_TIEMPO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_TIPO_MONEDA') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_TIPO_MONEDA
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_FACT_ANUNCIO') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_FACT_ANUNCIO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_DIM_SUCURSAL') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_DIM_SUCURSAL
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_FACT_VENTA') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_FACT_VENTA
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_FACT_ALQUILER') IS NOT NULL
	DROP PROCEDURE SYSTEAM.CARGAR_FACT_ALQUILER
GO

-------------------------------------------------------------------------------------------------
-----------------------------------DROP DE FUNCTIONS---------------------------------------------
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
-----------------------------------DROP DE VIEWS-------------------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
--------------------------------------------SCHEMA-----------------------------------------------
-------------------------------------------------------------------------------------------------

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'BI_SYSTEAM')
	DROP SCHEMA BI_SYSTEAM
GO

CREATE SCHEMA BI_SYSTEAM
GO

-------------------------------------------------------------------------------------------------
----------------------------------------CREATE TABLES--------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE TABLE BI_SYSTEAM.BI_TIEMPO (
    ID_TIEMPO NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    TIEMPO_ANIO INT,
    TIEMPO_CUATRIMESTRE INT,
    TIEMPO_MES INT,
	TIEMPO_DIA INT
);

CREATE TABLE BI_SYSTEAM.BI_UBICACION (
    ID_UBICACION NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    PROVINCIA NVARCHAR(255),
    LOCALIDAD NVARCHAR(255),
    BARRIO NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_SUCURSAL (
    ID_SUCURSAL NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    SUCURSAL_NOMBRE NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_RANGO_ETARIO (
    ID_RANGO_ETARIO NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    RANGO_ETARIO_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_TIPO_INMUEBLE (
    ID_TIPO_INMUEBLE NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    TIPO_INMUEBLE_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_AMBIENTES (
    ID_AMBIENTES NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    AMBIENTES_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_RANGO_M2 (
    ID_RANGO_M2 NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    RANGO_M2_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_TIPO_OPERACION (
    ID_TIPO_OPERACION NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    TIPO_OPERACION_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE BI_SYSTEAM.BI_TIPO_MONEDA (
    ID_TIPO_MONEDA NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
    TIPO_MONEDA_DESCRIPCION NVARCHAR(255)
);


CREATE TABLE BI_SYSTEAM.BI_FACT_ANUNCIO (
	ID_TIPO_INMUEBLE NUMERIC(18,0),
	ID_RANGO_M2 NUMERIC(18,0),
    ID_TIEMPO NUMERIC(18,0),
    ID_TIPO_OPERACION NUMERIC(18,0),
	ID_AMBIENTES NUMERIC(18,0),
	ID_SUCURSAL NUMERIC(18,0),
	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
	ID_RANGO_ETARIO NUMERIC(18,0),
	ID_AGENTE NUMERIC(18,0),
	ANUNCIO_FECHA_PUBLICACION NUMERIC(18,0),
    ANUNCIO_FECHA_FINALIZACION NUMERIC(18,0),
	ANUNCIO_ESTADO NVARCHAR(100),
	ANUNCIO_DIAS_PUBLICADO INT,
	ANUNCIO_PRECIO INT
	
	PRIMARY KEY(
	ID_SUCURSAL,
	ID_RANGO_ETARIO,
	ID_TIPO_INMUEBLE,
	ID_TIPO_OPERACION,
	ID_TIPO_MONEDA,
	ID_AMBIENTES,
	ID_RANGO_M2,
	ID_UBICACION,
	ID_AGENTE
	)
);

CREATE TABLE BI_SYSTEAM.BI_FACT_VENTA (
	ID_TIPO_INMUEBLE NUMERIC(18,0),
	ID_RANGO_M2 NUMERIC(18,0),
    ID_TIEMPO_FECHA NUMERIC(18,0),
	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
    PRECIO_VENTA NUMERIC(18,0),
	COMISION DECIMAL(18, 2)
	PRIMARY KEY(
	ID_TIEMPO_FECHA,
	ID_UBICACION,
	ID_TIPO_INMUEBLE,
	ID_TIPO_MONEDA,
	ID_RANGO_M2
	)
);

CREATE TABLE BI_SYSTEAM.BI_FACT_ALQUILER (
    ID_TIEMPO_FECHA_INICIO NUMERIC(18,0),
    ID_TIEMPO_FECHA_FIN NUMERIC(18,0),
	ID_TIEMPO_FECHA_PAGO NUMERIC(18,0),
	ID_TIEMPO_FECHA_VENCIMIENTO NUMERIC(18,0),
	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
	ID_RANGO_ETARIO NUMERIC(18,0),
    ALQUILER_MONTO_ANTERIOR INT,
	ALQUILER_MONTO_PAGADO INT,
	ALQUILER_PRECIO INT,
	ALQUILER_CUMPLIMIENTO INT
	
	PRIMARY KEY(
	ID_TIEMPO_FECHA_INICIO,
	ID_TIEMPO_FECHA_FIN,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ID_TIPO_MONEDA
	)
);
GO


-------------------
------- FKs -------
-------------------

--FK DE TABLA ANUNCIO

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_INMUEBLE_BI
    FOREIGN KEY (ID_TIPO_INMUEBLE) 
    REFERENCES BI_SYSTEAM.BI_TIPO_INMUEBLE(ID_TIPO_INMUEBLE);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_RANGO_M2_BI
    FOREIGN KEY (ID_RANGO_M2) 
    REFERENCES BI_SYSTEAM.BI_RANGO_M2(ID_RANGO_M2);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIEMPO_FECHA_PUBLICACION_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PUBLICACION) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIEMPO_FECHA_FINALIZACION_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_FINALIZACION) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_OPERACION_BI
    FOREIGN KEY (ID_TIPO_OPERACION) 
    REFERENCES BI_SYSTEAM.BI_TIPO_OPERACION(ID_TIPO_OPERACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_AMBIENTES_BI
    FOREIGN KEY (ID_AMBIENTES) 
    REFERENCES BI_SYSTEAM.BI_AMBIENTES(ID_AMBIENTES);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_SUCURSAL_BI
    FOREIGN KEY (ID_SUCURSAL) 
    REFERENCES BI_SYSTEAM.BI_SUCURSAL(ID_SUCURSAL);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_MONEDA_BI
    FOREIGN KEY (ID_TIPO_MONEDA) 
    REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA(ID_TIPO_MONEDA);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_UBICACION_BI
    FOREIGN KEY (ID_UBICACION) 
    REFERENCES BI_SYSTEAM.BI_UBICACION(ID_UBICACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_RANGO_ETARIO_BI
    FOREIGN KEY (ID_RANGO_ETARIO) 
    REFERENCES BI_SYSTEAM.BI_RANGO_ETARIO(ID_RANGO_ETARIO);


-- FK TABLA VENTA


ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_TIPO_INMUEBLE_VENTA_BI
    FOREIGN KEY (ID_TIPO_INMUEBLE) 
    REFERENCES BI_SYSTEAM.BI_TIPO_INMUEBLE(ID_TIPO_INMUEBLE);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_RANGO_M2_VENTA_BI
    FOREIGN KEY (ID_RANGO_M2) 
    REFERENCES BI_SYSTEAM.BI_RANGO_M2(ID_RANGO_M2);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_TIEMPO_FECHA_VENTA_BI
    FOREIGN KEY (ID_TIEMPO_FECHA) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_TIPO_MONEDA_VENTA_BI
    FOREIGN KEY (ID_TIPO_MONEDA) 
    REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA(ID_TIPO_MONEDA);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_UBICACION_VENTA_BI
    FOREIGN KEY (ID_UBICACION) 
    REFERENCES BI_SYSTEAM.BI_UBICACION(ID_UBICACION);


-- FK TABLA ALQUILER


ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_INICIO_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_INICIO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_FIN_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_FIN) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_PAGO_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PAGO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_VENCIMIENTO_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_VENCIMIENTO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIPO_MONEDA_ALQUILER_BI
    FOREIGN KEY (ID_TIPO_MONEDA) 
    REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA(ID_TIPO_MONEDA);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_UBICACION_ALQUILER_BI
    FOREIGN KEY (ID_UBICACION) 
    REFERENCES BI_SYSTEAM.BI_UBICACION(ID_UBICACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_RANGO_ETARIO_ALQUILER_BI
    FOREIGN KEY (ID_RANGO_ETARIO) 
    REFERENCES BI_SYSTEAM.BI_RANGO_ETARIO(ID_RANGO_ETARIO);


GO




-------------------
--- FUNCIONES ----
-------------------


CREATE FUNCTION BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_EMPLEADO(@EMPLEADO INT)
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_EMPLEADO INT
	SET @FECHA_NACIMIENTO = (SELECT AGENTE_FECHA_NAC
							FROM SYSTEAM.AGENTE
							WHERE AGENTE_CODIGO = @EMPLEADO)
	SET @EDAD = YEAR(GETDATE()) - YEAR(@FECHA_NACIMIENTO)

	IF @EDAD < 25
		SET @ID_RANGO_ETARIO_EMPLEADO = 1
	ELSE IF @EDAD BETWEEN  25 AND 35
		SET @ID_RANGO_ETARIO_EMPLEADO = 2
	ELSE IF @EDAD BETWEEN 35 AND 50
		SET @ID_RANGO_ETARIO_EMPLEADO = 3
	ELSE IF @EDAD > 50
		SET @ID_RANGO_ETARIO_EMPLEADO = 4

RETURN @ID_RANGO_ETARIO_EMPLEADO
END
GO



CREATE FUNCTION BI_SYSTEAM.FX_CALCULAR_RANGO_METROS(@INMUEBLE INT)
RETURNS INT
BEGIN
	DECLARE @SUPERFICIE numeric(18, 2)
	DECLARE @ID_RANGO_METROS INT

	SET @SUPERFICIE = (SELECT i.INMUEBLE_SUPERFICIETOTAL
					   FROM SYSTEAM.INMUEBLE i
					   WHERE i.INMUEBLE_CODIGO = @INMUEBLE)

	IF @SUPERFICIE < 35
		SET @ID_RANGO_METROS = 1
	ELSE IF @SUPERFICIE BETWEEN 35 AND 55
		SET @ID_RANGO_METROS = 2
	ELSE IF @SUPERFICIE BETWEEN 55 AND 75
		SET @ID_RANGO_METROS = 3
	ELSE IF @SUPERFICIE BETWEEN 75 AND 100
		SET @ID_RANGO_METROS = 4
	ELSE IF @SUPERFICIE > 100
		SET @ID_RANGO_METROS = 5

RETURN @ID_RANGO_METROS
END
GO

-------------------
--- PROCEDURES ----
-------------------

CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_FACT_ANUNCIO
AS
BEGIN
INSERT INTO BI_SYSTEAM.BI_FACT_ANUNCIO(
	ID_TIPO_INMUEBLE,
	ID_RANGO_M2,
	ID_TIEMPO,
	ID_TIPO_OPERACION,
	ID_AMBIENTES,
	ID_SUCURSAL,
	ID_TIPO_MONEDA,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ID_AGENTE,
	ANUNCIO_FECHA_PUBLICACION,
    ANUNCIO_FECHA_FINALIZACION,
	ANUNCIO_ESTADO,
	ANUNCIO_DIAS_PUBLICADO,
	ANUNCIO_PRECIO

)
SELECT DISTINCT
   bti.INMUEBLE_TIPO_CODIGO , --TIPO INMUEBLES
   rm.ID_RANGO_M2, --RANGO METROS CUADRADOS
   t.ID_TIEMPO, -- TIEMPO
   tiop.ID_TIPO_OPERACION, --TIPO OPERACION
   amb.INMUEBLE_CANT_AMBIENTES_CODIGO,   -- AMBIENTES
   bs.SUCURSAL_CODIGO , --SUCURSALES
   tm.ID_TIPO_MONEDA, --TIPO MONEDA
   bb.BARRIO_CODIGO , --BARRIO
   re.ID_RANGO_ETARIO, --RANGO ETARIO EMPLEADO
   AG.AGENTE_CODIGO, -- AGENTE 
   a.ANUNCIO_FECHA_PUBLICACION, -- FECHA PUBLICACION
   a.ANUNCIO_FECHA_FINALIZACION,-- FECHA FINALIZACION
   a.ANUNCIO_ESTADO,-- ESTADO
   AVG(DATEDIFF(DAY, a.ANUNCIO_FECHA_PUBLICACION, a.ANUNCIO_FECHA_FINALIZACION )), -- DIAS PUBLICADO
   a.ANUNCIO_PRECIO_PUBLICADO -- PRECIO
   
FROM SYSTEAM.ANUNCIO a
JOIN SYSTEAM.INMUEBLE i ON i.INMUEBLE_CODIGO = a.ANUNCIO_CODIGO
JOIN SYSTEAM.BARRIO bb ON bb.BARRIO_CODIGO =  i.BARRIO_CODIGO
JOIN SYSTEAM.INMUEBLE_CANT_AMBIENTES amb ON amb.INMUEBLE_CANT_AMBIENTES_CODIGO = i.INMUEBLE_CANT_AMBIENTES_CODIGO
JOIN SYSTEAM.INMUEBLE_TIPO bti ON bti.INMUEBLE_TIPO_CODIGO = i.INMUEBLE_TIPO_CODIGO
JOIN SYSTEAM.AGENTE ag ON ag.AGENTE_CODIGO = a.AGENTE_CODIGO
JOIN SYSTEAM.SUCURSAL bs ON bs.SUCURSAL_CODIGO = ag.SUCURSAL_CODIGO
JOIN BI_SYSTEAM.BI_TIEMPO t ON t.TIEMPO_ANIO = DATEPART(YEAR,a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_MES = DATEPART(MONTH, a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.ANUNCIO_FECHA_PUBLICACION)
JOIN BI_SYSTEAM.BI_TIPO_OPERACION tiop ON tiop.ID_TIPO_OPERACION = a.TIPO_ANUNCIO_CODIGO
JOIN BI_SYSTEAM.BI_RANGO_ETARIO re ON re.ID_RANGO_ETARIO = BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_EMPLEADO(a.AGENTE_CODIGO)
JOIN BI_SYSTEAM.BI_RANGO_M2 rm ON rm.ID_RANGO_M2= BI_SYSTEAM.FX_CALCULAR_RANGO_METROS(a.INMUEBLE_CODIGO)
JOIN BI_SYSTEAM.BI_TIPO_MONEDA tm ON tm.ID_TIPO_MONEDA = a.MONEDA_CODIGO

	
END 
GO

CREATE PROCEDURE SYSTEAM.BI_CARGAR_FACT_ALQUILER
AS
BEGIN
INSERT INTO SYSTEAM.BI_FACT_ALQUILER(
	ID_TIEMPO_FECHA_INICIO,
	ID_TIEMPO_FECHA_FIN,
	ID_TIEMPO_FECHA_PAGO,
	ID_TIEMPO_FECHA_VENCIMIENTO,
	ID_TIPO_MONEDA,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ALQUILER_MONTO_ANTERIOR,
	ALQUILER_CUMPLIMIENTO,
	ALQUILER_MONTO_PAGADO,
	ALQUILER_PRECIO
)
SELECT DISTINCT
	t.ID_TIEMPO,
	tm.ID_TIPO_MONEDA, 
	u.ID_UBICACION
	re.ID_RANGO_ETARIO,
	a.ALQUILER_MONTO_ANTERIOR
	a.ALQUILER_MONTO_CUMPLIMIENTO
	a.ALQUILER_MONTO_PAGADO
	a.ALQUILER_PRECIO	
FROM SYSTEAM.ALQUILER a
JOIN SYSTEAM.pagos_por_alquiler ppa ON ppa.PAGO_INQUILINO_CODIGO = a.ALQUILER_INQUILINO_CODIGO
JOIN BI_SYSTEAM.BI_RANGO_ETARIO re ON re.ID_RANGO_ETARIO = BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_EMPLEADO(a.AGENTE_CODIGO)
JOIN BI_SYSTEAM.BI_TIEMPO t ON t.TIEMPO_ANIO = DATEPART(YEAR,a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_MES = DATEPART(MONTH, a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.ANUNCIO_FECHA_PUBLICACION)
JOIN BI_SYSTEAM.BI_TIPO_MONEDA tm ON tm.ID_TIPO_MONEDA = a.MONEDA_CODIGO
END
GO

--COMANDO ELIMINAR FKS DE BI_SYSTEAM

/*
DECLARE @sql NVARCHAR(MAX);

-- Verificar si el esquema "BI_SYSTEAM" existe
IF EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'BI_SYSTEAM'
)
BEGIN
    -- Verificar si existen tablas en el esquema "BI_SYSTEAM"
    IF EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES t
        INNER JOIN sys.schemas s ON t.TABLE_SCHEMA = s.name
        WHERE s.name = 'BI_SYSTEAM'
    )
    BEGIN
        -- Verificar si existen restricciones de clave externa en el esquema "BI_SYSTEAM"
        IF EXISTS (
            SELECT 1
            FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS c
            INNER JOIN INFORMATION_SCHEMA.TABLES t ON c.TABLE_NAME = t.TABLE_NAME
            INNER JOIN sys.schemas s ON t.TABLE_SCHEMA = s.name
            WHERE c.CONSTRAINT_TYPE = 'FOREIGN KEY' AND s.name = 'BI_SYSTEAM'
        )
        BEGIN
            -- Generar comandos para eliminar restricciones de clave externa en el esquema "BI_SYSTEAM"
            SELECT @sql = COALESCE(@sql, '') + 'ALTER TABLE ' + s.name + '.' + t.TABLE_NAME + ' DROP CONSTRAINT ' + c.CONSTRAINT_NAME + ';
            '
            FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS c
            INNER JOIN INFORMATION_SCHEMA.TABLES t ON c.TABLE_NAME = t.TABLE_NAME
            INNER JOIN sys.schemas s ON t.TABLE_SCHEMA = s.name
            WHERE c.CONSTRAINT_TYPE = 'FOREIGN KEY' AND s.name = 'BI_SYSTEAM';

            -- Ejecutar los comandos para eliminar las restricciones
            EXEC sp_executesql @sql;
        END
        ELSE
        BEGIN
            PRINT 'No existen restricciones de clave externa en el esquema "BI_SYSTEAM".';
        END
    END
    ELSE
    BEGIN
        PRINT 'No hay tablas en el esquema "BI_SYSTEAM".';
    END
END
ELSE
BEGIN
    PRINT 'El esquema "BI_SYSTEAM" no existe.';
END


*/




--COMANDO ELIMINAR TODAS LAS TABLAS DE BI_SYSTEAM

/*
USE GD2C2023;

DECLARE @TableName NVARCHAR(MAX);
DECLARE cursor_tables CURSOR FOR
    SELECT TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'BI_SYSTEAM' AND TABLE_TYPE = 'BASE TABLE';

OPEN cursor_tables;
FETCH NEXT FROM cursor_tables INTO @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @DropTableCommand NVARCHAR(MAX);
    SET @DropTableCommand = 'DROP TABLE BI_SYSTEAM.' + @TableName;

    EXEC sp_executesql @DropTableCommand;

    FETCH NEXT FROM cursor_tables INTO @TableName;
END

CLOSE cursor_tables;
DEALLOCATE cursor_tables;
*/
