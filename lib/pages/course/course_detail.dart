import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc_provider/pages/common_widgets.dart';
import 'package:ulearning_app_bloc_provider/pages/course/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      thumpNail(),
                      SizedBox(height: 15.h,),
                      menuView(),
                      SizedBox(height: 15.h,),
                      reusableText("Course Description"),
                      SizedBox(height: 15.h,),
                      courseDescreption(),
                      SizedBox(height: 15.h,),
                      goBuyButton("Buy Course"),
                      courseSummaryTitle(),
                      courseSummaryView(context),
                      courseLessonList(),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
