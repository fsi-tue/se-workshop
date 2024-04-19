# Interface Segregation

> Nutzer sollten nicht gezwungen sein Methoden zu implementieren, die sie nicht benötigen

Dieses Prinzip zielt darauf ab, Interfaces mit möglichst wenigen Methoden zu definieren, anstatt Interfaces mit vielen Methoden zu definieren, um alle Möglichen Fälle abzudecken.

## Beispiel

```java
interface Vehicle {
    void startEngine();
    void stopEngine();
    void drive();
    void fly();
}

class Car implements Vehicle {

    @Override
    public void startEngine() {
        // implementation
    }

    @Override
    public void stopEngine() {
        // implementation
    }

    @Override
    public void drive() {
        // implementation
    }

    @Override
    public void fly() {
        throw new UnsupportedOperationException("This vehicle cannot fly.");
    }
}
```

In diesem Beispiel implementiert die Klasse `Car` das Interface `Vehicle`. Da ein Auto nicht fliegen kann, wird die Methode `fly` mit einer `UnsupportedOperationException` geworfen. Das ist ein Verstoß gegen das Interface Segregation Prinzip, da das Interface unnötig viele Methoden fasst. Wir können das Interface in kleinere Interfaces aufteilen.

```java
interface Engine {
    void startEngine();
    void stopEngine();
}

interface Drivable {
    void drive();
}

interface Flyable {
    void fly();
}
```

Wir teilen unser Interface in drei kleinere Interfaces auf: `Engine`, `Drivable` und `Flyable`. Durch die kleineren Interfaces ist es deutlich einfacher für Klassen, sich nur Methoden bzw. Interfaces zu implementieren, die sie wirklich benötigen. Hier können wir nun die Klasse `Car` und `Airplane` ohne Probleme implementieren.

```java
class Car implements Engine, Drivable {

    @Override
    public void startEngine() {
        // implementation
    }

    @Override
    public void stopEngine() {
        // implementation
    }

    @Override
    public void drive() {
        // implementation
    }
}

class Airplane implements Engine, Drivable, Flyable {

    @Override
    public void startEngine() {
        // implementation
    }

    @Override
    public void stopEngine() {
        // implementation
    }

    @Override
    public void drive() {
        // implementation
    }

    @Override
    public void fly() {
        // implementation
    }
}
```
