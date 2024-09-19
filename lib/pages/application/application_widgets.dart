import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile/profile_page.dart';
import '../home/home_page.dart';

Widget buildApplicationPage(int index) {
  List<Widget> _widget =[
    const Homepage(),
    Center(child: Text("Search")),
    Center(child: Text("Search")),
    Center(child: Text("chat")),
    const ProfileScreen(),

  ];
  return _widget[index];

}
var bottomTabs=[
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset(
        "assets/icons/home.png",
        color: Colors.blueAccent,
      ),
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset("assets/icons/search.png"),
    ),
    label: 'search',
    activeIcon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset(
        "assets/icons/search2.png",
        color: Colors.blueAccent,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    label: 'search',
    activeIcon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: Colors.blueAccent,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    label: 'chat',
    activeIcon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: Colors.blueAccent,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset("assets/icons/person2.png"),
    ),
    label: 'search',
    activeIcon: SizedBox(
      height: 15,
      width: 15,
      child: Image.asset(
        "assets/icons/person2.png",
        color: Colors.blueAccent,
      ),
    ),
  ),
];