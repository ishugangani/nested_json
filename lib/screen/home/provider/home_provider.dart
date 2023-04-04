import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested_json/screen/home/modal/home_modal.dart';

class HomeProvider extends ChangeNotifier
{
  int index=0;
  NewsModal? newsModal;

  void jsonParsing() async
  {
    String jsonString = await rootBundle.loadString("assets/json/news.json");
    var newsJson = jsonDecode(jsonString);
    newsModal=NewsModal().newsJson(newsJson);
    notifyListeners();
  }

  void indChange(int ind)
  {
    index=ind;
    notifyListeners();
  }
}