import 'package:flutter/material.dart';
import 'package:nested_json/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    HPTrue!.jsonParsing();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xffDA7F8F)),
                  ),
                  child: Text(
                    "News",
                    style: TextStyle(
                      color: Color(0xffE1E5EA),
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: HPTrue!.newsModal != null
                ? ListView.builder(
                    itemCount: HPTrue!.newsModal!.articleList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'news');
                            HPFalse!.indChange(index);
                          },
                          child: ListTile(
                            leading: Image.network(
                              "${HPTrue!.newsModal!.articleList![index].urlToImage}",
                              fit: BoxFit.contain, height: 50,width: 100,
                            ),
                            title: Text("${HPTrue!.newsModal!.articleList![index].title}",),
                            subtitle: Text("${HPTrue!.newsModal!.articleList![index].author}",),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
