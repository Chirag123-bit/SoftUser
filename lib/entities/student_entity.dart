import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String age;
  String gender;
  String address;

  Student(this.name, this.age, this.gender, this.address);
}
