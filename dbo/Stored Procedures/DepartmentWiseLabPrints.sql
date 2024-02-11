CREATE PROCEDURE [dbo].[DepartmentWiseLabPrints]

	@DepartmentID int,
	@DailyVisitID int
	
	
AS

if(@DepartmentID=99)
begin

SELECT        tblServices.DepartmentID, tblDailyVisits.PatientID, tblPatients.PatientName, tblPatients.FatherName, tblPatients.PatientPanelCode, tblPatients.Gender, 
                         tblDailyVisits.DailyVisitID, tblDailyVisits.VisitNbr, CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) AS Dated, tblDailyVisits.AGE, 
                         tblDailyVisitDetails.DailyVisitDetailID, tblDailyVisitDetails.ServiceID, tblServices.ServiceName, CONVERT(datetime, CONVERT(varchar, tblDailyVisitDetails.Dated, 
                         106)) AS ServiceReferalDate, tblDailyVisitDetails.RefDocID, tblDepartments.DepartmentTitle, tblDailyVisitServiceDetail.DailyVisitServiceDetailID, 
                         tblDailyVisitDetails.ActualValue, tblDailyVisitDetails.Remarks, tblDailyVisitServiceDetail.ActualValue AS ActualValueServiceDetail, 
                         tblDailyVisitServiceDetail.Remarks AS RemarksServiceDetail, tblDailyVisitDetails.PaymentCode, tblDailyVisitDetails.Comission, tblDailyVisitDetails.Rate, 
                         tblDailyVisitDetails.Payment, tblDailyVisitDetails.Discount, Beneficiaries.BeneficiaryName, PatientPanels.Companyname, tblServiceDetail.ServiceDetailID, 
                         tblServiceDetail.Title, tblServiceDetail.NormalValues, tblUnits.UnitTitle, tblCategory.Category, tblHospital.HospitalName, tblHospital.Address, tblHospital.PhoneNbr, 
                         tblHospital.FaxNbr, tblHospital.MobileNbr, tblHospital.Email, tblHospital.Website, tblHospital.ImagePath, tblHospital.Footer1, tblHospital.Footer2
FROM            tblServiceDetail INNER JOIN
                         tblDailyVisitServiceDetail ON tblServiceDetail.ServiceDetailID = tblDailyVisitServiceDetail.ServiceDetailID LEFT OUTER JOIN
                         tblUnits ON tblServiceDetail.UnitID = tblUnits.UnitID LEFT OUTER JOIN
                         tblCategory ON tblServiceDetail.CategoryID = tblCategory.CategoryID RIGHT OUTER JOIN
                         tblDailyVisits INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID INNER JOIN
                         tblDepartments ON tblServices.DepartmentID = tblDepartments.DepartmentID ON 
                         tblDailyVisitServiceDetail.DailyVisitDetailID = tblDailyVisitDetails.DailyVisitDetailID LEFT OUTER JOIN
                         Beneficiaries ON tblDailyVisitDetails.BeneficiaryServiceID = Beneficiaries.BeneficiaryID LEFT OUTER JOIN
                         PatientPanels ON tblDailyVisitDetails.CompanyPanelID = PatientPanels.CompanyID CROSS JOIN
                         tblHospital
WHERE        (tblServices.DepartmentID in (1,7) AND (tblHospital.IsActive = 1) AND (tblDailyVisits.DailyVisitID = @DailyVisitID))

end
else
begin
SELECT        tblServices.DepartmentID, tblDailyVisits.PatientID, tblPatients.PatientName, tblPatients.FatherName, tblPatients.PatientPanelCode, tblPatients.Gender, 
                         tblDailyVisits.DailyVisitID, tblDailyVisits.VisitNbr, CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) AS Dated, tblDailyVisits.AGE, 
                         tblDailyVisitDetails.DailyVisitDetailID, tblDailyVisitDetails.ServiceID, tblServices.ServiceName, CONVERT(datetime, CONVERT(varchar, tblDailyVisitDetails.Dated, 
                         106)) AS ServiceReferalDate, tblDailyVisitDetails.RefDocID, tblDepartments.DepartmentTitle, tblDailyVisitServiceDetail.DailyVisitServiceDetailID, 
                         tblDailyVisitDetails.ActualValue, tblDailyVisitDetails.Remarks, tblDailyVisitServiceDetail.ActualValue AS ActualValueServiceDetail, 
                         tblDailyVisitServiceDetail.Remarks AS RemarksServiceDetail, tblDailyVisitDetails.PaymentCode, tblDailyVisitDetails.Comission, tblDailyVisitDetails.Rate, 
                         tblDailyVisitDetails.Payment, tblDailyVisitDetails.Discount, Beneficiaries.BeneficiaryName, PatientPanels.Companyname, tblServiceDetail.ServiceDetailID, 
                         tblServiceDetail.Title, tblServiceDetail.NormalValues, tblUnits.UnitTitle, tblCategory.Category, tblHospital.HospitalName, tblHospital.Address, tblHospital.PhoneNbr, 
                         tblHospital.FaxNbr, tblHospital.MobileNbr, tblHospital.Email, tblHospital.Website, tblHospital.ImagePath, tblHospital.Footer1, tblHospital.Footer2
FROM            tblServiceDetail INNER JOIN
                         tblDailyVisitServiceDetail ON tblServiceDetail.ServiceDetailID = tblDailyVisitServiceDetail.ServiceDetailID LEFT OUTER JOIN
                         tblUnits ON tblServiceDetail.UnitID = tblUnits.UnitID LEFT OUTER JOIN
                         tblCategory ON tblServiceDetail.CategoryID = tblCategory.CategoryID RIGHT OUTER JOIN
                         tblDailyVisits INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID INNER JOIN
                         tblDepartments ON tblServices.DepartmentID = tblDepartments.DepartmentID ON 
                         tblDailyVisitServiceDetail.DailyVisitDetailID = tblDailyVisitDetails.DailyVisitDetailID LEFT OUTER JOIN
                         Beneficiaries ON tblDailyVisitDetails.BeneficiaryServiceID = Beneficiaries.BeneficiaryID LEFT OUTER JOIN
                         PatientPanels ON tblDailyVisitDetails.CompanyPanelID = PatientPanels.CompanyID CROSS JOIN
                         tblHospital
WHERE        (tblServices.DepartmentID = @DepartmentID) AND (tblHospital.IsActive = 1) AND (tblDailyVisits.DailyVisitID = @DailyVisitID) OR
                         (tblHospital.IsActive = 1) AND (tblDailyVisits.DailyVisitID = @DailyVisitID) AND (@DepartmentID = 0) 
end

	RETURN
