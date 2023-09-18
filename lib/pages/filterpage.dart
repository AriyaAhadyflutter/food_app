import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  void switchFunc(bool value) {
    setState(() {
      Bools.isglutenfree = value;
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'kkk',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'openSans',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'kkk',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'ubuntu',
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                inactiveThumbColor: Colors.white,
                activeColor: Colors.yellow,
                value: Bools.isglutenfree,
                onChanged: (value) {
                  switchFunc(value);
                },
              ),
            ],
          ),
          Text('${Bools.isglutenfree}')
        ],
      ),
    );
  }
}

class Bools {
  static bool isglutenfree = false;
}
