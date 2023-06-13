USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[SiteReferences_SelectByDates]    Script Date: 5/10/2023 4:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Steven Martinez
-- Create date: 05/09/2023
-- Description: Query database based on dates provided
-- Code Reviewer: Michael Sanchez
-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[SiteReferences_SelectByDates]
					@Date1 date
					,@Date2 date

as

/*

Declare @Date1 date = '2023-04-10'
		,@Date2 date = '2023-04-14'

Execute [dbo].[SiteReferences_SelectByDates]
						@Date1
						,@Date2 	
								
*/

BEGIN

		SELECT rt.[Id]
			  ,[Name]
			  ,TotalCount = COUNT(sr.ReferenceTypeId)
		  FROM [dbo].[ReferenceTypes] as rt 
					INNER JOIN
			   [dbo].[SiteReferences] as sr
			ON sr.ReferenceTypeId = rt.Id
					INNER JOIN
				[dbo].[Users] as u
			ON sr.UserId = u.Id
		WHERE u.DateCreated BETWEEN @Date1 AND @Date2
		GROUP BY rt.Id, rt.Name
		ORDER BY rt.Id


END
GO
