import 'package:flutter/material.dart';
import 'package:praktikum_satu/component/contact.dart';
import 'package:praktikum_satu/component/gridview_menu.dart';
import 'package:praktikum_satu/model/user.dart';

import '../model/user_references.dart';
import '../services/services.dart';

import 'package:qr_flutter/qr_flutter.dart';

class Beranda extends StatefulWidget {
  Beranda({Key? key, this.myUser}) : super(key: key);

  UserModel? myUser;

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // Fungsi untuk menghitung hasil nilai dari persentase sebuah total nilai
  double hitungPersentase(double total, double persentase) {
    return total * persentase / 100;
  }

  UserModel? user;

  UserReferences pref = UserReferences();

  UserServices userServices = UserServices();

  updateUser() async {
    List<UserModel?> userA = await userServices.getUser(userId: user!.userId);
    user = userA[0];
    print('updateUser ${user!.saldo}');
  }

  startUser() {
    user = widget.myUser;
    print('startUser ${user!.saldo}');
  }

  @override
  void initState() {
    startUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width:
                        hitungPersentase(MediaQuery.of(context).size.width, 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/250?image=9',
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            '${user!.nama} | Nomor Akun: ${user!.nomorRekening}',
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
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Saldo Anda',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp.${user!.saldo}',
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
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridDashboard(id: user!.userId),
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
