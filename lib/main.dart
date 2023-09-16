import 'package:flutter/material.dart';
import 'package:foodapp/data/widget/drawerwidget.dart';
// import 'package:foodapp/Models/category.dart';
// import 'package:foodapp/pages/bottomappbar.dart';
import 'package:foodapp/pages/favoritepage.dart';
import 'package:foodapp/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCategoryvisible = true;
  bool isFavoritevisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfffee5),
      bottomNavigationBar: BottomAppBar(
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
                  Navigator.pushReplacement(context, MaterialPageRoute(
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: const MainPage(),
    );
  }
}
