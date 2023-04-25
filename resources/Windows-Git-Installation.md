### 1. Git installieren

Ladet Euch [hier](https://git-scm.com/download/win) den passenden Installer für Euer Windows-Gerät herunter und folgt den Anweisungen im Installationsfenster. An den Konfigurationen müsst Ihr nichts ändern.


### 2. Git einrichten

Öffnet ein Terminal (z.B. Git Bash) und gebt folgende Befehle ein:

```bash
git config --global user.name "Dein Name"
git config --global user.email "deine@email.de"
git config --global init.defaultBranch main
git config --global color.ui auto
```
Idealerweise sollte Ihr hier dieselbe E-Mail-Adresse angeben, die Ihr zum Erstellen Eures Github Accounts verwendet habt.

### Tipps

Wenn ihr Windows benutzt und ihr euch gewundert habt, warum ihr eure Dateien mit "."-Präfix nicht seht (z.B. ".git", ".gitconfig", etc.) bzw. mit "."-Suffix (z.B. ".txt", ".mp4", etc.), dann könnt ihr das folgendermaßen ändern:

1. Sucht nach den "Explorer-Optionen" (entweder über das Suchfeld in den Einstellungen oder indem ihr mit dem Rechtsklick auf den Explorer klickt und auf "Eigenschaften" klickt).

2. Es sollte sich ein neues Fenster öffnen, klickt oben auf den Reiter "Ansicht".

3. Deaktiviert "Erweiterungen bei bekannten Dateitypen ausblenden" 

4. Wechselt die Option von "Ausgeblendete Dateien, Ordner oder Laufwerke nicht anzeigen" zu "Ausgeblendete Dateien, Ordner oder Laufwerke anzeigen"