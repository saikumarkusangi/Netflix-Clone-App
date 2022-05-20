import 'package:flutter/material.dart';
import 'package:demo/main.dart';

class Mylist extends StatelessWidget {
  const Mylist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0), child: Stless()),
        ),
      ),
    );
  }
}
