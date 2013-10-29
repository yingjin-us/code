CREATE procedure [dbo].[usp_admin_sql]
as

-- sync tmpreport with idmaster
update crs_tmpreport_downloaded
set
Lname = i.Idmaster_LastName
, FName = i.idmaster_firstname
, org = fullorg_id
, dose = idmaster_doe
, dope = idmaster_dope
, dot = idmaster_dot
, su1 = (select s1.supervisorCode from issql1.wisdom.dbo.idmaster s1 where s1.idmaster_westatid = i.idmaster_westatid_supervisor )
, su2 = (select s2.supervisorCode from issql1.wisdom.dbo.idmaster s2 where s2.idmaster_westatid = i.idmaster_westatid_supervisor2 )
, su3 = (select s3.supervisorCode from issql1.wisdom.dbo.idmaster s3 where s3.idmaster_westatid = i.idmaster_westatid_supervisor3 )
, su4 = (select s4.supervisorCode from issql1.wisdom.dbo.idmaster s4 where s4.idmaster_westatid = i.idmaster_westatid_supervisor4 )	
, SU1_NAME = (select SUBSTRING(N1.IDMASTER_fIRSTNAME,1,1) +'.' + N1.IDMASTER_LASTNAME from issql1.wisdom.dbo.idmaster N1 where N1.idmaster_westatid = i.idmaster_westatid_supervisor )
, SU2_NAME = (select SUBSTRING(N2.IDMASTER_fIRSTNAME,1,1) +'.' + N2.IDMASTER_LASTNAME from issql1.wisdom.dbo.idmaster N2 where N2.idmaster_westatid = i.idmaster_westatid_supervisor2 )
, SU3_NAME = (select SUBSTRING(N3.IDMASTER_fIRSTNAME,1,1) +'.' + N3.IDMASTER_LASTNAME from issql1.wisdom.dbo.idmaster N3 where N3.idmaster_westatid = i.idmaster_westatid_supervisor3 )
, SU4_NAME = (select SUBSTRING(N4.IDMASTER_fIRSTNAME,1,1) +'.' + N4.IDMASTER_LASTNAME from issql1.wisdom.dbo.idmaster N4 where N4.idmaster_westatid = i.idmaster_westatid_supervisor4 )
 from issql1.wisdom.dbo.vw_WINS_IDMaster i, crs_tmpreport_downloaded t
 where i.idmaster_westatid = t.empl_id
 
