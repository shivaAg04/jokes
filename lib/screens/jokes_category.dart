// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jokes/screens/home.dart';
import 'package:jokes/screens/saved_joke.dart';
import 'package:jokes/widget/category_tile.dart';

class JokesCategory extends StatelessWidget {
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

      // backgroundColor: Colors.yellowAccent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          '  Jokes C@tegory',
        ),
        actions: [Icon(Icons.more_vert)],
      ),

      body: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1.5, mainAxisSpacing: 1),
          itemBuilder: (context, i) {
            return CategoryTile(i);
          }),
    );
  }
}
