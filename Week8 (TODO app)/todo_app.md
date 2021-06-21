
# TODO App Completion


## Clean up uneccesary code 

The first step to take is to delete unesecary codes like the onstart function, also remember to delete it from the initstate block

```dart

  _onStart() async {
    final prefs = await SharedPreferences.getInstance();
    final todoMap = prefs.getString("todo");
    print(todoMap);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onStart();
  }

```

## Cache a list of todo's

In the previous code the caching logic was handling the caching of just one todo, in order to refactor it, some changes will have to be made.

1. Change the function from *prefs.getString* to *prefs.getStringList* because now we will be working with lists
2. Use a spread operator ("...") combined with a null check spread operator ("...?") to create a new list. This list will be comprised of the previously cached list (if it's not null) and the new todo. 
3. The last step will be cache the newly created list   

> For more information you can visit the links below
>
> - [Spread Operator](https://www.woolha.com/tutorials/dart-using-triple-dot-spread-operator-examples)      

```dart

  Future<void> saveData(TODO todo) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStrList = prefs.getStringList("todo");
    final newList = [...?todoStrList,jsonEncode(todo.toMap())];
    prefs.setStringList("todo",newList);

  }

```

## Navigate with Push Replacement  

In order to store the todo's and make sure that they are retreived on the *HomeScreen* page. From the floating action button's on pressed function, you will have to :-  
1. Call the save data function with the current textformfield data
2. Navigate to the *HomeScreen* page with the *Navigator.pushReplacement* function this will cause the **initState** function in the *HomeScreen* to be called  

> For more information you can visit the links below
>
> - [stateful widget Lifecycle](https://www.youtube.com/watch?v=pDzQGolJayE)  

```dart

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveData(TODO(
            date: _date.text,
            title: _title.text,
            desc: _desc.text,
          ));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.check,
          color: Color(0xFF21BE57),
          size: 32.0,
        ),
      ),

```

## Revert Changes to material App

Remember to change the *home* argument of the materialApp to *Homescreen()* so the app starts from the homescreen page 

```dart

  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
        textTheme: TextTheme(
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.white))),
    debugShowCheckedModeBanner: false,
  ));

```
## Create named constructor for empty todo  
In order to help make our code cleaner we will be utilizing a named constructor. This will allow us call an empty todo without having to write out every field e.g TODO(title: "", desc: "", date: "");  

> For more information you can visit the links below
>
> - [Constructors in dart](https://www.freecodecamp.org/news/constructors-in-dart/)
> - [video link "ignore the new keyword"](https://www.youtube.com/watch?v=k2R_HwZzogQ)  


```dart

  TODO.empty()
      : title = "",
        desc = "",
        date = "";

```
## Create an empty list

An instance of an empty list of type **TODO** will be created. This is the list that will be utilized by the *ListViewBuilder*. 

```dart

class _HomeScreenState extends State<HomeScreen> {
  //Every color in flutter starts with the value 0xFF then place the hex code afterwards
  Color backgroundColor = Color(0xFF1B87A9);
  List<TODO> todos = [];

```

## Extract list of todo's from cache

The *ListViewBuilder* only accepts todo objects so it's neccesary to convert the cached todo's to **TODO** objects. In order to do this for every item in the list  you will have to :-  
1. Decode each item to turn it into a map from a string.
2. Create a todo from the map.
3. Put all this data into a new list.  

> For more information you can visit the links below
>
> - [list map method](https://www.youtube.com/watch?v=6xWVWDvmqeU)
>
> - [json Serialization](https://flutter.dev/docs/development/data-and-backend/json)  

```dart

  Future<List<TODO>> _getCachedTodo() async {
    final prefs = await SharedPreferences.getInstance();
    final todoStr = prefs.getStringList("todo");
    return todoStr != null
        ? List.from(todoStr).map((e) => TODO.fromMap(jsonDecode(e))).toList()
        : [TODO.empty()];
  }

 ```

## Populate todo's list  

The next step is to take the now transformed list we got from the cache and assign it to the todo's list we instanciated earlier on. 

 ```dart

  Future<void> startUp() async {
    final cachedTodos = await _getCachedTodo();
    setState(() {
      todos = [if (cachedTodos.isNotEmpty) TODO.empty(), ...?cachedTodos];
    });
  }

```

## Calling from initState

The function that was just created will be run in the **initState** method. This ensures that the function is called right before the widget is rendered to the screen.  

> For more information you can visit the links below
>
> - [stateful widget Lifecycle](https://www.youtube.com/watch?v=pDzQGolJayE)  

```dart

  @override
  initState() {
    startUp();
    super.initState();
  }

```

## Remove todo from cache  
We will need a mechanism to remove the todo frome the local storage or cache. The method below solves this problem by:-
1. Getting the cached list 
2. Deleting the todo at a specified index.
3. Storing the newly modified list.  


```dart

  _unCache(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStr = prefs.getStringList("todo");
    todoStr.removeAt(index - 1);
    prefs.setStringList("todo", todoStr);
    
  }

```

## Creating the list view Builder

The very last step, which is the longest and also the most important, is to create the **ListViewBuilder**. To acheive this, several steps will have to be taken including:-

1. Creating the listview builder
2. Creating the seperator builder
3. Changing the rendering logic of the seperator
4. Wrapping our elements with a dissmisable Widget in order to remove items


> For more information you can visit the links below
>
> - [listview builder](https://flutter.dev/docs/cookbook/lists/long-lists)
>
> - [seperated listview builder](https://medium.com/flutter-community/flutter-adding-separator-in-listview-c501fe568c76)
>
> - [dissmisable widget](https://flutter.dev/docs/cookbook/gestures/dismissible)
> - [video link](https://www.youtube.com/watch?v=iEMgjrfuc58)


```dart

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              var todo = todos[index];
              return index != 0
                  ? Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          todos.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${todo.title} removed")));
                        });
                        _unCache(index);
                      },
                      key: Key(todo.title),
                      background: Container(color: backgroundColor),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(todo.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                          subtitle: Text(todo.desc),
                        ),
                        color: Colors.white,
                      ),
                    )
                  : SizedBox();
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(todos[index + 1].date,
                    style: TextStyle(color: Colors.white)),
              );
            },
          ),

```

