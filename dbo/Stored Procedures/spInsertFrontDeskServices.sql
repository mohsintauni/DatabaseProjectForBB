-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE spInsertFrontDeskServices

@DailyVisitID int

AS
BEGIN

Declare @DepartmentID int

SELECT DISTINCT @DepartmentID=isnull(tblServices.DepartmentID,0)
FROM         tblDailyVisitDetails INNER JOIN
                      tblServices ON tblDailyVisitDetails.ServiceID = tblServices.ServiceID
WHERE     (tblServices.DepartmentID = 7) AND (tblDailyVisitDetails.DailyVisitID = @DailyVisitID)

if(isnull(@DepartmentID,0)<>7)
begin
INSERT INTO tblDailyVisitDetails
						(DailyVisitID, ServiceID, Dated, Comission, Rate, Payment, BeneficiaryServiceID, CompanyPanelID)
SELECT					@DailyVisitID,ServiceID, getdate(),Comission, Rate,0,10,4
FROM         tblServices
WHERE     (DepartmentID = 7)

end




END
