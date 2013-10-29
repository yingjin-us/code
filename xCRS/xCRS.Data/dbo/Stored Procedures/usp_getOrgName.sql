
CREATE  procedure usp_getOrgName
	@org_ID varchar(50)
AS
--select ORG_NAME from dbo.org where org_id=@org_ID
select org_name from CPPROD..DELTEK.ORG where org_id=@org_ID

