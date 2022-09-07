import 'dart:async';

import 'package:floor/floor.dart';
import 'package:soft_user/dao/student_dao.dart';
import 'package:soft_user/entities/student_entity.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part "studentdatabase.g.dart";

@Database(version: 1, entities: [Student])
abstract class StudentDatabase extends FloorDatabase {
  StudentDao get studentDao;
}
