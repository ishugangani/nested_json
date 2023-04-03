import 'package:flutter/material.dart';
import 'package:nested_json/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  HomeProvider? HPTrue,HPFalse;
  
  @override
  Widget build(BuildContext context) {
    
    HPTrue=Provider.of<HomeProvider>(context,listen: true);
    HPFalse=Provider.of<HomeProvider>(context,listen: false);
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Daily News",style: TextStyle(color: Color(0xffDA7F8F),),),
          centerTitle: true,
          backgroundColor: Color(0xffE1E5EA),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                HPTrue!.jsonParsing();
              },
              child: Text("News"),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: HPTrue!.newsModal!.articleList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Image.network("${HPTrue!.newsModal!.articleList![index].urlToImage}"),
                        Text(
                          "${HPTrue!.newsModal!.articleList![index].title}",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "${HPTrue!.newsModal!.articleList![index].author}",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
