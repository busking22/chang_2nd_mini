import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###');

  List<Bank> myBankList = [];

  createdBank(Bank bank) async {
    myBankList.add(bank);

    notifyListeners();
  }

  Future<bool> sendMoney(Bank fromBank, Bank toBank, int money) async {
    if ((fromBank.balance ?? 0) < money) {
      return false;
    }

    fromBank.balance = (fromBank.balance ?? 0) - money;
    toBank.balance = (toBank.balance ?? 0) + money;

    notifyListeners();
    return true;
  }
}
