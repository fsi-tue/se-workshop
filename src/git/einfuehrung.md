# Git?!? - Was ist das eigentlich?

Stell dir vor, du arbeitest gemeinsam mit einem Team an einem Softwareprojekt.
Jeder arbeitet selbstständig an seinen Aufgaben und Datein, aber immer wieder
muss alles zusammengeführt werden, damit alle auf dem neusten Stand sind.

In unserem Beispiel tauscht sich dein Team per E-Mail aus und schickt immer wieder E-Mails mit Dateianhängen hin und her. Bei 2-3 Datein mag das noch gehen, aber sobald es mehr wird, wird es schnell unübersichtlich, kompliziert und fehleranfällig.

## Was sind Versionsverwaltungssysteme?

**Versionierungssysteme** (VCS = Version Control System) sind Werkzeuge, die es ermöglichen Änderungen an
Quellcode (oder anderen Sammlungen von Dateien und Ordnern) zu verfolgen.
Darüber hinaus erleichtern sie die Zusammenarbeit mit anderen Entwicklern.
**VCSs** verfolgen Datein und Sub-Ordner in einem ausgewählten Ordner und
speichern von diesen eine Serie von **Snapshots**. Diese enthalten neben den
Datein auch Metadaten, wie zum Beispiel Autoren und assoziierte Nachrichten.

Aber warum ist das nützlich? Auch wenn du alleine arbeitest, ermöglichen dir
**VCSs**, alte Zustände eines Projekts anzusehen, Protokoll zu führen,
warum bestimmte Änderungen gemacht wurden, parallel an **verschiedenen
Features** zu arbeiten, zu **früheren Zuständen** zurückzuspringen und vieles mehr. Bei der Arbeit mit anderen sind sie ein
unschätzbares Werkzeug, um zu sehen, was andere geändert haben, sowie um
Konflikte beim **parallelen Bearbeiten** von Datein zu minimieren.

Moderne **VCSs** ermöglichen es dir auch leicht (und oft automatisch) Fragen zu beantworten wie:

- Wer hat dieses Modul geschrieben?
- Wann wurde diese bestimmte Zeile dieser speziellen Datei bearbeitet? Von wem? Warum wurde sie bearbeitet?
- Im Laufe der letzten 1000 Änderungen, wann und warum hat ein bestimmter Unit-Test aufgehört zu funktionieren?

## Alternativen zu Git

Während Git heute der de fakto Standard ist, gibt es auch andere Systeme, die ähnliche Funktionen bieten:

- **Mercurial**
- **Subversion (SVN)**
- **Bazaar**

Jedes dieser Systeme ermöglicht ähnliche Funktionen wie Git, ist aber deutlich
weniger verbreitet und wird in der Regel nur in speziellen Anwendungsfällen eingesetzt.
