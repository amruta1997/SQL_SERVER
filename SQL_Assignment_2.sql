USE [master]
GO
/****** Object:  Database [BIKESTORE]    Script Date: 18-10-2019 18:16:39 ******/
CREATE DATABASE [BIKESTORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIKESTORE', FILENAME = N'D:\Amruta_Lahore\SQL\BIKESTORE.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BIKESTORE_log', FILENAME = N'D:\Amruta_Lahore\SQL\BIKESTORE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BIKESTORE] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIKESTORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIKESTORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIKESTORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIKESTORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIKESTORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIKESTORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIKESTORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIKESTORE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BIKESTORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIKESTORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIKESTORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIKESTORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIKESTORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIKESTORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIKESTORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIKESTORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIKESTORE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIKESTORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIKESTORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIKESTORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIKESTORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIKESTORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIKESTORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIKESTORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIKESTORE] SET RECOVERY FULL 
GO
ALTER DATABASE [BIKESTORE] SET  MULTI_USER 
GO
ALTER DATABASE [BIKESTORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIKESTORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIKESTORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIKESTORE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BIKESTORE]
GO
/****** Object:  Schema [production]    Script Date: 18-10-2019 18:16:40 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 18-10-2019 18:16:40 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  StoredProcedure [dbo].[USP_DIVIDE]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DIVIDE]
@A DECIMAL,
@B DECIMAL,
@C DECIMAL OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @C = @A/@B;
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS 'ERROR NUMBER',
		ERROR_MESSAGE() AS 'ERROR MESSAGE',
		ERROR_LINE() AS 'LINE NUMBER',
		ERROR_PROCEDURE() AS 'ESP NAME'
	END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_FINDPRODUCT_PRODUCT_BY_LISTPRICE]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FINDPRODUCT_PRODUCT_BY_LISTPRICE]
@LISTPRICE NUMERIC(10,2)
AS
BEGIN
	SELECT * FROM production.products
	WHERE list_price = @LISTPRICE ORDER BY list_price
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTLIST]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PRODUCTLIST]
----DECLARE PARAMETERS------
AS
BEGIN
----BODY OF SP--------------
SELECT * FROM production.products ORDER BY product_name
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_SAVE_BRANDS]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SAVE_BRANDS]

@BRAND_NAME		VARCHAR(50)
AS
BEGIN
	INSERT INTO production.brands(brand_name) VALUES(@BRAND_NAME)
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_SAVE_CATEGORIE]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SAVE_CATEGORIE]
@CAT_NAME		VARCHAR(50),
@CAT_COUNT		INT OUTPUT
AS
BEGIN
	INSERT INTO production.categories(category_name) VALUES(@CAT_NAME)
	SELECT @CAT_COUNT = COUNT(*) FROM production.categories
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_SAVE_CATEGORIES]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SAVE_CATEGORIES]
@CAT_NAME		VARCHAR(50)
AS
BEGIN
	INSERT INTO production.categories(category_name) VALUES(@CAT_NAME)
END;
GO
/****** Object:  UserDefinedFunction [sales].[UDF_NETSALE]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [sales].[UDF_NETSALE](
 @QUANTITY		INT,
 @LIST_PRICE	DEC(10,2)
 )
 RETURNS DEC(10,2)
 AS
 BEGIN
	RETURN @QUANTITY * @LIST_PRICE
END
GO
/****** Object:  Table [dbo].[MEMBERS]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEMBERS](
	[MEMID] [int] NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[PROID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MEMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MYORDER]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MYORDER](
	[MYORDERID] [int] NOT NULL,
	[CUSTNAME] [varchar](50) NOT NULL,
	[PRO_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MYORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MYPRODUCT]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MYPRODUCT](
	[PRO_ID] [int] NOT NULL,
	[NAME] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECTS]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECTS](
	[PROID] [int] NOT NULL,
	[TITLE] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PROID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[brands]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[categories]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[products]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[stocks]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[customers]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[order_items]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[orders]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[staffs]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[stores]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_1]    Script Date: 18-10-2019 18:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        sales.order_items.product_id, production.brands.brand_id
FROM            production.brands INNER JOIN
                         production.products ON production.brands.brand_id = production.products.brand_id INNER JOIN
                         sales.order_items ON production.products.product_id = sales.order_items.product_id

GO
ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[MEMBERS]  WITH CHECK ADD FOREIGN KEY([PROID])
REFERENCES [dbo].[PROJECTS] ([PROID])
GO
ALTER TABLE [dbo].[MYORDER]  WITH CHECK ADD FOREIGN KEY([PRO_ID])
REFERENCES [dbo].[MYPRODUCT] ([PRO_ID])
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "brands (production)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "order_items (sales)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "products (production)"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [BIKESTORE] SET  READ_WRITE 
GO
