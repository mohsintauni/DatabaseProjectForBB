CREATE PROCEDURE [dbo].[ProfitAndLossDetail]

@Dated1 datetime,
@Dated2 datetime

AS

SELECT 
tblDailyVisitDetails.Payment AS Amount, 
'Reveived' AS Transtype, 
CONVERT (datetime, CONVERT (varchar, @Dated1, 106)) AS D1, 
CONVERT (datetime, CONVERT (varchar, @Dated2, 106)) AS D2, 
tblServices.ServiceName 
FROM tblDailyVisitDetails INNER JOIN tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID 
WHERE (CONVERT (datetime, CONVERT (varchar, tblDailyVisitDetails.Dated, 106)) BETWEEN CONVERT (datetime, CONVERT (varchar, @Dated1, 106)) AND CONVERT (datetime, CONVERT (varchar, @Dated2, 106))) 
AND (tblDailyVisitDetails.Payment <> 0)

union all

SELECT 
- (1 * tblGeneralLedger.NetAmount) AS Amount, 
tblGeneralLedger.TransType, 
CONVERT (datetime, CONVERT (varchar, @Dated1, 106)) AS D1, 
CONVERT (datetime, CONVERT (varchar, @Dated2, 106)) AS D2, 
tblServices.ServiceName 
FROM tblGeneralLedger INNER JOIN tblServices ON tblGeneralLedger.ServiceID = tblServices.ServiceID 
WHERE (CONVERT (datetime, CONVERT (varchar, tblGeneralLedger.Dated, 106)) BETWEEN CONVERT (datetime, CONVERT (varchar, @Dated1, 106)) AND CONVERT (datetime, CONVERT (varchar, @Dated2, 106))) 
AND (- (1 * tblGeneralLedger.NetAmount) <> 0)
       
       

	RETURN
