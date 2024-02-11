CREATE TABLE [dbo].[tblCategory] (
    [CategoryID] INT           IDENTITY (1, 1) NOT NULL,
    [Category]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);

