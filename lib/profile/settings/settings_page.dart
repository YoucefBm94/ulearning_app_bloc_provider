import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc_provider/global.dart';
import 'package:ulearning_app_bloc_provider/main.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Assuming you have your Bloc files:
import '../../common/value/constant.dart';
import '../../pages/home/bloc/home_page_bloc.dart';
import '../widget_profile/profile_widget.dart';
import 'bloc/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData(){
    Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
    context.go("/SignIn_Screen");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state){
            return Container(

              child: Column(
                children: <Widget>[
                  settingsButton(context,removeUserData),
                ],
              ),
            );



          },
        ),
      ),
    );
  }
}
