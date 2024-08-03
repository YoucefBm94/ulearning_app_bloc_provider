import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registre_event.dart';
part 'registre_state.dart';

class RegisterBloc extends Bloc<RegistreEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<userNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });
    on <emailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<passwordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<rePasswordEvent>((event, emit) {
      emit(state.copyWith(rePassword: event.rePassword));
    });


}}