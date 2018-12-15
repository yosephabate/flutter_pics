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
