USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadTransactionTypeDim]    Script Date: 3/25/2021 12:31:03 AM ******/
DROP PROCEDURE [dbo].[usp_LoadTransactionTypeDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadTransactionTypeDim]    Script Date: 3/25/2021 12:31:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_LoadTransactionTypeDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadTransactionTypeDim
PURPOSE: Load the Transaction Type Dimension
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

    TRUNCATE TABLE dbo.tblTransactionTypeDim;

    -- 2) Reload data

    INSERT INTO dbo.tblTransactionTypeDim
           SELECT DISTINCT 
                  s.tran_type_id, 
                  s.tran_type_code, 
                  s.tran_type_desc, 
                  s.tran_fee_prct, 
                  s.cur_cust_req_ind
           FROM dbo.stg_p2 AS s
           ORDER BY s.tran_type_id;
END;   
GO


