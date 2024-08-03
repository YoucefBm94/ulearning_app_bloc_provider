import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
      automaticallyImplyLeading: false,

    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 20 ,
            height: 20,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            onTap: () {
              // Define your onTap action here
            },
            child: Container(
              width: 20,
              height: 20,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/person.png'),
                  ),


                ),

            ),
          ),
        ],
      ),
    ),
  );
}
