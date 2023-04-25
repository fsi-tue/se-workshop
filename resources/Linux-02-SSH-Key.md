# ssh

### Schlüsselpaar Generierung

`ssh` sollte bereits standardmäßig installiert sein. Sofern Ihr nicht bereits einen ssh-key generiert habt, wird im Folgenden gezeigt, wie Ihr einen solchen erstellt. Für mehr Details könnt ihr [hier](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) nachschlagen.

1. Führt den folgenden Befehl aus
    ```bash
    $  ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
3. Ihr werdet gefragt, wo Ihr das Schlüsselpaar speichern wollt. Solange Ihr keinen besonderen Grund habt, dies nicht zu tun, drückt einfach Enter, um das Schlüsselpaar an vorgeschlagenen Standardpfad mit den Standardnamen zu speichern (`~/.ssh`).
2. Abschließend werdet Ihr gefragt, ob Ihr ein Passwort für das Schlüsselpaar festlegen wollt. Da dies nochmals extra Sicherheit bietet, ist es empfehlenswert dies zu tun. Merkt Euch Euer Passwort gut, denn es lässt sich nicht zurücksetzen!

> **Wichtig**: Das genierte Schlüsselpaar besteht aus einen private- und einem public-key. Wie der Name schon vermuten lässt, ist der public-key öffentlich, das heißt diesen könnt Ihr öffentlich teilen und versenden. Der private-key hingegen ist Euer Geheimnis. Der private-key darf **niemals geteilt** werden! 
>
> Genauere Informationen, wie dieses Verfahren funktioniert, könnt Ihr [hier](https://en.wikipedia.org/wiki/Public-key_cryptography) nachlesen.

### Hinzufügen des Schlüsselpaars zum ssh-agent

Nun solltet Ihr ein Schlüsselpaar in Ordner `~/.ssh` haben. Standardmäßig sollten diese den Namen `id_ed25519` und `id_ed25519.pub` haben. Um nicht ständig euer Schlüssel-Passwort eingeben zu müssen, wenn ihr den Schlüssel verwenden wollt, könnt ihr ihn zum ssh-agent hinzufügen:

1. Startet den ssh-agent in Hintergrund:
    ```bash
    $ eval "$(ssh-agent -s)"
    > Agent pid 59566
    ```
    > Mit `>` soll im folgenden manchmal die erwartete Ausgabe von Befehlen notiert werden. Einzelne Details, wie z.B. die pid des gestarteten Prozesses, können sich hierbei unterscheiden.

      Je nach System können auch root-Rechte notwendig sein, um den ssh-agent zu starten, dann muss man vorher mit `sudo -s -H` in eine root-shell wechseln. Bei anderen Systemen lautet der Befehl `exec ssh-agent bash` oder `exec ssh-agent zsh`.

2. Fügt euren privaten Schlüssel zum ssh-agent dazu. Wenn ihr einen anderen Namen gewählt habt, müsst ihr den Befehl entsprechend abändern.
    ```bash
    $ ssh-add ~/.ssh/id_ed25519
    ```


### Hinzufügen des public-keys zu Github

Im Folgenden wird vorausgesetzt, dass Ihr bereits einen Account auf Github erstellt habt.

1. Kopiert den Inhalt Eures **public-keys** (zu erkennen an der Endung **.pub**!) in die Zwischenablage
    ```bash
    $ xclip -selection clipboard ~/.ssh/id_ed25519.pub
    ``` 
   _Sollte `xclip` bei euch nicht installiert sein, könnt ihr euch den Inhalt der Datei auch mit `cat` ausgeben - denkt aber dran beim Kopieren den Rechtsklick zu verwenden!_

2. In den Einstellungen Eures Github-Accounts klickt Ihr auf *SSH and GPG keys*.
3. Dort wählt Ihr nun *New SSH key* aus.
4. Vergebt einen Namen, der idealerweise Rückschlüsse auf die Herkunft des Schlüssels gibt, z. B. „Personal laptop“.
5. Wählt bei *key type* *Authentication key* aus.
6. Im Feld *Key* fügt Ihr den public-key aus der Zwischenablage ein (`Strg + V`).
7. Bestätigt das Hinzufügen des keys mit dem Klicken des Buttons *Add SSH key*.
8. Beim ersten Verbinden mit einem neuen Server (zB Github) bittet euch ssh, den Schlüssel dieses Servers zu überprüfen. Am besten macht ihr das nun für Github: Führt den Befehl
    ```sh
    ssh -T git@github.com
   ```
   aus und akzeptiert den Schüssel mit `yes` (Wenn ihr den Schlüssel abgleichen wollt, findet ihr deren Prüfsummen [hier](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).)