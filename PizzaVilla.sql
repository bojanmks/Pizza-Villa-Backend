USE [master]
GO
/****** Object:  Database [PizzaVilla]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE DATABASE [PizzaVilla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaVilla', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PizzaVilla.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PizzaVilla_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PizzaVilla_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PizzaVilla] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaVilla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaVilla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaVilla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaVilla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaVilla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaVilla] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaVilla] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaVilla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaVilla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaVilla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaVilla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaVilla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaVilla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaVilla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaVilla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaVilla] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzaVilla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaVilla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaVilla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaVilla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaVilla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaVilla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaVilla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaVilla] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaVilla] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaVilla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaVilla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaVilla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaVilla] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PizzaVilla] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzaVilla] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PizzaVilla] SET QUERY_STORE = OFF
GO
USE [PizzaVilla]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11.06.2022. 20:51:54 ******/
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
/****** Object:  Table [dbo].[Addons]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Addons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Identity] [nvarchar](50) NOT NULL,
	[UseCaseName] [nvarchar](50) NOT NULL,
	[ExecutionDateTime] [datetime2](7) NOT NULL,
	[IsAuthorized] [bit] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[Amount] [int] NOT NULL,
	[OrderId] [int] NULL,
	[ProductPriceWhenOrdered] [decimal](18, 2) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartAddons]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartAddons](
	[CartId] [int] NOT NULL,
	[AddonId] [int] NOT NULL,
	[PriceWhenOrdered] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CartAddons] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[AddonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartIngredients]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartIngredients](
	[CartId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[PriceWhenOrdered] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CartIngredients] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NOT NULL,
	[OccuredAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveredAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsIngredients]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsIngredients](
	[ProductId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
 CONSTRAINT [PK_ProductsIngredients] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersUseCases]    Script Date: 11.06.2022. 20:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UsersUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220611122325_initial', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220611180850_RenamedThePriceWhenOrderedColumnInCartToProductPriceWhenOrdered', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Addons] ON 
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Ketchup', CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702112' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Mushrooms', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702142' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Oregano', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702138' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Mustard', CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702131' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Pepperoni', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702127' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (6, N'Eggs', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702124' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Pineapple', CAST(1.49 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702120' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Addons] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Mayonnaise', CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4702117' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Addons] OFF
GO
SET IDENTITY_INSERT [dbo].[AuditLog] ON 
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (3, NULL, N'Anonymous', N'Create initial data (Ef)', CAST(N'2022-06-11T12:28:27.0416167' AS DateTime2), 1, N'{"Ingredients":[{"Name":"Marinara sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Olive oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Basil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Oregano","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"San Marzano tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mozzarella di bufala","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mozzarella","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Onions","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Spinach","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Salt","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Pepper","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Egg","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Riccota","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Red peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mustard","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Pat","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Salami","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Meatballs","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Spicy tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Pepperoni","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Green chili pepper slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mushrooms","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mozzarella cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Bacon","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Basil oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Tomatoes","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Avocado slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mexican cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Ground beef","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Black beans","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Corn","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Hot chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Sour cream","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Refried beans","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Cumin","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Cheddar cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Green peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Gilantro","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Taco seasoning","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Red sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Red chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Longaniza (Spanish sausage)","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Condensed milk","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Chocolate powder","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Strawberry slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"White cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Guava marmalade","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}],"Products":[{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Margherita","Price":15.99,"Image":"margherita.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Aglio e olio","Price":20.99,"Image":"aglio_e_olio.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Cipolla","Price":21.99,"Image":"cipolla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"California Style","Price":16.99,"Image":"california.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Meatball","Price":23.99,"Image":"meatball.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Sicilian","Price":18.99,"Image":"sicilian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Avocado","Price":20.99,"Image":"avocado.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"A la Parrilla","Price":20.99,"Image":"a_la_parilla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Canchera","Price":18.99,"Image":"canchera.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Longaniza","Price":19.99,"Image":"longaniza.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Brigadeiro","Price":17.99,"Image":"brigadeiro.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mussarela","Price":18.99,"Image":"mussarela.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Romeu e Julieta","Price":20.99,"Image":"romeu_e_julieta.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}],"Categories":[{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}],"ProductsIngredients":[{"ProductId":0,"IngredientId":0,"Product":{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Marinara sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Olive oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Basil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Marinara","Price":18.99,"Image":"marinara.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Oregano","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Margherita","Price":15.99,"Image":"margherita.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Olive oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Margherita","Price":15.99,"Image":"margherita.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"San Marzano tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Margherita","Price":15.99,"Image":"margherita.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Neapolitan pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella di bufala","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Aglio e olio","Price":20.99,"Image":"aglio_e_olio.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Aglio e olio","Price":20.99,"Image":"aglio_e_olio.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Olive oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Aglio e olio","Price":20.99,"Image":"aglio_e_olio.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Cipolla","Price":21.99,"Image":"cipolla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Oregano","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Cipolla","Price":21.99,"Image":"cipolla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Cipolla","Price":21.99,"Image":"cipolla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Cipolla","Price":21.99,"Image":"cipolla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Onions","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Spinach","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Salt","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pepper","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Egg","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Spinaci e Uovo","Price":17.99,"Image":"spinaci_e_uovo.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Italian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Olive oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"California Style","Price":16.99,"Image":"california.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Riccota","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"California Style","Price":16.99,"Image":"california.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Red peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"California Style","Price":16.99,"Image":"california.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mustard","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"California Style","Price":16.99,"Image":"california.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pat","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Meatball","Price":23.99,"Image":"meatball.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pat","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Meatball","Price":23.99,"Image":"meatball.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Salami","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Meatball","Price":23.99,"Image":"meatball.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Meatball","Price":23.99,"Image":"meatball.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Sicilian","Price":18.99,"Image":"sicilian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Sicilian","Price":18.99,"Image":"sicilian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"American pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Spicy tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Onions","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pepperoni","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Green chili pepper slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"All-dressed","Price":18.99,"Image":"all_dressed.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mushrooms","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pepperoni","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mushrooms","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canadian Pizza","Price":17.99,"Image":"canadian.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Bacon","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Basil oil","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Avocado","Price":20.99,"Image":"avocado.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomatoes","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Avocado","Price":20.99,"Image":"avocado.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Avocado slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Avocado","Price":20.99,"Image":"avocado.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mexican cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomatoes","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Ground beef","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Black beans","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Corn","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Hot chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Onions","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Pepper","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Salt","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Chili con Carne Style","Price":18.99,"Image":"chili_con_carne_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Sour cream","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Ground beef","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomatoes","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Refried beans","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Cumin","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Sour cream","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Cheddar cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Onions","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Green peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Gilantro","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Avocado slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Taco seasoning","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Taco Style","Price":17.99,"Image":"taco_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Mexican pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Salt","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"A la Parrilla","Price":20.99,"Image":"a_la_parilla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Red sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"A la Parrilla","Price":20.99,"Image":"a_la_parilla.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canchera","Price":18.99,"Image":"canchera.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canchera","Price":18.99,"Image":"canchera.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Garlic","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Canchera","Price":18.99,"Image":"canchera.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Red peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Longaniza","Price":19.99,"Image":"longaniza.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomatoes","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Longaniza","Price":19.99,"Image":"longaniza.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Red chili peppers","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Longaniza","Price":19.99,"Image":"longaniza.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Argentinean pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Longaniza (Spanish sausage)","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Brigadeiro","Price":17.99,"Image":"brigadeiro.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Condensed milk","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Brigadeiro","Price":17.99,"Image":"brigadeiro.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Chocolate powder","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Brigadeiro","Price":17.99,"Image":"brigadeiro.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Strawberry slices","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Mussarela","Price":18.99,"Image":"mussarela.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Tomato sauce","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Mussarela","Price":18.99,"Image":"mussarela.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Mozzarella","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Mussarela","Price":18.99,"Image":"mussarela.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Oregano","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Romeu e Julieta","Price":20.99,"Image":"romeu_e_julieta.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Brazilian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"White cheese","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}},{"ProductId":0,"IngredientId":0,"Product":{"Name":"Toronto Style","Price":19.99,"Image":"toronto_style.webp","CategoryId":0,"DeletedAt":null,"DeletedBy":null,"Category":{"Name":"Canadian pizza","Products":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredients":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},"Ingredient":{"Name":"Guava marmalade","Price":0.99,"Products":[],"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}}],"Addons":[{"Name":"Ketchup","Price":0.0,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mayonnaise","Price":0.0,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Pineapple","Price":1.49,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Eggs","Price":0.99,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Pepperoni","Price":0.99,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mustard","Price":0.0,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Oregano","Price":0.99,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Name":"Mushrooms","Price":0.99,"CartItems":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}],"Users":[{"Email":"admin@gmail.com","Password":"$2a$11$v547TsdI9/2nbOVFfQGyIOwnHH45dWOLaAyUmglhEp0Qb9iuO3VsW","Username":"admin01","DeletedAt":null,"DeletedBy":null,"CartItems":[],"Orders":[],"UseCases":[{"UserId":0,"UseCaseId":1,"User":null},{"UserId":0,"UseCaseId":2,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":5,"User":null},{"UserId":0,"UseCaseId":6,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":8,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":12,"User":null},{"UserId":0,"UseCaseId":13,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":15,"User":null},{"UserId":0,"UseCaseId":16,"User":null},{"UserId":0,"UseCaseId":17,"User":null},{"UserId":0,"UseCaseId":18,"User":null},{"UserId":0,"UseCaseId":19,"User":null},{"UserId":0,"UseCaseId":20,"User":null},{"UserId":0,"UseCaseId":21,"User":null},{"UserId":0,"UseCaseId":22,"User":null},{"UserId":0,"UseCaseId":23,"User":null},{"UserId":0,"UseCaseId":24,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":26,"User":null},{"UserId":0,"UseCaseId":27,"User":null},{"UserId":0,"UseCaseId":28,"User":null},{"UserId":0,"UseCaseId":29,"User":null},{"UserId":0,"UseCaseId":30,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":32,"User":null},{"UserId":0,"UseCaseId":33,"User":null},{"UserId":0,"UseCaseId":34,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null},{"UserId":0,"UseCaseId":37,"User":null},{"UserId":0,"UseCaseId":38,"User":null},{"UserId":0,"UseCaseId":39,"User":null},{"UserId":0,"UseCaseId":40,"User":null},{"UserId":0,"UseCaseId":41,"User":null},{"UserId":0,"UseCaseId":42,"User":null},{"UserId":0,"UseCaseId":43,"User":null},{"UserId":0,"UseCaseId":44,"User":null},{"UserId":0,"UseCaseId":45,"User":null},{"UserId":0,"UseCaseId":46,"User":null}],"AuditLog":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null},{"Email":"user@gmail.com","Password":"$2a$11$WiI61jw4w29AyewcfDL39.jr4UtZaDfGoqoAXTOOmOA8W.VDbyn6O","Username":"user01","DeletedAt":null,"DeletedBy":null,"CartItems":[],"Orders":[],"UseCases":[{"UserId":0,"UseCaseId":37,"User":null},{"UserId":0,"UseCaseId":2,"User":null},{"UserId":0,"UseCaseId":44,"User":null},{"UserId":0,"UseCaseId":39,"User":null},{"UserId":0,"UseCaseId":41,"User":null},{"UserId":0,"UseCaseId":47,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":36,"User":null},{"UserId":0,"UseCaseId":1,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":24,"User":null},{"UserId":0,"UseCaseId":38,"User":null},{"UserId":0,"UseCaseId":23,"User":null},{"UserId":0,"UseCaseId":40,"User":null}],"AuditLog":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"UpdatedAt":null,"UpdatedBy":null}],"Id":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (4, 1, N'admin01', N'Get Use Cases (Reflection)', CAST(N'2022-06-11T12:28:56.3422868' AS DateTime2), 1, N'{"Keyword":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (5, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:01:27.6437740' AS DateTime2), 1, N'{"ProductId":14,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (6, 1, N'admin01', N'Get Cart (Ef)', CAST(N'2022-06-11T17:01:40.0934855' AS DateTime2), 1, N'{"Keyword":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (7, 1, N'admin01', N'Set Cart Amount (Ef)', CAST(N'2022-06-11T17:01:58.6556112' AS DateTime2), 1, N'{"Amount":15,"Id":1}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (8, 1, N'admin01', N'Set Cart Amount (Ef)', CAST(N'2022-06-11T17:02:08.4377409' AS DateTime2), 1, N'{"Amount":10,"Id":1}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (9, 1, N'admin01', N'Get Cart (Ef)', CAST(N'2022-06-11T17:02:11.3546531' AS DateTime2), 1, N'{"Keyword":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (10, 1, N'admin01', N'Increase Cart Amount (Ef)', CAST(N'2022-06-11T17:02:25.4853421' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (11, 1, N'admin01', N'Decrease Cart Amount (Ef)', CAST(N'2022-06-11T17:02:33.5131677' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (12, 1, N'admin01', N'Get Cart (Ef)', CAST(N'2022-06-11T17:02:36.8425539' AS DateTime2), 1, N'{"Keyword":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (13, 1, N'admin01', N'Increase Cart Amount (Ef)', CAST(N'2022-06-11T17:02:44.3302137' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (14, 1, N'admin01', N'Set Cart Amount (Ef)', CAST(N'2022-06-11T17:02:47.9918252' AS DateTime2), 1, N'{"Amount":1,"Id":1}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (15, 1, N'admin01', N'Decrease Cart Amount (Ef)', CAST(N'2022-06-11T17:02:50.2067829' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (16, 1, N'admin01', N'Set Cart Amount (Ef)', CAST(N'2022-06-11T17:02:59.1800844' AS DateTime2), 1, N'{"Amount":10,"Id":1}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (17, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:03:03.2296192' AS DateTime2), 1, N'{"ProductId":14,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (18, 1, N'admin01', N'Decrease Cart Amount (Ef)', CAST(N'2022-06-11T17:03:13.2781233' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (19, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:03:17.9969818' AS DateTime2), 1, N'{"ProductId":14,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (20, 1, N'admin01', N'Get Cart (Ef)', CAST(N'2022-06-11T17:03:20.3271589' AS DateTime2), 1, N'{"Keyword":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (21, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T17:03:36.8241367' AS DateTime2), 1, N'{"DeliveryAddress":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (22, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T17:04:04.4260812' AS DateTime2), 1, N'{"DeliveryAddress":"3344 W Alameda Avenue, Lakewood, CO 80222"}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (23, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:04:10.8192054' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (24, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:04:57.0259137' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (25, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:05:21.2736073' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (26, 1, N'admin01', N'Mark Order as Delivered (Ef)', CAST(N'2022-06-11T17:05:37.2994387' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (27, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:05:40.2027061' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (28, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:06:08.6007131' AS DateTime2), 1, N'{"ProductId":16,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (29, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T17:06:23.5782975' AS DateTime2), 1, N'{"DeliveryAddress":"3344 W Alameda Avenue, Lakewood, CO 80222"}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (30, 1, N'admin01', N'Delete Order (Ef)', CAST(N'2022-06-11T17:06:34.8336269' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (31, 1, N'admin01', N'Delete Order (Ef)', CAST(N'2022-06-11T17:06:41.3740111' AS DateTime2), 1, N'2')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (32, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:06:45.8288869' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (33, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:06:48.8290622' AS DateTime2), 1, N'2')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (34, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:07:13.4643477' AS DateTime2), 1, N'1')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (35, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:07:17.1665335' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (36, 1, N'admin01', N'Get Use Cases (Reflection)', CAST(N'2022-06-11T17:07:49.6622033' AS DateTime2), 1, N'{"Keyword":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (37, 2, N'user01', N'Get Use Cases (Reflection)', CAST(N'2022-06-11T17:08:09.3425753' AS DateTime2), 0, N'{"Keyword":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (38, 2, N'user01', N'Get Products (Ef)', CAST(N'2022-06-11T17:08:16.2271464' AS DateTime2), 1, N'{"Keyword":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (39, 2, N'user01', N'Find Product (Ef)', CAST(N'2022-06-11T17:08:23.7594990' AS DateTime2), 1, N'6')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (40, 2, N'user01', N'Find Product for Administrators (Ef)', CAST(N'2022-06-11T17:08:29.0299412' AS DateTime2), 0, N'6')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (41, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:46:59.6283684' AS DateTime2), 1, N'{"ProductId":16,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (42, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:47:24.1766886' AS DateTime2), 1, N'{"ProductId":null,"IngredientsIds":null,"AddonsIds":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (43, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T17:50:06.4486760' AS DateTime2), 1, N'{"ProductId":null,"IngredientsIds":[16,17,18],"AddonsIds":[4,6]}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (44, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T17:51:08.5022983' AS DateTime2), 1, N'{"DeliveryAddress":"3344 W Alameda Avenue, Lakewood, CO 80222"}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (45, 2, N'user01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:51:17.1316911' AS DateTime2), 0, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (46, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T17:51:39.7661408' AS DateTime2), 1, N'{"DeliveryAddress":"3344 W Alameda Avenue, Lakewood, CO 80222"}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (47, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:51:55.1779157' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (48, 2, N'user01', N'Get Cart (Ef)', CAST(N'2022-06-11T17:52:50.7985956' AS DateTime2), 1, N'{"Keyword":null}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (49, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T17:53:05.3574356' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (50, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T17:53:19.3862202' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (51, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T18:01:43.3471261' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (52, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T18:11:38.9797915' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (53, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T18:12:43.9432264' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (54, 1, N'admin01', N'Mark Order as Delivered (Ef)', CAST(N'2022-06-11T18:48:54.6549535' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (55, 1, N'admin01', N'Find Order (Ef)', CAST(N'2022-06-11T18:48:59.3851365' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (56, 1, N'admin01', N'Delete Order (Ef)', CAST(N'2022-06-11T18:49:15.9476275' AS DateTime2), 1, N'3')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (57, 1, N'admin01', N'Add Item To Cart (Ef)', CAST(N'2022-06-11T18:50:11.5744600' AS DateTime2), 1, N'{"ProductId":16,"IngredientsIds":null,"AddonsIds":[4,3]}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (58, 1, N'admin01', N'Create Order (Ef)', CAST(N'2022-06-11T18:50:27.8106128' AS DateTime2), 1, N'{"DeliveryAddress":"3344 W Alameda Avenue, Lakewood, CO 80222"}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (59, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T18:50:32.7877669' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (60, 1, N'admin01', N'Delete Order (Ef)', CAST(N'2022-06-11T18:50:40.4196298' AS DateTime2), 1, N'4')
GO
INSERT [dbo].[AuditLog] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (61, 1, N'admin01', N'Get Orders (Ef)', CAST(N'2022-06-11T18:50:43.3422158' AS DateTime2), 1, N'{"DateFrom":null,"DateTo":null,"PerPage":null,"Page":null,"ToSkip":0}')
GO
SET IDENTITY_INSERT [dbo].[AuditLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Amount], [OrderId], [ProductPriceWhenOrdered], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, 1, 16, 1, 3, CAST(17.99 AS Decimal(18, 2)), CAST(N'2022-06-11T17:47:03.2306249' AS DateTime2), 1, CAST(N'2022-06-11T17:51:08.8235289' AS DateTime2), N'admin01')
GO
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Amount], [OrderId], [ProductPriceWhenOrdered], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, 1, NULL, 1, 3, NULL, CAST(N'2022-06-11T17:50:09.6250278' AS DateTime2), 1, CAST(N'2022-06-11T17:51:08.8237594' AS DateTime2), N'admin01')
GO
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [Amount], [OrderId], [ProductPriceWhenOrdered], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, 1, 16, 1, 4, CAST(17.99 AS Decimal(18, 2)), CAST(N'2022-06-11T18:50:11.8070371' AS DateTime2), 1, CAST(N'2022-06-11T18:50:27.9072078' AS DateTime2), N'admin01')
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartAddons] ([CartId], [AddonId], [PriceWhenOrdered]) VALUES (4, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartAddons] ([CartId], [AddonId], [PriceWhenOrdered]) VALUES (4, 6, CAST(0.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartAddons] ([CartId], [AddonId], [PriceWhenOrdered]) VALUES (5, 3, CAST(0.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartAddons] ([CartId], [AddonId], [PriceWhenOrdered]) VALUES (5, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartIngredients] ([CartId], [IngredientId], [PriceWhenOrdered]) VALUES (4, 16, CAST(0.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartIngredients] ([CartId], [IngredientId], [PriceWhenOrdered]) VALUES (4, 17, CAST(0.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartIngredients] ([CartId], [IngredientId], [PriceWhenOrdered]) VALUES (4, 18, CAST(0.99 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (1, N'Serialization and deserialization of ''System.Type'' instances are not supported and should be avoided since they can lead to security issues. Path: $.PropertyType.', N'   at System.Text.Json.ThrowHelper.ThrowNotSupportedException(WriteStack& state, NotSupportedException ex)
   at System.Text.Json.Serialization.JsonConverter`1.WriteCore(Utf8JsonWriter writer, T& value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.Serialization.JsonConverter`1.WriteCoreAsObject(Utf8JsonWriter writer, Object value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.JsonSerializer.WriteCore[TValue](JsonConverter jsonConverter, Utf8JsonWriter writer, TValue& value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.JsonSerializer.WriteAsyncCore[TValue](Stream utf8Json, TValue value, Type inputType, JsonSerializerOptions options, CancellationToken cancellationToken)
   at Microsoft.AspNetCore.Mvc.Formatters.SystemTextJsonOutputFormatter.WriteResponseBodyAsync(OutputFormatterWriteContext context, Encoding selectedEncoding)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|29_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T12:36:15.9801303' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (2, N'Validation failed: 
 -- Amount: You can''t have more than 10 items in your cart. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Cart.EfSetCartAmountCommand.Execute(SetCartAmountDto request) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Cart\EfSetCartAmountCommand.cs:line 35
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.CartController.SetAmount(Int32 id, Int32 amount, ISetCartAmountCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\CartController.cs:line 126
   at lambda_method609(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:02:02.9760825' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (3, N'Validation failed: 
 -- : You can''t have any more items in your cart. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Cart.EfIncreaseCartAmount.Execute(Int32 id) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Cart\EfIncreaseCartAmount.cs:line 34
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.CartController.IncreaseAmount(Int32 id, IIncreaseCartAmountCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\CartController.cs:line 79
   at lambda_method676(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:02:28.1711138' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (4, N'Validation failed: 
 -- : Amount can''t be lower than 1. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Cart.EfDecreaseCartAmountCommand.Execute(Int32 id) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Cart\EfDecreaseCartAmountCommand.cs:line 33
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.CartController.DecreaseAmount(Int32 id, IDecreaseCartAmountCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\CartController.cs:line 99
   at lambda_method681(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:02:53.0365667' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (5, N'Validation failed: 
 -- : You can''t have any more items in your cart. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Cart.EfAddItemToCartCommand.Execute(AddItemToCartDto request) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Cart\EfAddItemToCartCommand.cs:line 43
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.CartController.Post(AddItemToCartDto data, IAddItemToCartCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\CartController.cs:line 59
   at lambda_method130(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:03:05.5270703' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (6, N'Validation failed: 
 -- DeliveryAddress: Delivery Address is requred. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Orders.EfCreateOrderCommand.Execute(CreateOrderDto request) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Orders\EfCreateOrderCommand.cs:line 38
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.OrdersController.Post(CreateOrderDto data, ICreateOrderCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 100
   at lambda_method720(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:03:39.1982807' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (7, N'Validation failed: 
 -- Id: That order has already been delivered. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Orders.EfDeleteOrderCommand.Execute(Int32 id) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Orders\EfDeleteOrderCommand.cs:line 30
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.OrdersController.Delete(Int32 id, IDeleteOrderCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 140
   at lambda_method805(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:06:38.1196591' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (8, N'Entity of type Order with an id of 2 was not found.', N'   at PizzaVilla.Implementation.UseCases.Queries.Ef.Orders.EfFindOrderQuery.Execute(Int32 id) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Queries\Ef\Orders\EfFindOrderQuery.cs:line 34
   at PizzaVilla.Implementation.UseCaseHandler.HandleQuery[TRequest,TResponse](IQuery`2 query, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 69
   at PizzaVilla.Api.Controllers.OrdersController.Get(Int32 id, IFindOrderQuery query) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 59
   at lambda_method278(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:07:04.6395560' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (9, N'User user01 has tried to execute Get Use Cases (Reflection) without authorization.', N'   at PizzaVilla.Implementation.UseCaseHandler.HandleLoggingAndAuthorization[TRequest](IUseCase useCase, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 92
   at PizzaVilla.Implementation.UseCaseHandler.HandleQuery[TRequest,TResponse](IQuery`2 query, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 67
   at PizzaVilla.Api.Controllers.UseCasesController.Get(BasePagedSearch search, IGetUseCasesQuery query) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\UseCasesController.cs:line 40
   at lambda_method890(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:08:11.4758375' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (10, N'User user01 has tried to execute Find Product for Administrators (Ef) without authorization.', N'   at PizzaVilla.Implementation.UseCaseHandler.HandleLoggingAndAuthorization[TRequest](IUseCase useCase, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 92
   at PizzaVilla.Implementation.UseCaseHandler.HandleQuery[TRequest,TResponse](IQuery`2 query, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 67
   at PizzaVilla.Api.Controllers.ProductsController.Get(Int32 id, IFindProductAdminQuery query) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\ProductsController.cs:line 99
   at lambda_method1052(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:08:32.5129916' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (11, N'Validation failed: 
 -- : You can either create an order for an existing product, or an order without a product and at least 2 but no more than 10 ingredients. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Cart.EfAddItemToCartCommand.Execute(AddItemToCartDto request) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Cart\EfAddItemToCartCommand.cs:line 43
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.CartController.Post(AddItemToCartDto data, IAddItemToCartCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\CartController.cs:line 59
   at lambda_method19(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:47:29.1737301' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (12, N'User user01 has tried to execute Get Orders (Ef) without authorization.', N'   at PizzaVilla.Implementation.UseCaseHandler.HandleLoggingAndAuthorization[TRequest](IUseCase useCase, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 92
   at PizzaVilla.Implementation.UseCaseHandler.HandleQuery[TRequest,TResponse](IQuery`2 query, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 67
   at PizzaVilla.Api.Controllers.OrdersController.Get(PagedDateSearch search, IGetOrdersQuery query) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 43
   at lambda_method794(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:51:25.2454420' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (13, N'Validation failed: 
 -- : Your cart is empty. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Orders.EfCreateOrderCommand.Execute(CreateOrderDto request) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Orders\EfCreateOrderCommand.cs:line 38
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.OrdersController.Post(CreateOrderDto data, ICreateOrderCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 100
   at lambda_method370(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T17:51:46.6961381' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [OccuredAt]) VALUES (14, N'Validation failed: 
 -- Id: That order has already been delivered. Severity: Error', N'   at FluentValidation.AbstractValidator`1.RaiseValidationException(ValidationContext`1 context, ValidationResult result) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 538
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 220
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /Users/jskinner/code/FluentValidation/src/FluentValidation/AbstractValidator.cs:line 151
   at FluentValidation.DefaultValidatorExtensions.Validate[T](IValidator`1 validator, T instance, Action`1 options) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 39
   at FluentValidation.DefaultValidatorExtensions.ValidateAndThrow[T](IValidator`1 validator, T instance) in /Users/jskinner/code/FluentValidation/src/FluentValidation/DefaultValidatorExtensions_Validate.cs:line 62
   at PizzaVilla.Implementation.UseCases.Commands.Ef.Orders.EfDeleteOrderCommand.Execute(Int32 id) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCases\Commands\Ef\Orders\EfDeleteOrderCommand.cs:line 30
   at PizzaVilla.Implementation.UseCaseHandler.HandleCommand[TRequest](ICommand`1 command, TRequest data) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Implementation\UseCaseHandler.cs:line 37
   at PizzaVilla.Api.Controllers.OrdersController.Delete(Int32 id, IDeleteOrderCommand command) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Controllers\OrdersController.cs:line 140
   at lambda_method803(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at PizzaVilla.Api.Core.GlobalExceptionHandler.Invoke(HttpContext httpContext) in D:\Sve\ASP\PizzaVilla\PizzaVilla.Api\Core\GlobalExceptionHandler.cs:line 28', CAST(N'2022-06-11T18:49:20.5698437' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Green peppers', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701761' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Cheddar cheese', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701758' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Cumin', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701754' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Refried beans', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701750' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Marinara sauce', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4700765' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (6, N'Hot chili peppers', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701743' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Black beans', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701736' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Gilantro', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701764' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (9, N'Sour cream', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701747' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (10, N'Taco seasoning', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701768' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (11, N'Chili peppers', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701782' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (12, N'Red chili peppers', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701775' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (13, N'Longaniza (Spanish sausage)', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701778' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (14, N'Ground beef', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701731' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (15, N'Condensed milk', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701785' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Chocolate powder', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701789' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (17, N'Strawberry slices', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701792' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (18, N'White cheese', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701796' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (19, N'Guava marmalade', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701799' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (20, N'Red sauce', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701771' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (21, N'Mexican cheese', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701727' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (22, N'Corn', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701740' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (23, N'Tomatoes', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701720' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (24, N'Garlic', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701610' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (25, N'Olive oil', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701618' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (26, N'Basil', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701622' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (27, N'Oregano', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701625' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (28, N'San Marzano tomato sauce', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701629' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (29, N'Mozzarella di bufala', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701633' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (30, N'Tomato sauce', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701638' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (31, N'Mozzarella', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701641' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (32, N'Onions', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701644' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (33, N'Spinach', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701648' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (34, N'Avocado slices', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701723' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (35, N'Pepper', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701655' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (36, N'Egg', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701658' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (37, N'Riccota', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701662' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (38, N'Salt', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701652' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (39, N'Mustard', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701670' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (40, N'Pat', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701673' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (41, N'Salami', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701678' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (42, N'Meatballs', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701682' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (43, N'Cheese', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701685' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (44, N'Basil oil', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701715' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (45, N'Bacon', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701709' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (46, N'Mozzarella cheese', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701705' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (47, N'Mushrooms', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701702' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (48, N'Green chili pepper slices', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701699' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (49, N'Red peppers', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701666' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (50, N'Pepperoni', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701694' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [Price], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (51, N'Spicy tomato sauce', CAST(0.99 AS Decimal(18, 2)), CAST(N'2022-06-11T12:28:30.4701689' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [UserId], [TotalPrice], [DeliveryAddress], [DeliveredAt], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, 1, CAST(36.95 AS Decimal(18, 2)), N'3344 W Alameda Avenue, Lakewood, CO 80222', CAST(N'2022-06-11T18:48:54.9649953' AS DateTime2), NULL, NULL, CAST(N'2022-06-11T17:51:08.8235271' AS DateTime2), 1, CAST(N'2022-06-11T18:48:54.9736437' AS DateTime2), N'admin01')
GO
INSERT [dbo].[Orders] ([Id], [UserId], [TotalPrice], [DeliveryAddress], [DeliveredAt], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, 1, CAST(18.98 AS Decimal(18, 2)), N'3344 W Alameda Avenue, Lakewood, CO 80222', NULL, CAST(N'2022-06-11T18:50:40.4318854' AS DateTime2), N'admin01', CAST(N'2022-06-11T18:50:27.9072059' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Argentinean pizza', CAST(N'2022-06-11T12:28:30.4701824' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Mexican pizza', CAST(N'2022-06-11T12:28:30.4701821' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Canadian pizza', CAST(N'2022-06-11T12:28:30.4701815' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, N'American pizza', CAST(N'2022-06-11T12:28:30.4701812' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Italian pizza', CAST(N'2022-06-11T12:28:30.4701808' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (6, N'Neapolitan pizza', CAST(N'2022-06-11T12:28:30.4701804' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[ProductCategories] ([Id], [Name], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Brazilian pizza', CAST(N'2022-06-11T12:28:30.4701827' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Marinara', CAST(18.99 AS Decimal(18, 2)), N'marinara.webp', 6, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701832' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Romeu e Julieta', CAST(20.99 AS Decimal(18, 2)), N'romeu_e_julieta.webp', 7, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701909' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Mussarela', CAST(18.99 AS Decimal(18, 2)), N'mussarela.webp', 7, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701906' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Brigadeiro', CAST(17.99 AS Decimal(18, 2)), N'brigadeiro.webp', 7, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701902' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Canchera', CAST(18.99 AS Decimal(18, 2)), N'canchera.webp', 1, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701894' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (6, N'A la Parrilla', CAST(20.99 AS Decimal(18, 2)), N'a_la_parilla.webp', 1, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701890' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Taco Style', CAST(17.99 AS Decimal(18, 2)), N'taco_style.webp', 2, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701886' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Chili con Carne Style', CAST(18.99 AS Decimal(18, 2)), N'chili_con_carne_style.webp', 2, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701883' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (9, N'Avocado', CAST(20.99 AS Decimal(18, 2)), N'avocado.webp', 2, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701879' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (10, N'Toronto Style', CAST(19.99 AS Decimal(18, 2)), N'toronto_style.webp', 3, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701874' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (11, N'Longaniza', CAST(19.99 AS Decimal(18, 2)), N'longaniza.webp', 1, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701897' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (12, N'All-dressed', CAST(18.99 AS Decimal(18, 2)), N'all_dressed.webp', 3, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701867' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (13, N'Sicilian', CAST(18.99 AS Decimal(18, 2)), N'sicilian.webp', 4, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701864' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (14, N'Meatball', CAST(23.99 AS Decimal(18, 2)), N'meatball.webp', 4, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701860' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (15, N'California Style', CAST(16.99 AS Decimal(18, 2)), N'california.webp', 4, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701856' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Spinaci e Uovo', CAST(17.99 AS Decimal(18, 2)), N'spinaci_e_uovo.webp', 5, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701853' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (17, N'Cipolla', CAST(21.99 AS Decimal(18, 2)), N'cipolla.webp', 5, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701847' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (18, N'Aglio e olio', CAST(20.99 AS Decimal(18, 2)), N'aglio_e_olio.webp', 5, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701842' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (19, N'Margherita', CAST(15.99 AS Decimal(18, 2)), N'margherita.webp', 6, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701837' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [CategoryId], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (20, N'Canadian Pizza', CAST(17.99 AS Decimal(18, 2)), N'canadian.webp', 3, NULL, NULL, CAST(N'2022-06-11T12:28:30.4701870' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 1)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 2)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 3)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 4)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (1, 5)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 6)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 7)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 8)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 9)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 9)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 10)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 11)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (11, 12)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (11, 13)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 14)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 14)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (4, 15)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (4, 16)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (4, 17)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (2, 18)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (10, 19)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (6, 20)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (9, 21)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 22)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 23)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 23)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (9, 23)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (11, 23)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (1, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (5, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (10, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (18, 24)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (1, 25)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 25)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (18, 25)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (19, 25)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (1, 26)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (1, 27)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (3, 27)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (17, 27)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (19, 28)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (19, 29)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (3, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (5, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (10, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (13, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (14, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (17, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (18, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (20, 30)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (3, 31)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (10, 31)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 31)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (17, 31)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 32)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 32)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (12, 32)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (17, 32)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 33)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 34)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (9, 34)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 35)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 35)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 36)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (15, 37)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (7, 38)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (8, 38)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (16, 38)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (15, 39)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (14, 40)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (15, 40)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (14, 41)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (6, 43)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (13, 43)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (14, 43)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (10, 44)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (20, 45)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (20, 46)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (12, 47)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (20, 47)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (12, 48)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (5, 49)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (15, 49)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (12, 50)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (20, 50)
GO
INSERT [dbo].[ProductsIngredients] ([ProductId], [IngredientId]) VALUES (12, 51)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (1, N'admin@gmail.com', N'$2a$11$v547TsdI9/2nbOVFfQGyIOwnHH45dWOLaAyUmglhEp0Qb9iuO3VsW', N'admin01', NULL, NULL, CAST(N'2022-06-11T12:28:30.4702145' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [DeletedAt], [DeletedBy], [CreatedAt], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (2, N'user@gmail.com', N'$2a$11$WiI61jw4w29AyewcfDL39.jr4UtZaDfGoqoAXTOOmOA8W.VDbyn6O', N'user01', NULL, NULL, CAST(N'2022-06-11T12:28:30.4702232' AS DateTime2), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 1)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 3)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 6)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 7)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 8)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 9)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 10)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 11)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 12)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 13)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 14)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 15)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 16)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 17)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 18)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 19)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 20)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 21)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 22)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 23)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 24)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 25)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 26)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 27)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 28)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 29)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 30)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 31)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 32)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 33)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 34)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 35)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 36)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 37)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 38)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 39)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 40)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 41)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 42)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 43)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 44)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 45)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 46)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 1)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 2)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 9)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 23)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 24)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 25)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 36)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 37)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 38)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 39)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 40)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 41)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 44)
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (2, 47)
GO
/****** Object:  Index [IX_Addons_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Addons_IsActive] ON [dbo].[Addons]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Addons_Name]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Addons_Name] ON [dbo].[Addons]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditLog_ExecutionDateTime]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_AuditLog_ExecutionDateTime] ON [dbo].[AuditLog]
(
	[ExecutionDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuditLog_Identity]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_AuditLog_Identity] ON [dbo].[AuditLog]
(
	[Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuditLog_UseCaseName]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_AuditLog_UseCaseName] ON [dbo].[AuditLog]
(
	[UseCaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditLog_UserId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_AuditLog_UserId] ON [dbo].[AuditLog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cart_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cart_IsActive] ON [dbo].[Cart]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cart_OrderId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cart_OrderId] ON [dbo].[Cart]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cart_ProductId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cart_ProductId] ON [dbo].[Cart]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cart_UserId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cart_UserId] ON [dbo].[Cart]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartAddons_AddonId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_CartAddons_AddonId] ON [dbo].[CartAddons]
(
	[AddonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartIngredients_IngredientId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_CartIngredients_IngredientId] ON [dbo].[CartIngredients]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ErrorLog_OccuredAt]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_ErrorLog_OccuredAt] ON [dbo].[ErrorLog]
(
	[OccuredAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingredients_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Ingredients_IsActive] ON [dbo].[Ingredients]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ingredients_Name]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ingredients_Name] ON [dbo].[Ingredients]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_IsActive] ON [dbo].[Orders]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_TotalPrice]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_TotalPrice] ON [dbo].[Orders]
(
	[TotalPrice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCategories_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategories_IsActive] ON [dbo].[ProductCategories]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductCategories_Name]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductCategories_Name] ON [dbo].[ProductCategories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Products_IsActive] ON [dbo].[Products]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_Price]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Products_Price] ON [dbo].[Products]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductsIngredients_IngredientId]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProductsIngredients_IngredientId] ON [dbo].[ProductsIngredients]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_IsActive]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Users_IsActive] ON [dbo].[Users]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 11.06.2022. 20:51:54 ******/
CREATE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addons] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [Amount]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Ingredients] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductCategories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditLog_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuditLog] CHECK CONSTRAINT [FK_AuditLog_Users_UserId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Orders_OrderId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products_ProductId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users_UserId]
GO
ALTER TABLE [dbo].[CartAddons]  WITH CHECK ADD  CONSTRAINT [FK_CartAddons_Addons_AddonId] FOREIGN KEY([AddonId])
REFERENCES [dbo].[Addons] ([Id])
GO
ALTER TABLE [dbo].[CartAddons] CHECK CONSTRAINT [FK_CartAddons_Addons_AddonId]
GO
ALTER TABLE [dbo].[CartAddons]  WITH CHECK ADD  CONSTRAINT [FK_CartAddons_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartAddons] CHECK CONSTRAINT [FK_CartAddons_Cart_CartId]
GO
ALTER TABLE [dbo].[CartIngredients]  WITH CHECK ADD  CONSTRAINT [FK_CartIngredients_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartIngredients] CHECK CONSTRAINT [FK_CartIngredients_Cart_CartId]
GO
ALTER TABLE [dbo].[CartIngredients]  WITH CHECK ADD  CONSTRAINT [FK_CartIngredients_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
GO
ALTER TABLE [dbo].[CartIngredients] CHECK CONSTRAINT [FK_CartIngredients_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories_CategoryId]
GO
ALTER TABLE [dbo].[ProductsIngredients]  WITH CHECK ADD  CONSTRAINT [FK_ProductsIngredients_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
GO
ALTER TABLE [dbo].[ProductsIngredients] CHECK CONSTRAINT [FK_ProductsIngredients_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[ProductsIngredients]  WITH CHECK ADD  CONSTRAINT [FK_ProductsIngredients_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsIngredients] CHECK CONSTRAINT [FK_ProductsIngredients_Products_ProductId]
GO
ALTER TABLE [dbo].[UsersUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UsersUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersUseCases] CHECK CONSTRAINT [FK_UsersUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [PizzaVilla] SET  READ_WRITE 
GO
