import 'package:flutter/material.dart';

import '../screens/my_list.dart';
import '../screens/search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Image.network('https://raw.githubusercontent.com/iampawan/PKNetflix/master/assets/images/netflix_logo0.png', width: 40, fit: BoxFit.cover),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            // showSearch(context: context, delegate: Search());
                          },
                          icon: Icon(
                            Icons.search,
                            size: 38,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Image.network('https://i.pinimg.com/736x/9a/07/ad/9a07ad321c82d6c20697570d970f002a.jpg', fit: BoxFit.cover, width: 30),
                    )
                  ],
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Tv Shows',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Movies',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mylist(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'My List',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
