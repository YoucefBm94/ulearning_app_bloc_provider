import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'bloc/home_page_bloc.dart';


AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 20,
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

Widget homePageText(String text, {Color? color = kPrimaryColor, int? Top}) {
  return Container(
    margin: const EdgeInsets.all(20),
    width: 100,
    height: 100,
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
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

Widget slidersView(BuildContext context,HomePageState state) {
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
            _sliderContainer(path:"assets/icons/Art.png"),
            _sliderContainer(path:"assets/icons/image_1.png"),
            _sliderContainer(path:"assets/icons/image_2.png"),


          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: Colors.grey,
            activeColor: kPrimaryColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}
Widget _sliderContainer({String path="assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );


}