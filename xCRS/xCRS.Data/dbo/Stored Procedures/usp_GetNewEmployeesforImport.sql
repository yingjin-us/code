

CREATE procedure usp_GetNewEmployeesforImport
	@NewHire as bit
As
	if (@NewHire=1)
		begin
			Select v.*, i.IDMaster_WestatID_Supervisor4 SU from dbo.vw_Import_NewEmployees v
			left outer join idmaster i on v.empl_id=i.IDMaster_WestatID
			--where i.Supervisorcode=(select SupervisorCode from IDMaster where IDMaster_WestatID=v.empl_id)
		end 
	else
		begin
			Select v.*, i.IDMaster_WestatID_Supervisor4 SU from dbo.vw_Import_Rehires v
			left outer join idmaster i on v.empl_id=i.IDMaster_WestatID
			--where i.Supervisorcode=(select SupervisorCode from IDMaster where IDMaster_WestatID=v.empl_id)
		end 

