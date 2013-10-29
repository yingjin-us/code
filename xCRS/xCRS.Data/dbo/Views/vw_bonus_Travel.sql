
CREATE   view vw_bonus_Travel
as
select empl_id, Reviewyear, bon_amt 
	from crs_tblBon_Info
	where bon_type = 'BST'

