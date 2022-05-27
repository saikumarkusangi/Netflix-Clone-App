// final args = ModalRoute.of(context)!.settings.arguments as List;
//
import 'package:demo/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: args[5],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute (builder: (context) => MyHomePage(),));
      }, icon: Icon(Icons.arrow_back)
    
      ),),
      backgroundColor: Colors.black,
      
      body: ListView(
        padding: EdgeInsets.only(top: 2),
        scrollDirection: Axis.vertical,
        children: [
          YoutubePlayer(
            controller: _controller,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              args[0],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    args[2].toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFBEC9CE),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: Text(
                    args[3].toString() + ' seasons',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFBEC9CE),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 3, 0, 0),
            child: Text(
              args[4],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFFBEC9CE),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text(
              args[6],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Padding(

          //   padding: EdgeInsetsDirectional.fromSTEB(10, 30, 220, 0),
          //   child: DropDown(
          //     initialOption: dropDownValue ??= 'Season 1',
          //     options: ['Season 1', 'Season 2', 'Season 3'].toList(),
          //     onChanged: (val) => setState(() => dropDownValue = val),
          //     width: 10,
          //     height: 42,
          //     textStyle: TextStyle(
          //           fontFamily: 'Poppins',
          //           color: Colors.white,
          //           fontSize: 18,
          //         ),
          //     hintText: 'Season 1',
          //     icon: Icon(
          //       Icons.arrow_drop_down,
          //       color: Colors.white,
          //       size: 30,
          //     ),
          //     fillColor: Color(0xFF393E3E),
          //     elevation: 2,
          //     borderColor: Colors.transparent,
          //     borderWidth: 0,
          //     borderRadius: 5,
          //     margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
          //     hidesUnderline: true,
          //   ),
          // ),
        ],
      ),
    );
  }
}
