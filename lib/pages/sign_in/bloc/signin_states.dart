/// Represents the state of the SignIn process.
///
/// Holds the email and password entered by the user.
class SignInState{
  /// The email entered by the user.
  final String email;

  /// The password entered by the user.
  final String password;

  /// Constructs a [SignInState] with optional email and password.
  ///
  /// If not provided, defaults to an empty string for both.
  const SignInState({this.email = "", this.password = ""});

  /// Creates a copy of this [SingInState] with the given [email] and [password].
  ///
  /// If [email] or [password] is not provided, the current value is retained.
  SignInState copyWith({String? email, String? password}){
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}