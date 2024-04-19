# Open Closed

> Eine Komponente sollte offen für Erweiterungen aber geschlossen für Modifikationen sein. Das heißt Erweiterungen der Funktionalität sollten möglichst keinen bestehenden Code verändern.

Dies Prinzip ziehlt vor allem darauf einmal geschriebenen und getesteten Code nicht zu verändern und somit die Möglichkeits von Bugs zu minimieren

## Beispiel

```java
class UserDao {
    private User user;

    public UserDao(User user) {
        this.user = User;
    }

    public void saveToDb() {
        // save to database implementation
    }
}
```

User Dao hat eine einzige Aufgabe. Es speicher einen User in der Datenbank. Kommt nun aber die Anforderung, dass der User auch in einer Textdatei gespeichert werden soll, so müsste die Methode `saveToDb` angepasst werden. Das ist ein Verstoß gegen das Open/Closed Prinzip. Wir können den Code umschreiben, sodass die Methode `saveToDb` nicht mehr verändert werden muss.

```java
interface UserSaver {
    void save(User user);
}

class DbUserSaver implements UserSaver {
    public void save(User user) {
        // save to database implementation
    }
}

class FileUserSaver implements UserSaver {
    public void save(User user) {
        // save to file implementation
    }
}
```
