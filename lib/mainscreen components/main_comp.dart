import 'package:flutter/material.dart';
import 'package:nytnews/homePage/bottom.dart';
// ignore: unused_import
import 'package:nytnews/mainscreen%20components/recomendation/recomendations_list.dart';

var a = ResData.res;
Widget mainComponents() {
  return FutureBuilder(builder: (context, projectSnap) {
    if (projectSnap.connectionState == ConnectionState.none &&
        // ignore: unnecessary_null_comparison
        projectSnap.hasData == null) {
      //print('project snapshot data is: ${projectSnap.data}');
      return CircularProgressIndicator();
    }

    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, bottom: 20),
      height: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataDetails(i: index)));
                },
                child: Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage((a['results'][index]
                                      ['multimedia'] !=
                                  null
                              ? a['results'][index]['multimedia'][2]['url']
                                  .toString()
                              : 'https://cdn.pixabay.com/photo/2015/05/13/14/34/cube-765526_960_720.jpg')),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber,
                    ),
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 300),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black38,
                              ),
                              padding: EdgeInsets.all(30),
                              child: Column(children: [
                                Text(
                                  a['results'][index]['title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(a['results'][index]['abstract'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white60,
                                    ))
                              ]))
                        ],
                      ),
                    )),
              )),
    );
  });
}

class DataDetails extends StatelessWidget {
  final int i;

  const DataDetails({Key? key, required this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image(
            image: NetworkImage(a['results'][i]['multimedia'] != null
                ? a['results'][i]['multimedia'][2]['url'].toString()
                : 'https://cdn.pixabay.com/photo/2015/05/13/14/34/cube-765526_960_720.jpg')),
        Align(
            alignment: Alignment.bottomCenter,
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 620,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  Text(
                    a['results'][i]['title'],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    a['results'][i]['abstract'] != null
                        ? a['results'][i]['abstract']
                        : Text('No Data'),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(children: [
                    SizedBox(
                      width: size.width * 0.65,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Read more >>'),
                      ),
                    )
                  ]),
                  // RecomendList(ind: i)
                ]),
              ),
            ))
      ]),
    );
  }
}
