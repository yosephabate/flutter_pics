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