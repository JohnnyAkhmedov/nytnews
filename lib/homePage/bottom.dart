import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nytnews/mainscreen%20components/main_comp.dart';

class ResData {
  static var res = results;
}

var results;

var url = Uri.parse(
    'https://api.nytimes.com/svc/news/v3/content/nyt/world.json?api-key=v9MGM6lBPhu9tYuPMGWfZvIILYEeSegD');

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Future getData() async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    setState(() {
      results = jsonData;
      ResData.res = jsonData;
      // for (var i = 0; i < ind; i++) {
      //   if (results['results'][i]['multimedia'] == null) {
      //     print(results['results'][i]['multimedia']);
      //     print(i);
      //   }
      // }
    });
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 50,
        color: Colors.white,
        child: TextButton(
            onPressed: getData,
            child: Text(
              'Read News >>',
              style: TextStyle(color: Colors.black),
            )));
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'New-York Times',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 30,
          backgroundColor: Colors.blueGrey.shade900,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.update,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Breaking News',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))),
              ),
              Container(
                  margin: EdgeInsets.only(right: 20, bottom: 10, left: 20),
                  child: Divider(
                    color: Colors.white54,
                  )),
              mainComponents(),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ));
  }
}
