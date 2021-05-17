# Week 3 Object Oriented Programming

## What is a class
The class is like a template for the creation of objects 
## What is an object
An object is an instace of a class

## Defining a class

```dart

class Person{
    //You need to explicitly declare types because your are not initializing them
    String name;
    int age;
    double height;
}

//structure of a class
class class-name {
    // class variables
}

```

## Declaring a class

```dart

main(){
//Creating an instance of a class remember the open close brackets   
final person = Person();

//this will fail
print(person.name);

}

```

## Constructors in dart 

- Constructor using positional arguments

```dart

class Person{
    String name;
    int age;
    double height;

    //constructor name hass to be same as name of class
    Person(String name,int age,double height){
        this.age = age;
        this.name = name;
        this.height = height;

    }
    

}

//structure of a class
class class-name {
    // class variables
    //define constructor
    class-name(class-variables){
        // constructor logic
    }
}

```

- Constructor using named arguments

```dart

class Person{
    String name;
    int age;
    double height;

    //constructor
    Person({String name,int age,double height}){
        this.age = age;
        this.name = name;
        this.height = height;

    }
    

}

//structure of a class
class class-name {
    // class variables
    //define constructor
    class-name({class-variables}){
        // constructor logic
    }
}

//creating instance of a class with named arguments
main(){
//in this instance the class will take in named parameters
final person = Person(name: "oluwadare",age: 34,height: 90.0);

print(person.name);

}


```
- Contstructor using short form

```dart

class Person{
    String name;
    int age;
    double height;

    //constructor is shortened by putting class variables in curly braces dont forget the this
    Person({this.name,this.age,this.height});
    

}

//structure of a class
class class-name {
    // class variables
    //define constructor
    class-name({class-variables}){
        // constructor logic
    }
}

```

## Reassigning values to member variables

```dart

main(){
//in this instance the class will take in named parameters
final person = Person(name: "oluwadare",age: 34,height: 90.0);

print(person.name);

//reassign value to member variable
person.name = "Adaobi";

// output will be new value
print(person.name);

}


```

## Immutable Class

An immutable is a class where it's are object's that can't be changed after their created

```dart

class Person{
    final String name;
    final int age;
    final double height;

    //constructor is shortened by putting class variables in curly braces dont forget the this
    Person({this.name,this.age,this.height});
}

main(){
final person = Person(name: "oluwadare",age: 34,height: 90.0);

print(person.name);

//cannot reassign value to member variable because of final
person.name = "Adaobi";

print(person.name);

}

```

## Adding methods to class

A method defines the behavior of the objects that are created from a paticular class.


```dart

class Person{
    final String name;
    final int age;
    final double height;

    //constructor is shortened by putting class variables in curly braces dont forget the this
    Person({this.name,this.age,this.height});

    void sayName() {
        print("Hello my name is $name");
    }
    //functions can also take input
    void differenceBetweenAge(int theirAge) {
        final difference = age - theirAge;
        print("I am $difference years older than you");
    }
}

main(){
final person = Person(name: "oluwadare",age: 34,height: 90.0);

/*
when calling a method of an object write the object name
and a fullstop then the function name afterwards open & close
brackets
*/
person.sayName();
person.differenceBetweenAge(12);

}

```

Excercise 1

## Inheritance

Inheritance is the procedure in which one class inherits the attributes and methods of another class.


```dart

// After writing the class name write extends then the parent class name
class Employee extends Person{
    //Syntax remains the same for variables and constructors
    final String department;
    final int salary;

    Employee({this.department,this.salary});
}

class Person{
    final String name;
    final int age;
    final double height;

    //constructor is shortened by putting class variables in curly braces dont forget the this
    Person({this.name,this.age,this.height});

    void sayName() {
        print("Hello my name is $name");
    }
    void differenceBetweenAge(int theirAge) {
        final difference = age - theirAge;
        print("I am $difference years older than you");
    }
}

main(){
final employee = Employee(department: "sales",salary: 50000);

print(employee.name);

// can't work because class is immutable
employee.name = "John";
// if I remove final keyword it will work
}

```

## Super Constructor


```dart

// After writing the class name write extends then the parent class name
class Employee extends Person{
    //Syntax remains the same for variables and constructors
    final String department;
    final int salary;

//add the extra parameters/arguments to be passes up to parent class
    Employee({String name,int age,double height,this.department,this.salary})
//pass the extra paremeters to the parent class
: super(name: name,age: age,height: height);
    
}


main(){
final employee = Employee(department: "sales",salary: 50000,name: "emem");

// can access the name variable like a normal person object
print(employee.name);
  
// can also call the methods from person class
employee.sayName();
}

```

## Overide function 

Method overriding, in object-oriented programming, is a language feature that allows a subclass or child class to provide a specific implementation of a method that is already provided by one of its superclasses or parent classes.

```dart

// After writing the class name write extends then the parent class name
class Employee extends Person{
    //Syntax remains the same for variables and constructors
    final String department;
    final int salary;

//add the extra parameters/arguments to be passes up to parent class
    Employee({String name,int age,double height,this.department,this.salary})
//pass the extra paremeters to the parent class
: super(name: name,age: age,height: height);
  
//override the say name method
  void sayName(){
  print("my name is $name and I work in $department");
  }
    
}


main(){
final employee = Employee(department: "sales",salary: 50000,name: "emem");

// can access the name variable like a normal person object
print(employee.name);
  
// can also call the methods from person class
employee.sayName();
}

```

## Getters

A getter method is a method used for retreiving data from a class.

```dart

class Employee extends Person {
  String department;
  int yearlySalary;

//A getter method can be written as a fat arrow function
double get monthlySalary => yearlySalary / 12;

//A getter method can also be written in an expanded form
  double get monthlySalary {
    return yearlySalary / 12;
  }

  Employee({
    this.department,
    this.yearlySalary,
    String yourName,
    int yourAge,
    double yourHeight,
  }) : super(name: yourName, age: yourAge, height: yourHeight);

  void sayName() {
    super.sayName();
    // print("My name is $name and I earn $salary every year");
  }
}

main(){
//Creating an instance of a class remember the open close brackets   
final Employee employee1 = Employee();

//this will fail
print(employee1.monthlySalary);

}
```