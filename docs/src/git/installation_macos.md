# Installation auf MacOS

## Homebrew

Falls noch nicht der inoffiziellen (aber sehr verbreitete) Paketmanager [homebrew](https://brew.sh/) auf deinem MacBook installiert ist, ist jetzt der Zeitpunkt. `brew` ermöglicht die einfache Installation von Software und wird dir noch oft in der Entwicklung auf MacOS begegnen.j

Die Installation ist sehr simple. Kopiere den folgenden Befehl in dein Terminal und folgen den angezeigten Anweisungen.

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> Das `$` Zeichen wird verwendet um zu signalisieren, dass der folgende Befehl im Terminal auszuführen ist und ist nicht Teil des Befehls.

## git

1. Intalliere nun git mittels `brew`:

   ```bash
   $ brew install git
   ```

2. Folge nun der restlichen Konfiguartion [hier](./installation.md#Konfiguration)
