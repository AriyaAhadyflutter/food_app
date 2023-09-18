import 'package:flutter/material.dart';
import 'package:foodapp/Models/meal.dart';
import 'package:foodapp/widget/drawerwidget.dart';
import 'package:foodapp/main.dart';
// import 'package:foodapp/pages/bottomappbar.dart';

class FavoritPage extends StatefulWidget {
  final int? getfavorite;
  const FavoritPage({Key? key, this.getfavorite}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  bool isCategoryvisible = false;
  bool isFavoritevisible = true;
  List<Meal> myMeal = Meal.dUMMYMEALS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfffee5),

      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Your Favorite',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
      ),

      body: FavoriteBody(widget: widget, myMeal: myMeal),

      // bottom nav bar
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
    );
  }
}

// لیست ویو
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({
    super.key,
    required this.widget,
    required this.myMeal,
  });

  final FavoritPage widget;
  final List<Meal> myMeal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: myMeal.length,
      itemBuilder: (context, index) {
        
        if (myMeal[index].isFavorite == true) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 6.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
