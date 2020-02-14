#
# Read contents of a csv file and compare in AD
# Write out to a new csv file is similar name is found
# 

$fileOfNames = Import-CSV C:\Users\Dave\source\repos\CompareUserNames\CompareUserNames\Names.csv
$compareNAMES = Import-CSV C:\Users\Dave\source\repos\CompareUserNames\CompareUserNames\NamesCompare.csv
$ADNames = Get-ADUser -Filter * -SearchBase "OU=Finance,OU=UserAccounts,DC=FABRIKAM,DC=COM"

foreach ($item in $fileOfNames)  
{
	$item.Name
	$item.Surname
	$item.DOB
	foreach ($compare in $compareNAMES) 
	{
		If ($item.Name -eq $compare.Name ) 
		{
			'Found similar first name in the compare csv file'
			Add-Content -Path C:\Users\Dave\source\repos\CompareUserNames\CompareUserNames\SimilarNames.csv  -Value "$item.Name,$item.Surname,$item.DOB"
		}
		else {'No, first name not similar'}
	}
}
	

