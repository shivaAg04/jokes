import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:jokes/screens/saved_joke.dart';

import 'package:jokes/services/api_service.dart';
import 'package:swipedetector/swipedetector.dart';

class Home extends StatefulWidget {
  final String categoryName;
  Home(this.categoryName);

  @override
  _HomeState createState() => _HomeState(categoryName);
}

class _HomeState extends State<Home> {
  final String categoryName;
  _HomeState(this.categoryName);

  ApiService object = ApiService();

  List MainList = [];
  bool isSaved = false;

  @override
  void initState() {
    super.initState();

    object.getJokes(MainList, categoryName).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => saved()),
            );
          },
          child: SvgPicture.asset(
            'assets/save.svg',
            height: 25,
            color: Colors.black54,
          ),
        ),
        // backgroundColor: Colors.blue,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text("JOKES"),
          actions: [Icon(Icons.more_vert)],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                categoryName,
                style: TextStyle(fontSize: 40),
              ),
            ),
            MainList.length == 0
                ? Container(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : GestureDetector(
                    onVerticalDragUpdate: (dragUpdateDetails) {
                      object.getJokes(MainList, categoryName).then((value) {
                        setState(() {});
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 560,
                      child: ListView.builder(
                          itemCount: MainList.length,
                          itemBuilder: (ctx, i) {
                            int index = i + 1;

                            return Card(
                              color: Colors.amberAccent,
                              elevation: 2.3,
                              child: ListTile(
                                tileColor: Colors.transparent,
                                autofocus: true,
                                leading: Text("$index)"),
                                subtitle: Text(MainList[i]["category"],
                                    overflow: TextOverflow.visible),
                                trailing: IconButton(
                                  splashColor: Colors.black,
                                  icon: SvgPicture.asset(
                                    'assets/save.svg',
                                    height: 24,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () =>
                                      object.postJokes(MainList, i),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 16.0),
                                title: Text(MainList[i]["joke"]),
                              ),
                            );
                          }),
                    ),
                  ),

            SizedBox(
              height: 10,
            ),

            // ignore: deprecated_member_use
            RaisedButton.icon(
                onPressed: () {
                  object.getJokes(MainList, categoryName).then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.add),
                label: Text("more jokes")),

            SizedBox(
              height: 50,
            ),

            // ignore: deprecated_member_use
          ],
        ));
  }
}
