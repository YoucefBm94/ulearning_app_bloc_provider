import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc_provider/global.dart';
import 'package:ulearning_app_bloc_provider/main.dart';
import 'package:go_router/go_router.dart';

// Assuming you have your Bloc files:
import '../../common/value/constant.dart';
import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (BuildContext context){
                        return  AlertDialog(
                          title: const Text("Confirm logout"),
                          content:const Text("Confirm logout"),
                          actions: [
                            TextButton(
                                onPressed: ()=>context.pop, child: const Text("Cancel")
                            ),
                            TextButton(
                                onPressed:(){
                                  Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
                                  context.go("/SignIn_Screen");
                                },
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
                  ),
                ],
              ),
            );



          },
        ),
      ),
    );
  }
}
