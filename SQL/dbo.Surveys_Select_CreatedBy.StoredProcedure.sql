USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Select_CreatedBy]    Script Date: 4/18/2023 2:08:59 PM ******/
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
-- MODIFIED DATE: 04/10/2023
-- Code Reviewer:Brian Bauroth
-- Note: Updated to remove subquery select 
-- =============================================

CREATE proc [dbo].[Surveys_Select_CreatedBy]
					@PageIndex int 
					,@PageSize int
					,@UserId int 

as 

/*

		Declare @PageIndex int = 0
				,@PageSize int = 10
				,@UserId int = 3

		Execute [dbo].[Surveys_Select_CreatedBy] 
								@PageIndex 
								,@PageSize
								,@UserId 

*/

BEGIN 

		Declare @offSet int = @PageIndex * @PageSize 

		SELECT s.[Id]
			  ,s.[Name]
			  ,[Description]
			  ,ss.Id
			  ,ss.Name
			  ,st.Id
			  ,st.Name
			  ,[CreatedBy]
			  ,u.[FirstName]
			  ,u.[LastName]
			  ,u.[Mi]
			  ,u.[AvatarUrl]
			  ,s.[DateCreated]
			  ,s.[DateModified]
			  , TotalCount = COUNT(1) OVER()
		  FROM [dbo].[Surveys] as s inner join [dbo].[Users] as u
						ON s.CreatedBy = u.Id 
							INNER JOIN
						[dbo].[SurveyStatus] as ss
						ON s.StatusId = ss.Id
						INNER JOIN 
						[dbo].[SurveyTypes] as st
						ON s.SurveyTypeId = st.Id
		Where u.Id = @UserId
		ORDER BY U.Id

		OFFSET @offSet Rows
		FETCH Next @PageSize Rows ONLY 

END 
GO
