USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadCustomerDim]    Script Date: 3/25/2021 12:10:58 AM ******/
DROP PROCEDURE [dbo].[usp_LoadCustomerDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadCustomerDim]    Script Date: 3/25/2021 12:10:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_LoadCustomerDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadCustomerDim
PURPOSE: Load the Customer Dimension
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

    TRUNCATE TABLE dbo.tblCustomerDim;

    -- 2) Reload data

    INSERT INTO dbo.tblCustomerDim
           SELECT DISTINCT 
                  s.cust_id2 AS cust_id, 
                  s.last_name, 
                  s.first_name, 
                  s.gender, 
                  s.birth_date, 
                  s.cust_since_date, 
                  s.pri_branch_id, 
                  s.cust_pri_branch_dist, 
                  s.cust_add_id, 
                  s.cust_lat, 
                  s.cust_lon, 
                  s.cust_rel_id
           FROM dbo.stg_p1 AS s
           ORDER BY cust_id;
END;   
GO


