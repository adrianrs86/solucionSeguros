USE [master]
GO
/****** Object:  Database [Seguros]    Script Date: 24/06/2018 10:36:30 a. m. ******/
CREATE DATABASE [Seguros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N' ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Seguros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Seguros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Seguros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Seguros] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Seguros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Seguros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Seguros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Seguros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Seguros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Seguros] SET ARITHABORT OFF 
GO
ALTER DATABASE [Seguros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Seguros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Seguros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Seguros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Seguros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Seguros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Seguros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Seguros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Seguros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Seguros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Seguros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Seguros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Seguros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Seguros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Seguros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Seguros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Seguros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Seguros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Seguros] SET  MULTI_USER 
GO
ALTER DATABASE [Seguros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Seguros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Seguros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Seguros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Seguros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Seguros] SET QUERY_STORE = OFF
GO
USE [Seguros]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Seguros]
GO
/****** Object:  Schema [Productos]    Script Date: 24/06/2018 10:36:30 a. m. ******/
CREATE SCHEMA [Productos]
GO
/****** Object:  Schema [Pruebas]    Script Date: 24/06/2018 10:36:30 a. m. ******/
CREATE SCHEMA [Pruebas]
GO
/****** Object:  Schema [Pruebas1]    Script Date: 24/06/2018 10:36:30 a. m. ******/
CREATE SCHEMA [Pruebas1]
GO
/****** Object:  Table [Productos].[CubrimientoPolizas]    Script Date: 24/06/2018 10:36:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[CubrimientoPolizas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Productos].[PersonaPolizas]    Script Date: 24/06/2018 10:36:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[PersonaPolizas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [varchar](10) NOT NULL,
	[PolizaId] [int] NOT NULL,
	[activo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Productos].[Polizas]    Script Date: 24/06/2018 10:36:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[Polizas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[CodigoCubrimiento] [int] NOT NULL,
	[PorcentajeCobertura] [decimal](4, 2) NOT NULL,
	[InicioVigencia] [datetime] NOT NULL,
	[PeriodoCobertura] [int] NOT NULL,
	[Precio] [decimal](15, 2) NULL,
	[CodigoRiesgo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Productos].[RiesgosPolizas]    Script Date: 24/06/2018 10:36:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[RiesgosPolizas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Productos].[CubrimientoPolizas] ON 

INSERT [Productos].[CubrimientoPolizas] ([Id], [Codigo], [Nombre]) VALUES (1, 1, N'Terremoto')
INSERT [Productos].[CubrimientoPolizas] ([Id], [Codigo], [Nombre]) VALUES (2, 2, N'Incendio')
INSERT [Productos].[CubrimientoPolizas] ([Id], [Codigo], [Nombre]) VALUES (3, 3, N'Robo')
INSERT [Productos].[CubrimientoPolizas] ([Id], [Codigo], [Nombre]) VALUES (4, 4, N'Pérdida')
SET IDENTITY_INSERT [Productos].[CubrimientoPolizas] OFF
SET IDENTITY_INSERT [Productos].[PersonaPolizas] ON 

INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (1, N'1020398560', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (2, N'1020398560', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (3, N'10203', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (4, N'1020398560', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (5, N'111111', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (6, N'111111', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (7, N'111111', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (8, N'1020398560', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (9, N'1254', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (10, N'4545', 10, 1)
INSERT [Productos].[PersonaPolizas] ([Id], [PersonaId], [PolizaId], [activo]) VALUES (11, N'1020398560', 11, 1)
SET IDENTITY_INSERT [Productos].[PersonaPolizas] OFF
SET IDENTITY_INSERT [Productos].[Polizas] ON 

INSERT [Productos].[Polizas] ([Id], [Nombre], [Descripcion], [CodigoCubrimiento], [PorcentajeCobertura], [InicioVigencia], [PeriodoCobertura], [Precio], [CodigoRiesgo]) VALUES (10, N'prueba de poliza', N'peuba', 1, CAST(10.00 AS Decimal(4, 2)), CAST(N'2018-06-04T10:00:00.000' AS DateTime), 12, CAST(121212.00 AS Decimal(15, 2)), 2)
INSERT [Productos].[Polizas] ([Id], [Nombre], [Descripcion], [CodigoCubrimiento], [PorcentajeCobertura], [InicioVigencia], [PeriodoCobertura], [Precio], [CodigoRiesgo]) VALUES (11, N'Poliza de terremotos', N'des', 2, CAST(22.00 AS Decimal(4, 2)), CAST(N'2018-06-18T05:00:00.000' AS DateTime), 1, CAST(121212.00 AS Decimal(15, 2)), 2)
SET IDENTITY_INSERT [Productos].[Polizas] OFF
SET IDENTITY_INSERT [Productos].[RiesgosPolizas] ON 

INSERT [Productos].[RiesgosPolizas] ([Id], [Codigo], [Nombre]) VALUES (1, 1, N'Alto')
INSERT [Productos].[RiesgosPolizas] ([Id], [Codigo], [Nombre]) VALUES (2, 2, N'Medio-Alto')
INSERT [Productos].[RiesgosPolizas] ([Id], [Codigo], [Nombre]) VALUES (3, 3, N'Medio')
INSERT [Productos].[RiesgosPolizas] ([Id], [Codigo], [Nombre]) VALUES (4, 4, N'Bajo')
SET IDENTITY_INSERT [Productos].[RiesgosPolizas] OFF
/****** Object:  Index [UQ__Cubrimie__06370DACF4A67F4A]    Script Date: 24/06/2018 10:36:31 a. m. ******/
ALTER TABLE [Productos].[CubrimientoPolizas] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__RiesgosP__06370DAC18A4130F]    Script Date: 24/06/2018 10:36:31 a. m. ******/
ALTER TABLE [Productos].[RiesgosPolizas] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Productos].[PersonaPolizas]  WITH CHECK ADD FOREIGN KEY([PolizaId])
REFERENCES [Productos].[Polizas] ([Id])
GO
ALTER TABLE [Productos].[Polizas]  WITH CHECK ADD FOREIGN KEY([CodigoCubrimiento])
REFERENCES [Productos].[CubrimientoPolizas] ([Id])
GO
ALTER TABLE [Productos].[Polizas]  WITH CHECK ADD FOREIGN KEY([CodigoRiesgo])
REFERENCES [Productos].[RiesgosPolizas] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Seguros] SET  READ_WRITE 
GO
