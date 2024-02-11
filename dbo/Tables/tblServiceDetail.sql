CREATE TABLE [dbo].[tblServiceDetail] (
    [ServiceDetailID] BIGINT         IDENTITY (1, 1) NOT NULL,
    [ServiceID]       BIGINT         NULL,
    [Title]           NVARCHAR (100) NULL,
    [NormalValues]    NVARCHAR (50)  NULL,
    [UnitID]          INT            NULL,
    [CategoryID]      INT            NULL,
    [IsActive]        BIT            CONSTRAINT [DF_tblServiceDetail_IsActive] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_tblServiceDetail] PRIMARY KEY CLUSTERED ([ServiceDetailID] ASC),
    CONSTRAINT [FK_tblServiceDetail_tblCategory] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[tblCategory] ([CategoryID]),
    CONSTRAINT [FK_tblServiceDetail_tblServices] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[tblServices] ([ServiceID]),
    CONSTRAINT [FK_tblServiceDetail_tblUnits] FOREIGN KEY ([UnitID]) REFERENCES [dbo].[tblUnits] ([OldUnitID])
);

