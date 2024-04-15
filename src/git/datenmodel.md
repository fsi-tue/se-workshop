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

**Snapshots** alleine bringen uns noch keinen Mehrwert. Erst wenn wir mehrere Snapshots in relation setzten, kommen wir unserem Ziel eines VCS näher.

## Version history (Versionsgeschichte)

Widmen wir uns zuerst der wichtigsten Annforderung an unser Modell - der Versionsgeschichte. Zu jedem Zeitpunkt wollen wir Änderungen an unseren Dateinen nachverfolgen und falls nötig Rückgängig machen können. Das einfachste Modell ist die zeitliche Anneinanderreihung unserer Snapshots. Wir erhalten Modell mit einer rein linearen Relation.

```
o <--- o <--- o <--- o <--- o
```

Jedes `o` symbolisiert hier einen Snapshot und jeder `<---` eine Parent-Child-Relation. Das Child zeigt hierbei immer auf den Parent.

Sollten wir nun eine Änderung vorgenommen haben, die wir Rückgängig machen wollen. Suchen wir vom letzten (rechten) Snapshot in den Parent Snapshots (von rechts nach links), bis wir einem Snapshot gefunden haben, der unsere Datei im gewünschten Zustand enthält. Den Inhalt können wir kopieren und in unserem aktuellen Snapshot einfügen.

Eine version history ist somit möglich.

## Branches

Softwareprojekte laufen werden selte in Isolation geschrieben. Während Person A an dem einen Feature arbeitet, schreibt Person B vielleicht an einem anderen. Dies bringt Probleme mit sich, die wir in unserem aktuellen Modell nicht lösen können. Schauen wir uns ein Beispiel an:

Am Angang haben wir einen Commit (Snapshot) der leeren Datei src/datei.txt.
Dann Arbeiten Alice und Bob parallel an dieser:

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
fn hello_world(name: String) {
   print("Hello" + name)

}

fn main() {
   hello_world("Bob")
}
```

`src`ist unser `top-level`-Ordner.
Beide Personen schreiben an der selben Datei. Nur die Inhalte sind leicht unterschiedlich. Alice will das klassiche "Hello World" ausgegeben, während Bob lieber den eine Begrüßung mit Namen ausgeben möchte. Wir gehen davon aus dass sich nur diese Datei in dem Ordner `src` befindet. Wenn somit beide einen Commit (=Snapshot) erstellen haben diese die Form:

```
src (tree)
|
+- datei.txt (blob, contents = ...)
```

Aber wie sollen wir beide in relation setzten? Unser bisheriges Modell hat sich an die zeitliche Reihenfolge gehalten. Der der Commit mit der leeren Datei kommt somit zuerst, aber was ist mit den anderen beiden? Wenn Bob nach Alice seine Commit erstellt, wird Alice ihre Arbeit überschrieben. Wenn Alice nach Bob commited ist es genau anders herum. Paralleles Arbeiten ist somit noch nicht möglich.

### Paralleles Modell

Die Zeit war bis jetzt unsere x-Achse und wenn wir eine sinnvolle version history behalten wollen, sollten wir das auch nicht ändern.