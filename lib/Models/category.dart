import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final Color color;
   Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
  
 static List<Category> dummyCategories = [
  Category(
    id: 0,
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 1,
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 2,
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: 3,
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 4,
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 5,
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: 6,
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: 7,
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: 8,
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: 9,
    title: 'Summer',
    color: Colors.teal,
  ),
];
}
