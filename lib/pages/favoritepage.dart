import 'package:flutter/material.dart';
import 'package:foodapp/main.dart';
// import 'package:foodapp/pages/bottomappbar.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
              bool    isCategoryvisible = false;
              bool  isFavoritevisible = true;
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:   BottomAppBar(
        
    height: 55,
    color: Colors.green,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //main
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MyApp();
                },
              ));

              isCategoryvisible = true;
              isFavoritevisible = false;
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
        //favorite
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const FavoritPage();
                },
              ));
              isCategoryvisible = false;
              isFavoritevisible = true;
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
    ),
    );
  }
}
