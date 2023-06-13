USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_DeleteById]    Script Date: 4/12/2023 10:36:48 AM ******/
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

CREATE proc [dbo].[Surveys_DeleteById]
				@Id int

as 

/*--------------TEST CODE------------

	Declare @Id int = 4

	Execute [dbo].[Surveys_DeleteById]
							@Id 

	Execute [dbo].[Surveys_SelectById] 
										@Id 

*/


BEGIN 



	DELETE FROM [dbo].[Surveys]
		  WHERE Id = @Id 




END 
GO
