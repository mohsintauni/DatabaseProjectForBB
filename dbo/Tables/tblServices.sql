CREATE TABLE [dbo].[tblServices] (
    [ServiceID]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [ServiceNbr]               INT            NULL,
    [ServiceName]              NVARCHAR (100) NULL,
    [AgeRange1]                INT            NULL,
    [AgeRange2]                INT            NULL,
    [UnitID]                   INT            NULL,
    [Comission]                FLOAT (53)     NULL,
    [Rate]                     FLOAT (53)     NULL,
    [IsActive]                 BIT            CONSTRAINT [DF_tblServices_IsActive] DEFAULT ((1)) NULL,
    [DepartmentID]             INT            NULL,
    [MobileNbr]                NVARCHAR (50)  NULL,
    [ResPhNbr]                 NVARCHAR (50)  NULL,
    [Email]                    NVARCHAR (50)  NULL,
    [AddressLine1]             NVARCHAR (500) NULL,
    [AddressLine2]             NVARCHAR (500) NULL,
    [DOB]                      DATETIME       NULL,
    [IsBenficiaryAlsoEmployee] BIT            CONSTRAINT [DF_tblServices_IsBenficiaryAlsoEmployee] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tblTests] PRIMARY KEY CLUSTERED ([ServiceID] ASC),
    CONSTRAINT [FK_tblServices_tblDepartments1] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[tblDepartments] ([DepartmentID])
);

