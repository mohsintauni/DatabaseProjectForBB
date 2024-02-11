CREATE TABLE [dbo].[tblUnits] (
    [OldUnitID]  INT           NOT NULL,
    [UnitTitle]  NVARCHAR (50) NULL,
    [Old_UnitID] INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tblUnits] PRIMARY KEY CLUSTERED ([OldUnitID] ASC)
);

