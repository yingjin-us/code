
CREATE  procedure [dbo].[usp_getEmployeeDetail]
	@Empl_ID varchar(10)
AS
SELECT *,
	case 
		when ADJ_HIRE_DT is null then
			ORIG_HIRE_DT
		when ORIG_HIRE_DT > ADJ_HIRE_DT then
			ORIG_HIRE_DT  
	else
	       	ADJ_HIRE_DT 
	END HIRE_DT,

	case
		when ANNL_AMT is not null then
			ANNL_AMT/1000
		else
			0
		end ANNUAL_AMT,
	case 
		when right(ORG_ID,1)=1 then
			'Salaried'
		when right(ORG_ID,1)=2 then
			'Semi-Monthly Hrly'
		when right(ORG_ID,1)=3 then
			'Semi-Monthly Field'
		end CLASS
FROM vw_Empl_Info_Downloaded where Empl_ID=@Empl_ID

