import 'package:flutter/material.dart';
import 'package:nytnews/homePage/bottom.dart';

import 'text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 15, right: 10),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/road.jpg'), fit: BoxFit.fill)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Spacer(),
                      TextPlace(),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                            'Copyright (c) 2021 The New York Times Company.  All Rights Reserved.',
                            style: TextStyle(color: Colors.white60)),
                      ),
                      Row(
                        children: [Spacer(), BottomNav()],
                      )
                    ],
                  )),
            )));
  }
}
