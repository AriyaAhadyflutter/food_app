import 'package:flutter/material.dart';
import 'package:foodapp/Models/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: const BottomAppBar(
          height: 50,
          color: Colors.green,
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
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Category> myCategory = Category.dummyCategories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: myCategory[index].color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              myCategory[index].title,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
      itemCount: myCategory.length,
    );
  }
}
