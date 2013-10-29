CREATE procedure dbo.usp_GetLkpOfferJobFamily
as
	select j.*, pr.salmid, pr.spread from issql1.wisdom.dbo.jobfamily j, dbo.CRS_lkpOfferPayRange pr
	where j.title_cd = pr.title_cd
	
	