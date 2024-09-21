import 'package:ulearning_app_bloc_provider/pages/course/bloc/course_blocs.dart';
import 'package:ulearning_app_bloc_provider/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app_bloc_provider/pages/registre/bloc/registre_bloc.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app_bloc_provider/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc_provider/profile/settings/bloc/settings_bloc.dart';
class AppBlocProviders {
  static get allBlocProviders => [
        // Add all the providers here
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (context) => SignInBlocs()),
    BlocProvider(create: (context) => RegisterBloc()),
    BlocProvider(create: (context) => HomePageBloc()),
    BlocProvider(create: (context) => SettingsBloc()),
    BlocProvider(create: (context) => CourseBloc()),






  ];
}
