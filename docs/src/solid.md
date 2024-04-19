# SOLID Design Prinzipien

Alle Wege führen zum Ziel. Das gilt leider auch für die Softwareentwicklung. Es gibt viele Wege Software zu schreiben. Jede dieser Lösungungen hat Möglicherweise das gleiche Verhalten, kann sich aber signifikant in der Wartbarkeit, Erweiterbarkeit und Lesbarkeit - kurz: internen Qualität - unterscheiden.

Die SOLID Prinzipien versuchen uns dabei zu helfen, einen Weg mit möglichst hoher interner Qualität zu beschreiten.

## SOLID

SOLID ist ein Akonymn für fünf Design Prinzipien von Robert C. Martin. Diese Prinzipien sind:

- **Single Responsibility Principle** - Eine Komponente (Klasse, Funktion, Modul) sollte nur eine Aufgabe erfüllen
- **Open/Closed Principle** - Eine Komponente sollte offen für Erweiterungen aber geschlossen für Modifikationen sein
- **Liskov Substitution Principle** - Subtypen müssen in ihrem Verhalten den Basistypen entsprechen
- **Interface Segregation Principle** - Nutzer sollten nicht gezwungen sein Methoden zu implementieren, die sie nicht benötigen
- **Dependency Inversion Principle** - Module sollten nicht von konkreten Implementierungen abhängen, sondern von abstrakten Schnittstellen

Sie formulieren alle wünschenswerte Eigenschaften eines Software Designs. Dabei gelten sie mehr als Heuristiken die dir helfen sollen unterschiedliche Ansätze abzuwägen und nicht als strenge Regeln die es strikt einzuhalten gilt.
