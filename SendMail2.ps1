# need powershell v3.0
$From = "1111@sina.com"
$To = "2222@qq.com"
$Subject = "TestSubject" 
$Body = "TestBody"
$smtpServer = "smtp.sina.com"
$smtpPort = 25
$username = "1111@sina.com"
$password = "pppp"
$attach ="c:\1\test.txt"

$pword = ConvertTo-SecureString –String $password –AsPlainText -Force
$Creds = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $username, $pword
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -smtpserver $smtpServer -Credential $Creds -Attachments $attach 

if($?)
{
	Write-Host "Sent Successfully!" -ForegroundColor Green
}
else
{
	Write-Host "Error" -ForegroundColor Red
}
