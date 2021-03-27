USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHierDim]    Script Date: 3/25/2021 3:47:18 PM ******/
DROP PROCEDURE [dbo].[usp_LoadOrgHierDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHierDim]    Script Date: 3/25/2021 3:47:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_LoadOrgHierDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadOrgHierDim
PURPOSE: Load the OrgHier Dimension
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------

1.0     03/25/2021   JCRomero       1. Built this store procedure for LDS BC IT243


RUNTIME: 

NOTES:



LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

     


BEGIN

    -- 1) Truncate existing data

    TRUNCATE TABLE dbo.tblOrgHierDim;

    -- 2) Reload data

    INSERT INTO dbo.tblOrgHierDim
           SELECT DISTINCT 
                  [branch_id], 
                  [branch_code], 
                  [branch_desc], 
                  [region_id], 
                  [region_desc], 
                  [area_id], 
                  [area_desc]
           FROM stg.ORG_HIER
           ORDER BY branch_id;
END;   
GO


