import 'package:flutter/material.dart';
import 'package:foodapp/widget/drawerwidget.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool toggleIsGF(bool isGF) {
    return !isGF;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfffee5),
      appBar: AppBar(
        title: const Text(
          'Your Filter',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontFamily: 'openSans', fontSize: 17),
            ),
          ),
          const SizedBox(height: 30),
          MySwitch(
            title: 'Gluten-free',
            description: 'only include gluten-free',
            mainbool: Bools.isglutenfree,
          ),
          MySwitch(
            title: 'Lactose-free',
            description: 'only include Lactose-free',
            mainbool: Bools.isLactosfree,
          ),
          MySwitch(
            title: 'Vegetarian',
            description: 'only include vegetarian',
            mainbool: Bools.isVegeterian,
          ),
          MySwitch(
            title: 'Vegan',
            description: 'only include vegan',
            mainbool: Bools.isVegan,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MySwitch extends StatefulWidget {
  final String title;
  final String description;
  bool mainbool;
  MySwitch({
    super.key,
    required this.title,
    required this.description,
    required this.mainbool,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'openSans',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'ubuntu',
                ),
              ),
            ],
          ),
          Switch(
            activeColor: Colors.yellow,
            inactiveThumbColor: Colors.white,
            value: widget.mainbool,
            onChanged: (value) {
              setState(() {
                widget.mainbool = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class Bools {
  static bool isglutenfree = false;
  static bool isLactosfree = false;
  static bool isVegeterian = false;
  static bool isVegan = false;
}
