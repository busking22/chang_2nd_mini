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
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: TossColor.grey1,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: TossColor.black,
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
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "어디로 보낼까요?",
                      style: TextStyle(
                        color: TossColor.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
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
                      onChanged: (value) {
                        setState(() {
                          toBank = value;
                        });
                        moneyNode.requestFocus();
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      textAlign: TextAlign.end,
                      controller: moneyController,
                      focusNode: moneyNode,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value != '') {
                          String s = service.f.format(
                            int.tryParse(
                              value.replaceAll(
                                ',',
                                '',
                              ),
                            ),
                          );
                          moneyController.value = TextEditingValue(
                            text: s,
                            selection: TextSelection.collapsed(
                              offset: s.length,
                            ),
                          );
                        }
                      },
                      decoration: const InputDecoration(
                        suffix: Text("원"),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("현재 잔액 : ${service.f.format(widget.fromBank.balance)} 원"),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if ((widget.fromBank.balance ?? 0) <
                            (int.tryParse(
                                  moneyController.text.replaceAll(',', ''),
                                ) ??
                                0)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: TossColor.bluegrey,
                              content: Text("잔액이 부족해요"),
                            ),
                          );
                        } else if (toBank != null && moneyController.text != '') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Image.asset(
                                  'assets/money_icon.png',
                                  width: 32,
                                ),
                                title: Text(
                                  '${toBank?.name} 으로 ${int.tryParse(
                                    moneyController.text.replaceAll(',', ''),
                                  )} 원을 보내시겠어요?',
                                  style: const TextStyle(
                                    color: TossColor.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      service.sendMoney(
                                        widget.fromBank,
                                        toBank!,
                                        int.tryParse(moneyController.text.replaceAll(',', '')) ?? 0,
                                      );
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          backgroundColor: TossColor.blue,
                                          content: Text("전송 완료"),
                                        ),
                                      );
                                    },
                                    child: const Text("보내기"),
                                  )
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                        onPrimary: TossColor.white,
                        primary: TossColor.blue,
                      ),
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
