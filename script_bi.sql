USE GD2C2023
GO
-------------------------------------------------------------------------------------------------
-----------------------------------DROP DE TABLES------------------------------------------------
-------------------------------------------------------------------------------------------------
IF OBJECT_ID('BI_SYSTEAM.BI_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.BI_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_TIPO_OPERACION', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_TIPO_OPERACION
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_RANGO_M2', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_RANGO_M2
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_TIPO_INMUEBLE', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_TIPO_INMUEBLE
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_UBICACION', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_UBICACION
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_AMBIENTES', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_AMBIENTES
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_RANGO_ETARIO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_RANGO_ETARIO
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_TIEMPO
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_TIPO_MONEDA', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_TIPO_MONEDA
GO

IF OBJECT_ID('BI_SYSTEAM.FACT_ANUNCIO', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.FACT_ANUNCIO
GO

IF OBJECT_ID('BI_SYSTEAM.DIM_SUCURSAL', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.DIM_SUCURSAL
GO

IF OBJECT_ID('BI_SYSTEAM.FACT_VENTA', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.FACT_VENTA
GO

IF OBJECT_ID('BI_SYSTEAM.FACT_ALQUILER', 'U') IS NOT NULL
    DROP TABLE BI_SYSTEAM.FACT_ALQUILER
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
    ID_TIEMPO INT IDENTITY(1,1) PRIMARY KEY,
    TIEMPO_ANIO INT,
    TIEMPO_CUATRIMESTRE INT,
    TIEMPO_MES INT,
	TIEMPO_DIA INT
);
GO

CREATE TABLE BI_SYSTEAM.BI_UBICACION (
    ID_UBICACION INT IDENTITY(1,1) PRIMARY KEY,
    PROVINCIA NVARCHAR(255),
    LOCALIDAD NVARCHAR(255),
    BARRIO NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_SUCURSAL (
    ID_SUCURSAL INT IDENTITY(1,1) PRIMARY KEY,
    SUCURSAL_NOMBRE NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_RANGO_ETARIO (
    ID_RANGO_ETARIO INT IDENTITY(1,1) PRIMARY KEY,
    RANGO_ETARIO_DESCRIPCION NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_TIPO_INMUEBLE (
    ID_TIPO_INMUEBLE INT IDENTITY(1,1) PRIMARY KEY,
    TIPO_INMUEBLE_DESCRIPCION NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_AMBIENTES (
    ID_AMBIENTES INT IDENTITY(1,1) PRIMARY KEY,
    AMBIENTES_DESCRIPCION NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_RANGO_M2 (
    ID_RANGO_M2 INT IDENTITY(1,1) PRIMARY KEY,
    RANGO_M2_DESCRIPCION NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_TIPO_OPERACION (
    ID_TIPO_OPERACION INT IDENTITY(1,1) PRIMARY KEY,
    TIPO_OPERACION_DESCRIPCION NVARCHAR(255)
);
GO

CREATE TABLE BI_SYSTEAM.BI_TIPO_MONEDA (
    ID_TIPO_MONEDA INT IDENTITY(1,1) PRIMARY KEY,
    TIPO_MONEDA_DESCRIPCION NVARCHAR(255)
);
GO


CREATE TABLE BI_SYSTEAM.BI_FACT_ANUNCIO (
	ID_TIPO_INMUEBLE DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_INMUEBLE,
	ID_RANGO_M2 DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_RANGO_M2,
    ID_TIEMPO_FECHA_PUBLICACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
    ID_TIEMPO_FECHA_FINALIZACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
    ID_TIPO_OPERACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_OPERACION,
	ID_AMBIENTES DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_AMBIENTES,
	ID_SUCURSAL DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_SUCURSAL,
	ID_TIPO_MONEDA DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA,
	ID_UBICACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_UBICACION,
	ID_RANGO_ETARIO DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_RANGO_ETARIO,
	ANUNCIO_ESTADO NVARCHAR(100),
	ANUNCIO_DIAS_PUBLICADO INT,
	ANUNCIO_PRECIO INT
	
	PRIMARY KEY(
	ID_TIEMPO,
	ID_UBICACION,
	ID_SUCURSAL,
	ID_RANGO_ETARIO,
	ID_TIPO_INMUEBLE,
	ID_TIPO_OPERACION,
	ID_TIPO_MONEDA,
	ID_AMBIENTE,
	ID_RANGO_M2
	)
);
GO

CREATE TABLE BI_SYSTEAM.BI_FACT_VENTA (
	ID_TIPO_INMUEBLE DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_INMUEBLE,
	ID_RANGO_M2 DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_RANGO_M2,
    ID_TIEMPO_FECHA DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
	ID_TIPO_MONEDA DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA,
	ID_UBICACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_UBICACION,
    PRECIO_VENTA DECIMAL(18, 2),
	COMISION DECIMAL(18, 2)
	PRIMARY KEY(
	ID_TIEMPO,
	ID_UBICACION,
	ID_TIPO_INMUEBLE,
	ID_TIPO_MONEDA,
	ID_RANGO_M2
	)
);
GO

CREATE TABLE BI_SYSTEAM.BI_FACT_ALQUILER (
    ID_TIEMPO_FECHA_INICIO DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
    ID_TIEMPO_FECHA_FIN DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
	ID_TIEMPO_FECHA_PAGO DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
	ID_TIEMPO_FECHA_VENCIMIENTO DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIEMPO,
	ID_TIPO_MONEDA DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_TIPO_MONEDA,
	ID_UBICACION DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_UBICACION,
	ID_RANGO_ETARIO DECIMAL(18,0) FOREIGN KEY REFERENCES BI_SYSTEAM.BI_RANGO_ETARIO,
    ALQUILER_MONTO_ANTERIOR INT,
	ALQUILER_MONTO_PAGADO INT,
	ALQUILER_PRECIO INT,
	ALQUILER_CUMPLIMIENTO INT

	PRIMARY KEY(
	ID_TIEMPO,
	ID_UBICACION,
	ID_RANGO_ETARIO,
	ID_TIPO_MONEDA
	)
);
GO
