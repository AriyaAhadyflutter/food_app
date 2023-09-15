import 'package:flutter/material.dart';
import 'package:foodapp/Models/meal.dart';

class FoodDetail extends StatefulWidget {
  final int foodid;
  const FoodDetail({super.key, required this.foodid});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  List<Meal> myMeal = Meal.dUMMYMEALS;
    bool toggleIsFavorit(bool isFavorite) {
    return !isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfffee5),
      appBar: AppBar(
        title: Text(
          myMeal[widget.foodid].title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage(myMeal[widget.foodid].imageUrl),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontFamily: 'openSans',
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 70, left: 40),
              child: Card(
                color: Colors.yellow,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: myMeal[widget.foodid].ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.yellow,
                        child: Text(
                          myMeal[widget.foodid].ingredients[index],
                          style: const TextStyle(
                            fontFamily: 'ubuntu',
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Steps',
              style: TextStyle(
                fontFamily: 'openSans',
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 45),
              child: Card(
                color: Colors.yellow,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: myMeal[widget.foodid].steps.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Card(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.all(10),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.tag,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  color: Colors.yellow,
                                  child: Text(
                                    myMeal[widget.foodid].steps[index],
                                    style: const TextStyle(
                                      fontFamily: 'ubuntu',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
          bool isFavorited = toggleIsFavorit(
                                        (myMeal[widget.foodid].isFavorite));
                                  myMeal[widget.foodid].isFavorite = isFavorited;
          });
        },
        backgroundColor: Colors.amberAccent,
        child: const Icon(Icons.star_border),
      ),
    );
  }
}
