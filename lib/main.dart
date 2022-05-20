import 'dart:convert';
import 'package:demo/screens/loading.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:demo/widgets/content/bar.dart';
import 'package:demo/widgets/only_on_netflix.dart';
import 'package:demo/widgets/topten.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/my_list.dart';
import 'package:demo/widgets/content/bar.dart';
import 'package:http/http.dart' as http;
import 'package:demo/screens/details.dart';
import 'package:demo/widgets/trending.dart';
import 'package:demo/widgets/banner.dart';
import 'package:demo/widgets/popular.dart';
import 'package:demo/screens/search.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

Future<List<Post>> fetchPost() async {
  const url = "https://script.google.com/macros/s/AKfycbzN4E0K3S2SjTHOPsuFz36lS1RIAJEmc3L6E6vwwab5RusnCWp2xea3Kta0Ts_nGmv_gg/exec";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // return Post.fromJson(json.decode(response.body));
    return compute(parseList, response.body);
  } else {
    throw Exception("Failed to load the post, try again late");
  }
}

List<Post> parseList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final String name;
  final String genre;
  final String poster;
  final String plot;
  final num year;
  final num seasons;
  final String trailer;

  Post({required this.name, required this.genre, required this.poster, required this.year, required this.seasons, required this.trailer, required this.plot});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      genre: json['genre'],
      poster: json['poster'],
      plot: json['plot'],
      year: json['year'],
      seasons: json['seasons'],
      trailer: json['trailer'],
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Networking Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<List<Post>> post = fetchPost();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          CustomAppBar()
        ],
      ),
      extendBody: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            BannerBox(),
            Trending(),
            Popular(),
             Only_on_Netflix(),
            TopTen(),
           
            
          ],
        ),
      ),
    );
  }
}

//  width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,

class Stless extends StatelessWidget {
  final Future<List<Post>> post = fetchPost();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Post>>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //   // return Text(snapshot.data.);
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10.0),
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
                        child: SizedBox(
                            height: 150,
                            width: 110,
                            child: Image.network(
                              snapshot.data![i].poster,
                            )),
                      ),
                      SizedBox(
                          height: 150,
                          width: 110,
                          child: Text(
                            snapshot.data![i].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ]),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Loading();
          }),
    );
  }
}
