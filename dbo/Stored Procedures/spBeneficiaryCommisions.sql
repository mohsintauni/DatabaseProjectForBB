CREATE PROCEDURE [dbo].[spBeneficiaryCommisions]
@dated1 datetime,
@dated2 datetime


AS

	

SELECT Beneficiaries.BeneficiaryName, 
SUM(tblDailyVisitDetails.Payment) AS Payment, 
SUM(CASE WHEN BeneficiaryServiceID <> 10 THEN tblDailyVisitDetails.Payment * tblDailyVisitDetails.Comission / 100 ELSE 0 END) AS CommisionToBeneficiary, 
SUM(CASE WHEN BeneficiaryServiceID <> 10 THEN tblDailyVisitDetails.Payment - tblDailyVisitDetails.Payment * tblDailyVisitDetails.Comission / 100 ELSE payment END) AS HospitalPart, 
tblDailyVisitDetails.BeneficiaryServiceID ,
@dated1 as D1,
@dated2 as D2
FROM tblDailyVisits INNER JOIN tblDailyVisitDetails ON tblDailyVisits.DailyVisitID = tblDailyVisitDetails.DailyVisitID INNER JOIN Beneficiaries ON tblDailyVisitDetails.BeneficiaryServiceID = Beneficiaries.BeneficiaryID WHERE (CONVERT (datetime, CONVERT (varchar, tblDailyVisits.Dated, 106)) BETWEEN CONVERT (datetime, CONVERT (varchar, @dated1, 106)) AND CONVERT (datetime, CONVERT (varchar, @dated2, 106))) GROUP BY Beneficiaries.BeneficiaryName, tblDailyVisitDetails.BeneficiaryServiceID HAVING (SUM(tblDailyVisitDetails.Payment) > 0)

RETURN
