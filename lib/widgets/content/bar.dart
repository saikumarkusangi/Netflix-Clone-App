// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// import '../../screens/details.dart';
// import '../../screens/loading.dart';
//
// class BannerBoxer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//
//           StreamBuilder<QuerySnapshot>(
//                  stream: FirebaseFirestore.instance
//                       .collection('Banner')
//                       .snapshots(),
//                 builder: (context, snapshot) {
//
//                   if (snapshot.hasData) {
//                      var docs = snapshot.data!.docs;
//                     //   // return Text(snapshot.data.);
//                     return ListView.builder(
//                       // shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       padding: EdgeInsets.only(top: 10),
//                       itemCount: docs.length,
//                       itemBuilder: (context, i) => Column(
//                           // padding: const EdgeInsets.all(4),
//
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//
//                                   showModalBottomSheet(
//                                     backgroundColor: Colors.transparent,
//                     context: context,
//                     builder: (context) {
//                       return GestureDetector(
//                         onTap: (){
//                            Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Details(),
//                                         settings: RouteSettings(arguments: [
//                                         docs[i]['name'],
//                                           docs[i]['poster'],
//                                           docs[i]['year'],
//                                          docs[i]['seasons'],
//                                           docs[i]['genre'],
//                                          docs[i]['trailer'],
//                                          docs[i]['plot'],
//                                         ])));
//                         },
//                         child: Container(   height: MediaQuery.of(context).size.height/3,                      decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 49, 45, 45),
//                           borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12)),
//                         ),
//                         //bottom information
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                         //Image
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Container(
//                                     height: 150,
//                                     width: 110,
//                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('${docs[i]['poster']}'))),
//                                 ),
//                                   ),
//                               //Column for title and plot
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 10),
//                                    child: Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      mainAxisAlignment: MainAxisAlignment.start,
//                                      children: [
//                                         Row(
//
//                                           children: [
//                                             SizedBox(
//                                               child: Text(
//                                                   '${docs[i]['name']}',
//                                                   style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//                                                 ),
//                                             ),
//
//                                         ],
//                                         ),
//
//
//                           //Row for year and seasons
//                                          Row(
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                        Text(
//                                            '${docs[i]['year']}',
//                                             style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(left: 10),
//                                             child: Text(
//                                             '${docs[i]['seasons']}'+' Season(s)',
//                                               style: TextStyle(color: Color.fromARGB(255, 187, 180, 180), fontSize: 15, fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//
//                                       ],
//                                     ),
//                                      Padding(
//                                        padding: const EdgeInsets.only(top: 10),
//                                        child: SizedBox(
//                                          width: MediaQuery.of(context).size.width/1.5,
//                                          child: Flexible(
//                                            child: Text(
//                                                 '${docs[i]['plot']}',
//                                                   style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
//                                                 ),
//                                          ),
//                                        ),
//                                      ),
//                                      ],
//                                    ),
//                                  ),
//
//
//                                 ],
//                               ),
//                             ),
//                         //Icons Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               children: [
//                                 Icon(Icons.play_circle,size: 32,color: Colors.white,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5),
//                                   child: Text('Play',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
//                                 ),
//
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(Icons.add_circle_rounded,size: 32,color: Colors.white,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5),
//                                   child: Text('My List',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
//                                 ),
//
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(Icons.info_rounded,size: 32,color: Colors.white,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5),
//                                   child: Text('Info',style: TextStyle(color:Color.fromARGB(255, 187, 180, 180), fontSize: 12 ),),
//                                 ),
//
//                               ],
//                             ),
//
//                           ],
//                         )
//                           ],
//                         ),
//                        ) );
//                     },
//                   ); },
//
//                   //Trending
//
//         // Container(
//         //   height: MediaQuery.of(context).size.height / 1.4,
//         //   decoration: BoxDecoration(
//         //       color: Colors.black,
//         //       gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
//         //         Colors.black.withOpacity(0.0),
//         //         Colors.black
//         //       ])),
//         // ),
//         // Container(
//         //   height: MediaQuery.of(context).size.height / 1.5,
//         //   width: MediaQuery.of(context).size.width,
//         //   child: Column(
//         //     mainAxisAlignment: MainAxisAlignment.end,
//         //     crossAxisAlignment: CrossAxisAlignment.center,
//         //     children: [
//         //       Image.network('https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/LmEnxtiAuzezXBjYXPuDgfZ4zZQ/AAAABQysjF21984zjKuNVgH_m3dP1f9iLq0B3i9G_vKdPqOx_8rqlr2Wjyl_v6AL5jX2DYP1do-CilJkInfzsKQoJvtwf_38WNvkdrEvWSIkWKga.png?r=b1b', width: 250),
//         //       SizedBox(
//         //         height: 15,
//         //       ),
//         //       Text('Action . Thriller . Comedy', style: TextStyle(fontSize: 15, color: Colors.white)),
//         //       SizedBox(
//         //         height: 10,
//         //       ),
//         //       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         //         Column(
//         //           children: [
//         //             Icon(Icons.add, color: Colors.white, size: 32),
//         //             SizedBox(height: 10),
//         //             Text('My List', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white))
//         //           ],
//         //         ),
//         //         Container(
//         //           decoration: BoxDecoration(
//         //             color: Colors.white,
//         //             borderRadius: BorderRadius.circular(4),
//         //           ),
//         //           child: Padding(
//         //             padding: const EdgeInsets.only(right: 13, left: 8, top: 2, bottom: 2),
//         //             child: Row(children: [
//         //               Icon(Icons.play_arrow, color: Colors.black, size: 30),
//         //               SizedBox(
//         //                 width: 5,
//         //               ),
//         //               Text('Play', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
//         //             ]),
//         //           ),
//         //         ),
//         //         Column(
//         //           children: [
//         //             Icon(Icons.info_outline, color: Colors.white, size: 32),
//         //             SizedBox(height: 10),
//         //             Text('Info', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white))
//         //           ],
//         //         )
//         //       ])
//         //     ],
//         //   ),
//         ),
//        ] )
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text("${snapshot.error}");
//                   }
//                   return Loading();
//                 }),
//
//           Container(
//           height: MediaQuery.of(context).size.height / 1.4,
//           decoration: BoxDecoration(color: Colors.black, image: DecorationImage(image: NetworkImage('${docs[i]['poster']}'), fit: BoxFit.cover)),
//         ),
//
//
//       ],
//     );
//   }
// }
