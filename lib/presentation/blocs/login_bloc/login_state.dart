part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String response;
  LoginSuccess({required this.response});
}

final class LoginError extends LoginState {
  final String errorText;
  LoginError({required this.errorText});
}
