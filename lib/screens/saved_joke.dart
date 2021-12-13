import 'package:flutter/material.dart';
import 'package:jokes/services/api_service.dart';

class saved extends StatefulWidget {
  @override
  _savedState createState() => _savedState();
}

List<jokeStructure> savedList = [];

class _savedState extends State<saved> {
  ApiService object = ApiService();

  @override
  void initState() {
    super.initState();

    object.savedJokes(savedList).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Saved jokes"),
        ),
        body: Column(
          children: [
            savedList.length == 0
                ? Container(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    height: 700,
                    child: ListView.builder(
                        itemCount: savedList.length,
                        itemBuilder: (ctx, i) {
                          int index = i + 1;

                          return Card(
                            color: Colors.amberAccent,
                            elevation: 2.3,
                            child: ListTile(
                              tileColor: Colors.transparent,
                              autofocus: true,
                              leading: Text("$index)"),
                              // tileColor: Colors.lightBlue,
                              subtitle: Text(savedList[i].category),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      object.deleteData(savedList[i].key);

                                      savedList.removeAt(i);
                                    });
                                  }),

                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                              title: Text(savedList[i].joke),
                            ),
                          );
                        }),
                  ),
          ],
        ));
  }
}
