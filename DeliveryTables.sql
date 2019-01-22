/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2008 R2 (10.50.1600)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [deliveries]
GO

/****** Object:  Table [dbo].[deliveries]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[deliveries](
	[deliveriesid] [int] IDENTITY(1,1) NOT NULL,
	[deliveryid] [int] NOT NULL,
	[from] [varchar](50) NOT NULL,
	[to] [varchar](50) NOT NULL,
	[message] [varchar](8000) NULL,
	[messagebody] [varbinary](max) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_deliveries_1] PRIMARY KEY CLUSTERED 
(
	[deliveryid] ASC,
	[from] ASC,
	[to] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[delivery_errors]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[delivery_errors](
	[errorid] [int] IDENTITY(1,1) NOT NULL,
	[deliveriesid] [int] NOT NULL,
	[deliverytype] [varchar](5) NOT NULL,
	[errordescription] [varchar](max) NOT NULL,
	[stacktrace] [varchar](max) NULL,
	[errordatetime] [datetime] NOT NULL,
 CONSTRAINT [PK_delivery_errors] PRIMARY KEY CLUSTERED 
(
	[errorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[delivery_types]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[delivery_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deliveryid] [int] NOT NULL,
	[deliveryname] [varchar](5) NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[deliveryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[messages_delete]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[messages_delete](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[deliveriesid] [int] NOT NULL,
	[messagebody] [varchar](1000) NULL,
	[messageattachment] [varbinary](max) NULL,
	[active] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[schedule_ids]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[schedule_ids](
	[scheduleid] [int] IDENTITY(1,1) NOT NULL,
	[scheduletime] [varchar](8) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[schedules]    Script Date: 1/21/2019 8:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[schedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deliveriesid] [int] NOT NULL,
	[scheduleid] [int] NOT NULL,
	[active] [bit] NOT NULL,
	[datecreated] [datetime] NOT NULL
) ON [PRIMARY]
GO


