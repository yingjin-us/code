create   view vw_bonus_Hiring
as
select empl_id, Reviewyear, bon_amt , bon_type
from crs_tblBon_Info
where bon_type = 'BNH'

