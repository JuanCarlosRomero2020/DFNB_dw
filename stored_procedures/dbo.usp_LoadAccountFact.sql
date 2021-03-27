USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountFact]    Script Date: 3/25/2021 12:36:16 AM ******/
DROP PROCEDURE [dbo].[usp_LoadAccountFact]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountFact]    Script Date: 3/25/2021 12:36:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_LoadAccountFact]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadAccountFact
PURPOSE: Load the Account Fact
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

    TRUNCATE TABLE dbo.tblAccountFact;

    -- 2) Reload data

    INSERT INTO dbo.tblAccountFact
           SELECT DISTINCT 
                  s.as_of_date, 
                  s.acct_id3 AS acct_id, 
                  s.cur_bal
           FROM dbo.stg_p1 AS s
           ORDER BY acct_id;
END;   
GO


