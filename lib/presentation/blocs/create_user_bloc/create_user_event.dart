part of 'create_user_bloc.dart';

@immutable
class CreateUserEvent {
  final String email;
  final String password;
  const CreateUserEvent({required this.email, required this.password});
}
