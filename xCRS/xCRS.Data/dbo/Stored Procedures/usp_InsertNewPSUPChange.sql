CREATE procedure usp_InsertNewPSUPChange
	@empl_ID nvarchar(12),
	@Name varchar(150),
	@NewPSUP varchar(150),
	@NewPSUPCode char(3),
	@username varchar(100)
AS
Declare @ctr int
	set @ctr = (select count(*) from CRS_tblNewPSUP where empl_id=@empl_ID)
if (@ctr=1) 
	BEGIN
	update CRS_tblNewPSUP
		set NewPSUP=@NewPSUP,
		NewPSUPCode=@NewPSUPCode,
		updatedby=@username,
		updatedate=getdate()
	where empl_id=@empl_ID
	END
else
	BEGIN
	insert into CRS_tblNewPSUP
		VALUES(@empl_ID, @Name, @NewPSUP, @NewPSUPCode, getdate(), getdate(), @username )
	END



--select * from CRS_tblNewPSUP where empl_id='1001873'

