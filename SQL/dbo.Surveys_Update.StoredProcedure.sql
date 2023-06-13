USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Update]    Script Date: 4/18/2023 2:08:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Steven Martinez
-- Create date: 04/10/2023
-- Description: dbo.Surveys_Update
-- Code Reviewer: Kolby Morris
-- MODIFIED BY: Steven Martinez
-- MODIFIED DATE: 04/18/2023
-- Code Reviewer:Brian Bauroth
-- Note: Updated to add StatusId parameter
-- =============================================

CREATE proc [dbo].[Surveys_Update]
					@Name nvarchar(100)
					,@Description nvarchar(2000)
					,@StatusId int
					,@Id int 
as 

/*-------------TEST CODE--------------

		Declare @Id int = 1
					Declare @Name nvarchar(100) = 'Survey2'
										,@Description nvarchar(2000) = 'New Survey that I am testing update!'

					Execute [dbo].[Surveys_SelectById] 
												@Id 

					Execute [dbo].[Surveys_Update] 
											@Name 
											,@Description 
											,@Id 

					Execute [dbo].[Surveys_SelectById] 
												@Id 

*/

BEGIN 



		UPDATE [dbo].[Surveys]
		   SET [Name] = @Name
		      ,[StatusId] = @StatusId
			  ,[Description] = @Description
			  ,[DateModified] = GETUTCDATE()
		 WHERE Id = @Id




END 
				
GO
