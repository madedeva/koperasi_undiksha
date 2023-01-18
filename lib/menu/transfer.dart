import 'package:flutter/material.dart';
import 'package:praktikum_satu/model/user.dart';
import 'package:praktikum_satu/model/user_references.dart';
import 'package:praktikum_satu/services/services.dart';

class Transfer extends StatefulWidget {
  Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  String? qrData;

  UserReferences pref = UserReferences();

  UserServices userServices = UserServices();

  List<UserModel?> user = [];

  String? userId;

  UserModel? myUser;

  int? biayaAdmin;

  final _nominalController = TextEditingController();
  final _nomorRekeningController = TextEditingController();
  final _pinController = TextEditingController();

  void getUser() async {
    userId = await pref.getUserId();
    user = await userServices.getUser(userId: userId!);
    setState(() {
      myUser = user[0];
      biayaAdmin = int.parse(myUser!.nomorRekening.substring(1));
    });
  }

  void transferSaldo(String nominal, rekening, password) async {
    List<UserModel?> users = await userServices.getAllUser();
    bool isExist = false;
    for (var i = 0; i < users.length; i++) {
      if (users[i]!.nomorRekening == rekening) {
        isExist = true;
        break;
      }
    }
    userId = await pref.getUserId();

    if (isExist) {
      // check password
      if (myUser!.password == password) {
        if (myUser!.saldo >= (int.parse(nominal) + biayaAdmin!)) {
          await userServices
              .transfer(
                  nominal: nominal, userId: userId!, rekeningTujuan: rekening)
              .then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Transfer berhasil'),
                backgroundColor: Colors.green,
              ),
            );
          }).onError((error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Transfer gagal'),
                backgroundColor: Colors.red,
              ),
            );
          });

          await userServices.tarikan(
              nominal: biayaAdmin.toString(), userId: userId!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Saldo tidak cukup'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password salah'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nomor rekening tidak ditemukan'),
          backgroundColor: Colors.red,
        ),
      );
    }

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
    qrData = ModalRoute.of(context)!.settings.arguments as String?;

    if (qrData != null) {
      _nomorRekeningController.text = qrData!;
    }

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Transfer Saldo'),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (myUser != null) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                    // Form transfer
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'Transfer Saldo',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _nominalController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Nominal transfer',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _nomorRekeningController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Rekening tujuan',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _pinController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Password akun',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                transferSaldo(
                                    _nominalController.text,
                                    _nomorRekeningController.text,
                                    _pinController.text);
                              },
                              child: const Text('Transfer'),
                            ),
                          ),
                        ]))
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
