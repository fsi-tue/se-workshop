# Changing History

Sei es um die Historie besser nachvollziebar zu machen oder um Fehler zu korrigieren, es gibt immer wieder Situationen in denen wir die Historie ändern wollen.

## Verändern des letzten Commits

Ein Komma vergessen, vergessen die Datei zu formatieren oder einfach eine falsche Commit-Message geschrieben? Kein Problem wir können den letzten Commit ohne Probleme ändern. Eine Möglichkeit das zu erreichen haben wir uns bereits im Kapitel Resets angeschaut. Hierbei müssen wir aber immer die Commit-Message komplett neu schreiben.

```bash
   $ git reset --soft HEAD~
   # alle notwenigen Änderungen vornehmen und der Staging Area hinzufügen
   $ git commit
```

Grade wenn wir nur kleine Änderungen an der Commit Message vornehmen oder die Commit Message gleich bleiben soll, ist gibt es komfortablere Möglichkeiten.
Mit `git commit --amend` können wir den letzten Commit bearbeiten.

1. Füge alle Änderungen am letzten Commit der Staging Area hinzu.
2. ```bash
   $ git commit --amend
   ```
3. Der Editor öffnet sich und wir können die Commit-Message bearbeiten.
4. Speichern und schließen

## Interaktive Rebase

### Bearbeiten von älteren Commits

Wollen wir mehrere Commits oder Commits weiter aus der Vergangenheit bearbeiten müssen wir zu einem komplexeren Tool greifen. Interaktives Rebasing
Eine abgespekte Form davon haben wir schon als normales Rebasing kennengelernt. Im Gegensatz zum normalen Rebasing, können wir hier aber die Reihenfolge der Commits ändern, Commits zusammenfassen oder auch Commits komplett löschen.

In unserem Beispiel wollen wir die letzten 3 Commits bearbeiten.

```bash
  $ git rebase -i HEAD~3
```

> Wie bei jedem git Befehlt können wir wahlweise auch direkt den Commit-Hash angeben.

Sobald wir den Command ausführen öffnet sich ein Editor mit einer Liste der letzten 3 Commits.

```bash
pick 5c32ae1 Change my name a bit
pick 8723ace Update README formatting and hello world
pick a3b02e7 Add license

# Rebase 710f0f8..a5f4a0d onto 710f0f8
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Die Commits werden in inverser Reihenfolge zum Log angezeigt. Mit log würde die Reihenfolge wie folgt ausschauen:

```bash
$ git log --oneline
a3b02e7 Add license
8723ace Update README formatting and hello world
5c32ae1 Change my name a bit
...
```

Der Editor vom interaktiven Rebase zeigt nicht die Vergangenheit unserere Commits, sondern ist vielmehr ein Skript, das von oben nach unten von git ausgeführt wird. Um eine Änderung an einem Commit vorzunehmen, müssen wir das skript ändern, sodass es anhält und auf unsere Eingabe wartet. Um das zu erreichen, müssen wir das `pick` durch ein `edit` ersetzten.

```bash
edit 5c32ae1 Change my name a bit
pick 8723ace Update README formatting and hello world
pick a3b02e7 Add license
```

Wenn wir jetzt die Datei speichern und den Editor schließen. Erhalten wir folgende ausgabe.

```bash
$ git rebase -i HEAD~3
> Stopped at f7f3f6d... Change my name a bit
  You can amend the commit now, with

       git commit --amend

  Once you're satisfied with your changes, run

       git rebase --continue
```

Wir können jetzt unsere Änderungen stagen und wenn wir glücklich sind den Commit mit `git commit --amend` abschließen. Hier ist dann auch nochmal die Änderung der Commit-Message möglich. Wenn du fertig bist, kannst du den Rebase mit `git rebase --continue` fortsetzten.

Da wir ansonsten alles auf `pick` gelassen haben, wird der Rest der Commits einfach angewendet.

> Grade bei größeren Rebases kann es zu Konflikten kommen. Diese müssen dann wie bereits gelern händisch gelöst werden.

> 💡 Auch beim interaktiven Rebase gilt: Commits können nicht verändert werden. Was wir hier eigentlich machen ist das erstellen von neuen Commits, die die alten ersetzen.

### Umstellen von Commits

Du hast den Eindruck, dass die Reihenfolge von Commits fürs Verständnis nicht optional ist? Mit unserem Rebase ist das ein Katzensprung. Wie bei einem normalen Skript können wir die Reihenfolge der Befehle einfach ändern und die Reihenfolge der Commits ändert sich dementsprechend. Was als erstes kommt, wird auch als erstes angewendet.

### Squashen von Commits

Mit `git reset` haben wir schon eine Möglichkeit gesehen, wie wir Commits zusammenfassen können. Leider ging das dabei nur mit den letzten Commits bzw. bringt einen enormen Aufwand mit sich ältere Commits zusammenzufassen. Mit dem interaktiven Rebase ist das ganz schnell und elegant erledigt.

Hier nochmal unser Anfangszustand:

```bash
pick 5c32ae1 Change my name a bit
pick 8723ace Update README formatting and hello world
pick a3b02e7 Add license
```

Wie unten im Editor in der hilfreichen Zusammenfassung beschrieben, können wir mit `squash` Commits zusammenfassen. Wichtig ist hierbei, dass wir der mit dem `squash` annotierte Commit mit dem Commit darüber zusammengefasst wird. In unserem Beispiel wollen wir die ersten beiden Commits zusammenfassen:

```bash
pick 5c32ae1 Change my name a bit
squash 8723ace Update README formatting and hello world
pick a3b02e7 Add license
```

Nachdem wir den Editor schließen, öffnet sich ein weiterer Editor, in dem wir die Commit-Message für den neuen (gesquashten) Commit eingeben können. Wenn wir fertig sind, speichern und schließen wir den Editor.
