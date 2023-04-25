Wenn ihr Linux verwendet, ist euch das Terminal vermutlich schon ein Begriff. Für alle Neulinge: Am schnellsten öffnet man ein Terminal mit `Strg + Alt + T`, auf Ubuntu funktioniert das auf jeden Fall, bei anderen Distributionen kann die Tastenkombination eine andere sein. 

> Thema Distributionen: Der Autor dieses Guides verwendet Ubuntu, welches auf Debian basiert. Wenn sich Instruktionen von Distribution zu Distribution unterscheiden, versuche ich, darauf hinzuweisen, und freue mich über Feedback von anderen Nutzer:innen :) 


# git

### 1. Git installieren 
Git kann über den Paketmanager der jeweiligen Distribution installiert werden. Der Befehl lautet also auf Debian-basierten Systemen wie Ubuntu oder Linux Mint:
```bash
$ sudo apt-get install git
```
> Das `$` Zeichen wird im folgenden verwendet um zu signalisieren, dass der folgende Befehl im Terminal einzugeben ist. Das `$` selbst ist nicht Teil des Befehls und dient nur der besseren lesbarkeit.

> Hier der obligatorische Hinweis, dass man **niemals** blind irgendwelche Bash-Skripte aus dem Internet ausführen sollte. Es liegt in Eurer Verantwortung sicherzustellen, dass solche Skripte keinerlei Schaden anrichten können.

> Bedenkt dass in einem Terminal zwar Text auswählen, kopieren und einfügen könnt, die Tastenkombinationen `Strg + C` (cancel) und `Strg + V` anderweitig belegt sind - ihr müsst dann also mit Rechtsklick kopieren/einfügen.

Eine Liste mit dem Installationsbefehl für eine große Menge an anderen Distributionen findet sich [hier](https://git-scm.com/download/linux) auf der offiziellen Website von Git. 

### 2. Git einrichten

```bash
$ git config --global user.name "Dein Name"
$ git config --global user.email "deine@email.de"
$ git config --global init.defaultBranch main
$ git config --global color.ui auto
```
   Idealerweise sollte Ihr hier dieselbe E-Mail-Adresse angeben, die Ihr zum Erstellen Eures Github Accounts verwendet habt.