CREATE TABLE [dbo].[tblDailyVisitServiceDetail] (
    [DailyVisitServiceDetailID] BIGINT          IDENTITY (1, 1) NOT NULL,
    [DailyVisitDetailID]        BIGINT          NULL,
    [ActualValue]               NVARCHAR (50)   NULL,
    [ServiceDetailID]           BIGINT          NULL,
    [Remarks]                   NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tblDailyVisitServiceDetail] PRIMARY KEY CLUSTERED ([DailyVisitServiceDetailID] ASC),
    CONSTRAINT [FK_tblDailyVisitServiceDetail_tblDailyVisitDetails] FOREIGN KEY ([DailyVisitDetailID]) REFERENCES [dbo].[tblDailyVisitDetails] ([DailyVisitDetailID]),
    CONSTRAINT [FK_tblDailyVisitServiceDetail_tblServiceDetail] FOREIGN KEY ([ServiceDetailID]) REFERENCES [dbo].[tblServiceDetail] ([ServiceDetailID])
);

