# SRP Single Responsibility Principle

> Eine Komponente (Klasse, Funktion, Modul) sollte nur eine Aufgabe erfüllen. Oder anders ausgedrückt: Eine Komponente sollte nur einen Grund haben verändert zu werden.

Am Einfachsten lässt sich das das an einem Beispiel sehen, dass das Single Responsibility Principle verletzt. Wir betrachten folgenden Java Code:

```java
public class User {
    private String name;
    private String email;
    private String password;

    public void save() {
        // Speichere den User in der Datenbank
    }

    public void sendEmail() {
        // Sende eine E-Mail an den User
    }
}
```

Die Klasse `User` hat zwei Methoden `saveToDB` und `sendEmail`. Die Methode `saveToDB` speichert den User in der Datenbank und die Methode `sendEmail` sendet eine E-Mail an den User. DasProblem hierbei ist, dass die Klasse `User` zwei Gründe hat verändert zu werden. Zum einen, wenn sich die Weise ändert, wie ein User in der Datenbank gespeichert wird und zum anderen, wenn sich die Art ändert, wie eine E-Mail an den User gesendet wird.

> Zusätzlich zum SRP verletzt unser Code auf das DRY Prinzip, sollte es wo anders noch eine Methode geben, die E-Mails sendet.

Wie könnten wir das ganze besser machen? Wir könnten die methode `sendEmail` in eine eigene Klasse `EmailService` auslagern. Die Klasse `User` würde dann nur noch die Daten des Users verwalten und die Methode `save` enthalten.

```java
class User {
    private String name;
    private String email;
    private String password;

    public void saveToDb() {
        // Speichere den User in der Datenbank
    }
}

class EmailService {
    public void sendEmail(User user) {
        // Sende eine E-Mail an den User
    }
}
```
