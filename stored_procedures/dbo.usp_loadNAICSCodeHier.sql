USE [DFNB3];
GO

/****** Object:  StoreProcedure [dbo].[usp_loadNAICSCodeHier]    Script Date: 3/12/2021 11:44:48 PM ******/

DROP PROCEDURE [dbo].[usp_loadNAICSCodeHier];
GO

/****** Object:  StoreProcedure [dbo].[usp_loadNAICSCodeHier]    Script Date: 3/12/2021 11:44:48 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO


CREATE PROCEDURE [dbo].[usp_loadNAICSCodeHier];
AS

/*****************************************************************************************************************
NAME:    dbo.usp_loadNAICSCodeHier
PURPOSE: LOad the NAICS Code Hierarchy
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------

1.0     11/12/2019   JJAUSSI       1. Built this table for LDS BC IT240
1.1     03/12/2021   JJAUSSI       1. Added PK and NOT NULL contraints

RUNTIME: 

NOTES:
NAICS Code Hierarchy


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

     BEGIN

           -- 1) Truncate existing data

           TRUNCATE TABLE dbo.tblNAICSCodehier;



           -- 2) Reload data

           INSERT INTO dbo.tblNAICSCodehier
           SELECT v.*
             FROM etl.v_naics_code_hier_load as v


    END;         
