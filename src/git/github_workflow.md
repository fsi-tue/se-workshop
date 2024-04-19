# Github Workflow

Die nahtlose Zusammenarbeit mit deinem Team ist nicht immer einfach, aber eine Grundvorausetztung für das Schreiben von moderner Software. Softwareprojekte sind zu groß und zu komplex, als dass eine Person alleine sie bewältigen könnte. Grade weil dies Zusammenarbeit so wichtig ist, gibt es mitlerweile viele erprobte und bewährte Workflows, die uns dabei helfen können. Hier werden wir uns einen der einfachsten Workflows anschauen, der auch gut für das Teamprojekt in Frage kommt.

# Review

Viel zu oft passieren beim Coden unabsichtlich kleine Fehler. Mal ein +1 vergessen, mal die falsche Variable verwendet oder einfach nur ein Tippfehler. Viele dieser Fehler werden heutzutage schnell von LSP-Servern oder dem Compiler gefunden. Aber auch wenn kleinere Tippfehler kein Problem mehr sind, können grade Logikfehler selten bis gar nicht von einem Computer gefunden werden. Der Computer weiß schließlich nicht, was wir eigentlich schreiben wollen. Selbstverständlich sollten wir Tests schreiben, die diesen Fehler auf die schliche kommen, aber auch diese sind nicht perfekt. Und wäre es nicht viel schöner, wenn die Fehler erst gar nicht den Code erreichenq würden?

Genau dafür gibt es Code Reviews. In einem Code Review überprüft ein Teammitglied den Code eines anderen Teammitglieds. Dabei wird nicht nur auf offensichtliche Fehler geachtet, sondern auch auf die Lesbarkeit und Verständlichkeit des Codes. Der Review dient aber nicht nur als Kontrolle, sondern auch als Lernmöglichkeit. Durch das Lesen des Codes eines anderen Teammitglieds können wir neue Techniken und Methoden lernen, die wir in Zukunft auch in unserem eigenen Code verwenden können.

# Pull Request

Das Code Reviews Sinn machen, haben wir bereits gesehen, aber wie können wir das in unserem git Alltag einbauen. Hast du noch unser 1. Leitmotiv im Kopf? `main` sollte immer stabil also möglichst ohne Fehler sein. Um sich diesem Zustand anzunähern, würde sich ein Code Review vor jeder Änderungen an `main` anbieten. Eingangs haben wir schon erwähnt, dass wir nicht direkt auf `main` committen sollten. Aber wie können wir dann unsere Änderungen auf `main` bingen? Normalerweise würden wir einen einfachen Merge oder Rebase verenden um Änderungen aus andren Branches auf `main` zu bringen. Wenn wir aber vorher ein Code Review haben wollen, brauchen wir einen Möglichkeit Änderungen zu prüfen bevor sie auf `main` landen. Wir wollen also eine Möglichkeit den andren Teammitgliedern zu signaliseren, dass unsere Änderungen bereit für ein Review sind und ihnen unsere Änderungen einfach zugänglich machen. Genau dafür gibt es **Pull Requests**. Wenn ihr also eure Änderungen auf `main` bringen wollt, erstellt ihr einen Pull Request von eurer Branch auf `main`. (Im Github Repository - Reiter: Pull Request) Hier beschreibt ihr die Änderungen die ihr vorgenommen habt und wartet bis ein anderes Teammitglied eure Änderungen rewiewed hat. Solle es Änderungswünsche vom Reviewer geben, sollten diese in einem neuen Commit auf euren Branch eingearbeitet werden. Durch ein pushen auf die remote Branch wird auch der Pull Request automatisch aktuelliisiert. Wenn der Reviewer zufrieden ist, kann er den Pull Request mergen und eure Änderungen landen auf `main`.

# Erste Schritte

Euer Teamprojekt Remote Repository wird vermutlich Github als Hosting Provider verwenden. Damit die Zusammenarbeit reibungslos funktioniert, werden wir den defacto Standard Github Workflow vorstellen.

Die Zusammenarbeit wird von zwei Leitprinzipien bestimmt:

1. `main` ist immer stabil. Es erfolgen keine direkten Commits auf `main`.
2. Branch early, branch often - Jede neue Funktionalität wird in einem eigenen Branch entwickelt.

Wie können wir diese Leitlinien auf den Workflow in unserem Teamprojekt anwenden?

Wir gehen davon aus, dass ihr bereits ein Repository für euer Teamprojekt erstellt habt. Falls nicht, könnt ihr dies in der [Github Dokumentation](https://docs.github.com/en/github/getting-started-with-github/create-a-repo) nachlesen.

Da viele Programmiersprachen gleich mit einer grundlegenden Ordnerstruktur und Dateien starten, empfehlen wir euch, dass einer alles aufsetzt und dann als initial Commit direkt auf `main` pushed. Dies ist der einzige Fall, in dem ein direkter Commit auf `main` erstellt werde sollte.

Die andren Teammitglieder können jetzt das Repository clonen.

> Achtet darauf gleich am Anfang alle eine `.gitignore` Datei zu erstellen, damit nicht unnötige Dateien (Editor-Config / Cache-Dateien / etc.) im Repository landen und bei den andern zu Konflikten führen.

Nachdem ihr diese Anfangsschritte durchgeführt habt, könnt ihr mit dem eigentlichem sich immer Wiederholenden Workflow beginnen.

## Der Workflow

1. Ihr habt eine klare Vorstellung, was ihr implementieren oder ändern wollt. Die Aufgabe sollte in sich geschlossen sein und nicht zu groß.

> "nicht zu groß" ist ein sehr subjektiver Begriff. Aber für euer Teamprojekt könnt ihr euch an einer groben Faustregel orientieren: Wenn ihr vorraussichtlich mehr als 4-5 Stunden braucht um die Aufgabe zu erledigen, ist sie vermutlich zu groß. Hier solltet ihr sie in deutlich fassbare Aufgaben unterteilen.

2. Setzt eueren `main` Branch auf den aktuellen Stand. Wir verwenden dafür den Befehl `git pull` auf main.

3. Erstellt einen neuen Branch für eure Aufgabe. Der Name der Branch sollte aussagekräftig sein und am besten vermitteln, was ihr angehen wollt. (z.B `feature/login_page`). Letztendlich bleibt es euch überlassen einen Namenskonvention zu finden. Achtet aber drauf, dass alle im Team die selbe Konvention verwenden. Es erleichtert die Zusammenarbeit.

4. Bearbeitet eure Aufgabe auf eurem Branch. Commitet regelmäßig und schreibt aussagekräftige Commit Messages - eure Teammitglieder werden es euch danken.

5. Ihr könnt bereits euren Branch auf den Remote Server (eg. Github) pushen. Das ist besonders dann sinnvoll, wenn ihr an einem Feature arbeitet, das länger dauert. So können eure Teammitglieder sehen, dass ihr an der Aufgabe arbeitet und ggf. Feedback geben. (z.B. `git push -u origin feature/login_page`)

6. Wenn ihr mit eurer Aufgabe fertig seid erstellt ihr einen Pull Request (PR) auf `main`. In diesem PR beschreibt ihr kurz, was ihr erledigt habt (eg. Issue verlinken) und weißt eurem Code einen Reviewer zu. Sollten eure Änderungen nicht klar sein, habt ihr hier noch die Möglichkeit mit einem interaktiven Rebase vor dem Review Ordnung zu schaffen.

7. Ein anderes Teammitglied reviewed euren Code und gibt falls nötig Änderungswünsche. Sollt ihr diese für nicht sinnvoll halten, könnt ihr das über die Kommentarfunkionen im PR diskutieren. Wenn ihr einen Konsens gefunden habt und die Änderungen eingearbeitet sind, kann der Reviewer nach einem erneuten Review den PR mergen.

8. Wir beginnen wieder mit 1.
