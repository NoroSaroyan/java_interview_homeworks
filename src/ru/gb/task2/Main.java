package ru.gb.task2;

public class Main {

}
interface Moveable {
    void move();
}

interface Stopable {
    void stop();
}

abstract class Car { // public abstract class Car - if we want to use it anywhere out of this package
    // private Engine engine; Would benefit from using it as private
    // There isn't a class engine
    public Engine engine;
    private String color;
    private String name;


    protected void start() {
        System.out.println("Car starting");
    }

    //  Class Car is abstract, method start will compile, but we can't override
    // Either implement it as an abstract method, or implement it as an inteface
    public Engine getEngine() {
        return engine;
    }
    // public abstract void open(); the method is not available out of this package
    abstract void open();

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

class LightWeightCar extends Car implements Moveable{

    @Override
    void open() {
        System.out.println("Car is open");
    }

    @Override
    public void move() {
        System.out.println("Car is moving");
    }

}

0 // 0 is not needed

// Moveable, Stopable are interfaces, hence we should use keyword implements for them like below ->
//class Lorry extends Car implements Moveable, Stopable

class Lorry extends Car, Moveable, Stopable{ //

    public void move(){
        System.out.println("Car is moving");
    }

    public void stop(){
        System.out.println("Car is stop");
    }
    /*
    Because the class implements Moveable inteface and the class itself isn't abstract, we should override meyhod open().
        @Override
        void open() {
        }
     */
}
