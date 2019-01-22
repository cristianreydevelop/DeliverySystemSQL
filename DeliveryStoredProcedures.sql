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

/****** Object:  StoredProcedure [dbo].[getschedules]    Script Date: 1/21/2019 8:27:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getschedules]
	@time varchar(8)
as
	select
		s.deliveriesid
	from
		dbo.schedules s with (nolock)
		join dbo.schedule_ids si with (nolock)
		on si.scheduleid=s.scheduleid
	where
		si.scheduletime = @time
GO

/****** Object:  StoredProcedure [dbo].[logerror]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[logerror]
	@deliveriesid int,
	@deliverytype varchar(5)=null,
	@errdescription varchar(max),
	@stacktrace varchar(max)
As
	if @deliverytype is null
	begin
		select @deliverytype = 
			dt.deliveryname
		from
			dbo.deliveries d with (nolock)
			join dbo.delivery_types dt with (nolock)
			on dt.deliveryid = d.deliveryid
		where
			d.deliveriesid = @deliveriesid
	end

	insert into
		dbo.delivery_errors with (rowlock)
		(deliveriesid, deliverytype, errordescription, stacktrace, errordatetime)

		values
		(@deliveriesid, @deliverytype, @errdescription, @stacktrace, getdate())
GO

/****** Object:  StoredProcedure [dbo].[getdeliveryforrun]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[getdeliveryforrun]
	@deliveriesid int
As
	select
		d.deliveriesid,
		dt.deliveryname,
		d.[from],
		d.[to],
		d.[message],
		d.active
	from
		deliveries d with (nolock)
		join delivery_types dt with (nolock) on dt.deliveryid=d.deliveryid
	where
		d.deliveriesid = @deliveriesid
GO

/****** Object:  StoredProcedure [dbo].[getdelivery]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[getdelivery]
	@deliveriesid int
As
	select
		deliveriesid,
		deliveryid,
		[from],
		[to],
		[message],
		active
	from
		deliveries with (nolock)
	where
		deliveriesid = @deliveriesid
GO

/****** Object:  StoredProcedure [dbo].[deactivatedelivery]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[deactivatedelivery]
	@deliveriesid int
As
	update 
		dbo.deliveries with (rowlock)
	set
		active = 0
	where
		deliveriesid = @deliveriesid
GO

/****** Object:  StoredProcedure [dbo].[getdeliveries]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[getdeliveries]
As
	select 
		deliveriesid,
		dt.deliveryname + ' | ' + 
		d.[from] + ' | ' + 
		d.[to] as [info]
	from 
		dbo.deliveries d with (nolock)
		join dbo.delivery_types dt with (nolock)
		on dt.deliveryid = d.deliveryid
	where 
		d.active = 1
		and
		dt.active = 1
	order by
		d.deliveriesid
GO

/****** Object:  StoredProcedure [dbo].[runschedules]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[runschedules]
	@scheduleid int
As

	select 
		deliveriesid
	from
		dbo.schedules with (nolock)
	where
		scheduleid = @scheduleid
GO

/****** Object:  StoredProcedure [dbo].[editdelivery]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[editdelivery]
	@deliveriesid int,
	@from varchar(50),
	@to varchar(50),
	@message varchar(8000),
	@messagebody varbinary(max)=null,
	@active bit
As
	update
		dbo.deliveries with (rowlock)
	set
		[from] = @from,
		[to] = @to,
		[message] = @message,
		messagebody = @messagebody,
		active = @active
	where
		deliveriesid = @deliveriesid
GO

/****** Object:  StoredProcedure [dbo].[insertnewdelivery]    Script Date: 1/21/2019 8:27:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[insertnewdelivery]
	@deliveryid int,
	@from varchar(50),
	@to varchar(50),
	@message varchar(8000),
	@messagebody varbinary(max)=null,
	@active bit
As
	Insert into
		dbo.deliveries with (rowlock)
		(deliveryid, [from], [to], [message], [messagebody], active)
	values
		(@deliveryid, @from, @to, @message, @messagebody, @active)
GO


