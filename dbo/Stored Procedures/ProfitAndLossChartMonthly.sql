create PROCEDURE [dbo].[ProfitAndLossChartMonthly]



AS
declare @Currentmonth datetime,
		@Currentyear datetime

set @Currentmonth=datepart(month,getdate())
set @Currentyear=datepart(year,getdate())
SELECT        SUM(Payment) AS Amount, 
'Received' AS Transtype
FROM            tblDailyVisitDetails
WHERE        
datepart(month,Dated)=@Currentmonth
and datepart(year,Dated)=@Currentyear
AND isnull(Payment,0) <>0


union all

SELECT        SUM(NetAmount) AS Amount, 
TransType
       FROM            tblGeneralLedger
       WHERE        
TransactionMonth=@Currentmonth
and TransactionYear=@Currentyear
AND isnull(NetAmount,0) <>0
       GROUP BY TransType
       
       

	RETURN
