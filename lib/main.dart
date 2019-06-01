import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'route_gen.dart';
import 'json_load.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  final dummyString =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor mi vitae mauris viverra sollicitudin. In sit amet velit euismod, porttitor erat nec, malesuada augue. Cras maximus et nulla vel vehicula. Phasellus interdum leo vitae leo elementum maximus.";
  _buildTitle(title) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Text(title),
        ),
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {}, // ADD BOOKMARK  BUTTON
        )
      ],
    );
  }

  _buildDesc(String desc) {
    return Container(
      height: 60,
      child: Text(
        desc,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildBottom(author) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(author),
            ),
            Text("15 upvotes")
          ],
        ));
  }

  Widget _buildInfo(int curIndex, data) {
    return Container(
      height: 200,
      decoration: new BoxDecoration(
          border: Border(
              top: BorderSide(
        style: BorderStyle.solid,
      ))),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        children: <Widget>[
          _buildTitle(data[curIndex]['title']),
          _buildDesc(data[curIndex]['description']),
          _buildBottom(data[curIndex]['author']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("PowerPuff Boys"),
      ),
      body: FutureBuilder(
          future: JSONload.loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CarouselSlider(
                          height: 400,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          items: [0, 1, 2].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                // use snapshot.data
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 10),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigate to new page
                                        Navigator.pushNamed(context, '/idea',
                                            arguments:
                                                dummyString); // PASS DATA TO ROUTE GEN
                                      },
                                      child: Card(
                                        color: Colors.blue,
                                        child: Image.network(
                                            snapshot.data[i]['imageURL']),
                                      ),
                                    ));
                              },
                            );
                          }).toList()),
                    ),
                  ),
                  _buildInfo(currentIndex, snapshot.data),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
