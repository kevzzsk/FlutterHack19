import 'package:flutter/material.dart';
import 'ideas.dart';
import 'settings.dart';
import 'myideas.dart';
import 'package:flutterhack19/route_gen.dart';
import 'bookmarks.dart';

void main() => runApp(MyApp());

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final drawerItems = [
      DrawerItem("Explore Ideas", Icons.lightbulb_outline),
      DrawerItem("My Bookmarks", Icons.bookmark),
      DrawerItem("My Ideas", Icons.book),
      DrawerItem("Settings", Icons.settings)
    ];
  MyHomePage({Key key, this.title}) : super(key: key);  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex=0;
  String _appBarTitle;

  _getDrawerItemWidget(int pos) {
    switch(pos) {
      case 0:
        return  Ideas();
      case 1:
        return Bookmarks();
      case 2:
        return MyIdeas();
      case 3:
        return Settings();
    }
  }
  _getAppBarTitle(int pos) {
    switch(pos) {
      case 0:
        return  Text("Explore");
      case 1:
        return Text("Bookmarks");
      case 2:
        return Text("My Ideas");
      case 3:
        return Text("Settings");
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex=index;
      });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    
    for (var i =0; i <widget.drawerItems.length; i++){
      var d = widget.drawerItems[i];
      drawerOptions.add(
        ListTile(
          leading: Icon(d.icon),
          title: Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () =>_onSelectItem(i)
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: _getAppBarTitle(_selectedDrawerIndex),

      ),
      drawer: Drawer(
        child:
          ListView(
            
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("alibaba@gmail.com"),
                accountName: Text("Alibaba"),
                
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage("https://image.cnbcfm.com/api/v1/image/104225995-_95A5004.jpg?v=1540458420&w=1400&h=950")
                ),             
              ),
              Column(children:drawerOptions)
            ]
          )
      ),
    
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
