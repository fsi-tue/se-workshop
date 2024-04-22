# Git Cheatsheet

## Einen Überblick verschaffen

| Command                           | Beschreibung                                                                                             |
| --------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `git status`                      | Zeigt den aktuellen Stand des HEAD pointers, den Stand der Staging Area sowie Änderungen am Working Tree |
| `git log`                         | Zeigt die letzten Commits die von unserem aktuellen HEAD erreichbar sind                                 |
| `git log --oneline --graph --all` | Zeigt den Commit Graph aller Commits von allen Branches an                                               |

## Checkout

| Command                 | Beschreibung                                                                                                                                                     |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `git checkout <branch>` | Wechselt auf den angegebenen Branch.                                                                                                                             |
| `git checkout <commit>` | Wechselt auf den angegebenen Commit. Du befindest dich danach im "detached HEAD" modus. (Erstelle und) Wechsle auf einen Branch, bevor du einen Commit erstellst |

## Staging Area

| Command                 | Beschreibung                                                                                                                                                                 |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `git add <file_name>`   | Fügt die angegebene Datei der Staging Area hinzu.                                                                                                                            |
| `git reset <file_name>` | Überschreibt die Staging Area mit dem letzten Commit. Das hat den Effekt, dass die Datei wieder aus der Staging Area entfernt wird. Der Working Tree bleibt davon unberührt. |

## Commit

| Command                | Beschreibung                                    |
| ---------------------- | ----------------------------------------------- |
| `git commit`           | Erstellt einen neuen Commit.                    |
| `git commit -m "Text"` | Erstellt einen neuen Commit mit einer Nachricht |

## Branches

| Command                             | Beschreibung                                           |
| ----------------------------------- | ------------------------------------------------------ |
| `git branch`                        | Zeigt alle Branches an.                                |
| `git branch <name>`                 | Erstellt einen neuen Branch am aktuellen HEAD pointer. |
| `git branch -m <alter_name> <name>` | Ändert den Namen des angegebenen Branches.             |

## Merging

| Command              | Beschreibung                                                                                                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `git merge <branch>` | Merged den angegebenen Branch in den aktuellen Branch.                                                                                                                                                  |
| `git merge --abort`  | Bricht den Merge nach einem Konflikt ab und stellt den vorherigen Stand wieder her. Solltest du einen Merge abschließen wollen, muss nur ein neuer Commit nach dem Lösen des Konflikts erstellt werden. |

## Rebasing

| Command                 | Beschreibung                                                                         |
| ----------------------- | ------------------------------------------------------------------------------------ |
| `git rebase <branch>`   | Rebasen des aktuellen Branches auf den angegebenen Branch.                           |
| `git rebase --abort`    | Bricht den Rebase nach einem Konflikt ab und stellt den vorherigen Stand wieder her. |
| `git rebase --continue` | Führt den Rebase nach dem Lösen eines Konflikts fort.                                |

## Reset

| Command                      | Beschreibung                                                                                                                                                             |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `git reset --soft <commit>`  | Setzt den HEAD pointer auf den angegebenen Commit. Die Staging Area und der Working Tree bleiben unberührt.                                                              |
| `git reset --mixed <commit>` | Setzt den HEAD pointer auf den angegebenen Commit. Die Staging Area wird zurückgesetzt. Der Working Tree bleibt unberührt.                                               |
| `git reset --hard <commit>`  | Setzt den HEAD pointer auf den angegebenen Commit. Die Staging Area und der Working Tree werden zurückgesetzt. Nicht Commitete Änderungen im Working Tree gehen verloren |

## Reflog

| Command      | Beschreibung                                                                                       |
| ------------ | -------------------------------------------------------------------------------------------------- |
| `git reflog` | Zeigt die Historie aller HEAD Änderungen an. Nützlich um nach Commits ohne Branches wiederzufinden |

## Remotes

| Command                       | Beschreibung                                                       |
| ----------------------------- | ------------------------------------------------------------------ |
| `git remote`                  | Zeigt alle Remotes an, die in diesem Repository konfiguriert sind. |
| `git remote add <name> <url>` | Fügt ein neues Remote Repository hinzu.                            |
| `git remote remove <name>`    | Entfernt das angegebene Remote Repository.                         |
| `git remote show <name>`      | Zeigt Informationen über das angegebene Remote Repository an.      |

## Arbeiten mit Remotes

| Command                                          | Beschreibung                                                                                                                          |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| `git fetch <remote>`                             | Lädt alle Änderungen aus dem angegebenen Remote Repository herunter, ohne sie zu mergen.                                              |
| `git pull <remote> <branch>`                     | Lädt alle Änderungen aus dem angegebenen Remote Repository herunter und merged sie in den aktuellen Branch.                           |
| `git push <remote> <branch>`                     | Lädt alle Änderungen aus dem aktuellen Branch in das angegebene Remote Repository hoch.                                               |
| `git branch --set-upstream-to=<remote>/<branch>` | Setzt den Upstream Branch für den aktuellen Branch.                                                                                   |
| `git push -u <remote> <branch>`                  | Lädt alle Änderungen aus dem aktuellen Branch in das angegebene Remote Repository hoch und setzt den Upstream Branch.                 |
| `git pull --rebase <remote> <branch>`            | Lädt alle Änderungen aus dem angegebenen Remote Repository herunter, merged sie in den aktuellen Branch und setzt den Upstream Branch |
