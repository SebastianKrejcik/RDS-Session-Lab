# Abmeldeskript (wird per GPO bei der Benutzerabmeldung ausgefuehrt)
#
# Zweck: Raeumt die bei der Anmeldung erzeugten Artefakte wieder auf, damit bei
# der naechsten Anmeldung garantiert die aktuelle Icon-/Verknuepfungsversion neu
# ausgerollt wird und keine verwaisten Dateien im Profil zurueckbleiben.
# Hinweis aus der Praxis: Fuer jede zusaetzliche Anwendung muss hier eine eigene
# Remove-Item-Zeile ergaenzt werden, da nur einzelne Verknuepfungen (nicht der
# ganze Desktop-Ordner) entfernt werden sollen. Sauberer waere ein dedizierter
# Unterordner fuer alle RDS-Verknuepfungen - siehe README, Abschnitt "Lessons Learned".

Remove-Item -Path $env:USERPROFILE\Desktop\Drawio.lnk

Set-ItemProperty -Path "$env:USERPROFILE\Documents\icon" -Name Attributes -Value ([System.IO.FileAttributes]::Normal)
Remove-Item -Path "$env:USERPROFILE\Documents\icon" -Recurse -Force
