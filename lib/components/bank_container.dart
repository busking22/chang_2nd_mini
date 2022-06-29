import 'package:chang_mini/model/bank.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankContainer extends StatelessWidget {
  const BankContainer({
    Key? key,
    required this.bank,
  }) : super(key: key);
  final Bank bank;

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return ListTile(
          leading: Image.asset(
            bank.bankImage ?? '',
            width: 40,
          ),
          title: Container(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              bank.name ?? "부산은행 계좌",
            ),
          ),
          subtitle: Text(
            "${service.f.format(bank.balance)} 원",
          ),
          contentPadding: EdgeInsets.zero,
          trailing: ElevatedButton(
            onPressed: () {},
            child: const Text("송금"),
          ),
        );
      },
    );
  }
}
