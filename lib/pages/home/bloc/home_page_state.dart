part of 'home_page_bloc.dart';


class HomePageState {
   final int index;

     HomePageState({this.index=0});


   HomePageState copyWith({int? index}){
     return HomePageState(index: index ?? this.index);
   }

}
