USE [DFNB3];
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 3/24/2021 7:09:23 PM ******/

DROP PROCEDURE [dbo].[usp_HandleRefEnteg];
GO
USE [DFNB3];
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 3/23/2021 8:29:33 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE PROCEDURE [dbo].[usp_HandleRefEnteg](@v_op AS VARCHAR(10))
AS

/*****************************************************************************************************************
NAME:    dbo.usp_HandleRefEnteg
PURPOSE: Handle referential integrity

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/23/2021   JCRomero      1. Built this store procedure for LDS BC IT243



RUNTIME: 
Approx. 30 sec

NOTES: 
@v_op
- op = operation
- drop = drop foreign keys, primary keys, indexes
- add = add foreign keys, primary keys, indexes

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

    BEGIN

        -- 1) Drop

        IF @v_op = 'drop'
            BEGIN

                -- 1.1) Foreign Keys

                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblBranchDim_region_id_tblRegionDim_region_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblBranchDim_area_id_tblAreaDim_area_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblBranchDim_branch_add_id_tblAddressDim_add_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountFact_acct_id_tblAccountDim_acct_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountDim_prod_id_tblProductDim_prod_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;
                END;
                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id;
                END;

                -- 4.2.1) Transaction Type Dimension
                -- 4.2.2) Transaction Fact

                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblTransactionFact_branch_id_tblBranchDim_branch_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id;
                END;
                -- ALTER TABLE dbo.tblTransactionFact
                --WITH NOCHECK
                --ADD CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);
                --IF EXISTS
                --(
                --    SELECT fk.*
                --      FROM sys.foreign_keys AS fk
                --     WHERE fk.name = 'FK_tblTransactionFact_acct_id_tblAccountDim_acct_id'
                --           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
                --)
                --    BEGIN
                --        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_acct_id_tblAccountDim_acct_id;
                --END;
                --ALTER TABLE dbo.tblTransactionFact
                --ADD CONSTRAINT FK_tblTransactionFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);

                IF EXISTS
                (
                    SELECT fk.*
                    FROM sys.foreign_keys AS fk
                    WHERE fk.name = 'FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id'
                          AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id;
                END;
                -- ALTER TABLE dbo.tblTransactionFact
                -- ADD CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id FOREIGN KEY(tran_type_id) REFERENCES dbo.tblTransactionTypeDim(tran_type_id);
                -- 1.2) Primary Keys

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT PK_tblAccountCustomerDim;
                END;
                --ALTER TABLE dbo.tblAccountCustomerDim
                --WITH NOCHECK
                --ADD CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY(acct_id, cust_id);
                -- 1.2.1) Account Customer Role Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerRoleDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerRoleDim DROP CONSTRAINT PK_tblAccountCustomerRoleDim;
                END;
                --ALTER TABLE dbo.tblAccountCustomerRoleDim
                --WITH NOCHECK
                --ADD CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY(acct_cust_role_id);
                -- 1.2.2) Account Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT PK_tblAccountDim;
                END;
                -- ALTER TABLE dbo.tblAccountDim
                -- ADD CONSTRAINT PK_tblAccountDim PRIMARY KEY(acct_id);
                -- 1.2.3) Branch Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblBranchDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT PK_tblBranchDim;
                END;
                --ALTER TABLE dbo.tblBranchDim
                --ADD CONSTRAINT PK_tblBranchDim PRIMARY KEY(branch_id);
                -- 1.2.4) Region Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblRegionDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblRegionDim DROP CONSTRAINT PK_tblRegionDim;
                END;
                --ALTER TABLE dbo.tblRegionDim
                --ADD CONSTRAINT PK_tblRegionDim PRIMARY KEY(region_id);
                -- 1.2.5) Area Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAreaDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAreaDim DROP CONSTRAINT PK_tblAreaDim;
                END;
                --  ALTER TABLE dbo.tblAreaDim
                --ADD CONSTRAINT PK_tblAreaDim PRIMARY KEY(area_id);
                -- 1.2.6) Product Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblProductDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblProductDim DROP CONSTRAINT PK_tblProductDim;
                END;
                --ALTER TABLE dbo.tblProductDim
                --ADD CONSTRAINT PK_tblProductDim PRIMARY KEY(prod_id);
                -- 1.2.7) Customer Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT PK_tblCustomerDim;
                END;

                --ALTER TABLE dbo.tblCustomerDim
                --ADD CONSTRAINT PK_tblCustomerDim PRIMARY KEY(cust_id);
                -- 1.2.8) Account Fact

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAccountFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT PK_tblAccountFact;
                END;

                --ALTER TABLE dbo.tblAccountFact
                --ADD CONSTRAINT PK_tblAccountFact PRIMARY KEY(as_of_date, acct_id);
                -- 1.2.9) Address Dimension

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblAddressDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAddressDim DROP CONSTRAINT PK_tblAddressDim;
                END;

                --ALTER TABLE dbo.tblAddressDim
                --ADD CONSTRAINT PK_tblAddressDim PRIMARY KEY(add_id);
                --END;
                -- 4.1.1) Transaction Type Dimension
                -- Q4.1: How to define the PK?
                -- A4.1: Simple - Transaction Type ID

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblTransactionTypeDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionTypeDim DROP CONSTRAINT PK_tblTransactionTypeDim;
                END;

                --ALTER TABLE dbo.tblTransactionTypeDim
                --ADD CONSTRAINT PK_tblTransactionTypeDim PRIMARY KEY(tran_type_id);
                -- 4.1.2) Transaction Fact
                -- Q4.1: How to define the PK?
                -- A4.1: Thusly...
                -- PK = Transaction ID

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblTransactionFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT PK_tblTransactionFact;
                END;

                --ALTER TABLE dbo.tblTransactionFact
                --ADD CONSTRAINT PK_tblTransactionFact PRIMARY KEY(tran_id);
                -- Alternate PK (APK) = tran_date | tran_time | branch_id | tran_type_id | acct_id

                IF EXISTS
                (
                    SELECT *
                    FROM sys.indexes
                    WHERE name = 'APK_tblTransactionFact'
                )
                    BEGIN
                        DROP INDEX APK_tblTransactionFact ON dbo.tblTransactionFact;
                END;

                -- 4.1.1) Transaction Type Dimension
                -- Q4.1: How to define the PK?
                -- A4.1: Simple - Transaction Type ID

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblTransactionTypeDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionTypeDim DROP CONSTRAINT PK_tblTransactionTypeDim;
                END;

                --ALTER TABLE dbo.tblTransactionTypeDim
                --ADD CONSTRAINT PK_tblTransactionTypeDim PRIMARY KEY(tran_type_id);
                -- 4.1.2) Transaction Fact
                -- Q4.1: How to define the PK?
                -- A4.1: Thusly...
                -- PK = Transaction ID

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblTransactionFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT PK_tblTransactionFact;
                END;

                --ALTER TABLE dbo.tblTransactionFact
                --ADD CONSTRAINT PK_tblTransactionFact PRIMARY KEY(tran_id);
                -- Alternate PK (APK) = tran_date | tran_time | branch_id | tran_type_id | acct_id

                IF EXISTS
                (
                    SELECT *
                    FROM sys.indexes
                    WHERE name = 'APK_tblTransactionFact'
                )
                    BEGIN
                        DROP INDEX APK_tblTransactionFact ON dbo.tblTransactionFact;
                END;

                --DROP section
                --Primary key

                IF EXISTS
                (
                    SELECT 1
                    FROM sys.key_constraints
                    WHERE type = 'PK'
                          AND parent_object_id = OBJECT_ID('dbo.tblOrgHierDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblOrgHierDim DROP CONSTRAINT PK_tblOrgHierDim;
                END;
                IF EXISTS
                (
                    SELECT *
                    FROM sys.indexes
                    WHERE name = 'APK_tblOrgHierDim'
                )
                    BEGIN
                        DROP INDEX APK_tblOrgHierDim ON dbo.tblOrgHierDim;
                END;

                        -- 1.3) Indexes

        END;

        -- 2) Add

        IF @v_op = 'add'
            BEGIN

                -- 2.1) Primary Keys

                --ALTER TABLE dbo.tblBranchDim
                --ADD CONSTRAINT PK_tblBranchDim PRIMARY KEY CLUSTERED(branch_id ASC);
                ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY CLUSTERED(acct_id ASC, cust_id ASC);
                ALTER TABLE dbo.tblCustomerDim
                ADD CONSTRAINT PK_tblCustomerDim PRIMARY KEY CLUSTERED(cust_id ASC);
                ALTER TABLE dbo.tblAccountDim
                ADD CONSTRAINT PK_tblAccountDim PRIMARY KEY CLUSTERED(acct_id ASC);
                ALTER TABLE dbo.tblAccountFact
                ADD CONSTRAINT PK_tblAccountFact PRIMARY KEY CLUSTERED(as_of_date ASC, acct_id ASC);
                ALTER TABLE dbo.tblTransactionFact
                ADD CONSTRAINT PK_tblTransactionFact PRIMARY KEY CLUSTERED(tran_id ASC);
                ALTER TABLE dbo.tblAccountCustomerRoleDim
                ADD CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY CLUSTERED(acct_cust_role_id ASC);
                ALTER TABLE dbo.tblRegionDim
                ADD CONSTRAINT PK_tblRegionDim PRIMARY KEY CLUSTERED(region_id ASC);
                ALTER TABLE dbo.tblAreaDim
                ADD CONSTRAINT PK_tblAreaDim PRIMARY KEY CLUSTERED(area_id ASC);
                ALTER TABLE dbo.tblProductDim
                ADD CONSTRAINT PK_tblProductDim PRIMARY KEY CLUSTERED(prod_id ASC);
                ALTER TABLE dbo.tblAddressDim
                ADD CONSTRAINT PK_tblAddressDim PRIMARY KEY CLUSTERED(add_id ASC);
                ALTER TABLE dbo.tblTransactionTypeDim
                ADD CONSTRAINT PK_tblTransactionTypeDim PRIMARY KEY CLUSTERED(tran_type_id ASC);
                ALTER TABLE dbo.tblOrgHierDim
                ADD CONSTRAINT PK_tblOrgHierDim PRIMARY KEY CLUSTERED(branch_id ASC);

                -- 2.2) Foreign Keys

                  ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id FOREIGN KEY(cust_id) REFERENCES dbo.tblCustomerDim(cust_id);
          
                -- 2.3) Indexes

        END;
    END;
GO