Diese Anleitung setzt voraus, dass Sie "Homebrew" bereits gemäß [der vorherigen Anleitung](MacOS-Git-Installation.md) installiert haben.

# JDK, Scala & sbt

1. Installiert [coursier](https://get-coursier.io/docs/cli-overview) und lasst `coursier` Eure Scala Installation einrichten:
    ```text
    $ brew install coursier/formulas/coursier && cs setup
    ```
### Optional: Sollte bei Euch keine JDK installiert sein und der vorherige Befehl hat keine JDK heruntergeladen, führt noch die folgenden Schritte aus:

2. Installiert `openjdk` wie folgt:

    ```bash
    $ brew install openjdk@17
    ```
3. Damit Euer System die Installation finden kann, führt die folgenden Befehle aus

    ```text
    $ sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
    $ echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
    $ echo 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home' >> ~/.zshrc
     ```

    Abschließend müsst Ihr Euer Terminal neu starten. Das geht am einfachsten, indem Ihr einfach das Fenster schließt und wieder öffnet.


    > **Hinweis**: Hier wird davon ausgegangen, dass Ihr `zsh` als eure Shell habt. Seit >= MacOS 10.15 ist `zsh` als Standard-Shell vorinstalliert. Solltet Ihr euch unsicher sein, was eure Shell ist, könnt ihr dies mit
    > ```text
    > $ echo $SHELL
    > ```
    > herausfinden (das zweite `$` ist hier tatsächlich Teil des Befehls). Die üblichen Shells sind `bash`, `zsh` und `fish`. Solltet Ihr eine andere Shell als `zsh` installiert haben, ersetzt den Pfad `~/.zshrc` durch z. B. `~/.bashrc` für `bash` oder `~/.config/fish/config.fish` für `fish`. Solltet ihr eine nicht hier aufgelistete Shell installiert haben wisst ihr vermutlich was ihr macht und könnt selbständig den richtigen Pfad zu Konfigurationsdatei benutzen.

## Installation Testen

Abschließenden testet Ihr Eure Installation:

```bash
$ scala --version
```

Ihr könnt auch schon mal etwas mit REPL herumspielen. Dafür müsst Ihr lediglich den Befehl `scala` ausführen:

```bash
$ scala
```