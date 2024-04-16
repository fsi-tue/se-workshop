# Dein erstes Repository

Jetzt haben wir genügend Theorie für den Anfang. Lass uns ein Repository erstellen und damit arbeiten. Repositroy nennt man ein Verzeichnis, das von Git getrackt wird. Hier sind alle Funktionen des VCS verfügbar.

## Repository erstellen

1. Erstelle zunächst ein neues Verzeichnis für dein Repository.
   Navigiere mit `cd` in das Verzeichnis, wo du das Repository erstellen möchtest.
   ```bash
    $ cd ~/dev
   ```
   Bei mir ist das der Ordner `dev` in meinem Home-Verzeichnis.
   erstelle ein neues Verzeichnis mit `mkdir`.
   ```bash
    $ mkdir my_repository
   ```
   mit `ls` kannst du überprüfen, ob das Verzeichnis erstellt wurde.
   ```bash
    $ ls
    > my_repository ...
   ```
2. Jetzt machen wir aus dem Verzeichnis ein Git-Repository.
   Navigiere jetzt in das Verzeichnis.

   ```bash
    $ cd my_repository
   ```

   und führe den Befehl `git init` aus. Das initialisiert das Repository.

   ```bash
     $ git init
     > Initialized empty Git repository in ~/dev/my_repository/.git/
   ```

   Achte auf das Ende das Ausgabe. Es zeigt an, dass ein neues verstecktes Verzeichnis `.git` erstellt wurde. Das ist das Verzeichnis, in dem Git alle Informationen über das Repository speichert. Wenn du dieses Verzeichnis löscht, sind auch alle Informationen über das Repository weg und nur dein aktueller HEAD Zustand bleibt erhalten.

   > Wenn es dich interessiert, wie das Verzeichnis aussieht und wie genau Git deine Daten speichert, kannst du [hier](https://git-scm.com/book/en/v2/Git-Internals-Plumbing-and-Porcelain) mehr darüber lesen.

   Wir haben jetzt erfolgreich ein neues Repository erstellt. Um zu überprüfen, ob alles geklappt hat, führe den Befehl `ls -a` aus. Das zeigt dir alle versteckten Dateien und Verzeichnisse an.

   ```bash
    $ ls -a
    > . .. .git
   ```

# Repository clonen

Ein neues Repository erstellen ist oftmals hilfreich, ist aber nicht der normalfall. Meistens arbeiten wir an Projekten die von anderen bereits begonnen wurden. Um ein Repository von einem Remote zu kopieren, verwenden wir die `git clone` Funktion. Was genau ein Remote ist, lernst du später. Hier sei nur gesagt, dass ein Remote ein anderes Repository ist, das auf einem anderen Server liegt. Das kann z.B. Github sein.

Wir klonen nun ein bereits bestehendes Repository von Github. Dazu suchen wir uns erst ein passendes Repository raus. Ich nehme hier das Repository vom [rust-analyzer](https://github.com/rust-lang/rust-analyzer). Wir haben immer die wahl zwischen einen SSH und einem HTTP clone. Solltest du selber an einem Projekt arbeiten wollen, empfehle ich dir den SSH clone. Ansonsten wird es später schwierig, wenn du deine Änderungen wieder zurück an den Server schicken möchstet.

```bash
 $ git clone git@github.com:rust-lang/rust-analyzer.git
 > Cloning into 'rust-analyzer'...
 remote: Enumerating objects: 241212, done.
 remote: Counting objects: 100% (5583/5583), done.
 remote: Compressing objects: 100% (1805/1805), done.
 remote: Total 241212 (delta 4411), reused 4653 (delta 3671), pack-reused 235629
 Receiving objects: 100% (241212/241212), 69.32 MiB | 15.63 MiB/s, done.
 Resolving deltas: 100% (158407/158407), done.
```

Danach haben wir einen Ordner `rust-analyzer` erstellt, der das Repository enthält. Solltest du das Repository woanders haben wollen, kannst du alternativ auch den Pfad angeben.

```bash
 $ git clone git@github.com:rust-lang/rust-analyzer.git /pfad/zu/deinem/ordner
```

Du kannst nun Repositories erstellen und clonen. Im nächsten Kapitel lernst du, wie wir unser Repository verwalten können.
