CREATE TABLE [dbo].[tblPatients] (
    [PatientID]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientPanelCode] NVARCHAR (50)  NULL,
    [PatientName]      NVARCHAR (100) NULL,
    [FatherName]       NVARCHAR (100) NULL,
    [Gender]           NVARCHAR (50)  NULL,
    [DateofBirth]      DATETIME       NULL,
    [AddressLine1]     NVARCHAR (50)  NULL,
    [AddressLine2]     NVARCHAR (50)  NULL,
    [ResPhNbr]         NVARCHAR (50)  NULL,
    [MobNbr]           NVARCHAR (50)  NULL,
    [Email]            NVARCHAR (50)  NULL,
    [UpdatedOn]        DATETIME       CONSTRAINT [DF_tblPatients_UpdatedOn] DEFAULT (getdate()) NULL,
    [UpdatedBy]        NVARCHAR (50)  NULL,
    [IsActive]         BIT            CONSTRAINT [DF_tblPatients_IsActive] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_tblPatients] PRIMARY KEY CLUSTERED ([PatientID] ASC)
);

