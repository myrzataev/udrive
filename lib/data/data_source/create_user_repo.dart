import 'package:udrive/domain/repository/create_user.dart';
import 'package:udrive/services/user_database.dart';

class CreateUserRepo implements CreateUser {
  final DataBaseService dataBaseService = DataBaseService.instance;
  @override
  Future<void> createUser(
      {required String email, required String password}) async {
    await dataBaseService.createUser(email: email, password: password);
  }
}
