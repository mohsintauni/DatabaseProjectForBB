CREATE PROCEDURE ShowTopServicesChart

	@Dated1 datetime,
	 @Dated2 datetime
	
AS
SELECT        TOP (8) tblServices.ServiceName, SUM(tblDailyVisitDetails.TotalAmount) AS TotalAmount, SUM(tblDailyVisitDetails.Discount) AS Discount, 
                         SUM(tblDailyVisitDetails.Payment) AS Payment
FROM            tblDailyVisitDetails INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID
WHERE        (CONVERT(datetime, CONVERT(varchar, tblDailyVisitDetails.Dated, 106)) BETWEEN @Dated1 AND @Dated2)
GROUP BY tblServices.ServiceName
HAVING        (SUM(tblDailyVisitDetails.Payment) > 0)
ORDER BY TotalAmount DESC
                         
	RETURN
