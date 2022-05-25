import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/loading.dart';
import 'package:demo/screens/details.dart';

class Popular extends StatelessWidget {
  final Future<List<Post>> post = fetchPost();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular',
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: StreamBuilder<QuerySnapshot>(
                 stream: FirebaseFirestore.instance
                      .collection('Popular').orderBy('name')
                      .snapshots(),
                builder: (context, snapshot) {
                  
                  if (snapshot.hasData) {
                     var docs = snapshot.data!.docs;
                    //   // return Text(snapshot.data.);
                    return ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 10),
                      itemCount: docs.length,
                      itemBuilder: (context, i) => Column(
                          // padding: const EdgeInsets.all(4),

                          children: [
                            GestureDetector(
                              onTap: () {
                                
                                  showModalBottomSheet(
                                    
                                    enableDrag: false,
                                    isScrollControlled: false,
                                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: (){
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(),
                                        settings: RouteSettings(arguments: [
                                        docs[i]['name'],
                                          docs[i]['poster'],
                                          docs[i]['year'],
                                         docs[i]['seasons'],
                                          docs[i]['genre'],
                                         docs[i]['trailer'],
                                         docs[i]['plot'],
                                        ])));
                        },
                        child: Container(   height: MediaQuery.of(context).size.height/3,                      decoration: BoxDecoration(
                            color: Color.fromARGB(255, 49, 45, 45),
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12)),
                        ),
                        //bottom information
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                        //Image
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                    height: 150,
                                    width: 110,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('${docs[i]['poster']}'))),
                                ),
                                  ),
                              //Column for title and plot
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                        Row(
                                          
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                  '${docs[i]['name']}',
                                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                                ),
                                            ),
                                                                 
                                        ],
                                        ),
                                        
                                      
                          //Row for year and seasons
                                         Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Text(
                                           '${docs[i]['year']}',
                                            style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: docs[i]['seasons'] > 1 ? Text(
                                            '${docs[i]['seasons']}'+' Seasons',
                                              style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
                                            ) : docs[i]['seasons'] == 1 ? Text(
                                            '${docs[i]['seasons']}'+' Season',
                                              style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
                                            ) :Text(
                                            '${docs[i]['length']}',
                                              style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
                                            ) 
                                          ),
                                        
                                      ],
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.only(top: 10),
                                       child: SizedBox(
                                         width: MediaQuery.of(context).size.width/1.5,
                                         
                                           child: Text(
                                                '${docs[i]['plot']}',
                                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
                                                ),
                                         
                                       ),
                                     ),
                                     ],
                                   ),
                                 ),
                         
                                 
                                ],
                              ),
                            ),
                        //Icons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.play_circle,size: 32,color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('Play',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
                                ),
                                 
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.add_circle_rounded,size: 32,color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('My List',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
                                ),
                                 
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.info_rounded,size: 32,color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('Info',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
                                ),
                                 
                              ],
                            ),
                          
                          ],
                        )
                          ],
                        ),
                       ) );
                    },
                  ); },

                  //Trending 
                      child: Container(
                                height: 150,
                                width: 110,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('${docs[i]['poster']}'))),
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                  height: 150,
                                  width: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                     '${docs[i]['name']}',
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
