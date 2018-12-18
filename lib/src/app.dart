// Begin: Version 03
/*
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
*/
// End: Version 03
//==============================================================
// Begin: Version 04
/*
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
*/
// End: Version 04
//==============================================================
// Begin: Version 05
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
// End: Version 05
//==============================================================
