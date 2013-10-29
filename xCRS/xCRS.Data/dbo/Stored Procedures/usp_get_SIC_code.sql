CREATE   procedure [dbo].[usp_get_SIC_code]
as
select distinct
case when len(row4) = 0 and len(rcol4) > 0 then rcol4
     when len(rcol4) = 0 and len(row4) > 0 then row4
     else rcol4 + '/' + row4 end as SIC_Code
from crs_tmpreport_downloaded
where row4 is not null or rcol4 is not null
order by 1





