// Begin: Version 01
/*
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
*/
// End: Version 01
//==============================================================
// Begin: Version 02
/*
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
*/
// End: Version 02
//==============================================================
// Begin: Version 03
import 'package:flutter/material.dart';
import 'src/app.dart';

void main(List<String> args) {
  var app = App();

  runApp(app);
}
// End: Version 03
//==============================================================
