Diese Anleitung setzt voraus, dass Sie "Git Bash" bereits gemäß [der vorherigen Anleitung](Windows-Git-Installation.md) installiert haben.

### 1. Schlüsselpaar Generierung

`ssh` sollte bereits standardmäßig installiert sein. Sofern Ihr nicht bereits einen ssh-key generiert habt, wird im Folgenden gezeigt, wie Ihr einen solchen erstellt. Für mehr Details könnt ihr [hier](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=windows) nachschlagen.

1. Öffnet Git Bash

2. Führt den folgenden Befehl aus
    ```bash
    $  ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
3. Ihr werdet gefragt, wo Ihr das Schlüsselpaar speichern wollt. Solange Ihr keinen besonderen Grund habt, dies nicht zu tun, drückt einfach Enter, um das Schlüsselpaar an vorgeschlagenen Standardpfad mit den Standardnamen zu speichern (`~/.ssh`).

4. Abschließend werdet Ihr gefragt, ob Ihr ein Passwort für das Schlüsselpaar festlegen wollt. Da dies nochmals extra Sicherheit bietet, ist es empfehlenswert dies zu tun. Merkt Euch Euer Passwort gut, denn es lässt sich nicht zurücksetzen!

> **Wichtig**: Das genierte Schlüsselpaar besteht aus einen private- und einem public-key. Wie der Name schon vermuten lässt, ist der public-key öffentlich, das heißt diesen könnt Ihr öffentlich teilen und versenden. Der private-key hingegen ist Euer Geheimnis. Der private-key darf **niemals geteilt** werden! 
>
> Genauere Informationen, wie dieses Verfahren funktioniert, könnt Ihr [hier](https://en.wikipedia.org/wiki/Public-key_cryptography) nachlesen.


### 2. Hinzufügen des Schlüsselpaars zum ssh-agent

Nun solltet Ihr ein Schlüsselpaar in Ordner `~/.ssh` haben. Standardmäßig sollten diese den Namen `id_ed25519` und `id_ed25519.pub` haben. Um nicht ständig euer Schlüssel-Passwort eingeben zu müssen, wenn ihr den Schlüssel verwenden wollt, könnt ihr ihn zum ssh-agent hinzufügen:

1. Startet den ssh-agent in Hintergrund:
    ```bash
    $ eval "$(ssh-agent -s)"
    > Agent pid 59566
    ```
    > Mit `>` soll im folgenden manchmal die erwartete Ausgabe von Befehlen notiert werden. Einzelne Details, wie z.B. die pid des gestarteten Prozesses, können sich hierbei unterscheiden.

2. Fügt euren privaten Schlüssel zum ssh-agent dazu. Wenn ihr einen anderen Namen gewählt habt, müsst ihr den Befehl entsprechend abändern.
    ```bash
    $ ssh-add ~/.ssh/id_ed25519
    ```


### 3. Hinzufügen des public-keys zu GitHub

Kopiert den ssh key in die Zwischenablage, indem ihr folgenden Befehl ausführt. Wenn ihr den Namen geändert habt müsst ihr den Befehl entsprechend abändern:
```sh
clip < ~/.ssh/id_ed25519.pub
```

Falls der befehl nicht funktioniert müsst ihr  die id_ed25519.pub Datei in dem verstecketen .ssh ordner in einem Text Editor öffnen und den gesamten Inhalt (z.B mit strg-c) in die Zwischenablage kopieren.

Als nächstes müsst ihr im Browser auf https://github.com oben rechts auf euer Profilbild klicken und dann "settings" auswählen.

Links werden nun einige Einstellungen angezeigt in dem Abschnitt "Access" ist die Einstellung "SSH and GPG keys". Wählt diese aus.

Klickt nun auf den grünen Button "Add SSH key" oder "New SSH key".
Wählt im Feld "Title" einen passenden Namen für euren key, der für euch gut erkennbar euren Laptop representiert.

Als "Key type" wählt den normalerweise schon vor ausgewählten "Authenticaton Key" aus.

Fügt in das Feld "Key" den zuvor in die Zwischenablage kopierten ssh key ein.

Als letztes klcikt auf den grünen "Add SSH key" Button.


Beim ersten Verbinden mit einem neuen Server (zB Github) bittet euch ssh, den Schlüssel dieses Servers zu überprüfen. Am besten macht ihr das nun für Github: Führt den Befehl
```sh
ssh -T git@github.com
```
 aus und akzeptiert den Schüssel mit `yes`
Ihr könnt die Prüfstellen des Schlüssels mit folgendem Schlüssel abgleichen:

`SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU`