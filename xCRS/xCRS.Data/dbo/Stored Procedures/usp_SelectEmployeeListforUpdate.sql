CREATE  procedure usp_SelectEmployeeListforUpdate
AS
SELECT     dbo.vw_Empl_Info.LAST_NAME + ', ' +  dbo.vw_Empl_Info.FIRST_NAME Name, 
	ORG_ID, SU1_Name SU1, 
	substring(SU1_Name,3,len(SU1_Name))SULastName, 
	empl_class_cd,
	case
		when empl_class_cd = 'SAL' then 'Salaried'
		when empl_class_cd = 'FLD' then 'Field'
		when empl_class_cd = 'PTH' then 'Hourly'
		when empl_class_cd like 'PTS%' then 'Salaried'
		End StaffType
FROM         dbo.vw_Empl_Info
	--where ORG_ID='1.21.21.1'



