# Asynchronous Functions / Futures

### The basic structure of an asynchronous function is as follows

```dart

Future<return-type> function-name(function-arguments) async {
    // Blocks of code
    //If there is any data to be returned, it will be written at the end.
}

```
**Async functions with nothing being returned**
```dart

Future<void> sayHello() async {
// Just to simulate a delay
  await Future.delayed(const Duration(seconds: 3));
//What to do after the delay
  print("hello");
}

```
**Async functions with something returned**
```dart

Future<String> getName() async {
// Just to simulate a delay
  await Future.delayed(const Duration(seconds: 3));
//What to do after the delay
  return "Emem";
}

```