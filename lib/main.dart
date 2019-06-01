import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {

  final title = new Row(
    children: <Widget>[
      Expanded(
        child: Text("Title"),
      ),
      IconButton(
        icon: Icon(Icons.bookmark),
        onPressed: (){}, // ADD BOOKMARK  BUTTON
      )
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("PowerPuff Boys"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CarouselSlider(
              height: 400,
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList()),
          Container(
            child: Column(
              children: <Widget>[
                title,
                //desc,
                //bottom,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
