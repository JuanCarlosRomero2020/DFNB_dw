/*****************************************************************************************************************
NAME:    dbo.tblProductDim

PURPOSE: Create the Product Dimension stage table

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       03/20/2021  JCRomero      1. Built this script for LDS BC IT 243


RUNTIME: 
1 sec

NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

USE [DFNB3]
GO

/****** Object:  Table [dbo].[tblProductDim]    Script Date: 3/24/2021 7:55:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProductDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblProductDim]
GO

/****** Object:  Table [dbo].[tblProductDim]    Script Date: 3/24/2021 7:55:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblProductDim](
	prod_id [smallint] NOT NULL,
	prod_code [varchar](50) NULL,
	[prod_desc] [varchar](50) NULL,
  CONSTRAINT [PK_tblProductDim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


