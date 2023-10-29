USE master;


BEGIN TRANSACTION;

-- Creación de la tabla Sucursal
CREATE TABLE gd_esquema.Sucursal (
    SUCURSAL_CODIGO INT PRIMARY KEY,
    SUCURSAL_NOMBRE NVARCHAR(255),
    SUCURSAL_DIRECCION NVARCHAR(255),
    SUCURSAL_TELEFONO NVARCHAR(20),
    SUCURSAL_LOCALIDAD NVARCHAR(255),
    SUCURSAL_PROVINCIA NVARCHAR(255)
);
GO

-- Creación de la tabla Inmueble
CREATE TABLE gd_esquema.Inmueble (
    INMUEBLE_CODIGO INT PRIMARY KEY,
    INMUEBLE_NOMBRE NVARCHAR(255),
    INMUEBLE_DESCRIPCION NVARCHAR(MAX),
    INMUEBLE_DIRECCION NVARCHAR(255),
    INMUEBLE_SUPERFICIETOTAL DECIMAL(10, 2),
    INMUEBLE_ANTIGUEDAD INT,
    INMUEBLE_EXPENSAS DECIMAL(10, 2),
    INMUEBLE_CARACTERISTICA_WIFI BIT,
    INMUEBLE_CARACTERISTICA_CABLE BIT,
    INMUEBLE_CARACTERISTICA_CALEFACCION BIT,
    INMUEBLE_CARACTERISTICA_GAS BIT,
    INMUEBLE_BARRIO NVARCHAR(255),
    INMUEBLE_LOCALIDAD NVARCHAR(255),
    INMUEBLE_PROVINCIA NVARCHAR(255),
    INMUEBLE_TIPO_INMUEBLE NVARCHAR(255),
    PROPIETARIO_DNI NVARCHAR(20),
    INMUEBLE_CANT_AMBIENTES INT,
    INMUEBLE_ORIENTACION NVARCHAR(255),
    INMUEBLE_DISPOSICION NVARCHAR(255),
    INMUEBLE_ESTADO NVARCHAR(255)
);
GO

-- Creación de la tabla Propietario
CREATE TABLE gd_esquema.Propietario (
    PROPIETARIO_DNI NVARCHAR(20) PRIMARY KEY,
    PROPIETARIO_NOMBRE NVARCHAR(255),
    PROPIETARIO_APELLIDO NVARCHAR(255),
    PROPIETARIO_FECHA_REGISTRO DATETIME,
    PROPIETARIO_TELEFONO NVARCHAR(20),
    PROPIETARIO_MAIL NVARCHAR(255),
    PROPIETARIO_FECHA_NAC DATETIME
);
GO

-- Creación de la tabla Agente
CREATE TABLE gd_esquema.Agente (
    AGENTE_DNI NVARCHAR(20) PRIMARY KEY,
    AGENTE_NOMBRE NVARCHAR(255),
    AGENTE_APELLIDO NVARCHAR(255),
    AGENTE_FECHA_REGISTRO DATETIME,
    AGENTE_TELEFONO NVARCHAR(20),
    AGENTE_MAIL NVARCHAR(255),
    AGENTE_FECHA_NAC DATETIME
);
GO

-- Creación de la tabla Tipo_Operacion
CREATE TABLE gd_esquema.Tipo_Operacion (
    TIPO_OPERACION_CODIGO INT PRIMARY KEY,
    TIPO_OPERACION_NOMBRE NVARCHAR(255)
);
GO

-- Creación de la tabla Moneda
CREATE TABLE gd_esquema.Moneda (
    MONEDA_CODIGO INT PRIMARY KEY,
    MONEDA_NOMBRE NVARCHAR(255)
    CONSTRAINT UQ_MONEDA_NOMBRE UNIQUE(MONEDA_NOMBRE)
);
GO

-- Creación de la tabla Alquiler
CREATE TABLE gd_esquema.Alquiler (
    ALQUILER_CODIGO INT PRIMARY KEY,
    ALQUILER_FECHA_INICIO DATETIME,
    ALQUILER_FECHA_FIN DATETIME,
    ALQUILER_CANT_PERIODOS INT,
    ALQUILER_DEPOSITO DECIMAL(10, 2),
    ALQUILER_COMISION DECIMAL(10, 2),
    ALQUILER_GASTOS_AVERIGUA DECIMAL(10, 2),
    INQUILINO_DNI NVARCHAR(20),
    ALQUILER_ESTADO NVARCHAR(255)
);
GO

-- Creación de la tabla Venta
CREATE TABLE gd_esquema.Venta (
    VENTA_CODIGO INT PRIMARY KEY,
    VENTA_FECHA DATETIME,
    VENTA_PRECIO_VENTA DECIMAL(10, 2),
    VENTA_COMISION DECIMAL(10, 2),
    COMPRADOR_DNI NVARCHAR(20),
    VENTA_MONEDA INT
);
GO

CREATE TABLE gd_esquema.Medio_Pago (
    MEDIO_PAGO_ID INT PRIMARY KEY,
    TIPO_MEDIO_PAGO NVARCHAR(30)
)

-- Creación de la tabla Pago_Alquiler
CREATE TABLE gd_esquema.Pago_Alquiler (
    PAGO_ALQUILER_CODIGO INT PRIMARY KEY,
    PAGO_ALQUILER_FECHA DATETIME,
    PAGO_ALQUILER_FECHA_VENCIMIENTO DATETIME,
    PAGO_ALQUILER_NRO_PERIODO INT,
    PAGO_ALQUILER_DESC NVARCHAR(MAX),
    PAGO_ALQUILER_FEC_INI DATETIME,
    PAGO_ALQUILER_FEC_FIN DATETIME,
    PAGO_ALQUILER_IMPORTE DECIMAL(10, 2),
    PAGO_ALQUILER_MEDIO_PAGO INT
);
GO

-- Creación de la tabla Pago_Venta
CREATE TABLE gd_esquema.Pago_Venta (
    PAGO_VENTA_CODIGO INT IDENTITY(1,1) PRIMARY KEY,
    PAGO_VENTA_IMPORTE DECIMAL(10, 2),
    PAGO_VENTA_MONEDA INT,
    PAGO_VENTA_COTIZACION DECIMAL(10, 2),
    PAGO_VENTA_MEDIO_PAGO INT
);
GO

-- Creación de la tabla Detalle_Importe
CREATE TABLE gd_esquema.Detalle_Importe (
    DETALLE_IMPORTE_CODIGO INT PRIMARY KEY,
    DETALLE_IMPORTE_ALQUILER INT,
    DETALLE_IMPORTE_PERIODO_INI DATETIME,
    DETALLE_IMPORTE_PERIODO_FIN DATETIME,
    DETALLE_IMPORTE_PRECIO DECIMAL(10, 2)
);
GO

-- Creación de la tabla Comprador
CREATE TABLE gd_esquema.Comprador (
    COMPRADOR_DNI NVARCHAR(20) PRIMARY KEY,
    COMPRADOR_NOMBRE NVARCHAR(255),
    COMPRADOR_APELLIDO NVARCHAR(255),
    COMPRADOR_FECHA_REGISTRO DATETIME,
    COMPRADOR_TELEFONO NVARCHAR(20),
    COMPRADOR_MAIL NVARCHAR(255),
    COMPRADOR_FECHA_NAC DATETIME
);
GO

-- Creación de la tabla Inquilino
CREATE TABLE gd_esquema.Inquilino (
    INQUILINO_DNI NVARCHAR(20) PRIMARY KEY,
    INQUILINO_NOMBRE NVARCHAR(255),
    INQUILINO_APELLIDO NVARCHAR(255),
    INQUILINO_FECHA_REGISTRO DATETIME,
    INQUILINO_TELEFONO NVARCHAR(20),
    INQUILINO_MAIL NVARCHAR(255),
    INQUILINO_FECHA_NAC DATETIME
);
GO

-- Creación de la tabla Tipo_Inmueble
CREATE TABLE gd_esquema.Tipo_Inmueble (
    TIPO_INMUEBLE_CODIGO INT PRIMARY KEY,
    TIPO_INMUEBLE_TIPO NVARCHAR(255)
);
GO

-- Creación de la tabla Provincia
CREATE TABLE gd_esquema.Provincia (
    PROVINCIA_CODIGO INT PRIMARY KEY,
    PROVINCIA_NOMBRE NVARCHAR(255)
);
GO

-- Creación de la tabla Localidad
CREATE TABLE gd_esquema.Localidad (
    LOCALIDAD_CODIGO INT PRIMARY KEY,
    LOCALIDAD_NOMBRE NVARCHAR(255)
);
GO

-- Creación de la tabla Barrio
CREATE TABLE gd_esquema.Barrio (
    BARRIO_CODIGO INT PRIMARY KEY,
    BARRIO_NOMBRE NVARCHAR(255)
);
GO

-- Creación de la tabla BarriosPorLocalidad
CREATE TABLE gd_esquema.BarriosPorLocalidad (
    LOCALIDAD_CODIGO INT,
    BARRIO_CODIGO INT
);
GO

-- Creación de la tabla Ambientes
CREATE TABLE gd_esquema.Ambientes (
    AMBIENTES_CODIGO INT PRIMARY KEY,
    AMBIENTES_CANTIDAD INT
);
GO

-- Creación de la tabla Disposicion
CREATE TABLE gd_esquema.Disposicion (
    DISPOSICION_CODIGO INT PRIMARY KEY,
    DISPOSICION_UBICACION NVARCHAR(255)
);
GO

-- Creación de la tabla Orientacion
CREATE TABLE gd_esquema.Orientacion (
    ORIENTACION_CODIGO INT PRIMARY KEY,
    ORIENTACION_CARDINAL NVARCHAR(255)
);
GO

-- Creación de la tabla Estado_Inmueble
CREATE TABLE gd_esquema.Estado_Inmueble (
    ESTADO_CODIGO INT PRIMARY KEY,
    ESTADO_TIPO NVARCHAR(255)
);
GO

-- Creación de la tabla Estado_Anuncio
CREATE TABLE gd_esquema.Estado_Anuncio (
    ESTADO_CODIGO INT PRIMARY KEY,
    ESTADO_TIPO NVARCHAR(255)
);
GO

-- Creación de la tabla Tipo_Periodo
CREATE TABLE gd_esquema.Tipo_Periodo (
    TIPO_PERIODO_CODIGO INT PRIMARY KEY,
    TIPO_PERIODO_TIPO NVARCHAR(255)
);
GO

-- Creación de la tabla Estado_Alquiler
CREATE TABLE gd_esquema.Estado_Alquiler (
    ESTADO_CODIGO INT PRIMARY KEY,
    ESTADO_TIPO NVARCHAR(255)
);
GO

-- Creación de las tablas intermedias para relaciones muchos a muchos (por ejemplo, Alquiler_Tipo_Operacion)
CREATE TABLE gd_esquema.Alquiler_Tipo_Operacion (
    ALQUILER_CODIGO INT,
    TIPO_OPERACION_CODIGO INT
);
GO

-- Creación de las tablas intermedias para relaciones muchos a muchos (por ejemplo, Alquiler_Moneda)
CREATE TABLE gd_esquema.Alquiler_Moneda (
    ALQUILER_CODIGO INT,
    MONEDA_CODIGO INT
);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Inmueble
ADD FOREIGN KEY (PROPIETARIO_DNI) REFERENCES gd_esquema.Propietario(PROPIETARIO_DNI);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Inmueble
ADD FOREIGN KEY (INMUEBLE_TIPO_INMUEBLE) REFERENCES gd_esquema.Tipo_Inmueble(TIPO_INMUEBLE_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Inmueble
ADD FOREIGN KEY (INMUEBLE_LOCALIDAD) REFERENCES gd_esquema.Localidad(LOCALIDAD_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.BarriosPorLocalidad
ADD FOREIGN KEY (LOCALIDAD_CODIGO) REFERENCES gd_esquema.Localidad(LOCALIDAD_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.BarriosPorLocalidad
ADD FOREIGN KEY (BARRIO_CODIGO) REFERENCES gd_esquema.Barrio(BARRIO_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Inmueble
ADD FOREIGN KEY (INMUEBLE_ESTADO) REFERENCES gd_esquema.Estado_Inmueble(ESTADO_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Inmueble
ADD FOREIGN KEY (INMUEBLE_ORIENTACION) REFERENCES gd_esquema.Orientacion(ORIENTACION_CODIGO);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Alquiler
ADD FOREIGN KEY (INQUILINO_DNI) REFERENCES gd_esquema.Inquilino(INQUILINO_DNI);
GO

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Venta
ADD FOREIGN KEY (COMPRADOR_DNI) REFERENCES gd_esquema.Comprador(COMPRADOR_DNI);
GO

ALTER TABLE gd_esquema.Pago_Alquiler
ADD FOREIGN KEY (PAGO_ALQUILER_MEDIO_PAGO) REFERENCES gd_esquema.Medio_Pago(MEDIO_PAGO_ID);

-- Definición de claves foráneas para relaciones
ALTER TABLE gd_esquema.Pago_Venta
ADD FOREIGN KEY (PAGO_VENTA_MEDIO_PAGO) REFERENCES gd_esquema.Medio_Pago(MEDIO_PAGO_ID);
GO

-- Define las claves foráneas para las demás relaciones entre tablas

-- Creación de Stored Procedures para migrar datos

-- Stored Procedure para migrar datos de la tabla Sucursal
CREATE PROCEDURE gd_esquema.MigrarDatosSucursal AS
BEGIN
    INSERT INTO gd_esquema.Sucursal (
        SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_DIRECCION, SUCURSAL_TELEFONO,
        SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA
    )
    SELECT
        SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_DIRECCION, SUCURSAL_TELEFONO,
        SUCURSAL_LOCALIDAD, SUCURSAL_PROVINCIA
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Inmueble
CREATE PROCEDURE gd_esquema.MigrarDatosInmueble AS
BEGIN
    INSERT INTO gd_esquema.Inmueble (
        INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_DESCRIPCION, INMUEBLE_DIRECCION,
        INMUEBLE_SUPERFICIETOTAL, INMUEBLE_ANTIGUEDAD, INMUEBLE_EXPENSAS,
        INMUEBLE_CARACTERISTICA_WIFI, INMUEBLE_CARACTERISTICA_CABLE,
        INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS,
        INMUEBLE_BARRIO, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA,
        INMUEBLE_TIPO_INMUEBLE, PROPIETARIO_DNI, INMUEBLE_CANT_AMBIENTES,
        INMUEBLE_ORIENTACION, INMUEBLE_DISPOSICION, INMUEBLE_ESTADO
    )
    SELECT
        INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_DESCRIPCION, INMUEBLE_DIRECCION,
        INMUEBLE_SUPERFICIETOTAL, INMUEBLE_ANTIGUEDAD, INMUEBLE_EXPESAS,
        INMUEBLE_CARACTERISTICA_WIFI, INMUEBLE_CARACTERISTICA_CABLE,
        INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS,
        INMUEBLE_BARRIO, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA,
        INMUEBLE_TIPO_INMUEBLE, PROPIETARIO_DNI, INMUEBLE_CANT_AMBIENTES,
        INMUEBLE_ORIENTACION, INMUEBLE_DISPOSICION, INMUEBLE_ESTADO
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Propietario
CREATE PROCEDURE gd_esquema.MigrarDatosPropietario AS
BEGIN
    INSERT INTO gd_esquema.Propietario (
        PROPIETARIO_DNI, PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO,
        PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO,
        PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC
    )
    SELECT
        PROPIETARIO_DNI, PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO,
        PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO,
        PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Alquiler
CREATE PROCEDURE gd_esquema.MigrarDatosAlquiler AS
BEGIN
    INSERT INTO gd_esquema.Alquiler (
        ALQUILER_CODIGO, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN,
        ALQUILER_CANT_PERIODOS, ALQUILER_DEPOSITO, ALQUILER_COMISION,
        ALQUILER_GASTOS_AVERIGUA, INQUILINO_DNI, ALQUILER_ESTADO
    )
    SELECT
        ALQUILER_CODIGO, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN,
        ALQUILER_CANT_PERIODOS, ALQUILER_DEPOSITO, ALQUILER_COMISION,
        ALQUILER_GASTOS_AVERIGUA, INQUILINO_DNI, ALQUILER_ESTADO
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Venta
CREATE PROCEDURE gd_esquema.MigrarDatosVenta AS
BEGIN
    INSERT INTO gd_esquema.Venta (
        VENTA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION,
        COMPRADOR_DNI, VENTA_MONEDA
    )
    SELECT
        VENTA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION,
        COMPRADOR_DNI, VENTA_MONEDA
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Pago_Alquiler
CREATE PROCEDURE gd_esquema.MigrarDatosPagoAlquiler AS
BEGIN
    INSERT INTO gd_esquema.Pago_Alquiler (
        PAGO_ALQUILER_CODIGO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FECHA_VENCIMIENTO,
        PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_DESC, PAGO_ALQUILER_FEC_INI,
        PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_IMPORTE, PAGO_ALQUILER_MEDIO_PAGO
    )
    SELECT
        PAGO_ALQUILER_CODIGO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FECHA_VENCIMIENTO,
        PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_DESC, PAGO_ALQUILER_FEC_INI,
        PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_IMPORTE, PAGO_ALQUILER_MEDIO_PAGO
    FROM Maestra;
END;
GO

-- Stored Procedure para migrar datos de la tabla Pago_Venta
CREATE PROCEDURE gd_esquema.MigrarDatosPagoVenta AS
BEGIN
    INSERT INTO gd_esquema.Pago_Venta (
        PAGO_VENTA_IMPORTE, PAGO_VENTA_MONEDA,
        PAGO_VENTA_COTIZACION, PAGO_VENTA_MEDIO_PAGO
    )
    SELECT
        PAGO_VENTA_IMPORTE, PAGO_VENTA_MONEDA,
        PAGO_VENTA_COTIZACION, PAGO_VENTA_MEDIO_PAGO
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas que necesitas migrar

-- Stored Procedure para migrar datos de la tabla Comprador
CREATE PROCEDURE gd_esquema.MigrarDatosComprador AS
BEGIN
    INSERT INTO gd_esquema.Comprador (
        COMPRADOR_DNI, COMPRADOR_NOMBRE, COMPRADOR_APELLIDO,
        COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO,
        COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
    )
    SELECT
        COMPRADOR_DNI, COMPRADOR_NOMBRE, COMPRADOR_APELLIDO,
        COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO,
        COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Inquilino
CREATE PROCEDURE gd_esquema.MigrarDatosInquilino AS
BEGIN
    INSERT INTO gd_esquema.Inquilino (
        INQUILINO_DNI, INQUILINO_NOMBRE, INQUILINO_APELLIDO,
        INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO,
        INQUILINO_MAIL, INQUILINO_FECHA_NAC
    )
    SELECT
        INQUILINO_DNI, INQUILINO_NOMBRE, INQUILINO_APELLIDO,
        INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO,
        INQUILINO_MAIL, INQUILINO_FECHA_NAC
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Tipo_Operacion
-- TODO: aca no toy seguro que iria
CREATE PROCEDURE gd_esquema.MigrarDatosTipoOperacion AS
BEGIN
    INSERT INTO gd_esquema.Tipo_Operacion (
        TIPO_OPERACION_CODIGO, TIPO_OPERACION_NOMBRE
    )
    SELECT
        TIPO_OPERACION_CODIGO, TIPO_OPERACION_NOMBRE
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Moneda
CREATE PROCEDURE gd_esquema.MigrarDatosMoneda AS
BEGIN
    INSERT INTO gd_esquema.Moneda (
        MONEDA_NOMBRE
    )
    SELECT DISTINCT MONEDA FROM
        (SELECT DISTINCT VENTA_MONEDA as MONEDA FROM gd_esquema.Maestra
        UNION ALL
        SELECT DISTINCT ANUNCIO_MONEDA FROM gd_esquema.Maestra
        UNION ALL
        SELECT DISTINCT PAGO_VENTA_MONEDA FROM gd_esquema.Maestra)
    as MVMMAM WHERE MONEDA is not null;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Estado_Inmueble
CREATE PROCEDURE gd_esquema.MigrarDatosEstadoInmueble AS
BEGIN
    INSERT INTO gd_esquema.Estado_Inmueble (
        ESTADO_CODIGO, ESTADO_TIPO
    )
    SELECT
        ESTADO_CODIGO, ESTADO_TIPO
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Estado_Anuncio
CREATE PROCEDURE gd_esquema.MigrarDatosEstadoAnuncio AS
BEGIN
    INSERT INTO gd_esquema.Estado_Anuncio (
        ESTADO_CODIGO, ESTADO_TIPO
    )
    SELECT
        ESTADO_CODIGO, ESTADO_TIPO
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Tipo_Periodo
CREATE PROCEDURE gd_esquema.MigrarDatosTipoPeriodo AS
BEGIN
    INSERT INTO gd_esquema.Tipo_Periodo (
        TIPO_PERIODO_CODIGO, TIPO_PERIODO_TIPO
    )
    SELECT
        TIPO_PERIODO_CODIGO, TIPO_PERIODO_TIPO
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Stored Procedure para migrar datos de la tabla Estado_Alquiler
CREATE PROCEDURE gd_esquema.MigrarDatosEstadoAlquiler AS
BEGIN
    INSERT INTO gd_esquema.Estado_Alquiler (
        ESTADO_CODIGO, ESTADO_TIPO
    )
    SELECT
        ESTADO_CODIGO, ESTADO_TIPO
    FROM Maestra;
END;
GO

-- Repite el proceso para otras tablas

-- Ejecución de Stored Procedures para migrar datos

-- Ejecutar el Stored Procedure para la tabla Sucursal
EXEC gd_esquema.MigrarDatosSucursal;
GO

-- Ejecutar el Stored Procedure para la tabla Inmueble
EXEC gd_esquema.MigrarDatosInmueble;
GO

-- Ejecutar el Stored Procedure para la tabla Propietario
EXEC gd_esquema.MigrarDatosPropietario;
GO

-- Ejecutar el Stored Procedure para la tabla Alquiler
EXEC gd_esquema.MigrarDatosAlquiler;
GO

-- Ejecutar el Stored Procedure para la tabla Venta
EXEC gd_esquema.MigrarDatosVenta;
GO

-- Ejecutar el Stored Procedure para la tabla Pago_Alquiler
EXEC gd_esquema.MigrarDatosPagoAlquiler;
GO

-- Ejecutar el Stored Procedure para la tabla Pago_Venta
EXEC gd_esquema.MigrarDatosPagoVenta;
GO

-- Repite el proceso para otras tablas

-- Ejecutar el Stored Procedure para la tabla Comprador
EXEC gd_esquema.MigrarDatosComprador;
GO

-- Ejecutar el Stored Procedure para la tabla Inquilino
EXEC gd_esquema.MigrarDatosInquilino;
GO

-- Ejecutar el Stored Procedure para la tabla Tipo_Operacion
EXEC gd_esquema.MigrarDatosTipoOperacion;
GO

-- Ejecutar el Stored Procedure para la tabla Moneda
EXEC gd_esquema.MigrarDatosMoneda;
GO

-- Ejecutar el Stored Procedure para la tabla Estado_Inmueble
EXEC gd_esquema.MigrarDatosEstadoInmueble;
GO

-- Ejecutar el Stored Procedure para la tabla Estado_Anuncio
EXEC gd_esquema.MigrarDatosEstadoAnuncio;
GO

-- Ejecutar el Stored Procedure para la tabla Tipo_Periodo
EXEC gd_esquema.MigrarDatosTipoPeriodo;
GO

-- Ejecutar el Stored Procedure para la tabla Estado_Alquiler
EXEC gd_esquema.MigrarDatosEstadoAlquiler;
GO

COMMIT;
