import 'package:flutter/cupertino.dart';

Widget buildPage(int index) {
  List<Widget> _pages = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];

  return _pages[index];
}