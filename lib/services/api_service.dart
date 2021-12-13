import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jokes/services/firebass_url.dart';

ApiService object = ApiService();
Firebass firebs = Firebass();

class jokeStructure {
  String key;
  String joke;
  String category;

  jokeStructure(this.key, this.joke, this.category);
}

class ApiService {
  final jokesUrl = "https://v2.jokeapi.dev/joke/";
  final firebasUrl = "https://jokes-66b4d-default-rtdb.firebaseio.com/.json";
  final lastUrl = "?type=single&amount=10";

  Future<void> getJokes(List list, List<bool> boolList, String catName) async {
    try {
      var response = await get(Uri.parse(jokesUrl + catName + lastUrl));

      list.addAll(jsonDecode(response.body)["jokes"]);
      boolList.addAll(List.filled(10, false));
    } catch (e) {
      print('no jokes');
      // return mainList;
    }
  }

  Future postJokes(List list, int i) async {
    try {
      var response = await post(
        Uri.parse(
          firebs.firebasUrl,
        ),
        body: json.encode({
          'joke': list[i]['joke'],
          'category': list[i]['category'],
          'id': list[i]['id'],
          'save': false,
        }),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<void> savedJokes(List list) async {
    try {
      var response = await get(Uri.parse(firebs.firebasUrl));
      final extractedData = (jsonDecode(response.body)) as Map<String, dynamic>;
      extractedData.forEach((key, jokesData) {
        list.add(jokeStructure(
          key,
          jokesData['joke'],
          jokesData['category'],
        ));
      });

      print(list);
    } catch (e) {
      // return mainList;
    }
  }

  Future deleteData(String key) async {
    // final url = "https://jokes-66b4d-default-rtdb.firebaseio.com/$key.json";
    final url = firebs.firebasUrl + key + ".json";
    // final firebasUrl = "https://jokes-66b4d-default-rtdb.firebaseio.com/.json";
    try {
      final res = await delete(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }
}
