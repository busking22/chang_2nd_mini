import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/model/bank.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendPage extends StatefulWidget {
  const SendPage({
    Key? key,
    required this.fromBank,
  }) : super(key: key);
  final Bank fromBank;

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  Bank? toBank;

  TextEditingController moneyController = TextEditingController();
  FocusNode moneyNode = FocusNode();

  @override
  void initState() {
    toBank = Provider.of<BankService>(context, listen: false).myBankList.first;
    super.initState();
  }

  @override
  void dispose() {
    moneyController.dispose();
    moneyNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            backgroundColor: TossColor.grey1,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              backgroundColor: TossColor.grey1,
              elevation: 0,
              actions: const [],
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "송금하기",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "어디로 보낼까요?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButton<Bank>(
                      value: toBank,
                      items: service.myBankList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name ?? ''),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("현재 잔액 : ${service.f.format(widget.fromBank.balance)} 원"),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("보내기"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
