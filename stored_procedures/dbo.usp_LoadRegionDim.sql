USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadRegionDim]    Script Date: 3/25/2021 12:25:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER PROCEDURE [dbo].[usp_LoadRegionDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadRegionDim
PURPOSE: Load the Region Dimension
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

    TRUNCATE TABLE dbo.tblRegionDim;

    -- 2) Reload data

    INSERT INTO dbo.tblRegionDim
           SELECT DISTINCT 
                  s.acct_region_id AS region_id, 
                  'Unknown' AS region_desc
           FROM dbo.stg_p1 AS s
           ORDER BY region_id;
END;   
GO


