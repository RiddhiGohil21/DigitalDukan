import 'dart:convert';

import 'package:flutter/services.dart';

class Itnames {
  String keyword;
  int id;
  String autocompleteterm;
  String country;

  Itnames({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.country
  });

  factory Itnames.fromJson(Map<String, dynamic> parsedJson) {
    return Itnames(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autocompleteterm: parsedJson['autocompleteTerm'] as String,
        country: parsedJson['country'] as String
    );
  }
}

class ItemsViewModel {
  static List<Itnames> itname;

  static Future loadItems() async {
    try {
      itname = new List<Itnames>();
      String jsonString = await rootBundle.loadString('assets/itemnames.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['itname'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        itname.add(new Itnames.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
