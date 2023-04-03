import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested_json/screen/home/modal/home_modal.dart';

class HomeProvider extends ChangeNotifier
{
  List<dynamic> ArticleList=[];

  void jsonParsing() async
  {
    String jsonString = await rootBundle.loadString("assets/json/news.json");
    var newsJson = jsonDecode(jsonString);

    List<dynamic> modalList = newsJson.map((e)=>Articles().articleJson(e)).toList();
    ArticleList=modalList;
    notifyListeners();
  }
}