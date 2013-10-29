CREATE procedure [dbo].[usp_whatif_bonus_data]
@Empl_id  varchar(7)
as
select  Bon_type , Bon_Amt from CRS_TBL_WHATIF_BONUS_DATA where empl_id = @empl_id
