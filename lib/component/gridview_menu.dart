import 'package:flutter/material.dart';
import 'package:praktikum_satu/menu/ceksaldo.dart';
import 'package:praktikum_satu/menu/setoran.dart';
import 'package:praktikum_satu/menu/tarik.dart';
import 'package:praktikum_satu/menu/transfer.dart';

class GridLayout {
  String name;
  IconData icon;
  var screen;
  GridLayout({required this.name, required this.icon, required this.screen});
}

class GridDashboard extends StatelessWidget {
  GridDashboard({Key? key, this.id}) : super(key: key);
  String? id;
  final List<GridLayout> option = [
    GridLayout(
        name: 'Cek Saldo',
        icon: Icons.account_balance_wallet,
        screen: CekSaldo()),
    GridLayout(name: 'Transfer', icon: Icons.money, screen: Transfer()),
    GridLayout(
        name: 'Tambah Saldo', icon: Icons.attach_money, screen: Setoran()),
    GridLayout(name: 'Tarik Saldo', icon: Icons.credit_card, screen: Tarikan()),
    GridLayout(
        name: 'Peminjaman', icon: Icons.monitor_weight, screen: 'Peminjaman'),
    GridLayout(
        name: 'Cek Mutasi', icon: Icons.account_balance, screen: 'Mutasi'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: List.generate(option.length, (index) {
        return Card(
          color: Colors.grey[200],
          elevation: 0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => option[index].screen),
              );
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    option[index].icon,
                    size: 60.0,
                    color: Colors.blue,
                  ),
                  Text(
                    option[index].name,
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
