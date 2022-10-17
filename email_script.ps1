

function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192"
}
$IP = getIP

function getUSER {
    whoami
}
$USER = getUSER
 
function getHOST {
    hostname
}
$H = getHOST

function getVersion {
    ($HOST.Version)
}
$VERSION = getVersion

function getDATE {
    Get-Date
}
$DATE = getDATE

$From = "jwbehm2018@gmail.com"
$To = "jwbehm2018@gmail.com"
$Subject = "Lab 3 script"
$Body = ("This machine's IP is $IP. The user is $USER. The host is $H. The version is $VERSION. The date is $DATE.")

# The password is an app-specific password if you have 2-factor-auth enabled
$Password = "osqirekhxdullecn" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential





