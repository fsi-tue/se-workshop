Wenn ihr Linux verwendet, ist euch das Terminal vermutlich schon ein Begriff. Für alle Neulinge: Am schnellsten öffnet man ein Terminal mit `Strg + Alt + T`, auf Ubuntu funktioniert das auf jeden Fall, bei anderen Distributionen kann die Tastenkombination eine andere sein.

> Thema Distributionen: Der Autor dieses Guides verwendet Ubuntu, welches auf Debian basiert. Wenn sich Instruktionen von Distribution zu Distribution unterscheiden, versuche ich, darauf hinzuweisen, und freue mich über Feedback von anderen Nutzer:innen :)

# JDK, Scala & sbt

### 1. [coursier](https://get-coursier.io/docs/cli-overview) installieren und coursier die Scala-Installation einrichten lassen

> Coursier ist der Dependency Manager von Scala. Ein Dependency Manager, wie z.B. pip für python, npm für nodejs oder maven für Java-Projekte, ist für den Download und das Set-Up von Modulen aus einem Sprachspezifischen Repository zuständig.

Die folgende Zeile lädt in einem Schritt das offizielle Installationsskript herunter und führt es aus ([Offizielles Vorgehen!](https://www.scala-lang.org/download/)).

```bash
$ curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
```

Wenn das Programm fragt, ob du den Installationsordner mithilfe einer `.profile`-Datei zu deiner `PATH`-Variable hinzufügen willst, bestätige das mit `y` und Enter.

> Wenn du einen Befehl in deinem Terminal, also deiner Shell eintippst, sucht diese in allen Ordnern, die durch `:` getrennt mit absoluten Pfaden in der `PATH`-Variable gespeichert sind, nach ausführbaren Dateien mit dem entsprechenden Namen. Shell-Variablen wie `PATH` können durch Konfigurationsskripte mit Shell-spezifischen Namen wie z.B. `.profile` im Heimverzeichnis (relativ `~`, absolut `/home/<username>`), die automatisch beim Öffnen der Shell ausgeführt werden, verändert werden.

Überprüfe, ob die Installation geklappt hat, indem du dein Terminal-Fenster **schließt und neu öffnest** und

```shell
$ scala -version
```

ausführst, was dir folgenden Output liefern sollte:

```
Scala code runner version 3.2.0 -- Copyright 2002-2022, LAMP/EPFL
```

Ihr könnt auch schon mal etwas mit REPL herumspielen. Dafür müsst Ihr lediglich den Befehl `scala` ausführen:

```bash
$ scala
```

### 1.5 Coursier-Troubleshooting

### Scala nicht gefunden:

Wenn der Output von `scala -version` stattdessen z.B. so aussieht

```
Command 'scala' not found, but can be installed with:
sudo apt install scala
```

, also die Programme nicht gefunden wurden, könnte das Problem das folgende sein:

Wenn du z.B. Ubuntu mit einer Bash-Shell (das Standard-Terminal) verwendest, und in deinem Heimverzeichnis (`~`) schon eine Datei namens `.bashrc` liegt, wird diese statt der erstellten `.profile`-Datei verwendet.

> Andere Distributionen verwenden eventuell eine andere Standard-Shell als Terminal, die andere Standard-Konfigurationsdateien verwendet! Welche Shell ihr verwendet, findet ihr mit `echo $SHELL` heraus, für `zsh` ist die Datei z.B. `.zshrc`. _Hier wäre ich für Erfahrungen dankbar, gerne einfach direkt den Beitrag editieren und die Infos hier einfügen._

Also musst du die relevanten Zeilen vom Ende der `.profile`-Datei kopieren. Dazu kannst du sie dir z.B. mit

```bash
$ cat ~/.profile
```

ausgeben lassen.
Alles ab

```
# >>> coursier install directory >>>
export PATH="$PATH:/home/<username>/.local/share/coursier/bin"
# <<< coursier install directory <<<
```

ist relevant, sollte Coursier für dich das Java Development Kit (JDK) installiert haben, werden danach noch u.a. die wichtige `$JAVA_HOME`-Variable gesetzt. _Dran denken: Beim Kopieren/Einfügen Rechtsklick verwenden!_

Danach kannst du diese Zeilen in deine `.bashrc`-Datei einfügen, indem du sie mit `nano` bearbeitest:

```bash
$ nano ~/.bashrc
```

(Datei speichern mit STRG+O, schließen mit STRG+X)

> `.profile` und `.bashrc` sind ganz normale Textdateien, die du mit jedem beliebigen Texteditor bearbeiten kannst. Das Problem ist nur, dass sie - durch den Punkt vorne dran - versteckt und im regulären Dateibrowser nicht sichtbar sind. Wenn du sie lieber mit einem graphischen Editor bearbeiten willst, kannst du z.B. auf Ubuntu auch folgendes in dein Terminal eingeben:
> `$ gedit .bashrc .profile`

Damit die veränderte Datei eingelesen wird, musst du das Terminal wieder schließen und neu öffnen. _(Technisch gesehen kannst du auch `source ~/.bashrc` ausführen, aber damit testest du dann nicht, ob `~/.bashrc` auf deinem System tatsächlich auch die richtige Konfigurationsdatei ist, die automatisch eingelesen wird.)_

Wenn das alles nicht hilft, hilft es vielleicht auch, den Computer neu zu starten ;)

### Java nicht gefunden

Sollte die automatische Installation des Java Development Kits (JDK) fehlgeschlagen sein:

Wenn Coursier das Java Development Kit nicht automatisch für dich installieren kann, musst du es manuell installieren. Das geht am Besten über deinen System-Paketmanager, für Ubuntu wäre das also:

```bash
$ sudo apt-get install openjdk-17*
```

Das `*` sorgt dafür, dass alle nur denklichen Unterpakete mitinstalliert werden, worüber sich später die IDE freut.

Die Installation kannst du testen mit:

```bash
$ java -version
> openjdk version "17.0.4" 2022-07-19
> OpenJDK Runtime Environment (build 17.0.4+8-Ubuntu-122.04)
> OpenJDK 64-Bit Server VM (build 17.0.4+8-Ubuntu-122.04, mixed mode, sharing)
```

Sollte `scala` danach immer noch nicht funktionieren, musst du eventuell das Terminal schließen und neu öffnen, oder Coursier nochmal neu installieren (s.u.).

> **Coursier Deinstallieren**
> Wenn etwas schiefgelaufen ist, oder du Coursier, Scala und SBT nach der Vorlesung nicht auf deinem Computer lassen willst, kannst du `cs uninstall --all` ausführen. Coursier lässt aber auch noch Dateien in den Ordnern `~/.local/share/coursier` und `~/.cache/coursier` liegen, die du mit `rm -rf` löschen kannst und wahrscheinlich auch löschen solltest, wenn da der Wurm drin ist. Du kannst auch `cs uninstall <module>` ausführen, um nur ein Modul (wie z.B. SBT) zu entfernen.

### 2. SBT installieren

Das Scala Build Tool lässt sich dann einfach mit

```bash
cs install sbt
```

installieren.

---

Sollte bei Euch etwas nicht funktionieren oder solltet Ihr noch Fehler o.ä. finden, antwortet gerne auf diesen Post, sodass ich den Wiki-Eintrag aktualisieren kann.
Wenn ihr Linux verwendet, ist euch das Terminal vermutlich schon ein Begriff. Für alle Neulinge: Am schnellsten öffnet man ein Terminal mit `Strg + Alt + T`, auf Ubuntu funktioniert das auf jeden Fall, bei anderen Distributionen kann die Tastenkombination eine andere sein.

> Thema Distributionen: Der Autor dieses Guides verwendet Ubuntu, welches auf Debian basiert. Wenn sich Instruktionen von Distribution zu Distribution unterscheiden, versuche ich, darauf hinzuweisen, und freue mich über Feedback von anderen Nutzer:innen :)

# JDK, Scala & sbt

### 1. [coursier](https://get-coursier.io/docs/cli-overview) installieren und coursier die Scala-Installation einrichten lassen

> Coursier ist der Dependency Manager von Scala. Ein Dependency Manager, wie z.B. pip für python, npm für nodejs oder maven für Java-Projekte, ist für den Download und das Set-Up von Modulen aus einem Sprachspezifischen Repository zuständig.

Die folgende Zeile lädt in einem Schritt das offizielle Installationsskript herunter und führt es aus ([Offizielles Vorgehen!](https://www.scala-lang.org/download/)).

```bash
$ curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
```

Wenn das Programm fragt, ob du den Installationsordner mithilfe einer `.profile`-Datei zu deiner `PATH`-Variable hinzufügen willst, bestätige das mit `y` und Enter.

> Wenn du einen Befehl in deinem Terminal, also deiner Shell eintippst, sucht diese in allen Ordnern, die durch `:` getrennt mit absoluten Pfaden in der `PATH`-Variable gespeichert sind, nach ausführbaren Dateien mit dem entsprechenden Namen. Shell-Variablen wie `PATH` können durch Konfigurationsskripte mit Shell-spezifischen Namen wie z.B. `.profile` im Heimverzeichnis (relativ `~`, absolut `/home/<username>`), die automatisch beim Öffnen der Shell ausgeführt werden, verändert werden.

Überprüfe, ob die Installation geklappt hat, indem du dein Terminal-Fenster **schließt und neu öffnest** und

```shell
$ scala -version
```

ausführst, was dir folgenden Output liefern sollte:

```
Scala code runner version 3.2.0 -- Copyright 2002-2022, LAMP/EPFL
```

Ihr könnt auch schon mal etwas mit REPL herumspielen. Dafür müsst Ihr lediglich den Befehl `scala` ausführen:

```bash
$ scala
```

### 1.5 Coursier-Troubleshooting

### Scala nicht gefunden:

Wenn der Output von `scala -version` stattdessen z.B. so aussieht

```
Command 'scala' not found, but can be installed with:
sudo apt install scala
```

, also die Programme nicht gefunden wurden, könnte das Problem das folgende sein:

Wenn du z.B. Ubuntu mit einer Bash-Shell (das Standard-Terminal) verwendest, und in deinem Heimverzeichnis (`~`) schon eine Datei namens `.bashrc` liegt, wird diese statt der erstellten `.profile`-Datei verwendet.

> Andere Distributionen verwenden eventuell eine andere Standard-Shell als Terminal, die andere Standard-Konfigurationsdateien verwendet! Welche Shell ihr verwendet, findet ihr mit `echo $SHELL` heraus, für `zsh` ist die Datei z.B. `.zshrc`. _Hier wäre ich für Erfahrungen dankbar, gerne einfach direkt den Beitrag editieren und die Infos hier einfügen._

Also musst du die relevanten Zeilen vom Ende der `.profile`-Datei kopieren. Dazu kannst du sie dir z.B. mit

```bash
$ cat ~/.profile
```

ausgeben lassen.
Alles ab

```
# >>> coursier install directory >>>
export PATH="$PATH:/home/<username>/.local/share/coursier/bin"
# <<< coursier install directory <<<
```

ist relevant, sollte Coursier für dich das Java Development Kit (JDK) installiert haben, werden danach noch u.a. die wichtige `$JAVA_HOME`-Variable gesetzt. _Dran denken: Beim Kopieren/Einfügen Rechtsklick verwenden!_

Danach kannst du diese Zeilen in deine `.bashrc`-Datei einfügen, indem du sie mit `nano` bearbeitest:

```bash
$ nano ~/.bashrc
```

(Datei speichern mit STRG+O, schließen mit STRG+X)

> `.profile` und `.bashrc` sind ganz normale Textdateien, die du mit jedem beliebigen Texteditor bearbeiten kannst. Das Problem ist nur, dass sie - durch den Punkt vorne dran - versteckt und im regulären Dateibrowser nicht sichtbar sind. Wenn du sie lieber mit einem graphischen Editor bearbeiten willst, kannst du z.B. auf Ubuntu auch folgendes in dein Terminal eingeben:
> `$ gedit .bashrc .profile`

Damit die veränderte Datei eingelesen wird, musst du das Terminal wieder schließen und neu öffnen. _(Technisch gesehen kannst du auch `source ~/.bashrc` ausführen, aber damit testest du dann nicht, ob `~/.bashrc` auf deinem System tatsächlich auch die richtige Konfigurationsdatei ist, die automatisch eingelesen wird.)_

Wenn das alles nicht hilft, hilft es vielleicht auch, den Computer neu zu starten ;)

### Java nicht gefunden

Sollte die automatische Installation des Java Development Kits (JDK) fehlgeschlagen sein:

Wenn Coursier das Java Development Kit nicht automatisch für dich installieren kann, musst du es manuell installieren. Das geht am Besten über deinen System-Paketmanager, für Ubuntu wäre das also:

```bash
$ sudo apt-get install openjdk-17*
```

Das `*` sorgt dafür, dass alle nur denklichen Unterpakete mitinstalliert werden, worüber sich später die IDE freut.

Die Installation kannst du testen mit:

```bash
$ java -version
> openjdk version "17.0.4" 2022-07-19
> OpenJDK Runtime Environment (build 17.0.4+8-Ubuntu-122.04)
> OpenJDK 64-Bit Server VM (build 17.0.4+8-Ubuntu-122.04, mixed mode, sharing)
```

Sollte `scala` danach immer noch nicht funktionieren, musst du eventuell das Terminal schließen und neu öffnen, oder Coursier nochmal neu installieren (s.u.).

> **Coursier Deinstallieren**
> Wenn etwas schiefgelaufen ist, oder du Coursier, Scala und SBT nach der Vorlesung nicht auf deinem Computer lassen willst, kannst du `cs uninstall --all` ausführen. Coursier lässt aber auch noch Dateien in den Ordnern `~/.local/share/coursier` und `~/.cache/coursier` liegen, die du mit `rm -rf` löschen kannst und wahrscheinlich auch löschen solltest, wenn da der Wurm drin ist. Du kannst auch `cs uninstall <module>` ausführen, um nur ein Modul (wie z.B. SBT) zu entfernen.

### 2. SBT installieren

Das Scala Build Tool lässt sich dann einfach mit

```bash
cs install sbt
```

installieren.
