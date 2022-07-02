import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController bankController = TextEditingController();
  TextEditingController moneyController = TextEditingController();

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
                  Icons.arrow_back_ios_new,
                  color: TossColor.black,
                ),
              ),
              backgroundColor: TossColor.grey1,
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text("확인"),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "은행 추가하기",
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("은행명"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: bankController,
                            textAlign: TextAlign.end,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text("은행"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("잔액"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: moneyController,
                            textAlign: TextAlign.end,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text("원"),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: TossColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/toss_bank.png'),
                          ),
                          Text(
                            "토스 은행",
                            style: TextStyle(
                              color: TossColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "비대면으로 통장을 개설 할 수 있어요",
                            style: TextStyle(
                              color: TossColor.bluegrey,
                              fontSize: 14,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              onPrimary: TossColor.white,
                              primary: TossColor.blue,
                            ),
                            child: const Text("지금 바로 만들기"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          onPrimary: TossColor.white,
                          primary: TossColor.blue,
                        ),
                        child: const Text("확인"),
                      ),
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
