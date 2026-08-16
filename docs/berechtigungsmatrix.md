# Berechtigungsmatrix – Freigabe `\\FileSrv\RDS_APPS`

Alle Berechtigungen sind NTFS-Berechtigungen, vergeben nach dem **AGDLP-Prinzip**
(Accounts → Global Group → Domain Local Group → Permissions):
Benutzerkonten sind Mitglied globaler Sicherheitsgruppen, diese wiederum Mitglied
domänenlokaler Gruppen, denen die eigentlichen NTFS-Rechte zugewiesen werden.

| Ordnerpfad                     | Gilt für                          | Abteilung A (AE) | Abteilung B (SI) | Admins      |
|---------------------------------|-------------------------------------|:-----------------:|:-----------------:|:-----------:|
| `\\FileSrv\RDS_APPS\`           | nur dieser Ordner                  | lesen              | lesen              | Vollzugriff |
| `\\FileSrv\RDS_APPS\AE`         | Ordner, Unterordner und Dateien    | schreiben/lesen    | kein Zugriff       | Vollzugriff |
| `\\FileSrv\RDS_APPS\SI`         | Ordner, Unterordner und Dateien    | kein Zugriff       | schreiben/lesen    | Vollzugriff |

Zusätzlich ist auf der Freigabe **Access-Based Enumeration (ABE)** aktiviert:
Benutzer sehen im Explorer ausschließlich die Ordner, für die sie tatsächlich
Berechtigungen besitzen — nicht autorisierte Ordner werden gar nicht erst
angezeigt statt nur den Zugriff zu verweigern. Das reduziert die sichtbare
Angriffsfläche und verhindert versehentliches "Herumklicken" in fremden
Abteilungsordnern.
