import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app_bloc_provider/pages/home/bloc/home_page_bloc.dart';
import 'home_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc,HomePageState>(
        builder: (context,state){
          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                homePageText("hello"),

                homePageText("youcef" ),
                const SizedBox(
                  height: 20,
                ),
                searchView(),
                slidersView(context,state ),
              ],
            ),
          );
        },
      ),
    );
  }
}
