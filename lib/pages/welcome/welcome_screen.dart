import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_bloc_provider/pages/welcome/bloc/welcome_bloc.dart';
import '../../common/value/constant.dart';
import '../../global.dart';
import '../../size_config.dart';
import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';

/// `WelcomeScreen` is a StatefulWidget that represents the welcome screen of the application.
/// It uses the `WelcomeBloc` for state management.
class WelcomeScreen extends StatefulWidget {
  // Constructor for the WelcomeScreen
  const WelcomeScreen({super.key});

  // Creating the state for this StatefulWidget
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

/// `_WelcomeScreenState` is the state associated with `WelcomeScreen`.
/// It contains a `PageController` for controlling the page view in the welcome screen.
class _WelcomeScreenState extends State<WelcomeScreen> {
  // Initializing the PageController with the first page
  PageController pageController = PageController(initialPage: 0);

  // Building the UI for the WelcomeScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // PageView for displaying the welcome pages
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      // Updating the page index in the state when the page changes
                      state.page = index;
                      // Adding a WelcomeEvent to the WelcomeBloc when the page changes
                      BlocProvider.of<WelcomeBloc>(context).add(const WelcomeEvent());
                    },
                    // The pages in the PageView
                    children: [
                      _page(
                          0,
                          context,
                          'next',
                          'First See Learning',
                          'Forget about a form of paper, all knowledge in one learning',
                          'assets/images/reading.png'),
                      _page(
                          1,
                          context,
                          'next',
                          'Connect with',
                          'Forget about a form of paper, all knowledge in one learning',
                          'assets/images/boy.png'),
                      _page(
                          2,
                          context,
                          'Get started',
                          'First See Learning',
                          'Forget about a form of paper, all knowledge in one learning',
                          'assets/images/man.png'),
                    ],
                  ),
                ),
                // DotsIndicator for indicating the current page
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// `_page` is a helper function that creates a page for the PageView.
  /// It takes the index of the page, the context, the name of the button, the title and subtitle of the page, and the path to the image as parameters.
  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Displaying an image
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath),
        ),
        const Spacer(),
        // Displaying the title
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Displaying the subtitle
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Spacer(),
        // Button for navigating to the next page
        GestureDetector(
          onTap: () {
            if (index < 2) {
              // animation
              pageController.animateToPage(
                index +1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Handle the last page action
              Global.storageService.setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              if (kDebugMode) {
                print("the value is ${Global.storageService.getDeviceFirstOpen()}");
              }
              context.go("/Sign_In");
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w , bottom: 40.h),
            width: 345.w,
            height: 50.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Text(
              buttonName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
