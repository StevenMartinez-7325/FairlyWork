USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[SiteReferences_SelectByCount]    Script Date: 5/8/2023 4:53:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Martinez, Steven
-- Create date: 05/02/2023
-- Description: Select SiteRefs by # of times it was selected
-- Code Reviewer: Rasean Rhone

-- MODIFIED BY: Steven Martinez
-- MODIFIED DATE: 05/08/2023
-- Code Reviewer: Quincy Huang
-- Note: Modified to only select if the user exist. 
-- =============================================

CREATE proc [dbo].[SiteReferences_SelectByCount]
				
as

/*---------TEST CODE----------

		Execute [dbo].[SiteReferences_SelectByCount] 

*/

BEGIN 

		SELECT	sr.[ReferenceTypeId]
				,rt.[Name]
				,TotalCount = COUNT(sr.ReferenceTypeId) 
		FROM [dbo].[ReferenceTypes] as rt
					INNER JOIN
				[dbo].[SiteReferences] as sr
		ON sr.ReferenceTypeId = rt.Id
					INNER JOIN 
					[dbo].[Users] as u
		ON u.Id = sr.UserId
		GROUP BY sr.ReferenceTypeId, rt.Name
		ORDER BY sr.ReferenceTypeId



END 
GO
