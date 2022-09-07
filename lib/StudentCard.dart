import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color.fromARGB(255, 122, 122, 122),
      margin: EdgeInsets.all(10),
      child: GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Image.network(
              'https://www.unitedway.ca/wp-content/uploads/2017/06/TempProfile.jpg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Kiran Rana',
                textAlign: TextAlign.left,
              ),
              Text(
                '55',
                textAlign: TextAlign.left,
              ),
              Text(
                'Lalitpur',
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Icon(Icons.delete), Icon(Icons.add)],
          )
        ],
      ),
    );
  }
}
