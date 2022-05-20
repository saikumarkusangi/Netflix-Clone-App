import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/loading.dart';
import 'package:demo/screens/details.dart';

class Popular extends StatelessWidget {
  final Future<List<Post>> post = fetchPost();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular',
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
                                          snapshot.data![snapshot.data!.length - i - 1].name,
                                          snapshot.data![snapshot.data!.length - i - 1].poster,
                                          snapshot.data![snapshot.data!.length - i - 1].year,
                                          snapshot.data![snapshot.data!.length - i - 1].seasons,
                                          snapshot.data![snapshot.data!.length - i - 1].genre,
                                          snapshot.data![snapshot.data!.length - i - 1].trailer,
                                          snapshot.data![snapshot.data!.length - i - 1].plot
                                        ])));
                              },
                              child: Container(
                                height: 150,
                                width: 110,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(20), // Image radius
                                      child: Image.network(
                                        snapshot.data![snapshot.data!.length - i - 1].poster,
                                      ),
                                    )),
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                  height: 150,
                                  width: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      snapshot.data![snapshot.data!.length - i - 1].name,
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

// class Stless extends StatelessWidget {
//   final Future<List<Post>> post = fetchPost();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<List<Post>>(
//           future: post,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               //   // return Text(snapshot.data.);
//               return ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 physics: BouncingScrollPhysics(),
//                 padding: EdgeInsets.all(10.0),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, i) => Column(
//                     // padding: const EdgeInsets.all(4),

//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Details(),
//                                   settings: RouteSettings(arguments: [
//                                     snapshot.data![i].name,
//                                     snapshot.data![i].poster,
//                                     snapshot.data![i].year,
//                                     snapshot.data![i].seasons,
//                                     snapshot.data![i].genre,
//                                     snapshot.data![i].trailer,
//                                     snapshot.data![i].plot
//                                   ])));
//                         },
//                         child: SizedBox(
//                             height: 150,
//                             width: 110,
//                             child: Image.network(
//                               snapshot.data![i].poster,
//                             )),
//                       ),
//                       SizedBox(
//                           height: 150,
//                           width: 110,
//                           child: Text(
//                             snapshot.data![i].name,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//                           )),
//                     ]),
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return Loading();
//           }),
//     );
//   }
// }
