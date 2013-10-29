create view [dbo].[vw_sic_code]
as
select empl_id,
case when len(row4) = 0 and len(rcol4) > 0 then rcol4
     when len(rcol4) = 0 and len(row4) > 0 then row4
     when len(rcol4) = 0 and len(row4) = 0 then ''
     else rcol4 + '/' + row4 end as SIC_Code
from crs_tmpreport_downloaded

