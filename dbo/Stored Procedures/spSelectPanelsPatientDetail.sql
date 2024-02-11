-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectPanelsPatientDetail]

@Dated1 datetime,
@Dated2 datetime,
@CompanyID int

AS
BEGIN

SELECT        PatientPanels.CompanyID, PatientPanels.Companyname, tblDailyVisitDetails.Rate,tblDailyVisitDetails.nbrOfRepitition,tblDailyVisitDetails.TotalAmount, tblDailyVisitDetails.Payment, tblDailyVisitDetails.Discount, 
                         tblServices.ServiceName, tblDepartments.DepartmentTitle, tblPatients.PatientID, tblPatients.PatientName, tblPatients.FatherName, tblPatients.DateofBirth, 
                         tblDailyVisits.VisitNbr, tblDailyVisits.Dated, tblPatients.PatientPanelCode
FROM            tblDailyVisitDetails INNER JOIN
                         tblDailyVisits ON tblDailyVisitDetails.DailyVisitID = tblDailyVisits.DailyVisitID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID INNER JOIN
                         tblDepartments ON tblServices.DepartmentID = tblDepartments.DepartmentID INNER JOIN
                         PatientPanels ON tblDailyVisitDetails.CompanyPanelID = PatientPanels.CompanyID INNER JOIN
                         tblPatients ON tblDailyVisits.PatientID = tblPatients.PatientID
WHERE        (PatientPanels.CompanyID = @CompanyID) AND (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) BETWEEN CONVERT(datetime, 
                         CONVERT(varchar, @Dated1)) AND CONVERT(datetime, CONVERT(varchar, @Dated2,106))) OR
                         (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @Dated1,106)) AND CONVERT(datetime, 
                         CONVERT(varchar, @Dated2))) AND (@CompanyID = 0)
ORDER BY PatientPanels.Companyname


END
