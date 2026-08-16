# Anmeldeskript (wird per GPO bei der Benutzeranmeldung ausgeführt)
#
# Zweck: Legt im Benutzerprofil einen versteckten Ordner "icon" an und kopiert
# die für die jeweilige Abteilung freigegebenen .ico-Dateien aus dem zentralen
# Freigabeordner auf dem Fileserver dorthin. Die GPO "erstellen_der_Verknuepfungen"
# verweist anschliessend auf diese lokal abgelegten Icons fuer die
# RemoteApp-Verknuepfungen auf dem Desktop.

New-Item -Path $env:USERPROFILE\Documents\ -Name "icon" -ItemType Directory
Set-ItemProperty -Path "$env:USERPROFILE\Documents\icon" -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

Copy-Item -Path \\FileSrv\RDS_APPS\<Abteilung>\Drawio.ico "$env:USERPROFILE\Documents\icon\"
Copy-Item -Path \\FileSrv\RDS_APPS\<Abteilung>\nmap.ico "$env:USERPROFILE\Documents\icon\"
Copy-Item -Path \\FileSrv\RDS_APPS\<Abteilung>\wireshark.ico "$env:USERPROFILE\Documents\icon\"
