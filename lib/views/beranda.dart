import 'package:flutter/material.dart';
import 'package:praktikum_satu/views/contact.dart';
import 'package:praktikum_satu/views/dashboard_grid.dart';
import 'package:praktikum_satu/model/users_model.dart';

class BerandaWidget extends StatefulWidget {
  const BerandaWidget({Key? key}) : super(key: key);

  @override
  State<BerandaWidget> createState() => _BerandaWidgetState();
}

class _BerandaWidgetState extends State<BerandaWidget> {
  double hitungPersentase(double total, double persentase) {
    return total * persentase / 100;
  }

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments;

    ListUsersModel myUser = user as ListUsersModel;

    if (myUser.nama == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 15,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width:
                      hitungPersentase(MediaQuery.of(context).size.width, 25),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                            'https://reqres.in/img/faces/${myUser.user_id}-image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      // height: 50,
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nasabah',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // Pakai data dari model
                            myUser.nama!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      // height: 50,
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Saldo Anda',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${myUser.saldo!}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // height: hitungPersentase(MediaQuery.of(context).size.height, 48),
            margin: EdgeInsets.symmetric(
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 15,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridDashboard(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Contact()
        ],
      ),
    );
  }
}
