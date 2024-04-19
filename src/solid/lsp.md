# Liskov Substitution

> Subtypen müssen in ihrem Verhalten den Basistypen entsprechen.

Betrachten wir das ganze anhand eines Beispiels:

```java
interface Bike {
    void turnOnEngine();

    void accelerate();
}
```

Wir haben das Interface Bike, welches zwei Methoden definiert: `turnOnEngine` und `accelerate`. Zwei Klassen implementieren dieses Interace `Motorbike` und `Bicycle`.

```java
class Motorbike implements Bike {

    boolean isEngineOn;
    int speed;

    @Override
    public void turnOnEngine() {
        isEngineOn = true;
    }

    @Override
    public void accelerate() {
        speed += 5;
    }
}
```

`Motorbike` hat für beide Methoden eine korrekte Implementierung. `turnOnEngine` setzt den Wert von `isEngineOn` auf `true` und `accelerate` erhöht die Geschwindigkeit um 5km/h.

```java
class Bicycle implements Bike {

    boolean isEngineOn;
    int speed;

    @Override
    public void turnOnEngine() {
        throw new AssertionError("There is no engine!");
    }

    @Override
    public void accelerate() {
        speed += 5;
    }
}
```

Im Gegensatz dazu hat `Bicycle` eine fehlerhafte Implementierung von `turnOnEngine`. Da ein Fahrrad keinen Motor hat, sollte die Methode `turnOnEngine` nicht aufgerufen werden. In diesem Fall wird eine `AssertionError` geworfen. Das ist ein Verstoß gegen das Liskov Substitution Prinzip. Sollte eine Klasse ein Interface implementieren, sollte alle Instanzen des Interfaces das gleiche Verhalten haben. In diesem Fall sollte `turnOnEngine` für alle Klassen, die das Interface `Bike` implementieren, den Motor anschalten. Die Implmentation von `Bicycle` ist also fehlerhaft.
