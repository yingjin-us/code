CREATE procedure [dbo].[usp_bon_info_downloaded]
@Empl_id  varchar(7)
as
select  Bon_type , Bon_Amt from crs_tblbon_info_downloaded where empl_id = @empl_id
