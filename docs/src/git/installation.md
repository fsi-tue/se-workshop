# Installation und Konfiguration von Git

Folgen den Platform-spezifischen Anweisungen um Git auf deinem System zu installieren und komme danach zurück um die Konfiguration abzuschließen.

- [Windows](./installation_windows.md)
- [MacOS](./installation_macos.md)
- [Linux](./installation_linux.md)

# Konfiguration

Die restliche Konfiguration läuft analog zu der auf Linux.

```bash
$ git config --global user.name "Dein Name"
$ git config --global user.email "deine@email.de"
$ git config --global init.defaultBranch main
$ git config --global color.ui auto
```

Verwende hier die Mail-Adresse, die du auch für deinen Github-Account verwenden wirst / verwendet hast.

## Github Account

Github ist eine Plattform, auf der Git-Repositories hosted werden können. Was genau das ist lernst du später. Hier sei nur gesagt, dass Github nicht das Gleiche wie Git ist und Git auch mit einem anderen Anbieter wie Gitlab oder Bitbucket verwendet werden kann. In unserem Workshop verwenden wir Github.

Erstelle dir nun einen Account auf [Github](www.github.com). Verwende die Mail-Adresse, die du auch in der Konfiguration von Git verwendet hast.

## SSH-Key

Um Git mit Github zu verbinden, benötigst du einen SSH-Key. Dieser wird verwendet um dich zu authentifizieren und eine sichere Verbindung zu Github herzustellen. Github stellt hier sehr gute Anleitungen zur Verfügung. Folge den Schritten [hier](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) um einen SSH-Key zu erstellen und den Schritten [hier](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) um diesen zu Github hinzuzufügen.

### Verknüfung testen

Beim ersten Verbinden mit einem neuen Server (z.B. Github) bittet euch ssh, den Schlüssel dieses Servers zu überprüfen. Am besten macht ihr das nun für Github: Führt den Befehl

```sh
ssh -T git@github.com
```

aus und akzeptiert den Schüssel mit `yes`
