import 'package:flutter/material.dart';
import 'package:get_it_package_demo/domain/meme_controller.dart';
import 'package:get_it_package_demo/domain/models/meme.dart';

import '../locator.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  //Meme visibleMeme = Meme(1, 'https://i.some-random-api.ml/pAQ82dVaNi.png',
  //  'What the flip is the paint?', 'superhero');
  var visibleMeme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: visibleMeme != null
            ? Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Category ${visibleMeme.category}",
                          style: TextStyle(fontSize: 36),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(visibleMeme.imageUrl),
                        ),
                        SizedBox(height: 8),
                        Text("Caption: ${visibleMeme.caption}"),
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "No Meme loaded yet, Click on the button to load meme",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.skip_next,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        onPressed: () async {
          Meme meme = await getIt.get<MemeDomainController>().getNextMeme();

          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}
