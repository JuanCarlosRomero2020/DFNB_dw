USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 3/25/2021 12:19:36 AM ******/
DROP PROCEDURE [dbo].[usp_LoadProductDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 3/25/2021 12:19:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_LoadProductDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadProductDim
PURPOSE: Load the Product Dimension
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

    TRUNCATE TABLE dbo.tblProductDim;

    -- 2) Reload data

    INSERT INTO dbo.tblProductDim
           SELECT DISTINCT 
                  s.prod_id, 
                  'Unknown' AS prod_desc
           FROM dbo.stg_p1 AS s
           ORDER BY s.prod_id;
    INSERT INTO dbo.tblBranchDim
           SELECT DISTINCT 
                  s.acct_branch_id AS branch_id, 
                  s.acct_branch_code AS branch_code, 
                  s.acct_branch_desc AS branch_desc, 
                  s.acct_branch_add_id AS branch_add_id, 
                  s.acct_region_id AS region_id, 
                  s.acct_area_id AS area_id
           FROM dbo.stg_p1 AS s
           ORDER BY branch_id;
END;   
GO


