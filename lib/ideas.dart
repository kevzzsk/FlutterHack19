import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'json_load.dart';



class Ideas extends StatefulWidget {
  @override
  _IdeasState createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  var currentIndex = 0;
  final dummyString =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor mi vitae mauris viverra sollicitudin. In sit amet velit euismod, porttitor erat nec, malesuada augue. Cras maximus et nulla vel vehicula. Phasellus interdum leo vitae leo elementum maximus.";
  _buildTitle(title) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Text(title , style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),),
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
      alignment: Alignment.topLeft,
      height: 60,
      child: Text(
        desc,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildBottom(author,upvotes) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("Written by $author", style: TextStyle(color: Colors.grey[600]),),
            ),
            Text("$upvotes upvotes", style: TextStyle(color: Colors.grey[600]),)
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
          _buildBottom(data[curIndex]['author'],data[curIndex]['upvotes']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                                                snapshot.data[i]); // PASS DATA TO ROUTE GEN
                                      },
                                      child: Card(
                                        color: Colors.white,
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
          });
  }
}