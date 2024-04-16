# Datenmodell in Git

# Commit Hashes

Unser Datenmodell von der letzten Seite ist schon recht fortschrittlich, jedoch gibt es im Bezug zu git noch ein paar kleine Unterschiede. Bisher haben wir Commits der Einfachkeit halbar mit o-x bezeichnet. In git werden Commits jedoch mit Hashes referenziert. Ein Hash ist eine Art Fingerabdruck eines Objekts. Der Hash eines Objekts ist immer gleich, solange sich das Objekt nicht verändert. Git hat sich für einen SHA-1 Hash entschieden, der 40 Hexadezimalzeichen lang ist. Da diese jedoch extrem unterschiedlich sind, reicht es meistens nur die ersten 7 Zeichen zu verwenden.

So schaut zum Beispiel der Hash des eines Commits von diesem Buch aus:

```
$ git rev-parse HEAD
> 9af8a075faebfc5391a1caf52116fc2cd45b2a13
```

Es reichen aber die ersten 7 Zeichen:

```
$ git rev-parse --short HEAD
> 9af8a07
```

So können wir das Beispiel von vorhin auch mit Hashes darstellen:

```
o-1 <--- o-2 (feature_a)
  ^
   \
    -- o-3 (feature_b)

== wird zu ==
9af8a07 <--- 3b2e1a2 (feature_a)
  ^
   \
    -- 1a2b3c4 (feature_b)
```

Die Hashes sind hierbei komplett zufällig und dienen nur zur Veranschaulichung.

# HEAD

Bisher haben wir uns immer nur das große ganze angeschaut, uns aber noch nicht überlegt wie wir auf die unterschiedlichen Commits bzw. Branches zugreifen können. Hier kommt der **HEAD** ins Spiel. Der HEAD ist ein Pointer auf einen beliebigen Commit oder Branch. Wenn wir also den Inhalt von `feature_a` anschauen wollen, setzten wir den HEAD auf `feature_a` und können dann den Inhalt von `feature_a` betrachten. Selbiges funktioniert mit `feature_b` oder anderen beliegibigen Branches. Da die meisten Operationen in git relativ zu HEAD arbeiten ist es wichtig zu wissen, wo dieser sich grade befindet. Wir fügen also noch HEAD in unser Datenmodell ein:

```
9af8a07 <--- 3b2e1a2 (feature_a)
  ^                     ^
   \                    HEAD
    -- 1a2b3c4 (feature_b)
```

Hier ist HEAD auf `feature_a` gesetzt.

# Besonderheiten von Branches

Bisher haben wir Branches nur sehr intuitiv definiert gehabt. Jeder Ast hat einfach einen Namen bekommen. Aber was genau ist ein Branch?

Ein Branch ist ähnlich wie HEAD ein Pointer auf einen Commit. Der Unterschied lässt sich gut an einem Beispiel festmachen:

Wir nehmen an du wanderst gerne durch die Alpen. Auf deiner heutigen Wanderung plannst du zwei Gipfel zu besteigen. Du startest also am Parkplatz und wanderst zum ersten Gipfel. Dort angekommen, machst du eine Pause und genießt die Pause bevor es weiter zum zweiten Gipfel geht.

Die Gipfelkreuze mit ihren Bergnamen sind die Branches und du als Wanderer bist der HEAD. Auch HEAD sieht immer nur aus seiner eigenen Perspektive und führt alle Aktionen relativ dazu aus.

Der Berg selber sind die Commits. Berge wachsen über die Zeit und werden immer ein bischen höher. Das Gipfelkreuz bleibt aber immer oben auf dem Berg. Wenn du also einen neuen Commit unserem Branch hinzufügst, wächst der Berg und das Gipfelkreuz wird ein Stück höher.

# Tags

Schauen wir uns nochmal unsere Wanderung an. Wir folgen unserem Weg und kommen an einem besonders schönen Aussichtspunkt vorbei. Hier machen wir ein Foto mit unserem Handy. Die Geodaten von dem Punkt werden gleich mitgespeichert. Wenn wir also später das Foto anschauen, können wir genau sehen wo wir waren und mit einer Karte auch einfach wieder zurückfinden. **Tags** in git sind äquivalent zu diesem Foto. Sie sind ein Pointer auf einen bestimmten Commit damit wir diesen später einfach wieder finden können. Wir markieren damit zum Beispiel wichtige Releases oder Meilensteine. Da Tags namen besitzten können sind sie deutlich einfachere Referenzen als die komplizierten Hashes der Commits.

- wie wird git repo erstellt
- wie wird gemergt
- wie wird gebrached
- wie wird gecloned
- wie wird gerebased
- interactive rebase?

```

```
