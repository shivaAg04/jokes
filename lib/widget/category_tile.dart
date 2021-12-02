// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jokes/screens/home.dart';

List<String> categoryImage = [
  'assets/programmingPic.png',
  'assets/dark.png',
  'assets/punPic.png',
  'assets/mixPic.jpg',
];

List<String> jokesCategoryTitle = [
  'Programming',
  'Dark',
  'Pun',
  'Misc',
];
List<String> iconList = [
  'assets/mix.svg'
      'assets/mix.svg'
      'assets/mix.svg'
      'assets/mix.svg'
];
List<String> subTitleList = [
  'for comders peopmle...',
  'for dangerous people...',
  'for pun sorry for fun...',
  'diversity is the winner...'
];

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  int i;
  CategoryTile(this.i);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Image.asset(
          categoryImage[i],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(jokesCategoryTitle[i])),
          );
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          jokesCategoryTitle[i],
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subTitleList[i],
        ),
      ),
    );
  }
}
