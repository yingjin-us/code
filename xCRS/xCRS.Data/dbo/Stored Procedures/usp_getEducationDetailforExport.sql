CREATE procedure usp_getEducationDetailforExport
	@empl_id varchar(12)
AS
select
CRS_tblEmployee_Education.Degree_Code [DEGREE],
CRS_lkpDegree.Degree [DESCRIPTION],
CRS_tblEmployee_Education.Major [MAJOR],
CRS_tblEmployee_Education.Minor [MINOR],
CRS_tblEmployee_Education.School [INSTITUTION],
CRS_tblEmployee_Education.Date_Completed [COMPLETED DATE]
from CRS_tblEmployee_Education inner join CRS_lkpDegree on  
	CRS_lkpDegree.Degree_ID= CRS_tblEmployee_Education.Degree_ID
	where CRS_tblEmployee_Education.Empl_ID=@empl_id
