


CREATE   view [dbo].[vw_DELTEK_TS_LN_HS]
AS
select empl_id, bon_type, sum(bon_amt) bon_amt,
	case
	when bon_type = 'BMG' and cast(month(bon_date) as int) = 1 then cast(year(bon_date) - 1 as char(4))
	when bon_type = 'BMG' then cast(year(bon_date) as char(4))
	when (bon_type ='BON' or bon_type='BSA' or bon_type = 'BST') and 
		(bon_date='12/10/' + cast(year(bon_date) as char(4)) OR bon_date='12/15/' + cast(year(bon_date) as char(4))) 
		then year(bon_date)
	when bon_date between '01/12/2006' and '11/30/2007' then '2007'
	when bon_date between '11/26/' + cast(year(bon_date) as char(4)) and 
		'11/25/' + cast(cast(year(bon_date) as int) + 1 as char(4)) then cast(year(bon_date) as int)  
	when bon_date between '11/26/' + cast(cast(year(bon_date) as int) - 1 as char(4)) and 
		'11/25/' + cast(year(bon_date) as char(4)) then cast(year(bon_date) as int) 
	else 0
	end AS bon_year
from DELTEK_TS_LN_HS
	group by  bon_type, empl_id,
	case
		when bon_type = 'BMG' and cast(month(bon_date) as int) = 1 then cast(year(bon_date) - 1 as char(4))
		when bon_type = 'BMG' then cast(year(bon_date) as char(4))
		when (bon_type ='BON' or bon_type='BSA' or bon_type = 'BST') and 
			(bon_date='12/10/' + cast(year(bon_date) as char(4)) OR bon_date='12/15/' + cast(year(bon_date) as char(4))) 
			then year(bon_date)
		when bon_date between '01/12/2006' and '11/30/2007' then '2007'
		when bon_date between '11/26/' + cast(year(bon_date) as char(4)) and 
			'11/25/' + cast(cast(year(bon_date) as int) + 1 as char(4)) then cast(year(bon_date) as int)  
		when bon_date between '11/26/' + cast(cast(year(bon_date) as int) - 1 as char(4)) and 
			'11/25/' + cast(year(bon_date) as char(4)) then cast(year(bon_date) as int) 
		else 0
	end 



