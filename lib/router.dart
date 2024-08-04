import 'package:go_router/go_router.dart';
import 'package:ulearning_app_bloc_provider/global.dart';
import 'package:ulearning_app_bloc_provider/pages/application_page/application_page.dart';
import 'package:ulearning_app_bloc_provider/pages/home/home_page.dart';
import 'package:ulearning_app_bloc_provider/pages/registre/sign_up/sign_up_screen.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/sign_in_screen.dart';
import 'package:ulearning_app_bloc_provider/pages/welcome/welcome_screen.dart';



bool isLogin= Global.storageService.getIsLogin() ;

final GoRouter router = GoRouter(
  initialLocation: isLogin? "/Application_Page" : "/",
  routes: [

    GoRoute(
      path: "/",
      builder: (context, state) => const SignInScreen(),
      routes: [
        GoRoute(
          path: "Application_Page",
          builder: (context, state) => const ApplicationPage(),
        ),
        GoRoute(
          path: "SignIn_Screen",
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: "Home_Screen",
          builder: (context, state) => const Homepage(),
        ),
        GoRoute(
          path: "welcome_screen",
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: "sign_up_screen",
          builder: (context, state) =>  const SignUpScreen(),
        ),
      ],
    ),
  ],
);