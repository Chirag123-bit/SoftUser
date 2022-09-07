import 'package:flutter/material.dart';
import 'package:soft_user/database/databaseInstance.dart';
import 'package:soft_user/entities/student_entity.dart';
import 'package:motion_toast/motion_toast.dart';

enum SingingCharacter { Male, Female, Others }

class StudentDetail extends StatefulWidget {
  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  String? name;
  String? age;
  String? address;
  String? gender;
  SingingCharacter? _character = SingingCharacter.Male;
  _addStudent(Student student) async {
    try {
      final database = await DatabaseInstance.instance.getDatabaseInstance();
      await database.studentDao.insertStudent(student);

      // ignore: use_build_context_synchronously
      MotionToast.success(
        description: const Text("Student added successfully"),
      ).show(context);
    } catch (e) {
      print(e);
      MotionToast.error(
        description: Text("Error ${e.toString()}"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: const Text(
                    'Student DEtails',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(hintText: 'Fullname'),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                  decoration: const InputDecoration(hintText: 'Age'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select gender',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 147, 146, 146),
                  ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<SingingCharacter>(
                      title: const Text('Male'),
                      value: SingingCharacter.Male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          gender = "Male";
                        });
                      },
                    ),
                    RadioListTile<SingingCharacter>(
                      title: const Text('Female'),
                      value: SingingCharacter.Female,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          gender = "Female";
                        });
                      },
                    ),
                    RadioListTile<SingingCharacter>(
                      title: const Text('Others'),
                      value: SingingCharacter.Others,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          gender = "Other";
                        });
                      },
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  decoration: const InputDecoration(hintText: 'Address'),
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      print(name);
                      print(age);
                      print(gender);
                      print(address);
                      Student student = Student(name!, age!, gender!, address!);

                      _addStudent(student);
                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
