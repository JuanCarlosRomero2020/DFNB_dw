USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadTransactionFact]    Script Date: 3/25/2021 12:39:31 AM ******/
DROP PROCEDURE [dbo].[usp_LoadTransactionFact]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadTransactionFact]    Script Date: 3/25/2021 12:39:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[usp_LoadTransactionFact]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadTransactionFact
PURPOSE: Load the Transaction Fact
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

    TRUNCATE TABLE dbo.tblTransactionFact;

    -- 2) Reload data

    INSERT INTO dbo.tblTransactionFact
           SELECT s.tran_date, 
                  s.tran_time, 
                  s.branch_id, 
                  s.acct_id, 
                  s.tran_type_id, 
                  s.tran_amt, 
                  s.tran_fee_amt
           FROM dbo.stg_p2 AS s
           ORDER BY s.tran_type_id;
END;   
GO


