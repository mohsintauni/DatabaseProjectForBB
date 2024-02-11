create PROCEDURE [dbo].[ProfitAndLossChartToday]



AS
declare @Dated1 datetime,
		@Dated2 datetime

set @Dated1=getdate()
set @Dated2=getdate()
SELECT        SUM(Payment) AS Amount, 
'Received' AS Transtype,
CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) as D1,
CONVERT(datetime, CONVERT(varchar, @Dated2, 106)) as D2
FROM            tblDailyVisitDetails
WHERE        (CONVERT(datetime, CONVERT(varchar, Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) AND CONVERT(datetime, CONVERT(varchar, 
                         @Dated2, 106))) AND isnull(Payment,0) <>0


union all

SELECT        SUM(NetAmount) AS Amount, 
TransType,
CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) as D1,
CONVERT(datetime, CONVERT(varchar, @Dated2, 106)) as D2
       FROM            tblGeneralLedger
       WHERE        (CONVERT(datetime, CONVERT(varchar, Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @Dated1, 106)) AND CONVERT(datetime, CONVERT(varchar, 
                                @Dated2, 106)))  AND isnull(NetAmount,0) <>0
       GROUP BY TransType
       
       

	RETURN
