CREATE PROCEDURE [dbo].[ProfitAndLoss]

@Dated1 datetime,
@Dated2 datetime

AS

SELECT        SUM(Payment) AS Amount, 
'Received' AS Transtype,
CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) as D1,
CONVERT(datetime, CONVERT(varchar, @Dated2, 106)) as D2

FROM            tblDailyVisitDetails INNER JOIN
                         tblDailyVisits ON tblDailyVisitDetails.DailyVisitID = tblDailyVisits.DailyVisitID

WHERE        (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) AND CONVERT(datetime, CONVERT(varchar, 
                         @Dated2, 106))) AND isnull(Payment,0) <>0


union all

SELECT        SUM(- (1 * NetAmount)) AS Amount, 
TransType,
CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) as D1,
CONVERT(datetime, CONVERT(varchar, @Dated2, 106)) as D2
       FROM            tblGeneralLedger
       WHERE        (CONVERT(datetime, CONVERT(varchar, Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) AND CONVERT(datetime, CONVERT(varchar, 
                                @Dated2, 106)))  AND isnull(NetAmount,0) <>0
       GROUP BY TransType
       
       

	RETURN
