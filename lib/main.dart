import 'package:flutter/material.dart';
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
  
            bool    isCategoryvisible = true;
              bool  isFavoritevisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFfffee5),
      bottomNavigationBar:  BottomAppBar(
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
      drawer: Drawer(
        backgroundColor: const Color(0xFFfffee5),
        child: Column(
          children: [
            Container(
              color: const Color(0xFFffc107),
              height: 120,
              child: const Center(
                child: Text(
                  'Lets Cook',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF54b04c),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant_rounded,
                    color: Color(
                      0xFF99988a,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Meals',
                    style: TextStyle(
                      fontFamily: 'ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Color(
                      0xFF99988a,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Filters',
                    style: TextStyle(
                      fontFamily: 'ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const MainPage(),
    );
  }
}
