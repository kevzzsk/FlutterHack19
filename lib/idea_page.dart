import 'package:flutter/material.dart';

class IdeaPage extends StatefulWidget {
  final data;

  IdeaPage({this.data});

  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  _buildComment() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
          );
        },
      ),
    );
  }

  Padding _buildCommentTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Comment",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          new Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/elon_musk.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a comment...'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _displayAuthor() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/elon_musk.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "WRITTEN BY",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("AUTHOR NAME")
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text("Follow"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(widget.data), // DISPLAY RAW STRING
        ),
        Divider(),
        _displayAuthor(),
        Divider(),
        _buildComment()
      ]),
    );
  }
}
