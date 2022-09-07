import 'package:soft_user/database/studentdatabase.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;

  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<StudentDatabase> getDatabaseInstance() {
    return $FloorStudentDatabase.databaseBuilder('student_db.db').build();
  }
}
