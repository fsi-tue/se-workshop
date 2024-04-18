# Tipps und Tricks

## Reflog!!

Wir haben Reflog bereits [hier](./help.md) ausführlich besprochen. Es ist so ein lebensrettendes Tool, von dem viel zu wenige wissen, als dass wir es hier nicht nochmal erwähnen müssen

## Aliase

Git Befehle sind können schnell zu sehr langen Monstern mit vielen Optionen ausaten. Und selbst wenn sie nur mittellang sind und wir sie sehr oft eingeben müssen ist das lästig. Hier kommen Aliase ins Spiel. Mit ihnen können wir Befehle abkürzen. Wir können sie entweder global für alle Projekte oder nur für das aktuelle Projekt definieren.
Hier ein paar Beispiele:

```bash
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
```

Wirklich angenehm sind Aliase wenn wir Befehle erstellen wollen die eigentlich exisieren sollen. Warum nicht einfach `git unstage` statt `git reset HEAD`

```bash
$ git config --global alias.unstage 'reset HEAD'
$ git config --global alias.graph 'log --oneline --graph'
```

Unser Leben wird deutlich angenehmer wenn wir uns ein paar Aliase erstellen.
