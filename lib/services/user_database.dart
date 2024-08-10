import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udrive/data/model/user_model.dart';

class DataBaseService {
  static Database? _db;
  static final DataBaseService instance = DataBaseService._constructor();
  DataBaseService._constructor();
  final String _userTable = "users";
  final String _usersIdColumName = "id";
  final String _usersEmail = "email";
  final String _usersPassword = "password";

  Future<Database> get dataBase async {
    if (_db != null) return _db!;
    _db = await getDataBase();
    return _db!;
  }

  Future<Database> getDataBase() async {
    final dataBaseDirPath = await getDatabasesPath();
    final dataBasePath = join(dataBaseDirPath, "user_db.db");
    final dataBase = await openDatabase(
      dataBasePath,
      version: 1, // Specify the version here
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_userTable(
          $_usersIdColumName INTEGER PRIMARY KEY,
          $_usersEmail TEXT NOT NULL,
          $_usersPassword TEXT NOT NULL
        )''');
      },
    );
    return dataBase;
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    final db = await dataBase;
    await db.insert(_userTable, {
      _usersEmail: email,
      _usersPassword: password,
    });
  }

  Future<String> login(
      {required String email, required String password}) async {
    final db = await dataBase;

    final emailCheck = await db.query(
      _userTable,
      where: "$_usersEmail = ?",
      whereArgs: [email],
    );

    if (emailCheck.isEmpty) {
      return "Email does not exist";
    }

    final passwordCheck = await db.query(
      _userTable,
      where: "$_usersEmail = ? AND $_usersPassword = ?",
      whereArgs: [email, password],
    );

    if (passwordCheck.isEmpty) {
      return "Incorrect password";
    }

    return "Login successful";
  }
}
