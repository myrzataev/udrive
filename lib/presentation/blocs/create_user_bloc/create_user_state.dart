part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserLoading extends CreateUserState {}

final class CreateUserSuccess extends CreateUserState {
  
}

final class CreateUserError extends CreateUserState {
  final String errorText;
  CreateUserError({required this.errorText});


}
