import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kSecondaryColor,
          ),
        ),
        child: Row(
          children: [
            Container(
            margin: EdgeInsets.only(left: 16),
              width: 16.w,
              height: 16.h,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              height: 16.h,
              width: 16.w,
              child: const TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Search your course",
                  hintStyle: TextStyle(
                    color: kSecondaryColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),

            ),
          ],

        ),

      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: kPrimaryColor2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ],
  );
}



