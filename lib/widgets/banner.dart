import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BannerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
                 stream: FirebaseFirestore.instance
                      .collection('Banner').orderBy('name')
                      .snapshots(),
                builder: (context, snapshot) {
                  
                  if (snapshot.hasData) {
                     var docs = snapshot.data!.docs;
                    //   // return Text(snapshot.data.);
                    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(color: Colors.black, image: DecorationImage(image: NetworkImage(docs[0]['poster']), fit: BoxFit.cover)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                Colors.black.withOpacity(0.0),
                Colors.black
              ])),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(docs[0]['title'], width: 250),
              SizedBox(
                height: 15,
              ),
              Text(docs[0]['genre'], style: TextStyle(fontSize: 15, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 32),
                    SizedBox(height: 10),
                    Text('My List', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13, left: 8, top: 2, bottom: 2),
                    child: Row(children: [
                      Icon(Icons.play_arrow, color: Colors.black, size: 30),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Play', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.info_outline, color: Colors.white, size: 32),
                    SizedBox(height: 10),
                    Text('Info', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white))
                  ],
                )
              ])
            ],
          ),
        ),
      ],
    );
  }else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Container( height: MediaQuery.of(context).size.height / 1.4,color: Colors.black12 ,);
}

);}}
