# flutter_pics

<h1>Version 01</h1>
<p>The following code snippet creates a MaterialApp widget and displays it on the mobile phone.</p>

<h2>main.dart</h2>

<pre>
// I need to import a helper library
//  from flutter to get content on the screen
import 'package:flutter/material.dart';

// Define a 'main' function to run when our app starts
void main(List<String> args) {
  // Create a new text widget to show some text
  //  on the screen
  var app = MaterialApp(
    home: Text('Hi there'),
  );

  // Take that widget and get it on the screen
  runApp(app);
}
</pre>
<hr>

<h1>Version 02</h1>
<p>The following code snippet shows how to create AppBar and FloatingActionButton on the mobile phone.</p>

<h2>main.dart</h2>

<pre>
import 'package:flutter/material.dart';

void main(List<String> args) {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Let\' see some images!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hi there!');
        },
      ),
    ),
  );

  runApp(app);
}
</pre>
<hr>

<h1>Version 03</h1>
<p>The following code snippet shows how to modularize the MaterialApp widget in another class.</p>

<h2>main.dart</h2>

<pre>
import 'package:flutter/material.dart';
import 'src/app.dart';

void main(List<String> args) {
  var app = App();

  runApp(app);
}
</pre>

<h2>app.dart</h2>

<pre>
// Import flutter helper library
import 'package:flutter/material.dart';

// Create a class that will be our custom widget
// This class must extend the 'StatelessWidget' base class
class App extends StatelessWidget {
  // We must define a 'build' method that returns
  //  the widgets   that *this* widget will show
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\' see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Hi there!');
          },
        ),
      ),
    );
  }
}
</pre>
<hr>

<h1>Version 04</h1>
<p>The following code snippet shows how to create a StatefulWidget in Flutter.</p>

<h2>main.dart</h2>

<pre>
import 'package:flutter/material.dart';
import 'src/app.dart';

void main(List<String> args) {
  runApp(App());
}
</pre>

<h2>app.dart</h2>

<pre>
import 'package:flutter/material.dart';

// Create a StatefulWidget
class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

// Change the previous App class to AppState
//  that extends from State<App>
class AppState extends State<App> {
  int counter = 0;

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\' see some images!'),
        ),
        body: Text('${counter}'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ),
      ),
    );
  }
}
</pre>
<hr>

<h1>Handle JSON</h1>
<p>The following code snippet shows how encode a JSON object into a model which can be used in another app.</p>

<pre>
import 'dart:convert';

void main() {
  var rawJSON = '{"url": "http://blah.jpg", "id": 1}';
  
  var parsedJSON = json.decode(rawJSON);
  //var imageModel = ImageModel(
  //  parsedJSON['id'], 
  //  parsedJSON['url']
  //);

  var imageModel = ImageModel.fromJSON(parsedJSON);
  print(imageModel.id);
}

class ImageModel {
  int id;
  String url;
  
  ImageModel(this.id, this.url);
  
  ImageModel.fromJSON(parsedJSON) {
    id = parsedJSON['id'];
    url = parsedJSON['url'];
  }
}
</pre>
<hr>

<h1>Async Process</h1>
<p>The following code snippet shows to execute a time taking process which usually returns a Future object.</p>

<h2>Option 1</h2>

<pre>
import 'dart:async';

main() {
  print('About to fetch data...');
  
  get('http://mockupurl')
    .then((result) {
      print(result);
    });
}

Future<String> get(String url) {
  return new Future.delayed(
  	new Duration(seconds: 3), () {
      return 'Got the data!';
    }
  );
}
</pre>

<h2>Option 2</h2>

<pre>
import 'dart:async';

main() async {
  print('About to fetch data...');
  
  /*get('http://mockupurl')
    .then((result) {
      print(result);
    });*/
  var result = await get('http://mockupurl');
  
  print(result);
}

Future<String> get(String url) {
  return new Future.delayed(
  	new Duration(seconds: 3), () {
      return 'Got the data!';
    }
  );
}
</pre>
<hr>

<h1>Version 05</h1>
<p>The following code snippet shows a complete program which displays a fake picture from a website - teaches how to make an HTTP call, JSON manipulation and Modeling.</p>

<h2>main.dart</h2>

<pre>
import 'package:flutter/material.dart';
import 'src/app.dart';

void main(List<String> args) {
  runApp(App());
}
</pre>

<h2>app.dart</h2>

<pre>
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

// Create a StatefulWidget
class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

// Change the previous App class to AppState
//  that extends from State<App>
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    // Make an HTTP request
    var response =
        await get('http://jsonplaceholder.typicode.com/photos/${counter}');

    var imageModel = ImageModel.fromJSON(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\' see some images!'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
</pre>

<h2>image_model.dart</h2>

<pre>
class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.title, this.url);

  //ImageModel.fromJSON(Map<String, dynamic> parsedJSON) {
  //  id = parsedJSON['id'];
  //  url = parsedJSON['url'];
  //  title = parsedJSON['title'];
  //}

  ImageModel.fromJSON(Map<String, dynamic> parsedJSON) 
    : id = parsedJSON['id'],
      url = parsedJSON['url'],
      title = parsedJSON['title'];
  
}
</pre>

<h2>image_list.dart</h2>

<pre>
import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(
              bottom: 8.0,
            ),
          ),
          Text(image.title),
        ],
      ),
    );
  }
}
</pre>
<hr>