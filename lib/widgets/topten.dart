import 'package:demo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/loading.dart';
import 'package:demo/screens/details.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/painting.dart';

class TopTen extends StatelessWidget {
  final Future<List<Post>> post = fetchPost();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top 10 Movies in India Today',
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<Post>>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //   // return Text(snapshot.data.);
                    return ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 10),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) => Column(
                          // padding: const EdgeInsets.all(4),

                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(),
                                        settings: RouteSettings(arguments: [
                                          snapshot.data![i].name,
                                          snapshot.data![i].poster,
                                          snapshot.data![i].year,
                                          snapshot.data![i].seasons,
                                          snapshot.data![i].genre,
                                          snapshot.data![i].trailer,
                                          snapshot.data![i].plot
                                        ])));
                              },
                              child: Stack(children: [
                                Container(
                                    height: 150,
                                    width: 140,
                                    decoration: BoxDecoration(
                                       color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                          snapshot.data![i].poster,
                                        )))),
                                Positioned(top: 36, right: 80, child: BorderedText(strokeWidth: 5, strokeColor: Colors.white, child: Text('${i + 1}', style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none))))
                              ]),
                            ),
                            Flexible(
                              child: SizedBox(
                                  height: 150,
                                  width: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      snapshot.data![i].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ]),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Loading();
                }),
          )
        ],
      ),
    );
  }
}
