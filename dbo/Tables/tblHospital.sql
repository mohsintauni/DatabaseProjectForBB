CREATE TABLE [dbo].[tblHospital] (
    [HospitalID]   INT             IDENTITY (1, 1) NOT NULL,
    [HospitalName] NVARCHAR (100)  NULL,
    [Address]      NVARCHAR (250)  NULL,
    [PhoneNbr]     NVARCHAR (50)   NULL,
    [FaxNbr]       NVARCHAR (50)   NULL,
    [MobileNbr]    NVARCHAR (50)   NULL,
    [Email]        NVARCHAR (50)   NULL,
    [Website]      NVARCHAR (50)   NULL,
    [ImagePath]    NVARCHAR (50)   NULL,
    [IsActive]     BIT             CONSTRAINT [DF_tblHospital_IsActive] DEFAULT ((1)) NULL,
    [Footer1]      NVARCHAR (1000) NULL,
    [Footer2]      NVARCHAR (1000) NULL,
    CONSTRAINT [PK_tblHospital] PRIMARY KEY CLUSTERED ([HospitalID] ASC)
);

