part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {}

class SignupSuccessState extends AuthenticationState {}

class LoginFailedState extends AuthenticationState {
  //---------------------------------------------------------
  final Object error;
  LoginFailedState(this.error);
  //---------------------------------------------------------
  List<Object> get props => [error];
}

class SignupFailedState extends AuthenticationState {
//---------------------------------------------------------
  final Object error;
  SignupFailedState(this.error);
//---------------------------------------------------------
  List<Object> get props => [error];
}

class AuthOperationInProgress extends AuthenticationState {}
