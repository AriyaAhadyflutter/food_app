import 'package:flutter/material.dart';


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
    );
  }
}
