# Help! I fucked up

Git kann praktisch alle Operationen rückgängig machen. Eine der wenigen Ausnahme haben wir im letzten Kapitel gesehen: Wenn ein Hard Reset durchgeführt wird, ohne dass Änderungen commited wurden, gehen diese unwiederbringlich verloren.

# Reflog

Abgesehen davon speichert git alle Änderungen von Commits und Branches im Repository die wir vorgenommen haben. Wir können all diese im Reflog anschauen:

```bash
$ git reflog
> e0a7930 HEAD@{0}: merge feature/hello_user: Merge made by the 'ort' strategy.
  f239baa HEAD@{1}: checkout: moving from feature/hello_user to main
  656d544 (feature/hello_user) HEAD@{2}: commit: added hello_user
  f239baa HEAD@{3}: commit: added echo functionality
```

## Back in Time

Um in der Zeit zurückzugehen bevor wir etwas versehentlich kaputt gemacht haben, müssen wir nur einen reset in Kombination mit unserer `HEAD@{index}` Referenz durchführen. Git setzt daraufhin alle Änderungen bis zu diesem Zeitpunkt zurück.

```bash
$ git reset HEAD@{index}
```

Oben haben wir gesehen, dass wir als letztes einen Merge durchgeführt hatten. Sollten wir diesen rückgängig machen wollen, können wir das mit folgendem Befehlt tun:

```bash
$ git reset HEAD@{1}
```

Schauen wir uns daraufhin das Reflog erneut an:

```bash
$ git reflog
> 1533063 (HEAD ->  main) HEAD@{0}: reset: moving to HEAD@{1}
  e0a7930 HEAD@{1}: merge feature/hello_user: Merge made by the 'ort' strategy.
  f239baa HEAD@{2}: checkout: moving from feature/hello_user to main
  656d544 (feature/hello_user) HEAD@{3}: commit: added hello_user
  f239baa HEAD@{4}: commit: added echo functionality
```

Auch unser Reset wurde im Reflog festgehalten. Wir können also auch diesen also jederzeit wieder rückgängig machen.

> Auch wenn wir all diese Änderungen mit dem bereits bekannten `git reset` durchführen können, ist es oft deutlich einfacher und sicherer, wenn wir die Reflog Referenzen als Adressierung verwenden. Grade bei Resets von Merges können wir sonst schnell auf die falsche Referenz zurücksetzten. Reflog in Kombination mit `git reset` ist also so etwas wie unsere Time Machine.
