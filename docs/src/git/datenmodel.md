# Datenmodel

Es gibt viele verschieden Ansätze für die ein VCS zu implementieren. Git verwendet ein sehr einfaches aber durchdachtes Modell, dass uns ermöglicht Features wie Branches, Kollaboration und eine Dateihistorie zu nutzten

# Snapshots / Commits

Unser Modell beinhaltet einer Sammlung von Ordnern und Datein in einem "top-level" Ordner - ein Snapshot auch **Commit** genannt. Von git wird eine Datei auch als `blob` bezeichnet und ist letzendlich nur eine Sammlung aus Bytes. Das Dateiformat spielt somit keine Rolle. Ein Ordner wird als `tree` bezeichnet und ordnet einem Namen einen oder mehrere `blob`s und andere `tree`s zu. Ordner können dementsprechend andere Ordner oder Datein enthalten und sind identisch vom Aufbau zu unserem Dateisystem. Zum Beispiel:

```
<root> (tree)
|
+- beispiel (tree)
|  |
|  + hello.txt (blob, contents = "hello world")
|
+- inhalt.txt (blob, contents = "git ist super")
```

Der top-level `tree` referenziert den `tree` "beispiel" (der wiederum einen `blob` enhält) und den `blob` "inhalt.txt".

# Snapshots in Relation

**Snapshots** alleine bringen uns noch keinen Mehrwert. Erst wenn wir mehrere Snapshots in Relation setzten, kommen wir unserem Ziel eines VCS näher.

## Version history (Versionsgeschichte)

Widmen wir uns zuerst der wichtigsten Annforderung an unser Modell - der Versionsgeschichte. Zu jedem Zeitpunkt wollen wir Änderungen an unseren Dateinen nachverfolgen und falls nötig Rückgängig machen können. Das einfachste Modell ist die zeitliche Anneinanderreihung unserer Snapshots. Wir erhalten Modell mit einer rein linearen Relation.

```
o <--- o <--- o <--- o <--- o
```

Jedes `o` symbolisiert hier einen Snapshot und jeder `<---` eine Parent-Child-Relation. Das Child zeigt hierbei immer auf den Parent.

Sollten wir nun eine Änderung vorgenommen haben, die wir Rückgängig machen wollen. Suchen wir vom letzten (rechten) Snapshot in den Parent Snapshots (von rechts nach links), bis wir einem Snapshot gefunden haben, der unsere Datei im gewünschten Zustand enthält. Den Inhalt können wir kopieren und in unserem aktuellen Snapshot einfügen.

Eine Version History ist somit möglich.

## Branches

Softwareprojekte werden selten in Isolation geschrieben. Während Person A an dem einen Feature arbeitet, schreibt Person B vielleicht an einem anderen. Dies bringt Probleme mit sich, die wir in unserem aktuellen Modell nicht lösen können. Schauen wir uns ein Beispiel an:

Am Angang haben wir einen Commit (Snapshot) der leeren Datei src/datei.txt.
Dann arbeiten Alice und Bob parallel an dieser:

Alice in src/datei.txt:

```
fn hello_world() {
   print("Hello World")
}

fn main() {
   hello_world()
}
```

Bob in src/datei.txt:

```
fn hello(name: String) {
   print("Hello" + name)
}

fn main() {
   hello("Bob")
}
```

`src`ist unser `top-level`-Ordner.
Beide Personen schreiben an der selben Datei. Nur die Inhalte sind leicht unterschiedlich. Alice will das klassiche "Hello World" ausgegeben, während Bob lieber den eine Begrüßung mit Namen ausgeben möchte. Wir gehen davon aus dass sich nur diese Datei in dem Ordner `src` befindet. Wenn somit beide einen Commit (=Snapshot) erstellen haben diese die Form:

```
src (tree)
|
+- datei.txt (blob, contents = ...)
```

Aber wie sollen wir beide in Relation setzten? Unser bisheriges Modell hat sich an die zeitliche Reihenfolge gehalten. Der Commit mit der leeren Datei kommt somit zuerst, aber was ist mit den anderen beiden? Wenn Bob nach Alice seine Commit erstellt, wird Alice ihre Arbeit überschrieben. Wenn Alice nach Bob commited ist es genau anders herum. Paralleles Arbeiten ist somit noch nicht möglich.

### Paralleles Modell

Die Zeit war bis jetzt unsere x-Achse und wenn wir eine sinnvolle Version History behalten wollen, sollten wir das auch nicht ändern. Alice und Bob arbeiten aber parallel an ihren Features. Wir wollen also wenn möglich eine zeitlich äquivalente Einordnung von beiden Commits. Warum nicht einfach übereinander?

```
o <--- o (Alice)
  ^
   \
    -- o (Bob)
```

Der erste Commit bleibt unverändert. Alice und Bobs Commits werden aber nicht mehr in eine Parent-Child Relation gebracht, sondern sind vielmehr in einer Sibling Relation. Beide haben als Parent den gleichen ersten Commit.

Die Struktur unseres Modells ändert sich also von einer reinen linearen Aneinanderreihung zu einem **Baum**. Paralleles Arbeiten wird somit möglich und Alice und Bob kommen sich nicht mehr in die Quere. Diese unterschiedlichen Stränge werden in git als **Branches** bezeichnet.

> Wen du schon Algorithmen gehört hast, wird dir das bekannt vorkommen. Falls nicht ist auch nicht schlimm. Ein **Baum** besteht aus lauter **Knoten** (hier: Commits) die genau einen **Parent** haben. Ein **Knoten** kann aber mehrere **Kinder** haben. Also wie ein Baum in der Natur, nur dass wir ihn meistens um 90° oder 180° gedreht darstellen.

Aktuell haben wir unsere **Branches** nach den Namen der Personen benannt, aber in der Praxis benennen wir sie nach den Features an denen wir arbeiten. Also lass uns die Namen ändern:

```
o-1 <--- o-2 (feature_a)
  ^
   \
    -- o-3 (feature_b)
```

Damit wir einfacher Commits referenzieren können, haben wir ihnen eine Nummer gegeben. Die Reihenfolge der Nummern spielt dabei keine Rolle, sondern ist nur zur Unterscheidung gedacht. Git verwendet statt Nummern Hashes mehr dazu aber später.

Aus Perspektive von Branch `feature_a` existieren nur zwei Commits o-1 und o-2. Von Branch `feature_b` existier Commit o-1 und o-3.

> ‼️ Commits können nur existieren, wenn sie von einem Branch direkt oder indirekt referenziert werden. Ein Commit der von keinem Branch referenziert wird, wird von git als **unreachable** bezeichnet und nach einer gewissen Zeit gelöscht.

> Branch Namen müssen eindeutig sein und dürfen keine Leerzeichen enthalten. Die Namen müssen keinen Konventionen folgen, es ist aber ratsam sich auf eine gemeinsame Konvention im Team zu einigen.

# Merging Branches

Wir haben nun zwei Branches die parallel an ihren Features arbeiten. Aber wie können wir den Fortschritt von beiden zusammenführen? Warum nicht einfach die Commits und damit auch Änderungen von beiden Branches in einen Commit zusammenfassen?

```
o-1 <--- o-2 <--- o-4 (feature_a, feature_b)
  ^              /
   \            /
    -- o-3 <---
```

Hier erstellen wir einen neuen Commit (o-4) der zwei Parents besitzt: o-2 und o-3. Dieser Commit enthält somit die Änderungen von beiden Branches. Diese Möglichkeit Branches zusammenzuführen wird in git als **Merge** bezeichnet.

Unser Modell müssen wir somit erweitern. Ein Knoten / Commit in einem Baum kann immer nur ein Parent erhalten. Unser Merge-Commit o-4 hat aber zwei Parents. In der Graphentheorie nennen wir diese neue Struktur einen **DAG** (Directed Asyclic Graph). Es hat nur eine wichtige Eigenschaft: Es gibt keine Zyklen. Das bedeutet, wenn wir den Verbindungen (Relations / Pointern) folgen, werden wir nie wieder an den selben Knoten zurückkommen.

So schön und unkompliziert das Merging in der Theorie klingt, ist es in der Praxis leider nicht immer. Auch wenn git recht intelligent mit dem Zusammenführen von Änderungen umgeht, kann es immer noch zu Konflikten kommen, die dann manuell gelöst werden müssen. Hier fokusieren wir uns erstmal auf die Theorie und lernen später wie wir mit Konflikten umgehen.

# Rebasing Branches

Das einfache Zusammenführen von Branches ist nicht die einzige Möglichkeit Änderungen von der einen Branch mit der andern zu kombinieren. Git erlaubt uns auch das einfache "anhängen" von Commits aus einem Branch an einen anderen. Der Vorgang wird als **Rebase** bezeichnet.

Wenn wir nun also die Commits von Branch `feature_b` an Branch `feature_a` anhängen wollen, verändert sich unser Commit-Graph wie folgt:

```
o-1 <--- o-2 (feature_a)
  ^
   \
    -- o-3 (feature_b)

== (rebase feature_a feature_b) ==

o-1 <--- o-2 (feature_a)
           ^
            \
             -- o-3 (feature_b)
```

`feature_a` besteht nun aus den Commits o-1 und o-2, während `feature_b` nun aus o-1, o-2 und o-3 besteht. `feature_a` verändert sich somit nicht.
Auch hier kann es selbstverständlich zu Konflikten kommen, die manuell gelöst werden müssen. Dazu später mehr.

# Commits

Du hast Commits bereits als "Snapshots" deiner Datein kennengelernt, dass ist nicht falsch, aber auch nicht ganz vollständig. Zusätzlich zu dem Zustand deiner Datein, speichert ein Commit noch Metainformationen wie:

- Autor
- Nachricht
- Zeitstempel

Commits sind immutable. Das bedeutet, dass Änderungen an alten Commits immer zwangsweise einen neuen Commit erstellen. Ohne diese Eigenschaft hätten wir keine klar nachfolziehbare Version History.

> Jedes Mal den vollständingen Datei-Tree zu speichern ist nicht nur ineffizient, sondern auch unnötig. Um das zu verhindern, werden gleiche Dateien und Verzeichnissse nur einmal gespeichert und sind dann von mehreren Commits referenzierbar. Eine einfache Implementierung dieser Optimierung ist durch die Immutablilty der Commits möglich.
