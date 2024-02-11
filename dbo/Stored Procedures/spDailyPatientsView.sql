CREATE PROCEDURE [dbo].[spDailyPatientsView]

@Dated datetime

AS


SELECT        tblDailyVisits.DailyVisitID, tblPatients.PatientID, tblPatients.PatientPanelCode, tblPatients.PatientName, tblPatients.FatherName, tblPatients.Gender, 
                         tblPatients.MobNbr, tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblDailyVisits.AGE, tblDailyVisits.OtherPayment, tblDailyVisits.PaymentFromDetail, 
                         tblDailyVisits.Discount, tblDailyVisits.NetAmount, tblDailyVisits.ReceivedAmount, tblDailyVisits.BalanceAmount, tblDailyVisits.PaymentCode, 
                         tblServices.ServiceName, tblDailyVisitDetails.RefDocID, tblDailyVisitDetails.PaymentCode AS PaymentCodeDetail, 
                         tblDailyVisitDetails.Rate, tblDailyVisitDetails.nbrOfRepitition,tblDailyVisitDetails.TotalAmount,
                         tblDailyVisitDetails.Payment, tblDailyVisitDetails.Discount AS DiscountDetail, Beneficiaries.BeneficiaryName, PatientPanels.Companyname
FROM            tblDailyVisits INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID LEFT OUTER JOIN
                         PatientPanels ON tblDailyVisitDetails.CompanyPanelID = PatientPanels.CompanyID LEFT OUTER JOIN
                         Beneficiaries ON tblDailyVisitDetails.BeneficiaryServiceID = Beneficiaries.BeneficiaryID
WHERE        (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) = @Dated) and isnull(tblDailyVisitDetails.Payment,0) >0
ORDER BY tblDailyVisits.VisitNbr

	RETURN
