part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class StartLoginEvent extends AuthenticationEvent {}

class StartSignupEvent extends AuthenticationEvent {}

class CheckCurrentUser extends AuthenticationEvent {}
