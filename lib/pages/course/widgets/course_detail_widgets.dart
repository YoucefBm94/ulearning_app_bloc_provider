import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/value/colors.dart';
import '../../common_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    title: reusableText("Course detail"),
  );
}

Widget thumpNail() {
  return Container(
    height: 200.h,
    width: 325.w,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/icons/image_1.png"),
    )),
  );
}

Widget menuView() {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    width: 325.w,
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reusableText("author",
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(num.toString(),
            color: AppColors.primaryThirdElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}
Widget courseDescreption() {
  return reusableText(
      "This course is designed to help you learn the basics of Flutter, including how to set up your development environment, create a simple app, and more. By the end of this course, you'll be able to create your own Flutter app and integrate with Firebase.",
      fontSize: 11.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryThirdElementText);
}

Widget goBuyButton(String name) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(name,textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal)),
  );
}

Widget courseSummaryTitle() {
  return reusableText("The Course Includes", fontSize: 14.sp);
}

Widget courseSummaryView(BuildContext context) {
//setting sections buttons
  var imagesInfo = <String, String>{
    "Hours Video": "video_detail.png",
    "Total Lessons": "file_detail.png",
    "Downloadable Resources": "download_detail.png",
  };

  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => null,
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(7.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        color: AppColors.primarySecondaryElementText,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp))
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget courseLessonList() {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 325.w,
            height: 80.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(10.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 1))
                ]),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LessonDetail()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //for image and the text
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.h),
                          image: const DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/icons/image_1.png"
                          ),
                        ),
                      ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          listContainer(),
                          listContainer(fontSize: 10, color: AppColors.primaryThirdElementText,FontWeight: FontWeight.normal),
                        ],
                      ),

                    ],
                  ),
                  //for showing the right arrow
                  Container(

                    child: Image(
                      height: 24.h,
                      width: 24.h,
                      image: AssetImage("assets/icons/arrow_right.png"),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
  );
}
listContainer({double fontSize=13, Color color=AppColors.primaryText,FontWeight=FontWeight.bold }){ {
  return Container(
      margin: EdgeInsets.only(left: 6.w),
      width:
      200.w,

      child: Text("UI design"
        ,overflow: TextOverflow.clip,
        maxLines: 1,
        style: TextStyle(
            color: color,
            fontSize: fontSize.sp,
            fontWeight: FontWeight.bold),
      )


  );

}}