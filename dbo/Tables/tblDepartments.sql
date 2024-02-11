CREATE TABLE [dbo].[tblDepartments] (
    [DepartmentID]                 INT            IDENTITY (1, 1) NOT NULL,
    [DepartmentTitle]              NVARCHAR (100) NULL,
    [IsOtherLab]                   BIT            CONSTRAINT [DF_tblDepartments_IsLab] DEFAULT ((0)) NULL,
    [IsPatientServices]            BIT            CONSTRAINT [DF_tblDepartments_IsPatientServies] DEFAULT ((0)) NULL,
    [IsExpenses]                   BIT            CONSTRAINT [DF_tblDepartments_IsExpenses] DEFAULT ((0)) NULL,
    [IsDepartmentCanUtilseExpense] BIT            CONSTRAINT [DF_tblDepartments_IsDepartmentCanUtilseExpense] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tblDepartments] PRIMARY KEY CLUSTERED ([DepartmentID] ASC)
);

