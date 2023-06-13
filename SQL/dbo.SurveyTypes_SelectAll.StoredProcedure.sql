USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[SurveyTypes_SelectAll]    Script Date: 4/12/2023 10:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Steven Martinez
-- Create date: 04/10/2023
-- Description: dbo.Surveys_DeleteById
-- Code Reviewer: Kolby Morris
-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[SurveyTypes_SelectAll]

as

/*

		Execute [dbo].[SurveyTypes_SelectAll]

*/

BEGIN 





		SELECT [Id]
			  ,[Name]
		  FROM [dbo].[SurveyTypes]


END 
GO
