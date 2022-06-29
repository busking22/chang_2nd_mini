import 'dart:convert';

import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###');

  SharedPreferences? prefs;
  List<Bank> myBankList = [];

  BankService(SharedPreferences preferences) {
    prefs = preferences;

    getPrefsData();
  }

  createdBank(Bank bank) async {
    myBankList.add(bank);
    await saveData();

    notifyListeners();
  }

  Future<bool> sendMoney(Bank fromBank, Bank toBank, int money) async {
    if ((fromBank.balance ?? 0) < money) {
      return false;
    }

    fromBank.balance = (fromBank.balance ?? 0) - money;
    toBank.balance = (toBank.balance ?? 0) + money;
    await saveData();

    notifyListeners();
    return true;
  }

  getPrefsData() {
    String? savedString = prefs?.getString('banks');
    if (savedString != null) {
      myBankList = [];
      jsonDecode(savedString).forEach((e) {
        myBankList.add(Bank.fromJson(e));
      });
    }
  }

  saveData() async {
    await prefs?.setString(
      'banks',
      jsonEncode(
        myBankList.map((e) => e.toJson()).toList(),
      ),
    );
  }
}
