import 'package:flutter/material.dart';
import 'package:praktikum_satu/model/user.dart';
import 'package:praktikum_satu/model/user_references.dart';
import 'package:praktikum_satu/services/services.dart';

class Tarikan extends StatefulWidget {
  Tarikan({Key? key}) : super(key: key);

  @override
  State<Tarikan> createState() => _TarikanState();
}

class _TarikanState extends State<Tarikan> {
  UserReferences pref = UserReferences();

  UserServices userServices = UserServices();

  List<UserModel?> user = [];

  String? userId;

  UserModel? myUser;

  final _nominalController = TextEditingController();

  void getUser() async {
    userId = await pref.getUserId();
    user = await userServices.getUser(userId: userId!);
    setState(() {
      myUser = user[0];
    });
  }

  void tarikSaldo(nominal) async {
    userId = await pref.getUserId();
    await userServices.tarikan(nominal: nominal, userId: userId!).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Penarikan berhasil'),
          backgroundColor: Colors.green,
        ),
      );
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Penarikan gagal'),
          backgroundColor: Colors.red,
        ),
      );
    });

    user = await userServices.getUser(userId: userId!);
    setState(() {
      myUser = user[0];
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Penarikan Saldo'),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (myUser != null) {
              return Container(
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            'Saldo Anda',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Rp. ${myUser!.saldo}',
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(82, 0, 0, 0),
                            blurRadius: 10,
                            offset: Offset(2, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nominalController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Nominal penarikan',
                            ),
                            // minimal penarikan 50000 maksimal 1000000
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Nominal pen tarikan tidak boleh kosong';
                            //   } else if (int.parse(value) < 50000) {
                            //     return 'Minimal penarikan adalah Rp. 50.000';
                            //   } else if (int.parse(value) > 1000000) {
                            //     return 'Maksimal penarikan adalah Rp. 1.000.000';
                            //   } else if (int.parse(value) > myUser!.saldo) {
                            //     return 'Saldo anda tidak mencukupi';
                            //   }
                            //   return null;
                            // },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_nominalController.text.isNotEmpty) {
                                tarikSaldo(_nominalController.text);
                                _nominalController.clear();
                              }
                            },
                            child: const Text('Tarik Saldo'),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
