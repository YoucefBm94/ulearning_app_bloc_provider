import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false, // This removes the back arrow
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 25.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          const Text('Profile'),
          GestureDetector(
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: const BoxDecoration(
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

Widget profileIconandEdit() {
  return Container(
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 10.w),
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image(
        height: 25.h,
        width: 25.w,
        image: AssetImage('assets/icons/edit_3.png')),
  );
}

//setting sections buttons
var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png"
};
Widget buildListview(BuildContext context) {
  return Column(
    children: <Widget>[
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
            onTap: () => context.go("/settings_page"),
            child: Container(
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                        image: AssetImage(
                            "assets/icons/${imagesInfo.values.elementAt(index)}")),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
      ),
    ],
  );
}
Widget settingsButton(BuildContext context, void Function() func){
  return GestureDetector(
    onTap: () {
      showDialog(context: context, builder: (BuildContext context){
        return  AlertDialog(
          title: const Text("Confirm logout"),
          content:const Text("Confirm logout"),
          actions: [
            TextButton(
                onPressed: ()=>context.pop(), child: const Text("Cancel")
            ),
            TextButton(
                onPressed:func,
                child: const Text("Confirm")
            )
          ],
        );
      });
      // Add your logic here
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(

        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        ),
      ),
    ),
  );

}
