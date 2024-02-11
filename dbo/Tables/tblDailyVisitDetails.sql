CREATE TABLE [dbo].[tblDailyVisitDetails] (
    [DailyVisitDetailID]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [DailyVisitID]         BIGINT          NULL,
    [ServiceID]            BIGINT          NULL,
    [Dated]                DATETIME        CONSTRAINT [DF_tblDailyVisitDetails_Dated] DEFAULT (case when datepart(hour,getdate())<=(9) then dateadd(day,(-1),getdate()) else getdate() end) NULL,
    [RefDocID]             NVARCHAR (250)  NULL,
    [PaymentCode]          NVARCHAR (10)   NULL,
    [Comission]            FLOAT (53)      NULL,
    [Rate]                 MONEY           NULL,
    [NbrOfRepitition]      INT             CONSTRAINT [DF_tblDailyVisitDetails_NbrOfRepitition] DEFAULT ((1)) NULL,
    [TotalAmount]          AS              (isnull([rate],(0))*isnull([NbrOfRepitition],(1))),
    [Payment]              MONEY           NULL,
    [Discount]             AS              (case when isnull([rate],(0))>(0) then isnull([Rate],(0))*isnull([nbrofRepitition],(0))-isnull([Payment],(0)) else (0) end),
    [ActualValue]          NVARCHAR (250)  NULL,
    [Remarks]              NVARCHAR (4000) NULL,
    [IsActive]             BIGINT          CONSTRAINT [DF_tblDailyVisitDetails_IsActive] DEFAULT ((1)) NULL,
    [BeneficiaryServiceID] BIGINT          NULL,
    [CompanyPanelID]       INT             NULL,
    CONSTRAINT [PK_tblDailyVisitDetails] PRIMARY KEY CLUSTERED ([DailyVisitDetailID] ASC),
    CONSTRAINT [FK_tblDailyVisitDetails_tblDailyVisits] FOREIGN KEY ([DailyVisitID]) REFERENCES [dbo].[tblDailyVisits] ([DailyVisitID]),
    CONSTRAINT [FK_tblDailyVisitDetails_tblPaymentCodes] FOREIGN KEY ([PaymentCode]) REFERENCES [dbo].[tblPaymentCodes] ([PaymentCode]),
    CONSTRAINT [FK_tblDailyVisitDetails_tblServices] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[tblServices] ([ServiceID])
);


GO
CREATE TRIGGER [dbo].[i_u_d_tblDailyVisitDetails]
ON [dbo].[tblDailyVisitDetails]

AFTER  INSERT, UPDATE, DELETE

AS
	
UPDATE       tblDailyVisits
SET                ReceivedAmount = isnull(ReceivedAmount,0) - isnull(tblDailyVisitDetails.Payment,0),
				   PaymentFromDetail = isnull(PaymentFromDetail,0) - (isnull(tblDailyVisitDetails.Rate,0) * isnull(nbrOfRepitition,1)),
					Discount = isnull(tblDailyVisits.Discount,0) - (tblDailyVisitDetails.Discount)
FROM     deleted as       tblDailyVisitDetails INNER JOIN
                         tblDailyVisits ON tblDailyVisitDetails.DailyVisitID = tblDailyVisits.DailyVisitID
where isnull(tblDailyVisitDetails.Payment,0) > 0
                         
                         
                         
                         UPDATE       tblDailyVisits
SET                ReceivedAmount = isnull(ReceivedAmount,0) + isnull(tblDailyVisitDetails.Payment,0),
				   PaymentFromDetail = isnull(PaymentFromDetail,0) + (isnull(tblDailyVisitDetails.Rate,0)* isnull(nbrOfRepitition,1)),
					Discount = isnull(tblDailyVisits.Discount,0) - (tblDailyVisitDetails.Discount)

FROM     Inserted as       tblDailyVisitDetails INNER JOIN
                         tblDailyVisits ON tblDailyVisitDetails.DailyVisitID = tblDailyVisits.DailyVisitID
where isnull(tblDailyVisitDetails.Payment,0) > 0

GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER i_u_d_tblDailyVisitDetailsForVisitServiceDetail
   ON  dbo.tblDailyVisitDetails
   FOR INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO tblDailyVisitServiceDetail
(
DailyVisitDetailID, 
ServiceDetailID
)
SELECT     
tblDailyVisitDetails.DailyVisitDetailID, 
tblServiceDetail.ServiceDetailID
FROM    Inserted as     tblDailyVisitDetails INNER JOIN
                      tblServiceDetail ON tblDailyVisitDetails.ServiceID = tblServiceDetail.ServiceID


END
