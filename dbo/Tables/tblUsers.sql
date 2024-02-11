CREATE TABLE [dbo].[tblUsers] (
    [UserName]         NVARCHAR (50) NOT NULL,
    [Password]         NVARCHAR (50) NULL,
    [IsOPD]            BIT           CONSTRAINT [DF_tblUsers_IsFrontDesk] DEFAULT ((0)) NULL,
    [IsPathologyLab]   BIT           CONSTRAINT [DF_tblUsers_IsPathologyLab] DEFAULT ((0)) NULL,
    [IsOtherLabs]      BIT           CONSTRAINT [DF_tblUsers_IsICU] DEFAULT ((0)) NULL,
    [IsSalary]         BIT           CONSTRAINT [DF_tblUsers_IsOT] DEFAULT ((0)) NULL,
    [IsRadiologyLab]   BIT           CONSTRAINT [DF_tblUsers_IsRadiologyLab] DEFAULT ((0)) NULL,
    [IsExpenses]       BIT           CONSTRAINT [DF_tblUsers_IsExpenses] DEFAULT ((0)) NULL,
    [IsPayments]       BIT           CONSTRAINT [DF_tblUsers_IsPayments] DEFAULT ((0)) NULL,
    [IsPatient]        BIT           CONSTRAINT [DF_tblUsers_IsPatient] DEFAULT ((0)) NULL,
    [IsPatientHistory] BIT           CONSTRAINT [DF_tblUsers_IsPatientHistory] DEFAULT ((0)) NULL,
    [IsInPatients]     BIT           CONSTRAINT [DF_tblUsers_IsInPatients] DEFAULT ((0)) NULL,
    [CompanyPanel]     BIT           CONSTRAINT [DF_tblUsers_CompanyPanel] DEFAULT ((0)) NULL,
    [IsActive]         BIT           CONSTRAINT [DF_tblUsers_IsActive] DEFAULT ((1)) NULL,
    [IsDoc]            BIT           CONSTRAINT [DF_tblUsers_IsDoc] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED ([UserName] ASC)
);

