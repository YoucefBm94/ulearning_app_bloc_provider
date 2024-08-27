import 'package:flutter/material.dart';

import '../../constants.dart';

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
Widget homePageText(String text ,{Color? color=kPrimaryColor,int?Top}){

  return Container(
    margin: const EdgeInsets.all(20),
    width: 100,
    height: 100,
    child:  Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

}



