import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app_bloc_provider/pages/sign_in/bloc/signin_states.dart';


/// Represents the business logic component for sign-in functionality.
///
/// This BLoC handles the sign-in related events such as email and password input
/// and emits states based on the current sign-in form status.
class SignInBlocs extends Bloc<SignInEvent, SignInState> {
  /// Initializes the [SignInBlocs] with an empty [SingInState].
  SignInBlocs() : super(const SignInState()){
    // Handles email input events.
    on<EmailEvent>((event, emit) {
      if (kDebugMode) {
        print("My email is SignInBlocs  ${event.email }" );
      }
      // Emits a new state with the updated email.
      emit(state.copyWith(email: event.email));
    });

    // Handles password input events.
    on<PasswordEvent>((event, emit) {

      if (kDebugMode) {
        print("My password is SignInBlocs ${event.password }" );
      }
      // Emits a new state with the updated password.
      emit(state.copyWith(password: event.password));
    });
  }
}