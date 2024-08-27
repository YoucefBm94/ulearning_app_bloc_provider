import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            homePageText("hello"),

            homePageText("youcef" ),
          ],
        ),
      ),
    );
  }
}
