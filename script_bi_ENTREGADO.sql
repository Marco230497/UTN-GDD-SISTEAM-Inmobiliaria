USE [GD2C2023]
GO
/*
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
*/
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
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.CARGAR_BI_TIPO_OPERACION') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_OPERACION
GO

IF OBJECT_ID('BI_SYSTEAM.CARGAR_BI_RANGO_M2') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_RANGO_M2
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_TIPO_INMUEBLE') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_INMUEBLE
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_UBICACION') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_UBICACION
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_AMBIENTES') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_AMBIENTES
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_RANGO_ETARIO') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_RANGO_ETARIO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_TIEMPO') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_TIEMPO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_TIPO_MONEDA') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_MONEDA
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_FACT_ANUNCIO') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_FACT_ANUNCIO
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_SUCURSAL') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_SUCURSAL
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_BI_FACT_VENTA') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_BI_FACT_VENTA
GO

IF OBJECT_ID ('BI_SYSTEAM.CARGAR_FACT_ALQUILER') IS NOT NULL
	DROP PROCEDURE BI_SYSTEAM.CARGAR_FACT_ALQUILER
GO

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
    RANGO_ETARIO_DESCRIPCION NVARCHAR(255),
	RANGO_ETARIO_MENOR INT,
	RANGO_ETARIO_MAYOR INT
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
    RANGO_M2_DESCRIPCION NVARCHAR(255),
	METROS2_MINIMO INT,
	METROS2_MAXIMO INT
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
    ID_TIPO_OPERACION NUMERIC(18,0),
	ID_AMBIENTES NUMERIC(18,0),
	ID_SUCURSAL NUMERIC(18,0),
	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
	ID_RANGO_ETARIO NUMERIC(18,0),
	ID_AGENTE NUMERIC(18,0),
	ID_TIEMPO_FECHA_PUBLICACION NUMERIC(18,0),
    ID_TIEMPO_FECHA_FINALIZACION NUMERIC(18,0),
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
	ID_AGENTE,
	ID_TIEMPO_FECHA_PUBLICACION,
    ID_TIEMPO_FECHA_FINALIZACION)
);

CREATE TABLE BI_SYSTEAM.BI_FACT_VENTA (
	ID_AMBIENTES NUMERIC(18,0),
	ID_TIPO_OPERACION NUMERIC(18,0),
	ID_TIPO_INMUEBLE NUMERIC(18,0),
	ID_RANGO_M2 NUMERIC(18,0),
    ID_TIEMPO_FECHA NUMERIC(18,0),
	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_SUCURSAL NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
    PRECIO_VENTA NUMERIC(18,0),
	COMISION DECIMAL(18, 2)
	PRIMARY KEY(
	ID_AMBIENTES,
	ID_TIPO_OPERACION,
	ID_TIEMPO_FECHA,
	ID_UBICACION,
	ID_TIPO_INMUEBLE,
	ID_TIPO_MONEDA,
	ID_SUCURSAL,
	ID_RANGO_M2
	)
);

CREATE TABLE BI_SYSTEAM.BI_FACT_ALQUILER (
    ID_TIEMPO_FECHA_INICIO NUMERIC(18,0),
    ID_TIEMPO_FECHA_FIN NUMERIC(18,0),
	ID_TIEMPO_FECHA_PAGO NUMERIC(18,0),
	ID_TIEMPO_FECHA_PERIODO_INICIO NUMERIC(18,0),
	ID_TIEMPO_FECHA_PERIODO_FIN NUMERIC(18,0),
	ID_TIPO_OPERACION NUMERIC(18,0),

	ID_TIPO_MONEDA NUMERIC(18,0),
	ID_UBICACION NUMERIC(18,0),
	ID_RANGO_ETARIO NUMERIC(18,0),
	ID_SUCURSAL NUMERIC(18,0),

	ALQUILER_PRECIO INT,
	ALQUILER_CUMPLIMIENTO INT,
	ALQUILER_COMISION DECIMAL(18, 2)
	
	PRIMARY KEY(
	ID_TIEMPO_FECHA_INICIO,
	ID_TIEMPO_FECHA_FIN,
	ID_TIPO_OPERACION,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ID_SUCURSAL,
	ID_TIPO_MONEDA,
	ID_TIEMPO_FECHA_PAGO, 
	ID_TIEMPO_FECHA_PERIODO_INICIO,
	ID_TIEMPO_FECHA_PERIODO_FIN
	)
);
GO


-------------------
------- FKs -------
-------------------

--FK DE TABLA ANUNCIO

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_INMUEBLE_ANUNCIO_BI
    FOREIGN KEY (ID_TIPO_INMUEBLE) 
    REFERENCES BI_SYSTEAM.BI_TIPO_INMUEBLE(ID_TIPO_INMUEBLE);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_RANGO_M2_ANUNCIO_BI
    FOREIGN KEY (ID_RANGO_M2) 
    REFERENCES BI_SYSTEAM.BI_RANGO_M2(ID_RANGO_M2);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIEMPO_FECHA_PUBLICACION_ANUNCIO_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PUBLICACION) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIEMPO_FECHA_FINALIZACION_ANUNCIO_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_FINALIZACION) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_OPERACION_ANUNCIO_BI
    FOREIGN KEY (ID_TIPO_OPERACION) 
    REFERENCES BI_SYSTEAM.BI_TIPO_OPERACION(ID_TIPO_OPERACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_AMBIENTES_ANUNCIO_BI
    FOREIGN KEY (ID_AMBIENTES) 
    REFERENCES BI_SYSTEAM.BI_AMBIENTES(ID_AMBIENTES);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_SUCURSAL_ANUNCIO_BI
    FOREIGN KEY (ID_SUCURSAL) 
    REFERENCES BI_SYSTEAM.BI_SUCURSAL(ID_SUCURSAL);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_TIPO_MONEDA_ANUNCIO_BI
    FOREIGN KEY (ID_TIPO_MONEDA) 
    REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA(ID_TIPO_MONEDA);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_UBICACION_ANUNCIO_BI
    FOREIGN KEY (ID_UBICACION) 
    REFERENCES BI_SYSTEAM.BI_UBICACION(ID_UBICACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_RANGO_ETARIO_ANUNCIO_BI
    FOREIGN KEY (ID_RANGO_ETARIO) 
    REFERENCES BI_SYSTEAM.BI_RANGO_ETARIO(ID_RANGO_ETARIO);
/*
ALTER TABLE BI_SYSTEAM.BI_FACT_ANUNCIO
ADD CONSTRAINT FK_AGENTE_ANUNCIO_BI
    FOREIGN KEY (ID_AGENTE) 
    REFERENCES BI_SYSTEAM.BI_AGENTE(ID_AGENTE);
*/




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

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_AMBIENTES_VENTA_BI
    FOREIGN KEY (ID_AMBIENTES) 
    REFERENCES BI_SYSTEAM.BI_AMBIENTES(ID_AMBIENTES);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_TIPO_OPERACION_VENTA_BI
    FOREIGN KEY (ID_TIPO_OPERACION) 
    REFERENCES BI_SYSTEAM.BI_TIPO_OPERACION(ID_TIPO_OPERACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_VENTA
ADD CONSTRAINT FK_SUCURSAL_VENTA_BI
    FOREIGN KEY (ID_SUCURSAL) 
    REFERENCES BI_SYSTEAM.BI_SUCURSAL(ID_SUCURSAL);




-- FK TABLA ALQUILER




ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_INICIO_ALQUILER_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_INICIO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_FIN_ALQUILER_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_FIN) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);
--
ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_PAGO_ALQUILER_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PAGO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_PERIODO_INICIO_ALQUILER_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PERIODO_INICIO) 
    REFERENCES BI_SYSTEAM.BI_TIEMPO(ID_TIEMPO);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIEMPO_FECHA_PERIODO_FIN_ALQUILER_BI
    FOREIGN KEY (ID_TIEMPO_FECHA_PERIODO_FIN) 
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

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_TIPO_OPERACION_ALQUILER_BI
    FOREIGN KEY (ID_TIPO_OPERACION) 
    REFERENCES BI_SYSTEAM.BI_TIPO_OPERACION(ID_TIPO_OPERACION);

ALTER TABLE BI_SYSTEAM.BI_FACT_ALQUILER
ADD CONSTRAINT FK_SUCURSAL_ALQUILER_BI
    FOREIGN KEY (ID_SUCURSAL) 
    REFERENCES BI_SYSTEAM.BI_SUCURSAL(ID_SUCURSAL);

GO

-------------------
--- FUNCIONES ----
-------------------


CREATE FUNCTION BI_SYSTEAM.obtener_a�o(@id NUMERIC(18,0))
RETURNS INTEGER
AS 
BEGIN
RETURN (
	SELECT TIEMPO_ANIO
	FROM BI_SYSTEAM.BI_tiempo T
	WHERE T.ID_TIEMPO = @id
	)
END
GO

CREATE FUNCTION BI_SYSTEAM.obtener_mes(@id NUMERIC(18,0))
RETURNS INTEGER
AS 
BEGIN
RETURN (
	SELECT TIEMPO_MES
	FROM BI_SYSTEAM.BI_tiempo T
	WHERE T.ID_TIEMPO = @id
	)
END
GO

CREATE FUNCTION BI_SYSTEAM.obtener_tiempo_id(@id NUMERIC(18,0))
RETURNS INTEGER
AS 
BEGIN
RETURN (
	SELECT TOP 1 id_tiempo 
	FROM BI_SYSTEAM.BI_tiempo T
	WHERE T.TIEMPO_ANIO = BI_SYSTEAM.obtener_a�o(@id) AND T.TIEMPO_MES = (BI_SYSTEAM.obtener_mes(@id)-1)
	)
END
GO


CREATE FUNCTION BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_AGENTE(@AGENTE INT)
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_EMPLEADO INT
	SET @FECHA_NACIMIENTO = (SELECT AGENTE_FECHA_NAC
							FROM SYSTEAM.AGENTE
							WHERE AGENTE_CODIGO = @AGENTE)
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

CREATE FUNCTION BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_INQUILINO(@INQUILINO INT)
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_EMPLEADO INT
	SET @FECHA_NACIMIENTO = (SELECT INQUILINO_FECHA_NAC
							FROM SYSTEAM.INQUILINO
							WHERE INQUILINO_CODIGO = @INQUILINO)
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


--MIGRACION DE BI_TIEMPO
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_TIEMPO AS
BEGIN
	INSERT INTO BI_SYSTEAM.BI_TIEMPO(
		TIEMPO_ANIO,
		TIEMPO_CUATRIMESTRE, 
		TIEMPO_MES,
		TIEMPO_DIA)
	SELECT
		A�o,
		Cuatrimestre,
		Mes,
		Dia
	FROM
	(	SELECT
		YEAR(fecha) AS A�o,
		DATEPART(QUARTER, fecha) AS Cuatrimestre,
		MONTH(fecha) AS Mes,
		DAY(fecha) AS Dia
		FROM
		(	SELECT ANUNCIO_FECHA_PUBLICACION AS fecha FROM SYSTEAM.ANUNCIO UNION ALL
			SELECT ANUNCIO_FECHA_FINALIZACION FROM SYSTEAM.ANUNCIO UNION ALL
			SELECT VENTA_FECHA FROM SYSTEAM.Venta UNION ALL
			SELECT ALQUILER_FECHA_INICIO FROM SYSTEAM.Alquiler UNION ALL
			SELECT ALQUILER_FECHA_FIN  FROM SYSTEAM.Alquiler UNION ALL
			SELECT PAGO_ALQUILER_FECHA FROM SYSTEAM.Pago_Alquiler UNION ALL
			SELECT PAGO_ALQUILER_FECHA_INI FROM SYSTEAM.Pago_Alquiler UNION ALL
			SELECT PAGO_ALQUILER_FECHA_FIN FROM SYSTEAM.Pago_Alquiler
		) AS fechas
	) AS resultado
	GROUP BY
	A�o,
	Cuatrimestre,
	Mes,
	Dia
	ORDER BY
	A�o,
	Mes,
	Dia;

END
GO

--MIGRACION DE BI_UBICACION
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_UBICACION
AS
BEGIN
	INSERT INTO BI_SYSTEAM.BI_UBICACION(
		provincia,
		localidad,
		barrio
	)
	SELECT 
		p.PROVINCIA_NOMBRE,
		l.LOCALIDAD_NOMBRE,
		b.BARRIO_NOMBRE
	FROM SYSTEAM.BARRIO b
		JOIN SYSTEAM.LOCALIDAD l ON l.LOCALIDAD_CODIGO  = b.LOCALIDAD_CODIGO 
		JOIN SYSTEAM.PROVINCIA p ON p.PROVINCIA_CODIGO  = l.PROVINCIA_CODIGO
END
GO

--MIGRACION DE BI_TIPO_OPERACION
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_OPERACION
AS
BEGIN
	INSERT INTO BI_SYSTEAM.BI_TIPO_OPERACION(
		TIPO_OPERACION_DESCRIPCION
	)
	SELECT DISTINCT
		TIPO_ANUNCIO_NOMBRE
	FROM SYSTEAM.TIPO_ANUNCIO
END
GO

--MIGRACION DE BI_AMBIENTES
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_AMBIENTES
AS
BEGIN
	INSERT INTO BI_SYSTEAM.BI_AMBIENTES(
		AMBIENTES_DESCRIPCION
	)
	SELECT DISTINCT
		INMUEBLE_CANT_AMBIENTES_DETALLE
	FROM SYSTEAM.INMUEBLE_CANT_AMBIENTES
END
GO

--MIGRACION DE BI_SUCURSAL
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_SUCURSAL
AS
BEGIN
	INSERT INTO BI_SYSTEAM.BI_SUCURSAL(
		SUCURSAL_NOMBRE
	)
	SELECT DISTINCT
		SUCURSAL_NOMBRE
	FROM SYSTEAM.SUCURSAL
END
GO

--MIGRACION DE BI_TIPO_MONEDA
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_MONEDA
AS
BEGIN
    INSERT INTO BI_SYSTEAM.BI_TIPO_MONEDA (
		TIPO_MONEDA_DESCRIPCION
	)
    SELECT DISTINCT(
		MONEDA_NOMBRE
	)
    FROM SYSTEAM.MONEDA sm
    WHERE sm.MONEDA_NOMBRE IS NOT NULL
    AND NOT EXISTS (
        SELECT 1
        FROM BI_SYSTEAM.BI_TIPO_MONEDA btm
        WHERE btm.TIPO_MONEDA_DESCRIPCION = sm.MONEDA_NOMBRE
      )
    ORDER BY 
		MONEDA_NOMBRE DESC;
END;
GO

--MIGRACION DE BI_TIPO_INMUEBLE
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_TIPO_INMUEBLE
AS
BEGIN

    INSERT INTO BI_SYSTEAM.BI_TIPO_INMUEBLE (
		TIPO_INMUEBLE_DESCRIPCION
	)
    SELECT DISTINCT(
		INMUEBLE_TIPO_DETALLE
	)
    FROM SYSTEAM.INMUEBLE_TIPO sit
    WHERE sit.INMUEBLE_TIPO_DETALLE IS NOT NULL
    AND NOT EXISTS (
        SELECT 1
        FROM BI_SYSTEAM.BI_TIPO_INMUEBLE bti
        WHERE bti.TIPO_INMUEBLE_DESCRIPCION = sit.INMUEBLE_TIPO_DETALLE
      )
    ORDER BY
		INMUEBLE_TIPO_DETALLE DESC;
END;
GO


--MIGRACION DE BI_RANGO_M2
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_RANGO_M2
AS
BEGIN
    INSERT INTO BI_SYSTEAM.BI_RANGO_M2(RANGO_M2_DESCRIPCION,METROS2_MINIMO,METROS2_MAXIMO)
    VALUES 
        ('<35',0,34),
        ('35-55',35,55),
        ('55-75',55,75),
        ('75-100',75,100),
        ('>100',100,10000);
END;
GO

--MIGRACION DE BI_RANGO_ETARIO
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_RANGO_ETARIO
AS
BEGIN
    INSERT INTO BI_SYSTEAM.BI_RANGO_ETARIO(RANGO_ETARIO_DESCRIPCION,RANGO_ETARIO_MENOR,RANGO_ETARIO_MAYOR)
    VALUES 
        ('<25',0,24),
        ('25-35',25,30),
        ('35-50',35,50),
        ('>50',51,150)
END;
GO

--MIGRACION DE BI_FACT_ANUNCIO
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_FACT_ANUNCIO
AS
BEGIN
INSERT INTO BI_SYSTEAM.BI_FACT_ANUNCIO(
	ID_TIPO_INMUEBLE,
	ID_RANGO_M2,
	ID_TIPO_OPERACION,
	ID_AMBIENTES,
	ID_SUCURSAL,
	ID_TIPO_MONEDA,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ID_AGENTE,
	ID_TIEMPO_FECHA_PUBLICACION,
    ID_TIEMPO_FECHA_FINALIZACION,
	ANUNCIO_ESTADO,
	ANUNCIO_PRECIO,
	ANUNCIO_DIAS_PUBLICADO


)
SELECT DISTINCT
   bti.INMUEBLE_TIPO_CODIGO , --TIPO INMUEBLES
   rm.ID_RANGO_M2, --RANGO METROS CUADRADOS
   tiop.ID_TIPO_OPERACION, --TIPO OPERACION
   amb.INMUEBLE_CANT_AMBIENTES_CODIGO,   -- AMBIENTES
   bs.SUCURSAL_CODIGO , --SUCURSALES
   tm.ID_TIPO_MONEDA, --TIPO MONEDA
   bb.BARRIO_CODIGO , --BARRIO
   re.ID_RANGO_ETARIO, --RANGO ETARIO EMPLEADO
   AG.AGENTE_CODIGO, -- AGENTE 
   T1.ID_TIEMPO, -- FECHA PUBLICACION
   T2.ID_TIEMPO,-- FECHA FINALIZACION
   a.ANUNCIO_ESTADO,-- ESTADO
   a.ANUNCIO_PRECIO_PUBLICADO, -- PRECIO
   AVG(DATEDIFF(DAY, a.ANUNCIO_FECHA_PUBLICACION, a.ANUNCIO_FECHA_FINALIZACION )) -- DIAS PUBLICADO
   
   
FROM SYSTEAM.ANUNCIO a
	JOIN SYSTEAM.INMUEBLE i ON i.INMUEBLE_CODIGO = a.ANUNCIO_CODIGO
	JOIN SYSTEAM.BARRIO bb ON bb.BARRIO_CODIGO =  i.BARRIO_CODIGO
	JOIN SYSTEAM.INMUEBLE_CANT_AMBIENTES amb ON amb.INMUEBLE_CANT_AMBIENTES_CODIGO = i.INMUEBLE_CANT_AMBIENTES_CODIGO
	JOIN SYSTEAM.INMUEBLE_TIPO bti ON bti.INMUEBLE_TIPO_CODIGO = i.INMUEBLE_TIPO_CODIGO
	JOIN SYSTEAM.AGENTE ag ON ag.AGENTE_CODIGO = a.AGENTE_CODIGO
	JOIN SYSTEAM.SUCURSAL bs ON bs.SUCURSAL_CODIGO = ag.SUCURSAL_CODIGO
	JOIN BI_SYSTEAM.BI_TIEMPO T1 ON T1.TIEMPO_ANIO = year(a.ANUNCIO_FECHA_PUBLICACION)  AND T1.TIEMPO_MES = month(a.ANUNCIO_FECHA_PUBLICACION)
	JOIN BI_SYSTEAM.BI_TIEMPO T2 ON T2.TIEMPO_ANIO = year(a.ANUNCIO_FECHA_FINALIZACION) AND T2.TIEMPO_MES = month(a.ANUNCIO_FECHA_FINALIZACION)
	--JOIN BI_SYSTEAM.BI_TIEMPO t ON t.TIEMPO_ANIO = DATEPART(YEAR,a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_MES = DATEPART(MONTH, a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.ANUNCIO_FECHA_PUBLICACION)
	JOIN BI_SYSTEAM.BI_TIPO_OPERACION tiop ON tiop.ID_TIPO_OPERACION = a.TIPO_ANUNCIO_CODIGO
	JOIN BI_SYSTEAM.BI_RANGO_ETARIO re ON re.ID_RANGO_ETARIO = BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_AGENTE(a.AGENTE_CODIGO)
	JOIN BI_SYSTEAM.BI_RANGO_M2 rm ON rm.ID_RANGO_M2= BI_SYSTEAM.FX_CALCULAR_RANGO_METROS(a.INMUEBLE_CODIGO)
	JOIN BI_SYSTEAM.BI_TIPO_MONEDA tm ON tm.ID_TIPO_MONEDA = a.MONEDA_CODIGO
GROUP BY
	 bti.INMUEBLE_TIPO_CODIGO, 
   rm.ID_RANGO_M2, 
   tiop.ID_TIPO_OPERACION, 
   amb.INMUEBLE_CANT_AMBIENTES_CODIGO,  
   bs.SUCURSAL_CODIGO ,
   tm.ID_TIPO_MONEDA, 
   bb.BARRIO_CODIGO , 
   re.ID_RANGO_ETARIO, 
   AG.AGENTE_CODIGO,
   T1.ID_TIEMPO, 
   T2.ID_TIEMPO,
   a.ANUNCIO_ESTADO,
   a.ANUNCIO_PRECIO_PUBLICADO
	
END 
GO


--MIGRACION DE BI_FACT_ALQUILER
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_FACT_ALQUILER
AS
BEGIN
INSERT INTO BI_SYSTEAM.BI_FACT_ALQUILER(

			ID_TIEMPO_FECHA_INICIO,
			ID_TIEMPO_FECHA_FIN,
			ID_TIEMPO_FECHA_PAGO,
			ID_TIEMPO_FECHA_PERIODO_INICIO,
			ID_TIEMPO_FECHA_PERIODO_FIN,
			ID_TIPO_OPERACION,

			ID_TIPO_MONEDA,
			ID_UBICACION,
			ID_RANGO_ETARIO,
			ID_SUCURSAL,

			ALQUILER_PRECIO,
			ALQUILER_CUMPLIMIENTO,
			ALQUILER_COMISION
)
SELECT DISTINCT
	
	T1.ID_TIEMPO,
	T2.ID_TIEMPO,
	T3.ID_TIEMPO,
	T4.ID_TIEMPO,
	T5.ID_TIEMPO,
	tipoOp.ID_TIPO_OPERACION,
	tm.ID_TIPO_MONEDA, 
	bb.BARRIO_CODIGO ,
	re.ID_RANGO_ETARIO,
	su.SUCURSAL_CODIGO,
	
	pa.PAGO_ALQUILER_IMPORTE,
	a.ALQUILER_ESTADO,
	a.ALQUILER_COMISION

FROM SYSTEAM.ALQUILER a

JOIN SYSTEAM.INMUEBLE i ON i.INMUEBLE_CODIGO = a.ANUNCIO_CODIGO
JOIN SYSTEAM.PAGO_ALQUILER pa ON pa.ALQUILER_CODIGO = a.ALQUILER_CODIGO
JOIN SYSTEAM.BARRIO bb ON bb.BARRIO_CODIGO =  i.BARRIO_CODIGO
JOIN SYSTEAM.ANUNCIO a1 ON a1.ANUNCIO_CODIGO =  a.ANUNCIO_CODIGO
JOIN SYSTEAM.AGENTE ag ON ag.AGENTE_CODIGO = a1.AGENTE_CODIGO
JOIN SYSTEAM.SUCURSAL su ON su.SUCURSAL_CODIGO =  ag.SUCURSAL_CODIGO
JOIN BI_SYSTEAM.BI_TIPO_OPERACION tipoOp ON tipoOp.TIPO_OPERACION_DESCRIPCION = a1.TIPO_ANUNCIO_CODIGO
JOIN BI_SYSTEAM.BI_TIEMPO T1 ON T1.TIEMPO_ANIO = year(a.ALQUILER_FECHA_INICIO)  AND T1.TIEMPO_MES = month(a.ALQUILER_FECHA_INICIO)
JOIN BI_SYSTEAM.BI_TIEMPO T2 ON T2.TIEMPO_ANIO = year(a.ALQUILER_FECHA_FIN)  AND T2.TIEMPO_MES = month(a.ALQUILER_FECHA_FIN)
JOIN BI_SYSTEAM.BI_TIEMPO T3 ON T3.TIEMPO_ANIO = year(pa.PAGO_ALQUILER_FECHA_INI)  AND T3.TIEMPO_MES = month(pa.PAGO_ALQUILER_FECHA_INI)
JOIN BI_SYSTEAM.BI_TIEMPO T4 ON T4.TIEMPO_ANIO = year(pa.PAGO_ALQUILER_FECHA_FIN)  AND T4.TIEMPO_MES = month(pa.PAGO_ALQUILER_FECHA_FIN)
JOIN BI_SYSTEAM.BI_TIEMPO T5 ON T5.TIEMPO_ANIO = year(pa.PAGO_ALQUILER_FECHA)  AND T5.TIEMPO_MES = month(pa.PAGO_ALQUILER_FECHA)
--JOIN BI_SYSTEAM.BI_TIEMPO t ON t.TIEMPO_ANIO = DATEPART(YEAR,a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_MES = DATEPART(MONTH, a.ANUNCIO_FECHA_PUBLICACION) AND t.TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.ANUNCIO_FECHA_PUBLICACION)
JOIN BI_SYSTEAM.BI_TIPO_MONEDA tm ON tm.ID_TIPO_MONEDA = pa.MEDIO_PAGO_CODIGO
JOIN BI_SYSTEAM.BI_RANGO_ETARIO re ON re.ID_RANGO_ETARIO = BI_SYSTEAM.FX_CALCULAR_RANGO_ETARIO_INQUILINO(A.INQUILINO_CODIGO)
END
GO

--MIGRACION DE BI_FACT_VENTA
CREATE PROCEDURE BI_SYSTEAM.CARGAR_BI_FACT_VENTA
AS
BEGIN

INSERT INTO BI_SYSTEAM.BI_FACT_VENTA(
    ID_AMBIENTES,      -- agregar ALTER FK
    ID_TIPO_OPERACION, -- agregar ALTER FK
    ID_TIPO_INMUEBLE,
    ID_RANGO_M2,
    ID_TIPO_MONEDA,
    ID_SUCURSAL, --agregar ALTER FK
	ID_UBICACION,
	PRECIO_VENTA,
    ID_TIEMPO_FECHA, 
    COMISION
    
) 
SELECT DISTINCT
	bia.ID_AMBIENTES,
	bitop.ID_TIPO_OPERACION,
	biTI.ID_TIPO_INMUEBLE,
	birm2.ID_RANGO_M2,
	bitm.ID_TIPO_MONEDA,
	bis.ID_SUCURSAL,
	biu.ID_UBICACION, 
	v.VENTA_PRECIO_VENTA,
	bitie.ID_TIEMPO,
	v.VENTA_COMISION
	

FROM SYSTEAM.VENTA v 
	JOIN SYSTEAM.MONEDA m ON v.MONEDA_CODIGO = m.MONEDA_CODIGO
	JOIN BI_SYSTEAM.BI_TIPO_MONEDA bitm ON m.MONEDA_NOMBRE = bitm.TIPO_MONEDA_DESCRIPCION
	JOIN SYSTEAM.ANUNCIO a ON v.ANUNCIO_CODIGO = a.ANUNCIO_CODIGO
	JOIN SYSTEAM.TIPO_ANUNCIO ta ON ta.TIPO_ANUNCIO_CODIGO = a.TIPO_ANUNCIO_CODIGO
	JOIN BI_SYSTEAM.BI_TIPO_OPERACION bitop ON bitop.TIPO_OPERACION_DESCRIPCION = ta.TIPO_ANUNCIO_NOMBRE
	JOIN SYSTEAM.INMUEBLE i ON i.INMUEBLE_CODIGO = a.INMUEBLE_CODIGO
	JOIN SYSTEAM.INMUEBLE_TIPO it ON it.INMUEBLE_TIPO_CODIGO  = i.INMUEBLE_TIPO_CODIGO
	JOIN BI_SYSTEAM.BI_TIPO_INMUEBLE biti ON biti.TIPO_INMUEBLE_DESCRIPCION = it.INMUEBLE_TIPO_DETALLE
	JOIN BI_SYSTEAM.BI_RANGO_M2 birm2 ON  i.INMUEBLE_SUPERFICIETOTAL BETWEEN  birm2.METROS2_MINIMO AND birm2.METROS2_MAXIMO
	JOIN SYSTEAM.INMUEBLE_CANT_AMBIENTES ica ON ica.INMUEBLE_CANT_AMBIENTES_CODIGO = i.INMUEBLE_CANT_AMBIENTES_CODIGO
	JOIN BI_SYSTEAM.BI_AMBIENTES bia ON biA.AMBIENTES_DESCRIPCION = ica.INMUEBLE_CANT_AMBIENTES_DETALLE
	JOIN SYSTEAM.AGENTE ag ON ag.AGENTE_CODIGO = a.AGENTE_CODIGO
	JOIN SYSTEAM.SUCURSAL s ON s.SUCURSAL_CODIGO = ag.SUCURSAL_CODIGO 
	JOIN BI_SYSTEAM.BI_SUCURSAL bis ON bis.SUCURSAL_NOMBRE = s.SUCURSAL_NOMBRE
	JOIN BI_SYSTEAM.BI_TIEMPO bitie ON bitie.TIEMPO_ANIO = year(v.VENTA_FECHA) AND bitie.TIEMPO_MES = month(v.VENTA_FECHA) AND bitie.TIEMPO_DIA = day(v.VENTA_FECHA)
	JOIN SYSTEAM.BARRIO b ON b.BARRIO_CODIGO = i.BARRIO_CODIGO
	JOIN SYSTEAM.LOCALIDAD l ON l.LOCALIDAD_CODIGO  = b.LOCALIDAD_CODIGO
	JOIN SYSTEAM.PROVINCIA p ON p.PROVINCIA_CODIGO  = l.PROVINCIA_CODIGO  
	JOIN BI_SYSTEAM.BI_UBICACION biu ON biu.PROVINCIA = p.PROVINCIA_NOMBRE AND biu.LOCALIDAD = l.LOCALIDAD_NOMBRE AND biu.BARRIO = b.BARRIO_NOMBRE
	/*WHERE VENTA_CODIGO IS NOT NULL AND NOT EXISTS (
    SELECT 1 
    FROM SYSTEAM.VENTA v2
    WHERE v2.VENTA_CODIGO = v.VENTA_CODIGO
)*/
GROUP BY 
	bia.ID_AMBIENTES,
	bitop.ID_TIPO_OPERACION,
	biTI.ID_TIPO_INMUEBLE,
	birm2.ID_RANGO_M2,
	bitm.ID_TIPO_MONEDA,
	bis.ID_SUCURSAL,
	biu.ID_UBICACION, 
	v.VENTA_PRECIO_VENTA,
	bitie.ID_TIEMPO,
	v.VENTA_COMISION

END
GO

SELECT * FROM BI_SYSTEAM.BI_FACT_ANUNCIO
SELECT * FROM BI_SYSTEAM.BI_FACT_ALQUILER
SELECT * FROM BI_SYSTEAM.BI_FACT_VENTA	


EXEC BI_SYSTEAM.CARGAR_BI_TIEMPO
EXEC BI_SYSTEAM.CARGAR_BI_TIPO_MONEDA
EXEC BI_SYSTEAM.CARGAR_BI_TIPO_INMUEBLE
EXEC BI_SYSTEAM.CARGAR_BI_RANGO_M2
EXEC BI_SYSTEAM.CARGAR_BI_RANGO_ETARIO
EXEC BI_SYSTEAM.CARGAR_BI_UBICACION
EXEC BI_SYSTEAM.CARGAR_BI_SUCURSAL
EXEC BI_SYSTEAM.CARGAR_BI_TIPO_OPERACION
EXEC BI_SYSTEAM.CARGAR_BI_AMBIENTES
EXEC BI_SYSTEAM.CARGAR_BI_FACT_ANUNCIO
EXEC BI_SYSTEAM.CARGAR_BI_FACT_ALQUILER
EXEC BI_SYSTEAM.CARGAR_BI_FACT_VENTA
GO



-------------------
--- VIEWS ----
-------------------


--VISTA 1:
CREATE VIEW BI_SYSTEAM.VISTA_PROMEDIO_DIAS_PUBLICADOS_ANUNCIOS AS 
	SELECT 
		t1.TIEMPO_ANIO									AS [A�o publicacion anuncio],
		t1.TIEMPO_MES									AS [Cuatrimestre publicacion anuncio],
		tipoOp.TIPO_OPERACION_DESCRIPCION				AS [Tipo Operacion],
		ambi.AMBIENTES_DESCRIPCION						AS [Ambientes],
		bar.BARRIO										AS [Barrio donde se publico el anuncio],
		ISNULL(AVG(a.ANUNCIO_DIAS_PUBLICADO),0)			AS [Duracion promedio en dias]
	FROM
		BI_SYSTEAM.BI_FACT_ANUNCIO a
		JOIN  BI_SYSTEAM.BI_UBICACION bar ON bar.ID_UBICACION = a.ID_UBICACION
		JOIN  BI_SYSTEAM.BI_TIPO_OPERACION tipoOp ON a.ID_TIPO_OPERACION = tipoOp.ID_TIPO_OPERACION
		JOIN  BI_SYSTEAM.BI_AMBIENTES ambi ON a.ID_AMBIENTES= ambi.ID_AMBIENTES
		JOIN  BI_SYSTEAM.BI_TIEMPO t1 ON a.ID_TIEMPO_FECHA_PUBLICACION= t1.ID_TIEMPO
	GROUP BY
		t1.TIEMPO_ANIO,
		t1.TIEMPO_MES,
		bar.BARRIO,
		ambi.AMBIENTES_DESCRIPCION,
		tipoOp.TIPO_OPERACION_DESCRIPCION
GO


--VISTA 2:
CREATE VIEW BI_SYSTEAM.VISTA_PROMEDIO_ANUNCIOS_INMUEBLES AS
	SELECT 
		t1.TIEMPO_ANIO								AS [A�o publicacion anuncio],
		t1.TIEMPO_MES								AS [Cuatrimestre publicacion anuncio],
		tipoOp.TIPO_OPERACION_DESCRIPCION			AS [Tipo Operacion],
		tipoAmb.TIPO_INMUEBLE_DESCRIPCION			AS [Tipo Inmueble],
		tipoMon.TIPO_MONEDA_DESCRIPCION				AS [Moneda Detalle],
		AVG(ANUNCIO_PRECIO)							AS [Precio promedio],
		rM2.RANGO_M2_DESCRIPCION					AS [Rango M2] 
	FROM
		BI_SYSTEAM.BI_FACT_ANUNCIO a
		JOIN BI_SYSTEAM.BI_TIPO_OPERACION tipoOp ON a.ID_TIPO_OPERACION = tipoOp.ID_TIPO_OPERACION
		JOIN BI_SYSTEAM.BI_TIPO_INMUEBLE tipoAmb ON a.ID_TIPO_INMUEBLE = tipoAmb.ID_TIPO_INMUEBLE
		JOIN BI_SYSTEAM.BI_RANGO_M2 rM2 ON a.ID_RANGO_M2 = rM2.ID_RANGO_M2
		JOIN BI_SYSTEAM.BI_TIPO_MONEDA tipoMon ON a.ID_TIPO_MONEDA = tipoMon.ID_TIPO_MONEDA 
		JOIN  BI_SYSTEAM.BI_TIEMPO t1 ON a.ID_TIEMPO_FECHA_PUBLICACION= t1.ID_TIEMPO
	GROUP BY
		t1.TIEMPO_ANIO,
		t1.TIEMPO_MES,
		tipoOp.TIPO_OPERACION_DESCRIPCION,
		tipoAmb.TIPO_INMUEBLE_DESCRIPCION,
		rM2.RANGO_M2_DESCRIPCION,
		tipoMon.TIPO_MONEDA_DESCRIPCION	
GO

--VISTA 3:
CREATE VIEW BI_SYSTEAM.VISTA_LOS_5_BARRIOS_MAS_ELEGIDOS_PARA_ALQUILAR AS
  SELECT TOP 5
	 t1.TIEMPO_ANIO						AS [A�o publicacion anuncio],
	 t1.TIEMPO_MES						AS [Cuatrimestre publicacion anuncio],
	 bar.BARRIO							AS [Barrio donde se publico el anuncio],
	 re.RANGO_ETARIO_DESCRIPCION        AS [Rango Etario Inquilinos],
	 COUNT(*)							AS [Cantidad alquileres dados de alta]
  FROM
    BI_SYSTEAM.BI_fact_alquiler AL
    JOIN  BI_SYSTEAM.BI_tiempo T1 ON AL.ID_TIEMPO_FECHA_INICIO = T1.ID_TIEMPO
	JOIN  BI_SYSTEAM.BI_UBICACION bar ON bar.ID_UBICACION = al.ID_UBICACION
	JOIN  BI_SYSTEAM.BI_RANGO_ETARIO re ON re.ID_RANGO_ETARIO = al.ID_RANGO_ETARIO
  GROUP BY 
     t1.TIEMPO_ANIO,
	 t1.TIEMPO_MES,
	 bar.BARRIO,
	 re.RANGO_ETARIO_DESCRIPCION 
   ORDER BY COUNT(*) DESC
GO

--VISTA 4:
CREATE VIEW BI_SYSTEAM.VISTA_PORCENTAJE_INCUMPLIMIENTO_PAGO_ALQUILER AS
	SELECT
 		T1.TIEMPO_ANIO												AS [A�o Alquiler],
		T1.TIEMPO_MES												AS [Mes Alquiler],
		COUNT(*)													AS [Total pagos],

		SUM(CASE WHEN  T1.TIEMPO_ANIO <= T2.TIEMPO_ANIO 
		AND T1.TIEMPO_CUATRIMESTRE <= T2.TIEMPO_CUATRIMESTRE 
		AND T1.TIEMPO_MES<= T2.TIEMPO_MES  THEN 1 ELSE 0 END)		AS [Pagos en termino],

		SUM(CASE WHEN T1.TIEMPO_ANIO > T2.TIEMPO_ANIO 
		AND T1.TIEMPO_CUATRIMESTRE > T2.TIEMPO_CUATRIMESTRE 
		AND T1.TIEMPO_MES > T2.TIEMPO_MES  THEN 1 ELSE 0 END)		AS [Pagos atrasados],

		CAST(SUM(CASE WHEN T1.TIEMPO_ANIO  > T2.TIEMPO_ANIO 
		AND T1.TIEMPO_CUATRIMESTRE > T2.TIEMPO_CUATRIMESTRE 
		AND T1.TIEMPO_MES > T2.TIEMPO_MES THEN 1 ELSE 0 END) 
		AS DECIMAL) / COUNT(*) * 100								AS [Porcentaje incumplimiento]

	FROM BI_SYSTEAM.BI_FACT_ALQUILER A
		JOIN BI_SYSTEAM.BI_TIEMPO T1 ON T1.ID_TIEMPO = A.ID_TIEMPO_FECHA_PERIODO_FIN
		JOIN BI_SYSTEAM.BI_TIEMPO T2 ON T2.ID_TIEMPO = A.ID_TIEMPO_FECHA_PAGO
	GROUP BY
		T1.TIEMPO_ANIO,
		T1.TIEMPO_MES
GO

--VISTA 5: 
CREATE VIEW BI_SYSTEAM.VISTA_PORCENTAJE_PROMEDIO_INCREMENTO_VALOR_ALQUILERES AS
	SELECT
		T1.TIEMPO_ANIO														AS [A�o],
		T1.TIEMPO_MES														AS [Mes],
		100.0 * (SUM(AL.ALQUILER_PRECIO)/SUM(al.ALQUILER_PRECIO) - 1)		AS [Porcentaje incremento alquiler]
	FROM BI_SYSTEAM.BI_FACT_ALQUILER al
		JOIN BI_SYSTEAM.BI_tiempo T1 ON al.ID_TIEMPO_FECHA_PAGO = T1.id_tiempo
		JOIN BI_SYSTEAM.BI_tiempo T2 ON T2.ID_TIEMPO = BI_SYSTEAM.obtener_tiempo_id(T1.ID_TIEMPO)	
		JOIN BI_SYSTEAM.BI_FACT_ALQUILER al2 on al2.ID_TIEMPO_FECHA_PAGO = T2.ID_TIEMPO
	GROUP BY 
		T1.TIEMPO_ANIO,
		T1.TIEMPO_MES
GO

--VISTA 6:
 
CREATE VIEW BI_SYSTEAM.VISTA_PRECIO_PROMEDIO_M2_VENTA AS
	SELECT
		TipoIn.TIPO_INMUEBLE_DESCRIPCION								AS [Tipo inmueble],
		T1.TIEMPO_ANIO													AS [A�o],
		T1.TIEMPO_CUATRIMESTRE											AS [Cuatrimestre],
		T1.TIEMPO_MES													AS [Mes],
		Ubi.LOCALIDAD													AS [Localidad],
		AVG(v.PRECIO_VENTA / (Rm2.METROS2_MAXIMO - Rm2.METROS2_MINIMO))	AS [Precio promedio M2]
	FROM BI_SYSTEAM.BI_FACT_VENTA v
		JOIN BI_SYSTEAM.BI_TIPO_INMUEBLE TipoIn ON v.id_tipo_inmueble = TipoIn.id_tipo_inmueble
		JOIN BI_SYSTEAM.BI_UBICACION Ubi ON v.id_ubicacion = Ubi.id_Ubicacion
		JOIN BI_SYSTEAM.BI_RANGO_M2 Rm2 ON v.id_rango_m2 = Rm2.id_rango_m2
		JOIN BI_SYSTEAM.BI_TIEMPO T1 ON T1.id_tiempo = v.ID_TIEMPO_FECHA
	GROUP BY
		TipoIn.TIPO_INMUEBLE_DESCRIPCION,
		T1.TIEMPO_ANIO,
		T1.TIEMPO_CUATRIMESTRE,
		T1.TIEMPO_MES,
		Ubi.LOCALIDAD
	GO

--VISTA 7
CREATE VIEW BI_SYSTEAM.VISTA_VALOR_PROMEDIO_COMISION AS
	SELECT
		tipoOp.TIPO_OPERACION_DESCRIPCION		AS [Tipo operacion],
		su.SUCURSAL_NOMBRE						AS [Sucursal],
		T1.TIEMPO_ANIO							AS [A�o],
		T1.TIEMPO_CUATRIMESTRE					AS [Cuatrimestre],
		ISNULL(AVG(
			CASE
				WHEN al.id_tipo_operacion = 1 THEN v.COMISION
				WHEN al.id_tipo_operacion = 2 THEN al.ALQUILER_COMISION 
				ELSE 0
			END
		),0)									AS [Valor promedio comision]

	FROM BI_SYSTEAM.BI_FACT_ALQUILER al
		LEFT JOIN BI_SYSTEAM.BI_FACT_VENTA v ON al.id_tipo_operacion = v.id_tipo_operacion		AND al.ID_TIEMPO_FECHA_INICIO = v.ID_TIEMPO_FECHA
		JOIN BI_SYSTEAM.BI_TIPO_OPERACION tipoOp ON al.id_tipo_operacion = tipoOp.id_tipo_operacion
		JOIN BI_SYSTEAM.BI_SUCURSAL su ON al.ID_SUCURSAL= su.id_sucursal
		JOIN BI_SYSTEAM.BI_TIEMPO T1 ON al.ID_TIEMPO_FECHA_INICIO = T1.id_tiempo
	GROUP BY
		tipoOp.TIPO_OPERACION_DESCRIPCION,		
		su.SUCURSAL_NOMBRE,						
		T1.TIEMPO_ANIO,							
		T1.TIEMPO_CUATRIMESTRE

GO

--VISTA 8
CREATE VIEW  BI_SYSTEAM.VISTA_PORCENTAJE_OPERACIONES_CONCRETADAS AS
  SELECT
    su.SUCURSAL_NOMBRE						AS [Sucursal],
	T1.TIEMPO_ANIO							AS [A�o],
    re.RANGO_ETARIO_DESCRIPCION             AS [Rango etario agente],
	COUNT(*)								AS [Cantidad de anuncios],
	CONCAT(
		(convert
			(float,
				(
				SELECT COUNT(*)
				FROM BI_SYSTEAM.BI_FACT_ANUNCIO a2
				JOIN BI_SYSTEAM.BI_tiempo T2 ON a2.ID_TIEMPO_FECHA_PUBLICACION = T2.ID_TIEMPO
				WHERE T2.TIEMPO_ANIO = T1.TIEMPO_ANIO 
				AND a2.ANUNCIO_ESTADO IN ('Vendido','Alquilado')
				)
			) / COUNT(*)
		) * 100, '%')
								            AS [Porcentaje operaciones concretadas]
  FROM BI_SYSTEAM.BI_FACT_ANUNCIO a
    JOIN BI_SYSTEAM.BI_tiempo T1 ON a.ID_TIEMPO_FECHA_PUBLICACION = T1.ID_TIEMPO
	JOIN BI_SYSTEAM.BI_RANGO_ETARIO re ON a.ID_RANGO_ETARIO = re.ID_RANGO_ETARIO
	JOIN BI_SYSTEAM.BI_SUCURSAL su ON a.ID_SUCURSAL = su.ID_SUCURSAL
  GROUP BY 
	T1.TIEMPO_ANIO,
	su.SUCURSAL_NOMBRE,
    re.RANGO_ETARIO_DESCRIPCION  
GO

--VISTA 9
CREATE VIEW BI_SYSTEAM.VISTA_MONTO_TOTAL_CIERRE_CONTRATOS AS
  SELECT
    su.SUCURSAL_NOMBRE						AS [Sucursal],
	T1.TIEMPO_ANIO							AS [A�o],
	T1.TIEMPO_CUATRIMESTRE					AS [Cuatrimestre],
	tipoOp.TIPO_OPERACION_DESCRIPCION		AS [Tipo operacion],
    tipoMon.TIPO_MONEDA_DESCRIPCION			AS [Moneda Detalle],
	SUM(a.ANUNCIO_PRECIO)					AS [Monto total cierre]

  FROM BI_SYSTEAM.BI_FACT_ANUNCIO a
    JOIN BI_SYSTEAM.BI_tiempo T1 ON a.ID_TIEMPO_FECHA_PUBLICACION = T1.ID_TIEMPO
	JOIN BI_SYSTEAM.BI_SUCURSAL su ON a.ID_SUCURSAL = su.ID_SUCURSAL
	JOIN BI_SYSTEAM.BI_TIPO_OPERACION tipoOp ON a.id_tipo_operacion = tipoOp.id_tipo_operacion
	JOIN BI_SYSTEAM.BI_TIPO_MONEDA tipoMon ON a.ID_TIPO_MONEDA = tipoMon.ID_TIPO_MONEDA 
  GROUP BY
   su.SUCURSAL_NOMBRE,
	T1.TIEMPO_ANIO,
	T1.TIEMPO_CUATRIMESTRE,
	tipoOp.TIPO_OPERACION_DESCRIPCION,
    tipoMon.TIPO_MONEDA_DESCRIPCION
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
