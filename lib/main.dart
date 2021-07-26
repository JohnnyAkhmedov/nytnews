import 'package:flutter/material.dart';

import 'homePage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey.shade900),
      debugShowCheckedModeBanner: false,
      title: 'nytnews',
      home: HomePage(),
    );
  }
}
