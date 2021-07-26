import 'package:flutter/material.dart';
import 'package:nytnews/homePage/bottom.dart';

var a = ResData.res;
var b;

class RecomendList extends StatelessWidget {
  final ind;
  static var recL;
  RecomendList({required this.ind});
  void reclist() {
    b = a['results'][ind]["geo_facet"];
    if (b == null) {
      print('no data');
    } else {
      for (var i = 0; i < 19; i++) {
        if (a['results'][i]['geo_facet'] == null) {
          print('data is null');
        } else {
          if (a['results'][i]['geo_facet'].contains(b[0])) {
            print(i);
          } else {
            print('...');
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: reclist, child: Text('tap'));
  }
}
