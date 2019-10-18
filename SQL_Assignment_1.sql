USE [master]
GO
/****** Object:  Database [BIKEDEMO]    Script Date: 18-10-2019 10:27:21 ******/
CREATE DATABASE [BIKEDEMO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIKEDEMO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BIKEDEMO.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BIKEDEMO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BIKEDEMO_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BIKEDEMO] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIKEDEMO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIKEDEMO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIKEDEMO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIKEDEMO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIKEDEMO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIKEDEMO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIKEDEMO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIKEDEMO] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BIKEDEMO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIKEDEMO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIKEDEMO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIKEDEMO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIKEDEMO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIKEDEMO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIKEDEMO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIKEDEMO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIKEDEMO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BIKEDEMO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIKEDEMO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIKEDEMO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIKEDEMO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIKEDEMO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIKEDEMO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIKEDEMO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIKEDEMO] SET RECOVERY FULL 
GO
ALTER DATABASE [BIKEDEMO] SET  MULTI_USER 
GO
ALTER DATABASE [BIKEDEMO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIKEDEMO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIKEDEMO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIKEDEMO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BIKEDEMO]
GO
/****** Object:  Schema [PRODUCTION]    Script Date: 18-10-2019 10:27:21 ******/
CREATE SCHEMA [PRODUCTION]
GO
/****** Object:  Schema [SALES]    Script Date: 18-10-2019 10:27:21 ******/
CREATE SCHEMA [SALES]
GO
/****** Object:  Table [PRODUCTION].[BRANDS]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[BRANDS](
	[BRAND_ID] [int] NOT NULL,
	[BRAND_NAME] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BRAND_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[CATEGORIES]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[CATEGORIES](
	[CATEGORY_ID] [int] NOT NULL,
	[CATEGORY_NAME] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[PRODUCTS]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[PRODUCTS](
	[PRODUCCT_ID] [int] NOT NULL,
	[PRODUCT_NAME] [varchar](50) NULL,
	[BRAND_ID] [int] NULL,
	[CATEGORY_ID] [int] NULL,
	[MODEL_YEAR] [int] NULL,
	[LIST_PRICE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PRODUCCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[STOCKS]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PRODUCTION].[STOCKS](
	[STORE_ID] [int] NULL,
	[PRODUCCT_ID] [int] NULL,
	[QUANTITY] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [SALES].[CUSTOMER]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[CUSTOMER](
	[CUSTOMER_ID] [int] NOT NULL,
	[FIRST_NAME] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[PHONE] [varchar](10) NULL,
	[EMAIL] [varchar](50) NULL,
	[STREET] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[ZIP_CODE] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[ORDER_ITEM]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SALES].[ORDER_ITEM](
	[ORDER_ID] [int] NULL,
	[ITEM_ID] [int] NOT NULL,
	[PRODUCCT_ID] [int] NULL,
	[QUANTITY] [int] NULL,
	[LIST_PRICE] [int] NULL,
	[DISCOUNT] [int] NULL,
	[ITEMS_AMOUNT]  AS ([QUANTITY]*[lIST_PRICE]-[DISCOUNT]),
PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SALES].[ORDERS]    Script Date: 18-10-2019 10:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[ORDERS](
	[ORDER_ID] [int] NOT NULL,
	[CUSTOMER_ID] [int] NULL,
	[ORDER_STATUS] [varchar](50) NULL,
	[ORDER_DATE] [varchar](50) NULL,
	[REQUIRED_DATE] [date] NULL,
	[SHIPPED_DATE] [date] NULL,
	[STORE_ID] [int] NULL,
	[STAFF_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[STAFFS]    Script Date: 18-10-2019 10:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[STAFFS](
	[STAFF_ID] [int] NOT NULL,
	[FIRST_NAME] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[PHONE] [varchar](10) NULL,
	[ACTIVE] [varchar](50) NULL,
	[STORE_ID] [int] NULL,
	[MANAGER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[STAFF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[STORES]    Script Date: 18-10-2019 10:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[STORES](
	[STORE_ID] [int] NOT NULL,
	[STORE_NAME] [varchar](50) NULL,
	[PHONE] [varchar](10) NULL,
	[EMAIL] [varchar](50) NULL,
	[STREET] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[ZIP_CODE] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[STORE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [PRODUCTION].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK_BRAND_ID] FOREIGN KEY([BRAND_ID])
REFERENCES [PRODUCTION].[BRANDS] ([BRAND_ID])
GO
ALTER TABLE [PRODUCTION].[PRODUCTS] CHECK CONSTRAINT [FK_BRAND_ID]
GO
ALTER TABLE [PRODUCTION].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORY_ID] FOREIGN KEY([CATEGORY_ID])
REFERENCES [PRODUCTION].[CATEGORIES] ([CATEGORY_ID])
GO
ALTER TABLE [PRODUCTION].[PRODUCTS] CHECK CONSTRAINT [FK_CATEGORY_ID]
GO
ALTER TABLE [PRODUCTION].[STOCKS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCCT_ID] FOREIGN KEY([PRODUCCT_ID])
REFERENCES [PRODUCTION].[PRODUCTS] ([PRODUCCT_ID])
GO
ALTER TABLE [PRODUCTION].[STOCKS] CHECK CONSTRAINT [FK_PRODUCCT_ID]
GO
ALTER TABLE [PRODUCTION].[STOCKS]  WITH CHECK ADD  CONSTRAINT [FK_STORES_ID] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORES] ([STORE_ID])
GO
ALTER TABLE [PRODUCTION].[STOCKS] CHECK CONSTRAINT [FK_STORES_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ID] FOREIGN KEY([ORDER_ID])
REFERENCES [SALES].[ORDERS] ([ORDER_ID])
GO
ALTER TABLE [SALES].[ORDER_ITEM] CHECK CONSTRAINT [FK_ORDER_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_ID] FOREIGN KEY([PRODUCCT_ID])
REFERENCES [PRODUCTION].[PRODUCTS] ([PRODUCCT_ID])
GO
ALTER TABLE [SALES].[ORDER_ITEM] CHECK CONSTRAINT [FK_PRODUCT_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_CUST_ID] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [SALES].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_CUST_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_STAFF_ID] FOREIGN KEY([STAFF_ID])
REFERENCES [SALES].[STAFFS] ([STAFF_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_STAFF_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_STORE_ID] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORES] ([STORE_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_STORE_ID]
GO
ALTER TABLE [SALES].[STAFFS]  WITH CHECK ADD  CONSTRAINT [FK_ST_ID] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORES] ([STORE_ID])
GO
ALTER TABLE [SALES].[STAFFS] CHECK CONSTRAINT [FK_ST_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEM]  WITH CHECK ADD CHECK  (([LIST_PRICE]>(0)))
GO
ALTER TABLE [SALES].[ORDER_ITEM]  WITH CHECK ADD CHECK  (([QUANTITY]>(0)))
GO
USE [master]
GO
ALTER DATABASE [BIKEDEMO] SET  READ_WRITE 
GO
