import 'package:flutter/material.dart';
import 'package:praktikum_satu/views/scan_qr.dart';

class GridLayout {
  String name;
  IconData icon;
  var screen;
  GridLayout({required this.name, required this.icon, required this.screen});
}

class GridDashboard extends StatelessWidget {
  final List<GridLayout> option = [
    GridLayout(
        name: 'Cek Saldo',
        icon: Icons.account_balance_wallet,
        screen: 'Cek Saldo'),
    GridLayout(name: 'Transfer', icon: Icons.money, screen: Qrscanner()),
    GridLayout(name: 'Deposito', icon: Icons.attach_money, screen: 'Deposito'),
    GridLayout(
        name: 'Pembayaran', icon: Icons.credit_card, screen: 'Pembayaran'),
    GridLayout(
        name: 'Peminjaman', icon: Icons.monitor_weight, screen: 'Peminjaman'),
    GridLayout(
        name: 'Cek Mutasi', icon: Icons.account_balance, screen: 'Mutasi'),
  ];

  GridDashboard({Key? key}) : super(key: key);

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
                    size: 50.0,
                    color: Colors.blue,
                  ),
                  Text(
                    option[index].name,
                    style: TextStyle(fontSize: 12.0),
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
