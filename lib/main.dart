import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc_provider/appblocproviders.dart';

import 'package:ulearning_app_bloc_provider/router.dart';
import 'package:ulearning_app_bloc_provider/size_config.dart';
import 'global.dart';



void main() async {
await Global.init();

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
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),

    );
  }
}
