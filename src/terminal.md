# Terminal / Shell

> 💡Wenn du dich schon mit dem Terminal bzw. einer Shell auskennst kannst du diese Seiter überspringen.

## Was ist das Terminal?

Computer haben heutzutage eine Vielzahl von Möglichkeiten bedient zu werden. Sei es über die grafische Benutzeroberfläche, Sprachsteuerung oder sogar AR/VR. Diese sind für 80% der Anwendungsfälle großartig, aber sie sind oft in ihren Möglichkeiten grundlegend eingeschränkt. Man kann nichts tun, was nicht vorher programmiert wurde. Grade in der Softwareentwicklung stoßen wir hier an die Grenzen des Möglichen. Um die Möglichkeiten des Computers voll ausschöpfen zu können, müssen wir zurück zu den Anfängen des Computers und eine Textschnittstelle verwenden: Das Terminal.

> **Terminal** und **Shell** werden oft synonym verwndet auch wenn sie nicht ganz das gleiche sind. Das **Terminal** ist ein Programm, das es ermöglicht, mit einer **Shell** zu interagieren. Die **Shell** ist das eigentliche Programm, das die Befehle ausführt.

In unserem Workshop liegt der Fokus auf der Bourne Again SHell, kurz "bash". Sie ist eine der am weitesten verbreiteten Shells und ihre Syntax ist ähnlich zu vielen anderern Shells. Um eine Shell-Prompt zu öffnen (in der du Befehle eingeben kannst), benötigst du zunächst ein Terminal. Auf deinem Gerät ist wahrscheinlich bereits eines installiert. (Nutzte auf Windows das Programm "Git Bash")

## Die Shell nutzen

Wenn du dein Terminal öffnest, siehst du eine **prompt** die so oder ähnlich aussieht:

```bash
arch:~$
```

"arch" ist der Name des Computers, "\~" ist das **cwd** (current working directory) bzw. aktuelles Verzeichnis und "$" signalisiert, dass du als normaler Benutzer angemeldet bist. (Adminastrator hat ein "#").
Das "\~" ist eine Abkürzung für dein Home-Verzeichnis. auf Unix-Systemen ist das `/home/deinBenutzername/` und auf Windows `C:\Users\deinBenutzername\`.

> Im Laufe des Workshops werden immer wieder Befehle gezeigt, die du in deinem Terminal ausführen kannst. Sie haben immer die gleiche Form:
>
> ```bash
> $ cat datei.txt
> > Ich bin der Inhalt der Datei!
> ```
>
> Wenn du den Befehl bei dir ausführen möchtest, must du das `$` nicht mit eingeben. Es wird nur verwendet um zu zeigen, dass es sich um einen Befehl in der Shell handelt. Hinter dem `>` steht die Ausgabe des Befehls. In diesem Fall der Inhalt der Datei `datei.txt`.

Aber woher weiß das Terminal welches Programm es ausführen soll, wenn du den Behelt `cat` eingibst? Ähnlich zu Programmiersprachen hat auch die Shell ein **Environment**, das Kontext für die Ausführung von Befehlen bereitstellt. In diesem Environment gibt es eine **PATH**-Variable, die eine Liste von Verzeichnissen enthält, in denen die Shell nach Programmen suchen soll. Wenn du also den Befehl `cat` eingibst, sucht die Shell in den Verzeichnissen, die in der PATH-Variable aufgelistet sind, nach einer Datei namens `cat` und führt sie aus. Solltest du Probleme haben ein Programm im Terminal auszuführen, auch wenn du dir sicher bist, dass es installiert ist, wurde meistens das Verzeichnis, in dem das Programm liegt, nicht zur PATH-Variable hinzugefügt.

Du kannst die PATH und sämtliche anderen Environment-Variablen mit folgendem Befehlt anzeigen lassen:

```bash
  $ echo $PATH
  > /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

Die Ausgabe schaut bei euch vermutlich ähnlich aus.

### Navigation im Terminal

Die Shell liegen die Identischen Verzeichnisse, die auch im Finder / Explorer zu finden sind, zugrunde. Navigation zwischen den einzelnen Verzeichnissen funktioniert über die Befehle `cd` (change directory) und `ls` (list). Mit `cd` kannst du in ein anderes Verzeichnis wechseln und mit `ls` kannst du dir den Inhalt eines Verzeichnisses anzeigen lassen.

Angenommen du hast folgende Ordnerstruktur:

```bash
 +-- ~
     +-- Dokumente
     |   +-- Texte
     |   |   +-- text1.txt
     |   |   +-- text2.txt
     |   +-- Bilder
     |   |   +-- bild1.jpg
     |   |   +-- bild2.jpg
     +-- Downloads
     |   +-- download1.zip
```

und du befindest dich in deinem Home-Verzeichnis (`~`). Wenn du nun sehen willst was sich dort befindet, kannst du den Befehl `ls` verwenden:

```bash
~$ ls
> Dokumente Downloads
```

Wenn du hinter `ls` einen Pfad angibst, wird der Inhalt dieses Verzeichnisses angezeigt. So kannst du zum Beipiel den Ordner Texte anzeigen lassen:

```bash
~$ ls Dokumente/Texte
> text1.txt text2.txt
```

Um in andere Ordner zu wechseln wir der Beffehl `cd` verwendet. Wenn du in den Ordner Texte wechseln möchtest, gibst du folgendes ein:

```bash
~$ cd Dokumente/Texte
~/Dokumente/Texte$ ls
> text1.txt text2.txt
```

### Absolute und relative Pfade

In unseren vorherigen Beispielen haben wir alle Pfade **relativ** zu deinem aktuellen Verzeichnis angegeben. Das heißt, dass der Bezugspunkt immer dein aktuelles Verzeichnis ist. Es gibt aber auch **absolute** Pfade, die immer von der Wurzel des Dateisystems ausgehen. Auf Unix-Systemen ist das `/` und auf Windows `C:\`. Wenn du also in deinem Home-Verzeichnis bist und in den Ordner Texte wechseln möchtest, kannst du auch den absoluten Pfad angeben:

```bash
~$ cd /home/deinBenutzername/Dokumente/Texte
```

> Um den absoluten Pfad zu deinem aktuellen Verzeichnis zu sehen, kannst du den Befehl `pwd` (print working directory) verwenden.

Um mit einem relativ zu deinem aktuellen Ordner nach oben zu gehen, kann der Pfad `..` verwendet werden.

```bash
~/Dokumente/Texte$ cd ..
~/Dokumente$
```

`..` kann auch in Kombination mit dem bereits bekannten relativen Pfad Syntax verwendet werden. Ein wechsel von `Dokumente` zu `Downloads` wird somit recht einfach.

```bash
~/Dokumente$ cd ../Downloads
~/Downloads$
```

### Skripte

Wir werden in unserem Workshop nicht näher darauf eingehen, jedoch ist es wichtig wenigstens den Begriff zu kennen.

Hinter dem recht unscheinbaren bereits bekannten Shell-Syntax versteckt sich eine Shell-Sprache die viele Features einer vollständigen Programmiersprache beinhaltet. So existieren Schleifen, if-Bedingungen, etc. Bündlet man mehrere Shell-Befehle spricht man von einem Shell-Skript. Diese ermöglichen leichte reproduzierbarkeit von komplizierteren Tätigkeiten und ein einfaches Teilen von Befehlen mit anderen Personen.
