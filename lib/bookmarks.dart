import 'package:flutter/material.dart';
import 'json_load.dart';
import 'dart:async';
import 'dart:convert';

class Bookmarks extends StatelessWidget {
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: JSONload.loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return Card(
                      color: Colors.white,
                      child: Row(
                        
                        children: <Widget>[
                         Container(
                          
                          height:250,
                            padding: const EdgeInsets.all(0.5),
                            alignment: Alignment.topLeft,
                            child: Image.network(snapshot.data[position]['imageURL'])),

                        Expanded(
                            child: Container(
                              height: 250,
                            alignment: Alignment.topLeft,
                            child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[                                   
                                    Expanded(                                      
                                      child: Text("Author: "+ snapshot.data[position]['author'],
                                      style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,),
                                      textAlign: TextAlign.left,
                                      maxLines: 5,
                                  ),
                                    ),
                                    Text("upvotes: "+ (snapshot.data[position]['upvotes']).toString())],),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0,30.0,8.0,15.0),
                                    child: Text(                                     
                                      snapshot.data[position]['description'],
                                      style: TextStyle(fontSize:20,fontWeight: FontWeight.bold), 
                                                                   
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                    ),
                                  ),

                                ],
                              ) 
                        
                        ))
                      ]));
                },
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
