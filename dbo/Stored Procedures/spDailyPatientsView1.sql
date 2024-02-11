CREATE PROCEDURE [dbo].[spDailyPatientsView1]

@Dated datetime

AS


SELECT        tblDailyVisits.DailyVisitID, tblPatients.PatientID, tblPatients.PatientPanelCode, tblPatients.PatientName, tblPatients.FatherName, tblPatients.Gender, 
                         tblPatients.MobNbr, tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblDailyVisits.AGE, tblDailyVisits.OtherPayment, tblDailyVisits.PaymentFromDetail, 
                         tblDailyVisits.Discount, tblDailyVisits.ReceivedAmount, tblDailyVisits.AmountReturned, tblDailyVisits.BalanceAmount, tblDailyVisits.NetAmount, 
                         tblDailyVisits.PaymentCode,tblDailyVisits.Remarks
FROM            tblDailyVisits INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID
WHERE        (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) = @Dated)
ORDER BY tblDailyVisits.VisitNbr

	RETURN
