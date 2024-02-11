CREATE PROCEDURE spInertVisitDetail
	
	
	@DailyVisitID int,
	@ServiceID int,
	@PaymentCode nvarchar(10),
	@Payment money,
	@Remarks nvarchar(2500),
	@IsActive bit,
	@BeneficiaryServiceID int, 
	@RefDocID int,
	@Rate money
	
AS
if(@ServiceID>0)
INSERT INTO tblDailyVisitDetails
                         (DailyVisitID, ServiceID, PaymentCode, Payment, Remarks, IsActive, BeneficiaryServiceID, Dated, RefDocID, Rate)
VALUES        (@DailyVisitID,@ServiceID,@PaymentCode,@Payment,@Remarks,@IsActive,@BeneficiaryServiceID, GETDATE(),@RefDocID,@Rate)

	RETURN
