USE [master]
GO
/****** Object:  Database [tt]    Script Date: 24/07/2022 17:40:33 ******/
CREATE DATABASE [tt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tt] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tt] SET ARITHABORT OFF 
GO
ALTER DATABASE [tt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tt] SET RECOVERY FULL 
GO
ALTER DATABASE [tt] SET  MULTI_USER 
GO
ALTER DATABASE [tt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tt', N'ON'
GO
ALTER DATABASE [tt] SET QUERY_STORE = OFF
GO
USE [tt]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24/07/2022 17:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 24/07/2022 17:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductProperties]    Script Date: 24/07/2022 17:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24/07/2022 17:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BrandId] [int] NOT NULL,
	[Key] [nvarchar](63) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 24/07/2022 17:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220627045916_first', N'5.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703131403_brandAdded', N'5.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703131726_product.key', N'5.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703133448_value to prod.property', N'5.0.1')
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'vf')
GO
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (2, N'otelo')
GO
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (3, N'cable')
GO
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (4, N'dsl')
GO
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (5, N'unity')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductProperties] ON 
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (1, 1, 15, N'1-24 Monat: 31,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (2, 1, 17, N'<div blister-action="SM2L" class="thumb thumb-blister vf" id="SM2L"><div class="title"><div class="inner">Smart L</div></div><div class="subtitle "><div class="inner">ALLET-FLAT</div></div><div class="teaser"><div class="inner">2 GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">31, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (3, 1, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone Smart L</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>2 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">31,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (4, 2, 15, N'1-24 Monat: 36,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (5, 2, 17, N'<div blister-action="SM2LP" class="thumb thumb-blister vf" id="SM2LP"><div class = "title"><div class = "inner">Smart L+</div> </div> <div class = "subtitle "> <div class = "inner">ALLNET-FLAT</div> </div> <div class = "teaser"> <div class = "inner">15 GB Datenvolumen</div> </div> <div class = "price"> <table ><tbody ><tr ><td rowspan = "2" class="price-unit">36, </td> <td class = "price-subunit">99</td> </tr> <tr ><td class = "price-desc">/ MTL.</td> </tr> </tbody> </table> </div> <div class = "icon iicon red arrow-blister"> </div> </div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (6, 2, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone Smart L+</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>5GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">36,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (7, 3, 15, N'1-24 Monat: 41,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (8, 3, 17, N'<div class="thumb thumb-blister vf" blister-action="SM2XL"><div class="title"><div class="inner">Smart XL</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">30GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">41, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (9, 3, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone Smart XL</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>6 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">41,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (10, 4, 15, N'1-12 Monat: 9,99 €;13-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (11, 4, 17, N'<div class="thumb thumb-blister dsl" blister-action="PK_INTP_DSL16_1016"><div class="title"><div class="inner">RED 16</div></div><div class="subtitle "><div class="inner">INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 16 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">9,</td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 13. Monat 29,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (12, 4, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Red Internet & Phone 16 DSL</div><div class="body text-body">DSL Internet-Flat<br>Bandbreite DSL 16000 <br>In den ersten 12 Monaten 9,99 €, danach 29,99€. <br><br>Basis-Anschluss oder <br>Komfort-Anschluss. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (13, 4, 5, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (14, 4, 6, N'IP068')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (15, 4, 7, N'I1204')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (16, 4, 8, N'voice')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (17, 4, 9, N'Festnetz-Flat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (18, 4, 10, N'VP068')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (19, 4, 11, N'VI202')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (20, 4, 12, N'Red Internet & Phone 16 DSL')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (21, 4, 13, N'24m')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (22, 5, 15, N'1-12 Monat: 14,99 €;13-24 Monat: 34,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (23, 5, 17, N'<div class="thumb thumb-blister dsl" blister-action="PK_INTP_DSL50_1016"><div class="title"><div class="inner">RED 50</div></div><div class="subtitle "><div class="inner">INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 50 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 13. Monat 34,99€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (24, 5, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Red Internet & Phone 50 DSL</div><div class="body text-body">DSL Internet-Flat<br>Bandbreite VDSL 50000 <br>In den ersten 12 Monaten 14,99 €, danach 34,99€. <br><br>Basis-Anschluss oder <br>Komfort-Anschluss. </div><div class="spacer-line"></div><div class="bl text-h2 tar">34,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (25, 5, 4, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (26, 5, 5, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (27, 5, 6, N'IP070')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (28, 5, 7, N'I1204')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (29, 5, 8, N'voice')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (30, 5, 9, N'Festnetz-Flat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (31, 5, 10, N'VP070')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (32, 5, 11, N'VI202')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (33, 5, 12, N'Red Internet & Phone 50 DSL')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (34, 5, 13, N'24m')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (35, 6, 15, N'1-12 Monat: 19,99 €;13-24 Monat: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (36, 6, 17, N'<div class="thumb thumb-blister dsl" blister-action="PK_INTP_DSL100_1016"><div class="title"><div class="inner">RED 100</div></div><div class="subtitle"><div class="inner">INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 100 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td class="price-unit" rowspan="2">19,</td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 13. Monat 39,99€</div> </div><div class="icon iicon red arrow-blister">&nbsp;</div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (37, 6, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Red Internet & Phone 100 DSL</div><div class="body text-body">DSL Internet-Flat<br>Bandbreite VDSL 100000. <br> <br>In den ersten 12 Monaten 19,99 €, danach 39,99€ <br>Basis-Anschluss oder <br>Komfort-Anschluss. </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (38, 6, 4, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (39, 6, 5, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (40, 6, 6, N'IP071')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (41, 6, 7, N'I1203')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (42, 6, 8, N'voice')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (43, 6, 9, N'Festnetz-Flat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (44, 6, 10, N'VP071')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (45, 6, 11, N'VI203')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (46, 6, 12, N'Red Internet & Phone 100 DSL')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (47, 6, 13, N'24m')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (48, 7, 15, N'1-12 Monat: 24,99 €;13-24 Monat: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (49, 7, 17, N'<div class="thumb thumb-blister dsl" blister-action="PK_INTP_DSL250_1016"><div class="title"><div class="inner">RED 250</div></div><div class="subtitle "><div class="inner">INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 250 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">24, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 13. Monat 49,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (50, 7, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Red Internet & Phone 250 DSL</div><div class="body text-body">DSL Internet-Flat<br>Bandbreite VDSL 250000 <br> <br>In den ersten 12 Monaten 24,99 €, danach 49,99€. <br>Basis-Anschluss oder <br>Komfort-Anschluss. </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (51, 7, 4, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (52, 7, 5, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (53, 7, 6, N'IP072')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (54, 7, 7, N'I1203')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (55, 7, 8, N'voice')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (56, 7, 9, N'Festnetz-Flat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (57, 7, 10, N'VP072')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (58, 7, 11, N'VI203')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (59, 7, 12, N'Red Internet & Phone 250 DSL')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (60, 7, 13, N'24m')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (61, 8, 15, N'1-24 Monat: 19,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (62, 8, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Internet-Flat Maxi</div><div class="body text-body">24  Monate<br><br>8 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (63, 9, 15, N'1-24 Monat: 9,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (64, 9, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Internet-Flat Maxi</div><div class="body text-body">24  Monate<br><br>3 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (65, 10, 15, N'1-24 Monat: 19,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (66, 10, 17, N'<div class="thumb thumb-blister otelo" blister-action="3"><div class="title"><div class="inner">Classic</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">15 GB Datenvolumen </div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (67, 10, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Classic</div><div class="body text-body"><br>5+10 GB monatliches Datenvolumen.</div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (68, 11, 15, N'1-24 Monat: 24,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (69, 11, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Comfort</div><div class="body text-body"><br>3+1+4 GB monatliches Datenvolumen. </div><div class="spacer-line"></div><div class="bl text-h2 tar">24,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (70, 12, 15, N'1-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (71, 12, 17, N'<div class="thumb thumb-blister otelo" blister-action="5"><div class="title"><div class="inner">Max</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">25 GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">29, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (72, 12, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Max</div><div class="body text-body"><br>8+17 GB monatliches Datenvolumen. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (73, 13, 15, N'1-24 Monat: 19,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (74, 13, 17, N'<div class="thumb thumb-blister otelo" blister-action="37"><div class="title"><div class="inner">Classic Young</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">17 GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (75, 13, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Classic Young</div><div class="body text-body"><br>5+10+2 GB monatliches Datenvolumen + Gratis LTE-100 Option.</div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (76, 14, 15, N'1-24 Monat: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (77, 14, 17, N'<div class="thumb thumb-blister otelo" blister-action="55"><div class="title"><div class="inner">otelo GO</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">7 GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (78, 14, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Go</div><div class="body text-body"><br>3+4 GB monatliches Datenvolumen. </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (79, 15, 15, N'1-24 Monat: 24,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (80, 15, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Comfort Young</div><div class="body text-body"><br>3+1+2 GB monatliches Datenvolumen. </div><div class="spacer-line"></div><div class="bl text-h2 tar">24,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (81, 16, 15, N'1-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (82, 16, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Max Young</div><div class="body text-body"><br>8+17+4 GB monatliches Datenvolumen + Gratis LTE-100 Option.</div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (83, 17, 15, N'1-24 Monat: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (84, 17, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone DataGo S</div><div class="body text-body">Reiner Datentarif<br><br>2 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (85, 18, 15, N'1-24 Monat: 19,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (86, 18, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone DataGo M</div><div class="body text-body">Reiner Datentarif<br><br>5 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (87, 19, 15, N'1-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (88, 19, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone DataGo L</div><div class="body text-body">Reiner Datentarif<br><br>12 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (89, 20, 15, N'1-24 Monat: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (90, 20, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone DataGo XL</div><div class="body text-body">Reiner Datentarif<br><br>20 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (91, 21, 15, N'+14,99€ GigaTV Net Laufzeit 1Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (92, 21, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-1m"><div class="title"><div class="inner">GigaTV Net</div></div><div class="subtitle "><div class="inner">1 Monat</div></div><div class="teaser"><div class="inner">Bis zu 62 TV-Sender in SD und 40 in HD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>  ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (93, 21, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Net (1 Monat)></div><div class="body text-body">14,99€/Monat. Mindestlaufzeit 1 Monate. Kündbar mit 4 Wochen Frist. GigaTV Net Box zur Nutzung überlassen. Vodafone Premium: 2 Gratismonate, ab dem 3. Monat 9,99 €.<br><br> </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (94, 22, 15, N'1-6 Monat: 9,99 €;ab Monat 7: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (95, 22, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-24m"><div class="title"><div class="inner">GigaTV Net</div></div><div class="subtitle "><div class="inner">24 Monate</div></div><div class="teaser"><div class="inner">Bis zu 62 TV-Sender in SD und 40 in HD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">12, </td><td class="price-subunit">49</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>  ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (96, 22, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Net (24 Monate)></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 12 Monaten<br> bezahlt Ihr Kunde 9,99€. <br>Ab dem 13. Monat 14,99€. </div><div class="spacer-line"></div><div class="bl text-h2 tar">12,49 € Durchschnittspreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (97, 23, 15, N'9,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (98, 23, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Vodafone TV Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Dein Kunde zahlt monatlich 9,99€ </div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (99, 24, 15, N'1-12 Monat: 9,99 €;ab Monat 13: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (100, 24, 17, N'<div class="thumb thumb-blister kabel" blister-action="tv-giga-wechselgarantie"><div class="title"><div class="inner">GigaTV Cable inkl. VF Premium</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div> ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (101, 24, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable inkl. VF Premium></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 2 Monaten<br> bezahlt Dein Kunde 9,99€. <br>Ab dem 13. Monat 14,99€. </div><div class="spacer-line"></div><div class="bl text-h2 tar">12,49 € Durchschnittspreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (102, 25, 15, N'4,95 € / 4 Wochen')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (103, 25, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">Smart S</div><div class="body text-body">Keine Vertragsbindung<br><br>750 MB Inklusiv-Volumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">4,95 € für 4 Wochen</div><div class="spacer"></div><div class="bl text-tiny tar"> für 4 Wochen (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (104, 26, 15, N'7,95 € / 4 Wochen')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (105, 26, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">Smart XL</div><div class="body text-body">Keine Vertragsbindung<br><br>3 GB Inklusiv-Volumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">7,95 € für 4 Wochen</div><div class="spacer"></div><div class="bl text-tiny tar"> für 4 Wochen (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (106, 27, 15, N'4,95 € einmalig')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (107, 27, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">Surf-Sim </div><div class="body text-body">Keine Vertragsbindung<br><br> 3 Euro Startguthaben </div><div class="spacer-line"></div><div class="bl text-h2 tar">4,95 € </div><div class="spacer"></div><div class="bl text-tiny tar"> einmalig  (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (108, 28, 15, N'4,95 € einmalig')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (109, 28, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">Handy-Karte </div><div class="body text-body">9 Cent/Min in alle dt. Netze<br>9 Cent/SMS auch im EU-Ausland<br> 5 Euro Startguthaben </div><div class="spacer-line"></div><div class="bl text-h2 tar">4,95 € </div><div class="spacer"></div><div class="bl text-tiny tar"> einmalig  (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (110, 29, 15, N'29,90 € einmalig')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (111, 29, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">Surfstick </div><div class="body text-body">Ab nur 19 Cent ins Internet<br><br> 3 Euro Startguthaben </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,90 € </div><div class="spacer"></div><div class="bl text-tiny tar"> einmalig  (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (112, 30, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 34,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (113, 30, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-100"><div class="title"><div class="inner">100 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 100 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 34,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (114, 30, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 100 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 34,99€.<br>Downstream: 100.000 kbit/s und Upstream: 10.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">34,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (115, 31, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (116, 31, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-250"><div class="title"><div class="inner">250 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 250 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 39,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (117, 31, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 250 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 39,99€.<br>Downstream: 250.000 kbit/s und Upstream: 12.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (118, 32, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 44,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (119, 32, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-500"><div class="title"><div class="inner">500 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 500 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 44,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (120, 32, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 500 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 44,99€.<br>Downstream: 500.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">44,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (121, 33, 15, N'1-6 Monat: 9,99 €;ab Monat 7: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (122, 33, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-50"><div class="title"><div class="inner">50 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 50 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">9, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 29,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (123, 33, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 50 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 9,99€. <br>Ab dem 7. Monat 29,99€.<br>Downstream: 50.000 kbit/s und Upstream: 5.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (124, 34, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (125, 34, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-1000"><div class="title"><div class="inner">1000 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 1000 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 49,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (126, 34, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 1000 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 49,99€.<br>Downstream: 1000.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (127, 35, 15, N'1-24 Monat: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (128, 35, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet-Flat Go Young</div><div class="body text-body"><br>3+4+1 GB monatliches Datenvolumen + Gratis LTE-100 Option</div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (129, 36, 15, N'1-24 Monat: 9,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (130, 36, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Basic 24 Monate</div><div class="body text-body">24  Monate<br><br>1 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (131, 37, 15, N'+14,99 € Giga TV Cable')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (132, 37, 17, N'<div class="thumb thumb-blister kabel" blister-action="tv-giga-cable"><div class="title"><div class="inner">GigaTV Cable</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div> ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (133, 37, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Dein Kunde zahlt 9,99 € in den ersten 6 Monaten<br>Ab dem 7. Monat bezahlt Dein Kunde 14,99 €. Vodafone GigaTV Cable Box zur Nutzung überlassen. Vodafone Premium Cable: 2 Gratismonate, ab dem 3. Monat 9,99 €. Achtung: Es darf nur eine GigaTV Bestellung pro Kunde getätigt werden. Wenn eine GigaTV 4K Box gebucht wurde, kann der Kunde gleichzeitig auf 2 mobilen Endgeräten Inhalte nutzen.</div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (134, 38, 15, N'+7,99 € Vodafone TV Cable')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (135, 38, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button" Vodafone TV Cable ></div><div class="body text-body">7,99€/Monat. Vodafone Digital HD-Recorder zur Nutzung überlassen. Mindestlaufzeit 24 Monate. Vodafone Premium Cable: 2 Gratismonate, ab dem 3. Monat 9,99 €.</div><div class="spacer-line"></div><div class="bl text-h2 tar">7,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (136, 39, 15, N'14,99 € in den ersten 6 Monaten. Ab dem 7. Monat 19,99 € ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (137, 39, 17, N'<div class="thumb thumb-blister kabel" blister-action="tv-giga-cable-premium"><div class="title"><div class="inner">GigaTV inkl. VF Premium</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (138, 39, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV inklusive HD Premium Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Ihr Kunde zahlt 14,99 € in den ersten 6 Monaten<br>Ab dem 7. Monat bezahlt Dein Kunde 19,99 € </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (139, 40, 15, N'+19,99 € Vodafone TV Connect')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (140, 40, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button" TV Connect></div><div class="body text-body">19,99€/Monat. Mindestlaufzeit 24 Monate. Alle frei empfangbaren TV- und Radioprogramme.</div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (141, 41, 15, N'1-6 Monat: 9,99 €, ab Monat 7: 14,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (142, 41, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-6m"><div class="title"><div class="inner">GigaTV Net</div></div><div class="subtitle "><div class="inner">24 Monate</div></div><div class="teaser"><div class="inner">Bis zu 62 TV-Sender in SD und 40 in HD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">9, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 14,99€ statt 9,99€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (143, 41, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Net (6 Monate)></div><div class="body text-body">1.- 6. Monat 9,99 €; ab 7. Monat 14,99. Mindestlaufzeit 24 Monate. GigaTV Net Box zur Nutzung überlassen. Vodafone Premium: 2 Gratismonate, ab dem 3. Monat 9,99 €.</div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (144, 42, 15, N'24,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (145, 43, 15, N'34,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (146, 44, 15, N'34,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (147, 45, 15, N'44,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (148, 46, 15, N'74,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (149, 47, 15, N'1-24 Monat: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (150, 47, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaCable Max 1000></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Downstream: 1.000.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (151, 48, 15, N'20,- € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (152, 49, 15, N'15,- € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (153, 50, 15, N'5,- € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (154, 51, 15, N'10,- € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (155, 52, 15, N'1-24 Monat: 19,99 €;ab Monat 25: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (156, 52, 17, N'<div class="thumb thumb-blister kabel" blister-action="RSA2N"><div class="title"><div class="inner">50 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 50 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 25. Monat 29,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (157, 52, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 50 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 24 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 25. Monat 29,99€.<br>Downstream: 50.000 kbit/s und Upstream: 5.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (158, 53, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (159, 53, 17, N'<div class="thumb thumb-blister kabel" blister-action="RLA2N"><div class="title"><div class="inner">250 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 250 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 39,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (160, 53, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 250 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 39,99€.<br>Downstream: 250.000 kbit/s und Upstream: 12.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Durchschnittspreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (161, 54, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 44,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (162, 54, 17, N'<div class="thumb thumb-blister kabel" blister-action="RXA2N"><div class="title"><div class="inner">500 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 500 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 44,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (163, 54, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 500 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 44,99€.<br>Downstream: 500.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">44,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (164, 55, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (165, 55, 17, N'<div class="thumb thumb-blister kabel" blister-action="RGA2N"><div class="title"><div class="inner">1000 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 1000 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 49,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (166, 55, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 1000 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 49,99€.<br>Downstream: 1000.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (167, 56, 15, N'29,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (168, 56, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone Zuhause Festnetz Flat</div><div class="body text-body">Flat in das Dt. Festnetz<br>Sollte Dein Kunde eine Rufnummerportierung wünschen, vernanlasse dies über das InfoDok 105<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (169, 57, 15, N'+ 3,99 € Vodafone Basic TV Cable')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (170, 57, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Vodafone Basic TV Cable></div><div class="body text-body"><br>3,99€/Monat zuzüglich HW. 24 Monate Mindestlaufzeit. Vodafone Premium Cable: 2 Gratismonate, ab dem 3. Monat 9,99 €.</div><div class="spacer-line"></div><div class="bl text-h2 tar">3,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (171, 58, 15, N'+ 3,99 € Vodafone Basic TV Cable 4KE')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (172, 58, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Vodafone Basic TV Cable></div><div class="body text-body"><br>3,99€/Monat zuzüglich HW. Mindestlaufzeit 24 Monate. Vodafone Premium Cable: 2 Gratismonate, ab dem 3. Monat 9,99 €. Angebot bei Bestellung zusammen mit Vodafone TV Connect Pro in VVO.</div><div class="spacer-line"></div><div class="bl text-h2 tar">3,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (173, 59, 15, N'+19,99 € GigaTV Cable inklusive VF Premium')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (174, 59, 17, N'<div class="thumb thumb-blister kabel" blister-action="tv-giga-vtv-premium"><div class="title"><div class="inner">GigaTV inkl. VF Premium</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (175, 59, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV inklusive HD Premium Cable></div><div class="body text-body">1.-6. Monat 14,99 €; ab 7. Monat 19,99€. Mindestlaufzeit 24 Monate. GigaTV Cable Box 2 und GigaTV Hard Drive zur Nutzung überlassen. Vodafone Premium Cable inklusive. Giga TV App inklusive.</div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (176, 60, 15, N'1-6 Monat: 19,99 €;ab Monat 7: 34,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (177, 60, 17, N'<div class="thumb thumb-blister kabel" blister-action="RMA2N"><div class="title"><div class="inner">100 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 100 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 34,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (178, 60, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 100 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Dein Kunde 19,99€. <br>Ab dem 7. Monat 34,99€.<br>Downstream: 100.000 kbit/s und Upstream: 10.000 kbit/s<br>Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste. </div><div class="spacer-line"></div><div class="bl text-h2 tar">34,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (179, 61, 15, N'+19,99€ GigaTV mit Apple TV')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (180, 61, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-appletv-2fm"><div class="title"><div class="inner">GigaTV mit Apple TV</div></div><div class="subtitle "><div class="inner">1 Monat</div></div><div class="teaser"><div class="inner">Bis zu 62 TV-Sender in SD und 40 in HD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">19, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>  ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (181, 61, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Net (1 Monat)></div><div class="body text-body">1.-6. Monat 9,99€; ab 7. Monat 19,99€. 4 Monate Mindestlaufzeit. Apple TV 4K zur Nutzung überlassen. Vodafone Premium: 2 Gratismonate, ab dem 3. Monat 9,99 €.<br><br> </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (182, 62, 15, N'0,00 € in den ersten 12 Monaten. Ab dem 13. Monat 14,99 € ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (183, 62, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable Promo></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Ihr Kunde zahlt 0,00 € in den ersten 12 Monaten<br>Ab dem 13. Monat bezahlt Dein Kunde 14,99 € </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (184, 63, 15, N'4,99 € in den ersten 12 Monaten. Ab dem 13. Monat 19,99 € ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (185, 63, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV inklusive Vodafone Premium Promo></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Ihr Kunde zahlt 4,99 € in den ersten 12 Monaten<br>Ab dem 13. Monat bezahlt Dein Kunde 19,99 € </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (186, 64, 15, N'1-24 Monat: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (187, 64, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaCable Max 1000></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Downstream: 1.000.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (188, 65, 15, N'1,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (189, 65, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech S</div><div class="body text-body">Tarif für Smart Tracker. Die Mindestvertragslaufzeit beträgt 24 Monate. 500MB Datenvolumen mit 500Kbit/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 150Kbit/s. EU-Roaming inklusive.<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">1,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (190, 66, 15, N'2,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (191, 66, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech S Flex</div><div class="body text-body">Tarif für Smart Tracker. Die Mindestvertragslaufzeit beträgt 1 Monat und ist monatlich kündbar. 500MB Datenvolumen mit 500Kbit/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 150Kbit/s. EU-Roaming inklusive.<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">2,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (192, 67, 15, N'5,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (193, 67, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech M</div><div class="body text-body">Tarif für Smart Watches. Die Mindestvertragslaufzeit beträgt 24 Monate. 3GB Datenvolumen mit 25Mbits/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 150Kbit/s. 500 Sprachminuten, 100 SMS inklusive (Folgepreise: 0,09€/Sprachminute, 0,09€/SMS). EU-Roaming inklusive.<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">5,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (194, 68, 15, N'6,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (195, 68, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech M Flex</div><div class="body text-body">Tarif für Smart Watches. Die Mindestvertragslaufzeit beträgt 1 Monat und ist monatlich kündbar. 3GB Datenvolumen mit 25Mbits/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 150Kbit/s. 500 Sprachminuten, 100 SMS inklusive (Folgepreise: 0,09€/Sprachminute, 0,09€/SMS). EU-Roaming inklusive.<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">6,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (196, 69, 15, N'9,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (197, 69, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech L</div><div class="body text-body">Tarif für Smart Cameras. Die Mindestvertragslaufzeit beträgt 24 Monate. 20GB Datenvolumen mit 25Mbits/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 1,5Mbit/s. EU-Roaming auf 7GB begrenzt (Fair-Use-Policy).<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (198, 70, 15, N'10,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (199, 70, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Smart Tech L Flex</div><div class="body text-body">Tarif für Smart Cameras. Die Mindestvertragslaufzeit beträgt 1 Monat und ist monatlich kündbar. 20GB Datenvolumen mit 25Mbits/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 1,5Mbit/s. EU-Roaming auf 7GB begrenzt (Fair-Use-Policy).<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">10,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (200, 71, 15, N'1-6 Monat: 0,00€ ;ab Monat 7: 49,99€')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (201, 71, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-1000-att"><div class="title"><div class="inner">1000 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 1000 Mbit/s  im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">49, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">1-6 Monat 0,00€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (202, 71, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 1000 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Ihr Kunde 0,00€. <br>Ab dem 7. Monat 49,99€.<br>Das Bereitstellungsentgelt entfällt.<br>Downstream: 1.000.000 kbit/s und Upstream: 50.000 kbit/s<br> Flat ins dt. Festnetz <br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (203, 72, 15, N'1-6 Monat: 0,00€ ;ab Monat 7: 44,99€')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (204, 72, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-500-att"><div class="title"><div class="inner">500 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 500 Mbit/s  im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">44, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">1-6 Monat 0,00€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (205, 72, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 500 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Ihr Kunde 0,00€. <br>Ab dem 7. Monat 44,99€.<br>Das Bereitstellungsentgelt entfällt.<br>Downstream: 500.000 kbit/s und Upstream: 50.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">44,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (206, 73, 15, N'1-6 Monat: 0,00€ ;ab Monat 7: 39,99€')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (207, 73, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-250-att"><div class="title"><div class="inner">250 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 250 Mbit/s  im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">39, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">1-6 Monat 0,00€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (208, 73, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 250 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Ihr Kunde 0,00€. <br>Ab dem 7. Monat 39,99€.<br>Das Bereitstellungsentgelt entfällt.<br>Downstream: 250.000 kbit/s und Upstream: 12.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (209, 74, 15, N'1-6 Monat: 0,00€ ;ab Monat 7: 34,99€')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (210, 74, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-100-att"><div class="title"><div class="inner">100 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 100 Mbit/s  im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">34, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">1-6 Monat 0,00€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (211, 74, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 100 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Ihr Kunde 0,00€. <br>Ab dem 7. Monat 34,99€.<br>Das Bereitstellungsentgelt entfällt.<br>Downstream: 100.000 kbit/s und Upstream: 10.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">34,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (212, 75, 15, N'1-6 Monat: 0,00€ ;ab Monat 7: 29,99€')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (213, 75, 17, N'<div class="thumb thumb-blister kabel" blister-action="kip-50-att"><div class="title"><div class="inner">50 Cable</div></div><div class="subtitle "><div class="inner">RED INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 50 Mbit/s  im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">29, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">1-6 Monat 0,00€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (214, 75, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"Red Internet & Phone 50 Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>In den ersten 6 Monaten<br> bezahlt Ihr Kunde 0,00€. <br>Ab dem 7. Monat 29,99€.<br>Das Bereitstellungsentgelt entfällt.<br>Downstream: 50.000 kbit/s und Upstream: 4.000 kbit/s<br>Flat ins dt. Festnetz<br>Gespräche ins dt. Mobilfunknetz 19,9 ct/Min <br>Gepräche ins Ausland lt. Preisliste </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (215, 76, 15, N'INFO MISSING')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (216, 76, 17, N'<div class="thumb thumb-blister kabel" blister-action="tv-giga-vtv-netflix"><div class="title"><div class="inner">GigaTV Cable inkl. Netflix</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div> ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (217, 76, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable></div><div class="body text-body">Changes in portfolio for November Main Release </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (218, 77, 15, N'INFO MISSING')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (219, 77, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-netflix-6m"><div class="title"><div class="inner">GigaTV inkl. Netflix</div></div><div class="subtitle "><div class="inner">TV</div></div><div class="teaser"><div class="inner">Bis zu 98 TV-Sender in SD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">14, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div> ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (220, 77, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable></div><div class="body text-body">Changes in portfolio for November Main Release </div><div class="spacer-line"></div><div class="bl text-h2 tar">14,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (221, 78, 15, N'1-24 Monat: 9,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (222, 78, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi otelo"></div></div><div class="col-md-10"><div class="title text-button">otelo Allnet Start</div><div class="body text-body">24  Monate<br><br>1+4 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">9,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (223, 79, 15, N'1-12 Monat: 9,99 €;13-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (224, 79, 17, N'<div class="thumb thumb-blister dsl" blister-action="PK_INTP_DSL16_1016"><div class="title"><div class="inner">RED 16</div></div><div class="subtitle "><div class="inner">INTERNET &amp PHONE</div></div><div class="teaser"><div class="inner">Bis 16 Mbit/s im Download</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">9,</td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 13. Monat 29,99€</div> </div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (225, 79, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Red Internet & Phone 16 DSL</div><div class="body text-body">DSL Internet-Flat<br>Bandbreite DSL 16000 <br>In den ersten 12 Monaten 9,99 €, danach 29,99€. <br><br>Basis-Anschluss oder <br>Komfort-Anschluss. </div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (226, 79, 5, N'internetFlat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (227, 79, 6, N'IP068')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (228, 79, 7, N'I1203')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (229, 79, 8, N'voice')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (230, 79, 9, N'Festnetz-Flat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (231, 79, 10, N'VP068')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (232, 79, 11, N'VI202')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (233, 79, 12, N'Red Internet & Phone 16 DSL')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (234, 79, 13, N'24m')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (235, 80, 15, N'9,99 € in den ersten 12 Monaten. Ab dem 7. Monat 14,99 € ')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (236, 80, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Cable></div><div class="body text-body">Die Mindestvertragslaufzeit beträgt 24 Monate.<br>Dein Kunde zahlt 9,99 € in den ersten 6 Monaten<br>Ab dem 7. Monat bezahlt Dein Kunde 14,99 € </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (237, 81, 15, N'alle 4 Wochen: 0,0 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (238, 81, 17, N'<div blister-action="HC5_15_9V" class="thumb thumb-blister vf" id="HC5_15_9V"><div class = "title"><div class = "inner">CallYa</div> </div> <div class = "subtitle "> <div class = "inner">PREPAID</div> </div> <div class = "teaser"> <div class = "inner">0 GB Datenvolumen</div> </div> <div class = "price"> <table ><tbody ><tr ><td rowspan = "2" class="price-unit">0, </td> <td class = "price-subunit">00</td> </tr> <tr ><td class = "price-desc">/4Wochen</td> </tr> </tbody> </table> </div> <div class = "icon iicon red arrow-blister"> </div> </div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (239, 81, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">Vodafone CallYa</div><div class="body text-body">Die Tarife haben keine feste Laufzeit und keine Vertragsbindung <br><br>CallYa-Tarife mit Inklusiv-Einheiten für Telefonie und SMS oder Allnet Flat und unterschiedlich hohem Highspeed-Datenvolumen für mobiles Surfen.</div><div class="spacer-line"></div><div class="bl text-h2 tar">0,00 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">alle 4 Wochen (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (240, 82, 15, N'1-6 Monat 0,00€. Ab 7.Monat +19,99€ GigaTV mit Apple TV')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (241, 82, 17, N'<div class="thumb thumb-blister kabel" blister-action="gigatv-net-appletv-6fm"><div class="title"><div class="inner">GigaTV mit Apple TV</div></div><div class="subtitle "><div class="inner">1 Monat</div></div><div class="teaser"><div class="inner">Bis zu 62 TV-Sender in SD und 40 in HD</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">0, </td><td class="price-subunit">00</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table><div class="blisterAditionalText">ab 7. Monat 19,99€</div></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (242, 82, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button"GigaTV Net (1 Monat)></div><div class="body text-body">1.-6. Monat 0,00€; ab 7. Monat 19,99€. 4 Monate Mindestlaufzeit. Apple TV 4K zur Nutzung überlassen. Vodafone Premium: 6 Gratismonate für alle GigaKombi TV berechtigten Mobilfunk Neu- sowie Bestandskunden (ab Red XS/ Young M/ Smart L).<br><br> </div><div class="spacer-line"></div><div class="bl text-h2 tar">19,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (243, 83, 15, N'5,99 € pro Monat')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (244, 83, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">SmartTech OneNumber</div><div class="body text-body">Tarif für Smart Watches. Die Mindestvertragslaufzeit beträgt 24 Monate. 3GB Datenvolumen mit 25Mbits/s Datenspeed. Nach Aufbrauchen des Datenvolumens, Drosselung auf 150Kbit/s. 500 Sprachminuten, 100 SMS inklusive (Folgepreise: 0,09€/Sprachminute, 0,09€/SMS). EU-Roaming inklusive.<br></div><div class="spacer-line"></div><div class="bl text-h2 tar">5,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (245, 84, 15, N'1-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (246, 84, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil XS</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>5 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (247, 85, 15, N'1-24 Monat: 39,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (248, 85, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil S</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>12 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">39,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (249, 86, 15, N'1-24 Monat: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (250, 86, 17, N'<div class="thumb thumb-blister vf" blister-action="GM1M"><div class="title"><div class="inner">GigaMobil M</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">25GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">49, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (251, 86, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil M</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>25 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (252, 87, 15, N'1-24 Monat: 59,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (253, 87, 17, N'<div class="thumb thumb-blister vf" blister-action="GM1L"><div class="title"><div class="inner">GigaMobil L</div></div><div class="subtitle "><div class="inner">ALLNET-FLAT</div></div><div class="teaser"><div class="inner">50GB Datenvolumen</div></div><div class="price"><table><tbody><tr><td rowspan="2" class="price-unit">59, </td><td class="price-subunit">99</td></tr><tr><td class="price-desc">/ MTL.</td></tr></tbody></table></div><div class="icon iicon red arrow-blister"></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (254, 87, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil L</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>50 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">59,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (255, 88, 15, N'1-24 Monat: 79,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (256, 88, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil XL</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>Unbegrenztes monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">79,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (257, 89, 15, N'1-24 Monat: 24,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (258, 89, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil Young S</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>10 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">24,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (259, 90, 15, N'1-24 Monat: 29,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (260, 90, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil Young M</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>30 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">29,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (261, 91, 15, N'1-24 Monat: 37,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (262, 91, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil Young L</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>50 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">37,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (263, 92, 15, N'1-24 Monat: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (264, 92, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil Young L+</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>80 GB monatliches Datenvolumen</div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (265, 93, 15, N'1-24 Monat: 69,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (266, 93, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil Young XL</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>Unbegrenztes monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">69,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (267, 94, 15, N'1-12 Monat: 49,99 €')
GO
INSERT [dbo].[ProductProperties] ([Id], [ProductId], [PropertyId], [Value]) VALUES (268, 94, 21, N'<div class="oe-tooltip"><div class="product tal"><div class="container"><div class="row"><div class="np col-md-2"><div class="brandi vf"></div></div><div class="col-md-10"><div class="title text-button">GigaMobil S - 12 Monatstarif</div><div class="body text-body">Flat in alle Dt. Netze<br>EU-Flat <br>SMS-Flat <br><br>12 GB monatliches Datenvolumen </div><div class="spacer-line"></div><div class="bl text-h2 tar">49,99 € Basispreis</div><div class="spacer"></div><div class="bl text-tiny tar">Monatlich (inkl. MWSt)</div><div class="nba dn">$</div></div></div></div></div></div>')
GO
SET IDENTITY_INSERT [dbo].[ProductProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (1, N'Vodafone Smart L aba hallo', 1, N'SM2L')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (2, N'Vodafone Smart L+ ', 1, N'SM2LP')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (3, N'Vodafone Smart XL ', 1, N'SM2XL')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (4, N'Red Internet & Phone 16 DSL', 4, N'PK_INTP_DSL16_1016')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (5, N'Red Internet & Phone 50 DSL', 4, N'PK_INTP_DSL50_1016')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (6, N'Red Internet & Phone 100 DSL', 4, N'PK_INTP_DSL100_1016')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (7, N'Red Internet & Phone 250 DSL', 4, N'PK_INTP_DSL250_1016')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (8, N'otelo Internet-Flat Maxi 24 Monate', 2, N'1')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (9, N'otelo Internet-Flat 24 Monate', 2, N'2')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (10, N'otelo Allnet-Flat Classic', 2, N'3')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (11, N'otelo Allnet-Flat Comfort ', 2, N'4')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (12, N'otelo Allnet-Flat Max', 2, N'5')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (13, N'Allnet-Flat Classic Young', 2, N'37')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (14, N'otelo Allnet-Flat Go', 2, N'55')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (15, N'Allnet-Flat Comfort Young', 2, N'76')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (16, N'Allnet-Flat Max Young', 2, N'77')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (17, N'Vodafone DataGo S', 1, N'MBBV_S')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (18, N'Vodafone DataGo M', 1, N'MBBV_M')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (19, N'Vodafone DataGo L', 1, N'MBBV_L')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (20, N'Vodafone DataGo XL', 1, N'MBBV_XL')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (21, N'GigaTV Net', 3, N'gigatv-net-1m')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (22, N'GigaTV Net', 3, N'gigatv-net-24m')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (23, N'Vodafone TV Cable', 3, N'tv-dvr-neu')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (24, N'GigaTV Cable', 3, N'tv-giga-wechselgarantie')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (25, N'Smart S', 2, N'8')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (26, N'Smart XL', 2, N'9')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (27, N'Surf-Sim', 2, N'10')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (28, N'Handy-Karte', 2, N'7')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (29, N'Surf-Stick', 2, N'11')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (30, N'Red Internet & Phone 100 Cable', 3, N'kip-100')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (31, N'Red Internet & Phone 250 Cable', 3, N'kip-250')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (32, N'Red Internet & Phone 500 Cable', 3, N'kip-500')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (33, N'Red Internet & Phone 50 Cable', 3, N'kip-50')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (34, N'Red Internet & Phone 1000 Cable', 3, N'kip-1000')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (35, N'otelo Allnet-Flat Go Young', 2, N'75')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (36, N'otelo Basic 24 Mon', 2, N'21')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (37, N'GigaTV Cable', 3, N'tv-giga-cable')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (38, N'Vodafone TV Cable', 3, N'tv-vodafone')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (39, N'GigaTV inklusive HD Premium Cable', 3, N'tv-giga-cable-premium')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (40, N'TV Connect', 3, N'tv-connect')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (41, N'GigaTV Net 6 Monate', 3, N'gigatv-net-6m')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (42, N'Vodafone GigaCube Mini', 1, N'GC19MIN')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (43, N'Vodafone GigaCube Flex', 1, N'GC19WP')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (44, N'Vodafone GigaCube', 1, N'GC19WOP')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (45, N'Vodafone GigaCube Max', 1, N'GC19MAX')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (46, N'Vodafone GigaCube Pro', 1, N'GC19PRO')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (47, N'Vodafone CableMax 1000', 3, N'kip-1000-cablemax')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (48, N'Vodafone Red+ Allnet', 1, N'REPL2AL')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (49, N'Vodafone Red+ Allnet Basic', 1, N'REPL2AU')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (50, N'Vodafone Red+ Data', 1, N'REPL2D')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (51, N'Vodafone Red+ Kids', 1, N'REPL2K')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (52, N'Red Internet & Phone 50 Cable U', 5, N'RSA2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (53, N'Red Internet & Phone 250 Cable U', 5, N'RLA2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (54, N'Red Internet & Phone 500 Cable U', 5, N'RXA2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (55, N'Red Internet & Phone 1000 Cable U', 5, N'RGA2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (56, N'Vodafone Zuhause Festznetz Flat', 1, N'VFZH24FFN')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (57, N'Vodafone Basic TV Cable', 3, N'tv-basic')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (58, N'Vodafone Basic TV Cable', 3, N'tv-basic-vvo')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (59, N'GigaTV Cable inklusive Vodafone Premium', 3, N'tv-giga-vtv-premium')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (60, N'Red Internet & Phone 100 Cable U', 5, N'RMA2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (61, N'GigaTV mit Apple TV', 3, N'gigatv-net-appletv-2fm')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (62, N'GigaTV Cable EM Promo', 3, N'tv-giga-cable-emp')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (63, N'GigaTV Cable Vodafone Premium EM Promo', 3, N'tv-giga-vtv-premium-emp')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (64, N'Vodafone CableMax 1000', 5, N'CMG2N')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (65, N'Smart Tech S', 1, N'CIOT2S')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (66, N'Smart Tech S Flex', 1, N'CIOT2SF')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (67, N'Smart Tech M', 1, N'CIOT2M')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (68, N'Smart Tech M Flex', 1, N'CIOT2MF')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (69, N'Smart Tech L', 1, N'CIOT2L')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (70, N'Smart Tech L Flex', 1, N'CIOT2LF')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (71, N'Red Internet & Phone 1000 Cable ATT', 3, N'kip-1000-att')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (72, N'Red Internet & Phone 500 Cable ATT', 3, N'kip-500-att')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (73, N'Red Internet & Phone 250 Cable ATT', 3, N'kip-250-att')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (74, N'Red Internet & Phone 100 Cable ATT', 3, N'kip-100-att')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (75, N'Red Internet & Phone 50 Cable ATT', 3, N'kip-50-att')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (76, N'GigaTV Cable inkl. Netflix', 3, N'tv-giga-vtv-netflix')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (77, N'GigaTV inkl. Netflix', 3, N'gigatv-net-netflix-6m')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (78, N'otelo Allnet Start', 2, N'6')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (79, N'Red Internet & Phone 16 DSL Regiozuschlag', 4, N'PK_INTP_DSL16_1016!1')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (80, N'Vodafone Giga TV Cable', 3, N'tv-giga-vtv')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (81, N'CallYa', 1, N'HC5_15_9V')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (82, N'GigaTV Net mit AppleTV 6 Monate gratis für GigaKombiTV-Kunden', 3, N'gigatv-net-appletv-6fm')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (83, N'SmartTech OneNumber', 1, N'CIOT2F')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (84, N'GigaMobil XS', 1, N'GM1XS')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (85, N'GigaMobil S', 1, N'GM1S')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (86, N'GigaMobil M', 1, N'GM1M')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (87, N'GigaMobil L', 1, N'GM1L')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (88, N'GigaMobil XL', 1, N'GM1UL')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (89, N'GigaMobil Young S', 1, N'GMY1S')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (90, N'GigaMobil Young M', 1, N'GMY1M')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (91, N'GigaMobil Young L', 1, N'GMY1L')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (92, N'GigaMobil Young L+', 1, N'GMY1LP')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (93, N'GigaMobil Young XL', 1, N'GMY1UL')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (94, N'GigaMobil S 12 M', 1, N'GM112S')
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [Key]) VALUES (95, N'Vodafone Smart ALABALA', 1, N'SM2L')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (1, 0, N'Root')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (2, 1, N'Product')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (3, 2, N'Ordering')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (4, 3, N'i_product_offeringCode')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (5, 3, N'i_productOfferingName')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (6, 3, N'i_priceName')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (7, 3, N'i_priceType')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (8, 3, N'v_productOfferingCode')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (9, 3, N'v_productOfferingName')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (10, 3, N'v_priceName')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (11, 3, N'v_priceType')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (12, 3, N'productOfferingName')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (13, 3, N'minimum_contract_duration')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (14, 2, N'UI')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (15, 14, N'extra')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (16, 14, N'name')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (17, 14, N'blister')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (18, 14, N'tooltip')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (19, 18, N'type')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (20, 18, N'style')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (21, 18, N'body')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (22, 14, N'availability')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (23, 22, N'category')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (24, 22, N'description')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (25, 1, N'Option')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (26, 25, N'UI')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (27, 26, N'extra')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (28, 26, N'tooltip')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (29, 28, N'body')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (30, 26, N'name')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (31, 1, N'Hardware')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (32, 31, N'UI')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (33, 32, N'extra')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (34, 32, N'tooltip')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (35, 34, N'body')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (36, 32, N'name')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (37, 31, N'XML')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (38, 37, N'type')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (39, 37, N'subentionsIndicator')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (40, 37, N'serviceCode')
GO
INSERT [dbo].[Properties] ([Id], [ParentId], [Name]) VALUES (41, 37, N'rented')
GO
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
/****** Object:  Index [IX_ProductProperties_ProductId]    Script Date: 24/07/2022 17:40:33 ******/
CREATE NONCLUSTERED INDEX [IX_ProductProperties_ProductId] ON [dbo].[ProductProperties]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductProperties_PropertyId]    Script Date: 24/07/2022 17:40:33 ******/
CREATE NONCLUSTERED INDEX [IX_ProductProperties_PropertyId] ON [dbo].[ProductProperties]
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 24/07/2022 17:40:33 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [BrandId]
GO
ALTER TABLE [dbo].[ProductProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProductProperties_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductProperties] CHECK CONSTRAINT [FK_ProductProperties_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProductProperties_Properties_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Properties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductProperties] CHECK CONSTRAINT [FK_ProductProperties_Properties_PropertyId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brand_BrandId]
GO
USE [master]
GO
ALTER DATABASE [tt] SET  READ_WRITE 
GO
