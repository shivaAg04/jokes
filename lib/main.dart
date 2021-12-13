// import  'dart:html';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:jokes/screens/jokes_category.dart';
import './screens/jokes_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jokes ',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: AnimatedSplashScreen(
          duration: 300,
          splash: Icons.emoji_emotions,
          nextScreen: JokesCategory(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.yellow),
    );
  }
}




// body: ListView.builder(
//           itemCount: 4,
//           itemBuilder: (context, int i) {
//             return Card(

//               elevation: 7,
//               child: ListTile(
                
//                 leading: CircleAvatar(
//                   child: SvgPicture.asset(
//                     iconList[i],
//                     height: 20,
//                   ),
//                 ),
//                 title: Text(jokesCategory[i]),
//                 subtitle: Text(subTitleList[i]),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Home()),
//                   );
//                 },
//               ),
//             );
//           },
//         )
