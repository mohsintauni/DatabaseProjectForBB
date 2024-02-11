CREATE PROCEDURE [dbo].[spPrintRecieptDepartmentWise]

@DailyVisitID int,
@DepartmentID varchar(50)

AS
if(convert(varchar,@DepartmentID) = '7,1')
begin
SELECT        
tblDailyVisits.DailyVisitID, 
tblPatients.PatientID, 
tblPatients.PatientPanelCode, 
tblPatients.PatientName, 
tblPatients.FatherName, 
tblPatients.Gender, 
tblDailyVisits.VisitNbr, 
tblDailyVisits.Dated, 
tblDailyVisits.AGE, 
tblDailyVisits.PaymentFromDetail, 
tblDailyVisits.NetAmount, 
tblDailyVisits.ReceivedAmount, 
tblDailyVisits.BalanceAmount, 
tblDailyVisits.PaymentCode, 
tblServices.ServiceName, 
CONVERT(varchar, tblDailyVisitDetails.Dated, 107) AS ReferalDate, 
SUM(tblDailyVisitDetails.TotalAmount) AS Rate, 
SUM(tblDailyVisitDetails.Payment) AS DetailPayment, 
SUM(tblDailyVisitDetails.Discount) AS DetailDiscount,
tblDailyVisits.OtherPayment as Advance,
tblDailyVisits.AmountReturned 
FROM            tblDailyVisits INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID
WHERE        (tblServices.DepartmentID IN (7, 1)) AND (tblDailyVisitDetails.Payment > 0)
GROUP BY tblDailyVisits.DailyVisitID, tblPatients.PatientID, tblPatients.PatientPanelCode, tblPatients.PatientName, tblPatients.FatherName, tblPatients.Gender, 
                         tblPatients.DateofBirth, tblPatients.MobNbr, tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblDailyVisits.AGE, tblDailyVisits.OtherPayment, 
                         tblDailyVisits.PaymentFromDetail, tblDailyVisits.Discount, tblDailyVisits.NetAmount, tblDailyVisits.ReceivedAmount, tblDailyVisits.BalanceAmount, 
                         tblDailyVisits.PaymentCode, tblServices.ServiceName, CONVERT(varchar, tblDailyVisitDetails.Dated, 107),
                         tblDailyVisits.OtherPayment,
tblDailyVisits.AmountReturned 

HAVING        (tblDailyVisits.DailyVisitID = @DailyVisitID) 
end
else
begin

SELECT        
tblDailyVisits.DailyVisitID, 
tblPatients.PatientID, 
tblPatients.PatientPanelCode, 
tblPatients.PatientName, 
tblPatients.FatherName, 
tblPatients.Gender, 
tblDailyVisits.VisitNbr, 
tblDailyVisits.Dated, 
tblDailyVisits.AGE, 
tblDailyVisits.PaymentFromDetail, 
tblDailyVisits.NetAmount, 
tblDailyVisits.ReceivedAmount, 
tblDailyVisits.BalanceAmount, 
tblDailyVisits.PaymentCode, 
tblServices.ServiceName, 
CONVERT(varchar, tblDailyVisitDetails.Dated, 107) AS ReferalDate, 
SUM(tblDailyVisitDetails.TotalAmount) AS Rate, 
SUM(tblDailyVisitDetails.Payment) AS DetailPayment, 
SUM(tblDailyVisitDetails.Discount) AS DetailDiscount,
tblDailyVisits.OtherPayment as Advance,
tblDailyVisits.AmountReturned 
FROM            tblDailyVisits INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID
WHERE       (tblServices.DepartmentID = (convert(int,@DepartmentID)) OR (convert(int,@DepartmentID))=0) AND (tblDailyVisitDetails.Payment > 0)
GROUP BY tblDailyVisits.DailyVisitID, tblPatients.PatientID, tblPatients.PatientPanelCode, tblPatients.PatientName, tblPatients.FatherName, tblPatients.Gender, 
                         tblPatients.DateofBirth, tblPatients.MobNbr, tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblDailyVisits.AGE, tblDailyVisits.OtherPayment, 
                         tblDailyVisits.PaymentFromDetail, tblDailyVisits.Discount, tblDailyVisits.NetAmount, tblDailyVisits.ReceivedAmount, tblDailyVisits.BalanceAmount, 
                         tblDailyVisits.PaymentCode, tblServices.ServiceName, CONVERT(varchar, tblDailyVisitDetails.Dated, 107) 
,tblDailyVisits.OtherPayment,tblDailyVisits.AmountReturned 
                         
Having        (tblDailyVisits.DailyVisitID = @DailyVisitID) 


end


	RETURN
