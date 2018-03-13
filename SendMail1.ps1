# support powershell v2.0
$From = "1111@sina.com"
$To = "2222@qq.com"
$Subject = "TestSubject" 
$Body = "TestBody"
$smtpServer = "smtp.sina.com"
$smtpPort = 25
$username = "1111@sina.com"
$password = "pppp"
$attach ="c:\1\test.txt"

$SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($smtpServer, $SmtpPort) 
$SMTPClient.EnableSsl = $false 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($username, $password)
$attachfile = New-Object Net.Mail.Attachment($attach)
$SMTPMessage.Attachments.Add($attachfile)
$SMTPClient.Send($SMTPMessage)
if($?)
{
	Write-Host "Sent Successfully!" -ForegroundColor Green
}
else
{
	Write-Host "Error" -ForegroundColor Red
}
$attachfile.Dispose()
