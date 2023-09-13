import 'package:flutter/material.dart';
import 'package:foodapp/Models/category.dart';
import 'package:foodapp/pages/fooddetail.dart';
import 'package:page_transition/page_transition.dart';

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
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  child: DetailPage(foodid: myCategory[index].id),
                  type: PageTransitionType.bottomToTop),
            );
          },
          child: Card(
            elevation: 10,
            color: myCategory[index].color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                myCategory[index].title,
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: myCategory.length,
    );
  }
}
