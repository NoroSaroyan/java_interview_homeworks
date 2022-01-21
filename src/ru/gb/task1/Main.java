package ru.gb.task1;

public class Main {

    public static void main(String[] args) {

        Person person = new Person.Builder()
                .addFirstName("Bukayo")
                .addLastName("Saka")
                .addMiddleName("IDK")
                .addCountry("England")
                .addAddress("London")
                .addPhone("493928395")
                .addAge(20)
                .addGender("m")
                .build();
        System.out.println(person.toString());
    }
}

