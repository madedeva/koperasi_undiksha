import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  double hitungPersentase(double total, double persentase) {
    return total * persentase / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: hitungPersentase(MediaQuery.of(context).size.width, 3),
      ),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: const [
            Text('Butuh bantuan?'),
            Text(
              '0815-2997-4101',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: (() {
              print("calling..");
            }),
            icon: const Icon(
              Icons.call,
              color: Color.fromARGB(255, 33, 243, 117),
              size: 50,
            ))
      ]),
    );
  }
}
