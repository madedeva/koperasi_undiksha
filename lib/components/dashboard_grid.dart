import 'package:flutter/material.dart';

class GridLayout {
  String name;
  IconData icon;
  GridLayout({required this.name, required this.icon});
}

class GridDashboard extends StatelessWidget {
  final List<GridLayout> option = [
    GridLayout(
      name: 'Cek Saldo',
      icon: Icons.account_balance_wallet,
    ),
    GridLayout(
      name: 'Transfer',
      icon: Icons.money,
    ),
    GridLayout(
      name: 'Deposito',
      icon: Icons.attach_money,
    ),
    GridLayout(name: 'Pembayaran', icon: Icons.credit_card),
    GridLayout(name: 'Peminjaman', icon: Icons.monitor_weight),
    GridLayout(name: 'Cek Mutasi', icon: Icons.account_balance),
  ];

  GridDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: List.generate(option.length, (index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    option[index].icon,
                    size: 50.0,
                    color: Color.fromARGB(255, 65, 33, 243),
                  ),
                  Text(
                    option[index].name,
                    style: const TextStyle(fontSize: 12.0),
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
