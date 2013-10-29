CREATE procedure usp_getBonusType
	@Admin as bit
AS

if (@Admin=1)
	SELECT Bon_Type, Description From CRS_lkpBonus_Type where Old_Bon_Code = 0 ORDER BY Description
else
	SELECT Bon_Type, Description From CRS_lkpBonus_Type where 
		Old_Bon_Code = 0 AND (Bon_Type='BSA' OR Bon_Type='BST')
		ORDER BY Description;
	


