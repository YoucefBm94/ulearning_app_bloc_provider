import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_bloc_provider/appblocproviders.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/sign_in_screen.dart';
import 'package:ulearning_app_bloc_provider/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app_bloc_provider/pages/welcome/welcome_screen.dart';
import 'package:ulearning_app_bloc_provider/router.dart';
import 'package:ulearning_app_bloc_provider/size_config.dart';
import 'firebase_options.dart';
import 'global.dart';



void main() async {
await Global.init();
bool isFirstOpen = !Global.storageService.getDeviceFirstOpen( );

runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig


    return MultiBlocProvider(
      providers:AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),

    );
  }
}
