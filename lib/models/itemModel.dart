import 'dart:convert';

import 'package:flutter/services.dart';

class ItemModel{
  int categoryId;
  String categories;
  int itemId;
  String englishName;
  String price;

  ItemModel({this.categoryId,
      this.categories,
      this.itemId,
      this.englishName,
      this.price});

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    return ItemModel(
    categoryId: parsedJson['categoryId'],
    categories: parsedJson['categories'] as String,
    itemId: parsedJson['itemId'],
    englishName: parsedJson['englishName'] as String,
    price: parsedJson['price'] as String
    );
  }
}
class ItemViewModel {
  static List<ItemModel> items;

  static Future loadItems() async {
    try {
      items = new List<ItemModel>();
      String jsonString = await rootBundle.loadString('assets/ItemDetails.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['itemDetails'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        items.add(new ItemModel.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}