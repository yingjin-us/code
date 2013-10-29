
CREATE  procedure usp_getpsuplist
	@SUCode char(3)
as

if (@SUCode = '')
	BEGIN
	SELECT DISTINCT ltrim(substring(SU1_Name,3,len(SU1_Name)))SU, SU1,SU1_Name
		From dbo.CRS_tmpReport_Downloaded WHERE SU1 is not null and SU1<>'BRD'
	/*union
	SELECT DISTINCT substring(SU2_Name,3,len(SU2_Name))SU, SU2, SU2_Name From dbo.CRS_tmpReport_Downloaded 
		WHERE SU2 is not null  and SU2<>'BRD'
	union
	SELECT DISTINCT substring(SU3_Name,3,len(SU3_Name))SU, SU3, SU3_Name From dbo.CRS_tmpReport_Downloaded 
		WHERE SU3 is not null  and SU3<>'BRD'
	union
	SELECT DISTINCT substring(SU4_Name,3,len(SU4_Name))SU, SU4,SU4_Name  
		From dbo.CRS_tmpReport_Downloaded WHERE SU4 is not null  and SU4<>'BRD'*/
	END
else
BEGIN
	SELECT DISTINCT ltrim(substring(SU1_Name,3,len(SU1_Name)))SU, SU1,SU1_Name  
		From dbo.CRS_tmpReport_Downloaded WHERE ((SU1 = @SUCode) OR (SU2 = @SUCode) OR (SU3 = @SUCode) OR (SU4 = @SUCode)) 
		and SU1 is not null and SU1<>'BRD'
	/*union
	SELECT DISTINCT substring(SU2_Name,3,len(SU2_Name))SU, SU2, SU2_Name From dbo.CRS_tmpReport_Downloaded 
		WHERE ((SU2 = @SUCode) OR (SU3 = @SUCode) OR (SU4 = @SUCode)) and SU2 is not null  and SU2<>'BRD'
	union
	SELECT DISTINCT substring(SU3_Name,3,len(SU3_Name))SU, SU3, SU3_Name From dbo.CRS_tmpReport_Downloaded 
		WHERE ((SU3 = @SUCode) OR   (SU4 = @SUCode)) and SU3 is not null  and SU3<>'BRD'
	union
	SELECT DISTINCT substring(SU4_Name,3,len(SU4_Name))SU, SU4,SU4_Name  
		From dbo.CRS_tmpReport_Downloaded WHERE ((SU1 = @SUCode) OR (SU2 = @SUCode) OR (SU3 = @SUCode) OR (SU4 = @SUCode)) 
		and SU4 is not null  and SU4<>'BRD'*/
END

