import 'package:flutter/material.dart';
import 'package:foodapp/pages/filterPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: const Row(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Filter();
                  },
                ));
              },
              child: const Row(
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
          ),
        ],
      ),
    );
  }
}
