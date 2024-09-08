import 'package:bloc/bloc.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageDotsEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
  });
  }
}
