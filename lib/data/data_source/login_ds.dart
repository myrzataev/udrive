import 'package:udrive/domain/repository/login_repo.dart';
import 'package:udrive/services/user_database.dart';

class LoginDs implements LoginRepo {
  final DataBaseService dataBaseService = DataBaseService.instance;

  @override
  Future<String> login(
      {required String email, required String password}) async {
    return await dataBaseService.login(email: email, password: password);
  }
}
