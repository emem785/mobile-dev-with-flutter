# Lesson Guide (News App)

## Add api key to enviroment variables 

```
API_KEY=3008be7ee00a4950a012e35b047e0ece

```
1. Create a *.env* file in the root of your project folder

2. add your api key to the *.env* file 

```dart
Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(),
    ),
  );
}
```
3. In the *main.dart* file convert the main function to an async function 

4. call the dot env load function and pass the *.env* file as an argument

## Create getter for urlString

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
```
1. Remember to import the dotenv package

```dart
  String get urlString {
    final apiKey = dotenv.env["API_KEY"].toString();
    final urlString =
        "https://newsapi.org/v2/everything?q=google&from=2021-06-24&sortBy=popularity&apiKey=$apiKey";
    return urlString;
  }
```
2. Create a getter function that gets the value you put in the dotenv file 

3. Use string concatenation to add the api key to the url and return that value 

```dart
    const urlString = 
        "https://newsapi.org/v2/everything?q=google&from=2021-06-24&sortBy=popularity&apiKey=Apikey";
```
4. Remember to delete the previous const  **urlString** set at the top of the file

> For more information you can visit the links below
>
> - [Getter functions](https://dev.to/newtonmunene_yg/dart-getters-and-setters-1c8f)
>


## Create News Page widget 

```dart
class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(),
    );
  }
}

```
1. Create a new stateless widget called **NewsPage** 

2. Add Scaffold widget

3. Add An **AppBar** widget 

4. In the **AppBar** add a **Text** widget as the title argument which has it's text styled with a black color 

5. For the body you can temprarily use an empty container

```dart
Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    ),
  );
}


```
6. Add the **NewsPage** widget as the home argument of the Material App widget 

## Create Display News widget 

```dart
class DisplayNews extends StatefulWidget {
  const DisplayNews({Key key}) : super(key: key);

  @override
  _DisplayNewsState createState() => _DisplayNewsState();
}

class _DisplayNewsState extends State<DisplayNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: apiService.getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article article = articles[index];
                return Text(article.title);
              },
            );
          }

          if (snapshot.hasError) {
            return Text(snapshot.error);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
```

1. Create a new stateful widget called **DisplayNews** 

2. Add Center widget

3. Add a **FutureBuilder** widget

4. Check if the snapshot has data using an if statement

5. If the snapshot has data assign that data to a variable called **articles** of type **List<Article>**

6. Return a ListViewBuilder with the *articles.length* assigned to the itemCont argument

7. For the item builder argument create a new article by using the index provided by the ListViewBuilder to access the item at that particular index in the articles list

8. Afterwards return A **Text** widget with the article's title

9. If the snapshot has an error return a text widget with the error

10. Return a CircularProgressIndicator if there is no data or error

```dart
class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: DisplayNews(),
    );
  }
}
```
11. Add the DisplayNews widget to the NewsPage

> For more information you can visit the links below
>
> - [FutureBuilder](https://medium.com/nonstopio/flutter-future-builder-with-list-view-builder-d7212314e8c9)
>

## Create news tile widget

```dart
class NewsTile extends StatelessWidget {
  final Article article;
  NewsTile({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 8.0),
          _buildSource(article),
          SizedBox(height: 8.0),
          Text(
            article.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _buildSource(Article article) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        article.source.name,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
```
1. For the NewsTile widget return a Column 

2. Wrap the NewsTile with a Padding widget and set the padding to 8.0 on all sides

3. In the Column change the Cross Axis Alignment to **CrossAxisAlignment.start**

4. Create A function that builds a Container & edit the boxdecoration to change the design of the container

5. Add A text widget that has the Article source's name

6. Sandwich the the function between to sizedbox's with a height of 8

7. Add Article to widget throught the constructor.

```dart

  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: apiService.getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article article = articles[index];
                return NewsTile(article: article);
              },
            );
          }

          if (snapshot.hasError) {
            return Text(snapshot.error);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
```
8. Replace the Text widget with List Tile widget

