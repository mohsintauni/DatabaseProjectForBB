CREATE PROCEDURE [dbo].[spPrintReciept]

@DailyVisitID int

AS

SELECT        tblDailyVisits.DailyVisitID, tblPatients.PatientID, tblPatients.PatientPanelCode, tblPatients.PatientName, tblPatients.FatherName, tblPatients.Gender, 
                         tblPatients.DateofBirth, tblPatients.MobNbr, tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblDailyVisits.AGE, tblDailyVisits.OtherPayment, 
                         tblDailyVisits.PaymentFromDetail, tblDailyVisits.Discount, tblDailyVisits.NetAmount, tblDailyVisits.ReceivedAmount, tblDailyVisits.BalanceAmount, 
                         tblDailyVisits.PaymentCode
FROM            tblDailyVisits INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID
WHERE        (tblDailyVisits.DailyVisitID = @DailyVisitID)


	RETURN
