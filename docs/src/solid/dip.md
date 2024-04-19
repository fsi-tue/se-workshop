# Dependency Inversion

> Module sollten nicht von konkreten Implementierungen abhängen, sondern von abstrakten Schnittstellen.

Dieses Prinzip zielt darauf ab, die Kopplung zwischen Modulen zu verringern, die Modularität zu erhöhen und den Code leichter wartbar, testbar und erweiterbar zu machen.

Betrachten wir zum Beispiel ein Szenario, in dem wir eine Klasse haben, die eine Instanz einer anderen Klasse verwenden muss. Normalerweise würde die erste Klasse direkt eine Instanz der zweiten Klasse erstellen, was zu einer engen Kopplung zwischen ihnen führt. Dies erschwert es, die Implementierung der zweiten Klasse zu ändern oder die erste Klasse unabhängig zu testen.

Wenn wir jedoch das DIP anwenden, würde die erste Klasse stattdessen von einer Abstraktion der zweiten Klasse abhängen und nicht von der Implementierung. Dies würde es ermöglichen, die Implementierung leicht zu ändern und die erste Klasse unabhängig zu testen.

```java
class WeatherTracker {
    private String currentConditions;
    private Emailer emailer;

    public WeatherTracker() {
        this.emailer = new Emailer();
    }

    public void setCurrentConditions(String weatherDescription) {
        this.currentConditions = weatherDescription;
        if (weatherDescription == "rainy") {
            emailer.sendEmail("It is rainy");
        }
    }
}

```

In diesem Beispiel erstellt die Klasse `WetterTracker` direkt eine Instanz der Klasse `Emailer`, was zu einer engen Kopplung an die Implementierung führt. Dies erschwert es, die Implementierung der Klasse `Emailer` zu ändern oder die Klasse `WetterTracker` unabhängig zu testen.

Wir können unser Beispiel umschreiben, damit die Klassen nicht mehr so stark voneinander abhängen.

```java
interface Notifier {
    public void alertWeatherConditions(String weatherDescription);
}

class WeatherTracker {
    private String currentConditions;
    private Notifier notifier;

    public WeatherTracker(Notifier notifier) {
        this.notifier = notifier;
    }

    public void setCurrentConditions(String weatherDescription) {
        this.currentConditions = weatherDescription;
        if (weatherDescription == "rainy") {
            notifier.alertWeatherConditions("It is rainy");
        }
    }
}

class Emailer implements Notifier {
    public void alertWeatherConditions(String weatherDescription) {
        System.out.println("Email sent: " + weatherDescription);
    }
}

class SMS implements Notifier {
    public void alertWeatherConditions(String weatherDescription) {
        System.out.println("SMS sent: " + weatherDescription);
    }
}
```
