import 'package:floor/floor.dart';
import 'package:soft_user/entities/student_entity.dart';

@dao
abstract class StudentDao {
  @insert
  Future<void> insertStudent(Student student);

  @Query("select * from student")
  Future<List<Student>> getAllStudent();

  @update
  Future<void> updateStudent(Student student);

  @delete
  Future<void> deleteStudent(Student student);
}
