import 'package:flutter/material.dart';
import 'package:foodapp/Models/category.dart';
import 'package:foodapp/Models/meal.dart';
import 'package:foodapp/pages/filterpage.dart';
import 'package:foodapp/pages/fooddetail.dart';
import 'package:page_transition/page_transition.dart';

class DetailPage extends StatefulWidget {
  final int foodid;

  const DetailPage({super.key, required this.foodid});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Category> myCategory = Category.dummyCategories;
  List<Meal> myMeal = Meal.dUMMYMEALS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfffee5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          myCategory[widget.foodid].title.toString(),
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: myMeal.length,
          itemBuilder: (context, index) {
            if (myMeal[index].isGlutenFree == true) {
              return Visibility(
                visible: Bools.isglutenfree,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: FoodDetail(foodid: myMeal[index].id),
                            type: PageTransitionType.leftToRight),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  myMeal[index].imageUrl,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    height: 70,
                                    width: 280,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 6.0),
                                      child: Text(
                                        myMeal[index].title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'Raleway',
                                        ),
                                        // textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    const Icon(Icons.access_time_outlined),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${myMeal[index].duration} min',
                                      style: const TextStyle(
                                        fontFamily: 'ubunto',
                                      ),
                                    ),
                                  ]),
                                  Row(children: [
                                    const Icon(Icons.shopping_bag_sharp),
                                    const SizedBox(width: 3),
                                    Text(
                                      myMeal[index].complexity,
                                      style: const TextStyle(
                                        fontFamily: 'ubunto',
                                      ),
                                    ),
                                  ]),
                                  Row(children: [
                                    const Icon(Icons.attach_money),
                                    const SizedBox(width: 3),
                                    Text(
                                      myMeal[index].affordability,
                                      style: const TextStyle(
                                        fontFamily: 'ubunto',
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
