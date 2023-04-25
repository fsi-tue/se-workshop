Diese Anleitung setzt voraus, dass Sie "Homebrew" bereits gemäß [der vorherigen Anleitung](MacOS-Git-Installation.md) installiert haben.

# ssh

### Schlüsselpaar Generierung

`ssh` sollte bereits standardmäßig installiert sein. Sofern Ihr nicht bereits einen ssh-key generiert habt, wird im Folgenden gezeigt, wie Ihr einen solchen erstellt. Für mehr Details könnt ihr [hier](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) nachschlagen.

1. Führt den folgenden Befehl aus
    ```bash
    $  ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
3. Ihr werdet gefragt, wo Ihr das Schlüsselpaar speichern wollt. Solange Ihr keinen besonderen Grund habt, dies nicht zu tun, drückt einfach Enter, um das Schlüsselpaar an vorgeschlagenen Standardpfad mit den Standardnamen zu speichern (`~/.ssh`).
2. Abschließend werdet Ihr gefragt, ob Ihr ein Passwort für das Schlüsselpaar festlegen wollt. Da dies nochmals extra Sicherheit bietet, ist es empfehlenswert dies zu tun. Merkt Euch Euer Passwort gut, denn es lässt sich nicht zurücksetzen!
    > Lasst euch nicht verunsichern, dass keine Zeichen im Terminal angezeigt werden, während ihr Euer Passwort eingebt. Das ist normal und dient der Sicherheit, dass Euch niemand über die Schultern schauen kann und sieht, wie viele Zeichen Euer Passwort hat - etwas paranoid aber sicherer.

> **Wichtig**: Das genierte Schlüsselpaar besteht aus einen private- und einem public-key. Wie der Name schon vermuten lässt, ist der public-key öffentlich, das heißt diesen könnt Ihr öffentlich teilen und versenden. Der private-key hingegen ist Euer Geheimnis. Der private-key darf **niemals geteilt** werden! 
>
> Genauere Informationen, wie dieses Verfahren funktioniert, könnt Ihr [hier](https://en.wikipedia.org/wiki/Public-key_cryptography) nachlesen.

### Hinzufügen des Schlüsselpaars zum ssh-agent

1. Nun solltet Ihr ein Schlüsselpaar in Ordner `~/.ssh` haben. Standardmäßig sollten diese den Namen `id_ed25519` und `id_ed25519.pub` haben. Erstellt nun, falls nicht bereits vorhanden, die Datei `~/.ssh/config` mit
    ```bash
    $ touch ~/.ssh/config
    ```
2. Nun modifiziert die Datei, sodass sie die folgenden Zeilen enthält:
    ```text
    Host *
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/id_ed25519
    ```

    Öffnet dafür die Datei einfach mit Eurem Lieblingseditor oder verwendet den folgenden Befehl:
    ```bash
    $ open ~/.ssh/config
    ```
3. Jetzt fügt Ihr das Schlüsselpaar mit dem folgenden Befehl zum ssh-agent hinzu:

    ```bash
    $ ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    ```

    > Die Option `--apple-use-keychain` bewirkt, dass Euer Passwort für das Schlüsselpaar im „Schlüsselring“ von MacOS gespeichert wird. Dadurch müsst Ihr das Passwort nicht mehr explizit eingeben.

### Hinzufügen des public-keys zu Github

Im Folgenden wird vorausgesetzt, dass Ihr bereits einen Account auf Github erstellt habt.

1. Kopiert den Inhalt Eures **public-keys** (!) in die Zwischenablage
    ```text
    $ pbcopy < ~/.ssh/id_ed25519.pub
    ```
2. In den Einstellungen Eures GitHub-Accounts klickt Ihr auf *SSH and GPG keys*.
3. Dort wählt Ihr nun *New SSH key* aus.
4. Vergebt einen Namen, der idealerweise Rückschlüsse auf die Herkunft des Schlüssels gibt, z. B. „Personal laptop“.
5. Wählt bei *key type* *Authentication key* aus.
6. Im Feld *Key* fügt Ihr den public-key aus der Zwischenablage ein (CMD+V).
7. Bestätigt das Hinzufügen des keys mit dem Klicken des Buttons *Add SSH key*.
8. Beim ersten Verbinden mit einem neuen Server (zB Github) bittet euch ssh, den Schlüssel dieses Servers zu überprüfen. Am besten macht ihr das nun für Github: Führt den Befehl
    ```sh
    ssh -T git@github.com
    ```
    aus und akzeptiert den Schüssel mit `yes` (Wenn ihr den Schlüssel abgleichen wollt, findet ihr deren Prüfsummen [hier](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).)