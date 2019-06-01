import 'package:flutter/material.dart';

class IdeaPage extends StatefulWidget {
  final data;

  IdeaPage({this.data});

  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  _comment(name, date, desc, imageurl) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageurl),
              radius: 25,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(date)
                    ]))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(desc),
        )
      ]),
    );
  }

  _buildComment() {
    return Container(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Divider(),
        _comment(
            "Tim Apple",
            "31 May 2019",
            "This is such a great article! Well done! Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            "https://pbs.twimg.com/profile_images/1035649273721847809/B0f8n_oe_400x400.jpg"),
        _comment(
            "Rowan Lee",
            "30 May 2019",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            "https://upload.wikimedia.org/wikipedia/commons/a/a2/Rowan_Atkinson%2C_2011.jpg"),
        _comment(
            "Ren Zheng Fei",
            "30 May 2019",
            "Huawei!! Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            "http://www.ecns.cn/business/2016/05-13/U669P886T1D210304F12DT20160513091642.jpg"),
      ],
    ));
  }

  Widget _buildCommentTop() {
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

  _displayAuthor(author) {
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
                  Text(author)
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
        _displayAuthor(widget.data['author']),
        Divider(),
        _buildCommentTop(),
        _buildComment()
      ]),
    );
  }
}
