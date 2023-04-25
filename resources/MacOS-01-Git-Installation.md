# homebrew

Falls Ihr noch nicht den inoffiziellen Paketmanager [homebrew](https://brew.sh/) installiert habt, empfehle ich Euch dies zu tun, da man sich dadurch vieles vereinfachen kann. Im Folgenden werden alle wichtigen Tools mithilfe von `brew` installiert.

https://brew.sh/

Die Installation ist sehr simple und besteht nur daraus, einen Befehl ins Terminal einzugeben:

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> Das `$` Zeichen wird im folgenden verwendet um zu signalisieren, dass der folgende Befehl im Terminal einzugeben ist. Das `$` selbst ist nicht Teil des Befehls und dient nur der besseren lesbarkeit.

> Hier der obligatorische Hinweis, dass man **niemals** blind irgendwelche Bash-Skripte aus dem Internet ausführen sollte. Es liegt in Eurer Verantwortung sicherzustellen, dass solche Skripte keinerlei Schaden anrichten können.

# git

1. Im Terminal den Befehl

    ```bash
    $ brew install git
    ```

   eingeben. Dadurch wird `git` installiert. 

2. Die restliche Konfiguration läuft analog zu der auf Linux.

    ```bash
    $ git config --global user.name "Dein Name"
    $ git config --global user.email "deine@email.de"
    $ git config --global init.defaultBranch main
    $ git config --global color.ui auto
    ```
   Idealerweise sollte Ihr hier dieselbe E-Mail-Adresse angeben, die Ihr zum Erstellen Eures Github Accounts verwendet habt.