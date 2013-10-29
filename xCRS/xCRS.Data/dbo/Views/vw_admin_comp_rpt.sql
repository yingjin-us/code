

CREATE   View vw_admin_comp_rpt
as
select * from vw_comp_summary where reviewyear in(year(getdate())-1, year(getdate())-2)


