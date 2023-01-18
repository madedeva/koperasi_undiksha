import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                fontSize: 30.0,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: (() {
              _launchUrl('https://wa.me/6281529974101');
            }),
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 50,
              color: Colors.green,
            ))
      ]),
    );
  }
}

Future<void> _launchUrl(url) async {
  const url = 'https://wa.me/6281529974101';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
