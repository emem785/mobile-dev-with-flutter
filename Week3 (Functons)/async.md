# Asynchronous Functions / Futures

### The basic structure of an asynchronous function is as follows


```dart

Future<return-type> function-name(function-arguments) async {
    // Blocks of code
    //If there is any data to be returned, it will be written at the end.
}

```
**Async functions with nothing being returned**
In this scenario the return type is `void` because nothing is returned
```dart

Future<void> sayHello() async {
// Just to simulate a delay
  await Future.delayed(const Duration(seconds: 3));
//What to do after the delay
  print("hello");
}

```
**Async functions with something returned**
In this scenario the return type is of type `String` because the string `Emem` is being returned
```dart

Future<String> getName() async {
// Just to simulate a delay
  await Future.delayed(const Duration(seconds: 3));
//What to do after the delay
  return "Emem";
}

```
![Future visualized](https://ericwindmill.com/static/fff57d4bd69c56f5e1507db4ad0920b9/2b820/future_comic.png)