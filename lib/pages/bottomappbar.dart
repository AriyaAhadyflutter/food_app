import 'package:flutter/material.dart';
// import 'package:foodapp/pages/favoritepage.dart'; 
import 'package:foodapp/pages/homepage.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:foodapp/Models/category.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({
    super.key,
  });

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  bool isCategoryvisible = true;
  bool isFavoritevisible = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 55,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const MainPage(), type: PageTransitionType.fade),
                );

                isFavoritevisible != isFavoritevisible;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.category,
                  color: isCategoryvisible ? Colors.amber : Colors.white,
                ),
                Visibility(
                  visible: isCategoryvisible,
                  child: const Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'ubuntu',
                      fontWeight: FontWeight.normal,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                // Navigator.push(
                //   context,
                //   PageTransition(
                //       child: const FavoritPage(),
                //       type: PageTransitionType.rightToLeft),
                // );
                // isCategoryvisible != isCategoryvisible;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: isFavoritevisible ? Colors.amber : Colors.white,
                ),
                Visibility(
                  visible: isFavoritevisible,
                  child: const Text(
                    'Favorite',
                    style: TextStyle(
                      fontFamily: 'ubuntu',
                      fontWeight: FontWeight.normal,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
