part of 'registre_bloc.dart';

abstract class RegistreEvent {
  const RegistreEvent();

}
class userNameEvent extends RegistreEvent {
  final String userName;
  const userNameEvent(this.userName);
}
class emailEvent extends RegistreEvent {
  final String email;
  const emailEvent(this.email);
}
class passwordEvent extends RegistreEvent {
  final String password;
  const passwordEvent(this.password);
}
class rePasswordEvent extends RegistreEvent {
  final String rePassword;
  const rePasswordEvent(this.rePassword);
}