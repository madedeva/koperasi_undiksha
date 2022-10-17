import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.account_balance_wallet,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Cek Saldo",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.money,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Transfer",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.attach_money,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Deposito",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.credit_card,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Pembayaran",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.monitor_weight,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Peminjaman",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.account_balance,
                size: 50,
                color: Color.fromARGB(255, 65, 33, 243),
              ),
              ResponsiveVisibility(
                hiddenWhen: [
                  Condition.smallerThan(name: DESKTOP),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: Text(
                  "Cek Mutasi",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 33, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
