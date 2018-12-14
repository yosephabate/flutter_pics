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
<p>The following code snippet</p>