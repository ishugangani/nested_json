import 'package:flutter/material.dart';
import 'package:nested_json/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  HomeProvider? HPTrue, HPFalse;

  @override
  Widget build(BuildContext context) {
    HPTrue = Provider.of<HomeProvider>(context, listen: true);
    HPFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Daily News",
            style: TextStyle(
              color: Color(0xffDA7F8F),
              letterSpacing: 5,
              wordSpacing: 5,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffE1E5EA),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "${HPTrue!.newsModal!.articleList![HPTrue!.index].urlToImage}",
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${HPTrue!.newsModal!.articleList![HPTrue!.index].source!.name}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.newsModal!.articleList![HPTrue!.index].title}",
                        style: TextStyle(fontSize: 20,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.newsModal!.articleList![HPTrue!.index].description}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffA7BBC7),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.newsModal!.articleList![HPTrue!.index].publishedAt} | ${HPTrue!.newsModal!.articleList![HPTrue!.index].author}",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xffE1E5EA),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.newsModal!.articleList![HPTrue!.index].content}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
