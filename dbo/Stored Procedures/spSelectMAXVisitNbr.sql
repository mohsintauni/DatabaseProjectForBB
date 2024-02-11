-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectMAXVisitNbr]
	-- Add the parameters for the stored procedure here


AS
BEGIN


Select isnull(max(VisitNbr),0)+1 as VisitNbr
 from tblDailyVisits 
where convert(datetime, convert(varchar,Dated,106)) =

 convert(datetime, convert(varchar, (case when datepart(hour,getdate())<=(9) then dateadd(day,(-1),getdate()) else getdate() end),106))

END

