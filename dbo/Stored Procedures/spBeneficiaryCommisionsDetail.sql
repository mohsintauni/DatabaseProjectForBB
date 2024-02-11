
CREATE PROCEDURE [dbo].[spBeneficiaryCommisionsDetail]
@dated1 datetime,
@dated2 datetime,
@BeneficiaryName nvarchar(250)


AS

	

SELECT        Beneficiaries.BeneficiaryName, tblDailyVisitDetails.Payment, 
                         (CASE WHEN BeneficiaryServiceID <> 10 THEN tblDailyVisitDetails.Payment * tblDailyVisitDetails.Comission / 100 ELSE 0 END) AS CommisionToBeneficiary, 
                         (CASE WHEN BeneficiaryServiceID <> 10 THEN tblDailyVisitDetails.Payment - tblDailyVisitDetails.Payment * tblDailyVisitDetails.Comission / 100 ELSE payment END)
                          AS HospitalPart, tblDailyVisitDetails.BeneficiaryServiceID, @dated1 AS D1, @dated2 AS D2, tblServices.ServiceName
FROM            tblDailyVisits INNER JOIN
                         tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN
                         Beneficiaries ON tblDailyVisitDetails.BeneficiaryServiceID = Beneficiaries.BeneficiaryID INNER JOIN
                         tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID
WHERE        (CONVERT(datetime, CONVERT(varchar, tblDailyVisits.Dated, 106)) BETWEEN CONVERT(datetime, CONVERT(varchar, @dated1, 106)) AND CONVERT(datetime, 
                         CONVERT(varchar, @dated2, 106))) AND (tblDailyVisitDetails.Payment > 0) AND (Beneficiaries.BeneficiaryName LIKE N'%' + @BeneficiaryName + N'%' OR
                         @BeneficiaryName = 'All')

RETURN
