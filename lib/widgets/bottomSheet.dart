import 'package:flutter/material.dart';


class Bottomsheet extends StatelessWidget {
  const Bottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Row(
         children: [
           Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQqo1CA4AEUQNo-V01qV_fPSSepscJX9GSlegKVrk93ttXbwrCB')
         ],
       )
      ],
    );
  }
}