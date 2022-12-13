import 'package:flutter/material.dart';
import 'package:praktikum_satu/model/users_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // var user = ModalRoute.of(context)!.settings.arguments;

    // ListUsersModel myUser = user as ListUsersModel;

    // if (myUser.nama == null) {
    //   Navigator.pushReplacementNamed(context, '/settings');
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        child: Center(
          child: Text('User', style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
