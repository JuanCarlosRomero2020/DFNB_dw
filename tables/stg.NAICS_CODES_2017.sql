/*****************************************************************************************************************
NAME:    stg.NAICS_CODE_2017
PURPOSE: Create the stg.NAICS_CODES_2017 table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/12/2019   JJAUSSI       1. Built this view for LDS BC IT240



RUNTIME: 
Approx. 1 sec



NOTES:
Performs initial transformations on NAICS Code data

https://www.census.gow/eos/www/naics/downloadables.html
htpps://www.census.gow/eos/www/naics/2017NAICS/2-6%20digit_2017_codes.xlsx


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************

USE [DFNB3];
GO

/****** Object:  Table [stg].[NAICS_CODES_2017]    Script Date: 11/12/2019 8:46:01 PM ******/

DROP TABLE [stg].[NAICS_CODES_2017];
GO

/****** Object:  [stg].[NAICS_CODES_2017]    Script Date: 11/12/2019 8:46:01 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO


CREATE TABLE [stg].[NAICS_CODES_2017] (
    [Seq_No] float] NULL,
    [2017_NAICS_US_Code] [float] NULL,
    [2017_NAICS_US_Title] [nvarchar](500) NULL
) ON [PRIMARY]
GO