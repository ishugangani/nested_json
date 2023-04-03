import 'package:flutter/material.dart';
import 'package:nested_json/screen/home/provider/home_provider.dart';
import 'package:nested_json/screen/home/view/home_screen.dart';
import 'package:nested_json/screen/news/view/news_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'news':(context) => NewsScreen(),
        },
      ),
    ),
  );
}
