CREATE PROCEDURE spInsertDailyVisit
	
@PatientID bigint,
@VisitNbr int, 
@AGE int,
@OtherPayment float,
@PaymentFromDetail float,
@Discount float,
@PaymentCode nvarchar(50),
@UpdatedOn datetime,
@UpdatedBy nvarchar(100),
@Remarks nvarchar(4000), 
@ReceivedAmount float,
@CompanyPanelID int
	
AS
	
	INSERT INTO tblDailyVisits
                         (PatientID, VisitNbr, Dated, AGE, OtherPayment, PaymentFromDetail, Discount, PaymentCode, UpdatedOn, UpdatedBy, Remarks, IsActive, ReceivedAmount, 
                         CompanyPanelID)
select        @PatientID,isnull(max(VisitNbr),0)+1, GETDATE(),@AGE,@OtherPayment,@PaymentFromDetail,@Discount,@PaymentCode,@UpdatedOn,@UpdatedBy,@Remarks, 
                         1,@ReceivedAmount,@CompanyPanelID from tblDailyVisits
where convert(datetime,convert(varchar,Dated,106)) = convert(datetime,convert(varchar,GETDATE(),106))
	
	RETURN
