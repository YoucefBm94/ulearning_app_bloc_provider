import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/value/colors.dart';
import '../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'bloc/home_page_bloc.dart';

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
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
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

//reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryElementText,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primarySecondaryElementText,
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
              margin: EdgeInsets.only(left: 10.w),
              height: 25.h,
              width: 200.w,
              child: const TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Search your course",
                  hintStyle: TextStyle(
                    color: AppColors.primaryElementBg,
                  ),
                  label: Text("Search your course"),
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

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        width: 320.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            // Define your onPageChanged action here
            context.read<HomePageBloc>().add(HomePageDotsEvent(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/Art.png"),
            _sliderContainer(path: "assets/icons/image_1.png"),
            _sliderContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}

Widget _sliderContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _reusableText("Choose your course"),
              GestureDetector(
                  child: _reusableText("See all",
                      color: AppColors.primaryThirdElementText, fontSize: 10)),
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: AppColors.primaryBackground),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: AppColors.primaryBackground),
          ],
        ),
      )
    ],
  );
}

Widget _reusableText(String txt,
    {Color? color = AppColors.primarySecondaryElementText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    txt,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

//for the mnue buttons, reusbale text
//for the mnue buttons, reusbale text
Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: _reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/image_1.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Best course for IT",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Flutter Best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontSize: 8.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
